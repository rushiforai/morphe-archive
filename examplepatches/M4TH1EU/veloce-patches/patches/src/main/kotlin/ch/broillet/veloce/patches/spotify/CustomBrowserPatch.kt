package ch.broillet.veloce.patches.spotify

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import ch.broillet.veloce.patches.shared.*
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import java.util.Base64

private fun MutableClass.helper(name: String, parameters: List<String>, result: String, locals: Int, code: String): MutableMethod {
    if (methods.any { it.name == name }) throw PatchException("Spotify is already patched: $name exists")
    return MutableMethod(ImmutableMethod(type, name, parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(), MutableMethodImplementation(locals + parameters.size)))
        .also { it.addInstructions(0, code); methods.add(it) }
}

val customBrowserPatch = bytecodePatch(
    name = "Allow Veloce media browsing",
    description = "Trust Veloce (or a custom host package, UID and signing certificate) and use Spotify's existing Android Auto browser integration.",
) {
    compatibleWith(Compatibility(packageName = "com.spotify.music", name = "Spotify",
        targets = listOf(AppTarget(version = null, isExperimental = true,
            description = "Verified patch application on 9.1.94.1929."))))
    val hostCertificate by hostCertificateOption()
    val hostPackage by hostPackageOption()

    execute {
        val packageName = hostPackageName(checkNotNull(hostPackage))
        val root = Fingerprint(isStatic = false, filters = listOf(string("MBS: onGetRoot: IGNORING request from untrusted package %s")))
            .uniqueMethod(this, "Spotify media-browser root handler")
        val configurator = Fingerprint(isStatic = false, returnType = "Ljava/lang/String;", parameters = emptyList(),
            filters = listOf(string("spotify_media_browser_root_android_auto"))).uniqueMethod(this, "Spotify Android Auto configurator")
        val helpers = mutableClassDefBy(configurator.definingClass)
        val trustReference = root.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter { it.definingClass == root.definingClass && it.returnType == "Z" && it.parameterTypes == listOf("I", "Ljava/lang/String;") }
            .distinctBy { it.toString() }.singleOrNull() ?: throw PatchException("Spotify's browser trust call has changed")
        val handler = mutableClassDefBy(root.definingClass)
        val trust = handler.methods.single { it.name == trustReference.name && it.parameterTypes == trustReference.parameterTypes }
        val context = handler.fields.singleOrNull { it.type == "Landroid/content/Context;" }
            ?: throw PatchException("Spotify's browser context has changed")
        if (trust.implementation!!.registerCount < 5) throw PatchException("Spotify browser trust method has no scratch registers")

        val digest = certificateDigest(checkNotNull(hostCertificate)).chunked(2).map { it.toInt(16).toByte() }.toByteArray()
        val certificate = helpers.helper("veloceTrustedCaller", listOf("Landroid/content/Context;", "I"), "Z", 4, """
            sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
            const/16 v1, 0x1c
            if-lt v0, v1, :reject
            invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
            move-result-object v0
            invoke-virtual {v0, p1}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;
            move-result-object v1
            if-eqz v1, :reject
            invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
            move-result-object v1
            const-string v2, "$packageName"
            invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z
            move-result v1
            if-eqz v1, :reject
            const-string v1, "${Base64.getEncoder().encodeToString(digest)}"
            const/4 v3, 0x0
            invoke-static {v1, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
            move-result-object v1
            const/4 v3, 0x1
            invoke-virtual {v0, v2, v1, v3}, Landroid/content/pm/PackageManager;->hasSigningCertificate(Ljava/lang/String;[BI)Z
            move-result v0
            return v0
            :reject
            const/4 v0, 0x0
            return v0
        """)
        trust.addInstructionsWithLabels(0, """
            const-string v0, "$packageName"
            move-object/from16 v1, p2
            invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :original
            move-object/from16 v0, p0
            iget-object v0, v0, $context
            move/from16 v1, p1
            invoke-static {v0, v1}, $certificate
            move-result v0
            return v0
        """, ExternalLabel("original", trust.implementation!!.instructions.first()))

        // Extend package comparisons, not package identity or unrelated signature checks.
        val candidates = classDefByStrings(ANDROID_AUTO).flatMap { it.methods.toList() }
        var comparisons = 0
        var configured = false
        val equalityHelpers = mutableMapOf<String, MethodReference>()
        for (method in candidates) {
            if (method.name.startsWith("veloce")) continue
            val instructions = method.implementation?.instructions?.toList() ?: continue
            if (instructions.none { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == ANDROID_AUTO }) continue
            for ((index, call) in instructions.withIndex()) {
                val reference = (call as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                val registers = when (call) {
                    is FiveRegisterInstruction -> if (call.registerCount == 2) listOf(call.registerC, call.registerD) else continue
                    is RegisterRangeInstruction -> if (call.registerCount == 2) listOf(call.startRegister, call.startRegister + 1) else continue
                    else -> continue
                }
                if (reference.returnType != "Z") continue
                val virtual = call.opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) && reference.definingClass in setOf("Ljava/lang/String;", "Ljava/lang/Object;") &&
                    reference.name == "equals" && reference.parameterTypes == listOf("Ljava/lang/Object;")
                val static = call.opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) && reference.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
                if (!virtual && !static) continue
                val helper = equalityHelpers.getOrPut(reference.toString()) {
                    val parameters = if (virtual) listOf(reference.definingClass, "Ljava/lang/Object;") else listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
                    helpers.helper("velocePackageEquals${equalityHelpers.size}", parameters, "Z", 2, """
                        const-string v0, "$packageName"
                        invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v1
                        if-nez v1, :veloce
                        const-string v0, "$ANDROID_AUTO"
                        invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v1
                        if-eqz v1, :original
                        const-string v0, "$packageName"
                        goto :compare
                        :veloce
                        const-string v0, "$ANDROID_AUTO"
                        :compare
                        invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v1
                        if-eqz v1, :original
                        return v1
                        :original
                        invoke-${if (virtual) "virtual" else "static"} {p0, p1}, $reference
                        move-result v0
                        return v0
                    """)
                }
                val mutable = mutableClassDefBy(method.definingClass).methods.single { it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType }
                mutable.implementation!!.replaceInstruction(index, if (call is RegisterRangeInstruction)
                    BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, call.startRegister, 2, ImmutableMethodReference.of(helper))
                    else BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, registers[0], registers[1], 0, 0, 0, ImmutableMethodReference.of(helper)))
                comparisons++
                if (method.definingClass == configurator.definingClass) configured = true
            }
        }
        if (!configured || comparisons < 2) throw PatchException("Spotify's Android Auto package classification has changed")

        val grants = Fingerprint(name = "<clinit>", filters = listOf(string(ANDROID_AUTO), string("com.google.android.apps.automotive.templates.host")))
            .uniqueMethod(this, "Spotify artwork host list")
        val stores = grants.implementation!!.instructions.withIndex().filter {
            it.value.opcode == Opcode.SPUT_OBJECT && ((it.value as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference)?.type == "Ljava/util/List;"
        }
        if (stores.size != 1) throw PatchException("Spotify's artwork host list has changed")
        val include = helpers.helper("veloceArtworkHosts", listOf("Ljava/util/List;"), "Ljava/util/List;", 2, """
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
            const-string v1, "$packageName"
            invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            return-object v0
        """)
        val register = (stores.single().value as OneRegisterInstruction).registerA
        grants.addInstructions(stores.single().index, """
            invoke-static/range {v$register .. v$register}, $include
            move-result-object v$register
        """)
    }
}
