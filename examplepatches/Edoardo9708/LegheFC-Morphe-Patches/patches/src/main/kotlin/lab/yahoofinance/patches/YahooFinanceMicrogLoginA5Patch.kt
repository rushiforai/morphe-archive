package lab.yahoofinance.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private const val YF5_APP = "Lcom/yahoo/mobile/client/android/finance/FinanceApplication;"
private const val YF5_GMS = "app.revanced.android.gms"
private const val YF5_META = "app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE"
// Public certificate SHA-1 verified against the original APK. No private key.
private const val YF5_SHA1 = "bef32362c09f50807e025fad8e1f78a8c34a3805"

private val yahooMicrogA5Resources = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val ns = "http://schemas.android.com/apk/res/android"
            val root = manifest.documentElement
            val apps = root.getElementsByTagName("application")
            require(apps.length == 1) { "Yahoo microG: application non univoca" }
            val app = apps.item(0) as Element
            val metadata = app.getElementsByTagName("meta-data")
            require((0 until metadata.length).none {
                (metadata.item(it) as Element).getAttributeNS(ns, "name") == YF5_META
            }) { "Yahoo microG: metadata firma alternativa gia' presente" }
            val certificate = manifest.createElement("meta-data")
            certificate.setAttributeNS(ns, "android:name", YF5_META)
            certificate.setAttributeNS(ns, "android:value", YF5_SHA1)
            app.appendChild(certificate)

            val queryNodes = root.getElementsByTagName("queries")
            require(queryNodes.length <= 1) { "Yahoo microG: queries non univoco" }
            val queries = if (queryNodes.length == 1) queryNodes.item(0) as Element
                else manifest.createElement("queries").also { root.insertBefore(it, app) }
            val packages = queries.getElementsByTagName("package")
            if ((0 until packages.length).none {
                (packages.item(it) as Element).getAttributeNS(ns, "name") == YF5_GMS
            }) {
                val pkg = manifest.createElement("package")
                pkg.setAttributeNS(ns, "android:name", YF5_GMS)
                queries.appendChild(pkg)
            }
        }
    }
}

/** A5: use the bundled Play Services credential provider and route only identity clients.
 * Original public certificate digest is declared for the existing ReVanced GmsCore.
 * No tokens or account identifiers are logged. Test on top of the chosen Yahoo patch.
 */
@Suppress("unused")
val yahooFinanceMicrogLoginA5Patch = bytecodePatch(
    name = "Yahoo Finance - microG login A5",
    description = "Experimental: route Google identity sign-in/authorization to existing ReVanced GmsCore, using the bundled credential provider.",
    default = false
) {
    compatibleWith(Compatibility(name = "Yahoo Finance", packageName = "com.yahoo.mobile.client.android.finance", targets = listOf(AppTarget(version = "26.21.2"))))
    dependsOn(yahooMicrogA5Resources)
    execute {
        val credential = Fingerprint(
            definingClass = "Landroidx/credentials/j;", name = "a", returnType = "Ljava/lang/Object;",
            parameters = listOf("Landroidx/credentials/j;", "Landroid/content/Context;", "Landroidx/credentials/p;", "Lkotlin/coroutines/d;")
        ).method
        val instructions = requireNotNull(credential.implementation).instructions.toList()
        val sdkIndex = instructions.indices.single { index ->
            val ins = instructions[index]
            val field = (ins as? ReferenceInstruction)?.reference as? FieldReference
            ins.opcode == Opcode.SGET && field?.definingClass == "Landroid/os/Build${'$'}VERSION;" && field.name == "SDK_INT"
        }
        val register = (instructions[sdkIndex] as OneRegisterInstruction).registerA
        credential.replaceInstruction(sdkIndex, "const/16 v$register, 0x21")
        val clients = listOf("h" to "signin", "n" to "authorization")
        clients.forEach { (name, service) ->
            val owner = "Lcom/google/android/gms/internal/auth-api/$name;"
            Fingerprint(definingClass = owner, name = "l", parameters = emptyList(), returnType = "Ljava/lang/String;").method
                .replaceInstruction(0, "const-string v0, \"app.revanced.android.gms.auth.api.identity.service.$service.START\"")
            Fingerprint(definingClass = owner, name = "m", parameters = emptyList(), returnType = "Z").method
                .replaceInstruction(0, "const/4 v0, 0x0")
        }
        val base = mutableClassDefBy("Lcom/google/android/gms/common/internal/g;")
        val helperName = "yfIdentityServicePackage"
        require(base.methods.none { it.name == helperName })
        val helper = ImmutableMethod(base.type, helperName,
            listOf(ImmutableMethodParameter(base.type, null, null)), "Ljava/lang/String;",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(3)).toMutable()
        helper.addInstructionsWithLabels(0, """
            instance-of v0, p0, Lcom/google/android/gms/internal/auth-api/h;
            if-nez v0, :microg
            instance-of v0, p0, Lcom/google/android/gms/internal/auth-api/n;
            if-eqz v0, :official
            :microg
            const-string v0, "YF-GMS-A5"
            const-string v1, "app.revanced.android.gms"
            invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            return-object v1
            :official
            const-string v1, "com.google.android.gms"
            return-object v1
        """.trimIndent())
        base.methods.add(helper)
        val bind = base.methods.single { it.name == "r" && it.parameterTypes == listOf("I", "Landroid/os/IInterface;") }
        val impl = requireNotNull(bind.implementation)
        val original = impl.instructions.toList()
        val receiver = impl.registerCount - 3
        val reference = com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference(base.type, helperName, listOf(base.type), "Ljava/lang/String;")
        var count = 0
        original.indices.reversed().forEach { index ->
            val instruction = original[index]
            val string = (instruction as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.StringReference
            if ((instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) && string?.string == "com.google.android.gms") {
                val destination = (instruction as OneRegisterInstruction).registerA
                impl.replaceInstruction(index, com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, receiver, 0, 0, 0, 0, reference))
                impl.addInstruction(index + 1, com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, destination))
                count++
            }
        }
        require(count == 5) { "Yahoo GMS: expected five package selection sites, found $count" }
    }
}
