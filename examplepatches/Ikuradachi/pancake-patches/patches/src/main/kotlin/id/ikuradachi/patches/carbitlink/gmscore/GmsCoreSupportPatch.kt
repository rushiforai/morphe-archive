package id.ikuradachi.patches.carbitlink.gmscore

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import id.ikuradachi.patches.carbitlink.shared.Constants.COMPATIBILITY_CARBIT_LINK
import org.w3c.dom.Element

private const val GMS_PACKAGE = "app.revanced.android.gms"
private const val STATUS = "Lcom/google/android/gms/common/api/Status;"
private const val ACCOUNT = "Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;"
private const val OPTIONS = "Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;"
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

private fun Element.children(tag: String) = (0 until childNodes.length)
    .mapNotNull { childNodes.item(it) as? Element }.filter { it.tagName == tag }

private val gmsCoreResourcesPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            check(manifest.getAttribute("package") == "net.easyconn.carman.wws")
            val queries = manifest.children("queries").also { check(it.size <= 1) }.singleOrNull()
                ?: document.createElement("queries").also { manifest.appendChild(it) }
            val packages = queries.children("package").filter {
                it.getAttribute("android:name") == GMS_PACKAGE
            }
            val provider = packages.firstOrNull()
                ?: document.createElement("package").also { queries.appendChild(it) }
            provider.setAttributeNS(ANDROID_NS, "android:name", GMS_PACKAGE)
            packages.drop(1).forEach { queries.removeChild(it) }

            val application = manifest.children("application").single()
            mapOf(
                "$GMS_PACKAGE.SPOOFED_PACKAGE_NAME" to "net.easyconn.carman.wws",
                "$GMS_PACKAGE.SPOOFED_PACKAGE_SIGNATURE" to "0e4a67a64b13a7d909876ae9c40fd24dfc926d64",
            ).forEach { (name, value) ->
                val entries = application.children("meta-data").filter {
                    it.getAttribute("android:name") == name
                }
                val entry = entries.firstOrNull()
                    ?: document.createElement("meta-data").also { application.appendChild(it) }
                entry.removeAttribute("android:resource")
                entry.setAttributeNS(ANDROID_NS, "android:name", name)
                entry.setAttributeNS(ANDROID_NS, "android:value", value)
                entries.drop(1).forEach { application.removeChild(it) }
            }
            check(queries.children("package").count { it.getAttribute("android:name") == GMS_PACKAGE } == 1)
        }
    }
}

private fun MethodReference.sameSignature(other: MethodReference) = name == other.name &&
    parameterTypes == other.parameterTypes && returnType == other.returnType

private fun Method.calls() = implementation!!.instructions.mapNotNull {
    (it as? ReferenceInstruction)?.reference as? MethodReference
}

private fun BytecodePatchContext.ancestors(type: ClassDef): List<ClassDef> {
    val ancestors = mutableListOf<ClassDef>()
    var parent = type.superclass
    while (parent != null && parent != "Ljava/lang/Object;") {
        check(ancestors.none { it.type == parent }) { "Cyclic class hierarchy" }
        val ancestor = classDefByOrNull(parent) ?: break
        ancestors += ancestor
        parent = ancestor.superclass
    }
    return ancestors
}

private fun methodWithBody(owner: String, source: Method, registers: Int, body: String): MutableMethod {
    val method = MutableMethod(
        ImmutableMethod(
            owner, source.name, source.parameters, source.returnType, source.accessFlags,
            source.annotations, source.hiddenApiRestrictions, MutableMethodImplementation(registers),
        ),
    )
    method.addInstructions(0, body)
    check(method.sameSignature(source) && method.implementation!!.registerCount == registers)
    check(method.implementation!!.tryBlocks.isEmpty())
    return method
}

private fun MutableClass.addOverride(source: Method, registers: Int, body: String): MutableMethod {
    check(source.accessFlags and (
        AccessFlags.FINAL.value or AccessFlags.STATIC.value or AccessFlags.PRIVATE.value or
            AccessFlags.ABSTRACT.value or AccessFlags.NATIVE.value
        ) == 0) { "Unexpected non-overridable method: $source" }
    check(source.accessFlags and (AccessFlags.PUBLIC.value or AccessFlags.PROTECTED.value) != 0)
    check(methods.none { it.sameSignature(source) }) { "Override already exists: $source" }
    return methodWithBody(type, source, registers, body).also { check(methods.add(it)) }
}

@Suppress("unused")
val gmsCoreSupportPatch = bytecodePatch(
    name = "GmsCore support",
    description = "Uses Morphe GmsCore for Google sign-in and sign-out.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_CARBIT_LINK)
    dependsOn(gmsCoreResourcesPatch)

    execute {
        val mode = SignInModeFingerprint.matchAll(1..1).single()
        val hub = SignInHubDispatchFingerprint.matchAll(1..1).single()
        val service = SignInServiceFingerprint.matchAll(1..1).single()
        val cache = AvailabilityCacheFingerprint.matchAll(1..1).single().originalMethod
        val signOut = SignOutFingerprint.matchAll(1..1).single().originalMethod
        val client = service.classDef
        val hierarchy = ancestors(client)

        val servicePackage = hierarchy.flatMap {
            ServicePackageFingerprint.matchAllOrNull(it).orEmpty()
        }.single().originalMethod
        val packageInstructions = servicePackage.implementation!!.instructions.toList()
        check(packageInstructions.map { it.opcode } == listOf(Opcode.CONST_STRING, Opcode.RETURN_OBJECT))
        check((packageInstructions.first() as OneRegisterInstruction).registerA ==
            (packageInstructions.last() as OneRegisterInstruction).registerA)

        val requiresGms = cache.implementation!!.instructions.filter {
            it.opcode == Opcode.INVOKE_INTERFACE && (it as Instruction35c).registerCount == 1 &&
                it.registerC == cache.implementation!!.registerCount - 1 &&
                (it.reference as MethodReference).let { reference ->
                    reference.parameterTypes.isEmpty() && reference.returnType == "Z"
                }
        }.single().let { (it as ReferenceInstruction).reference as MethodReference }
        check(cache.parameterTypes[1] == requiresGms.definingClass)
        check((listOf(client) + hierarchy).any { requiresGms.definingClass in it.interfaces })
        val requirement = (listOf(client) + hierarchy).flatMap { it.methods }
            .filter { it.sameSignature(requiresGms) }.single()
        check(requirement.definingClass != client.type)
        val requirementInstructions = requirement.implementation!!.instructions.toList()
        check(requirementInstructions.map { it.opcode } == listOf(Opcode.CONST_4, Opcode.RETURN))
        check((requirementInstructions.first() as NarrowLiteralInstruction).narrowLiteral == 1)
        check((requirementInstructions.first() as OneRegisterInstruction).registerA ==
            (requirementInstructions.last() as OneRegisterInstruction).registerA)

        val operationType = signOut.implementation!!.instructions.filter { it.opcode == Opcode.NEW_INSTANCE }
            .map { ((it as ReferenceInstruction).reference as TypeReference).type }.single()
        val operation = classDefBy(operationType)
        check(signOut.calls().count {
            it.definingClass == operationType && it.name == "<init>" &&
                it.parameterTypes == listOf(signOut.parameterTypes.first())
        } == 1)
        val operationMatch = Fingerprint(
            accessFlags = listOf(AccessFlags.PROTECTED, AccessFlags.FINAL, AccessFlags.BRIDGE, AccessFlags.SYNTHETIC),
            parameters = listOf("L"), returnType = "V",
            filters = listOf(
                checkCast(client.type),
                methodCall(parameters = emptyList(), returnType = OPTIONS),
            ),
        ).matchAll(operation, 1..1).single().originalMethod
        val callbackType = operationMatch.implementation!!.instructions.filter { it.opcode == Opcode.NEW_INSTANCE }
            .map { ((it as ReferenceInstruction).reference as TypeReference).type }.single()
        check(operationMatch.calls().count {
            it.definingClass == callbackType && it.name == "<init>" &&
                it.parameterTypes == listOf(operationType) && it.returnType == "V"
        } == 1)
        val remote = operationMatch.calls().filter {
            it.parameterTypes.size == 2 && it.parameterTypes[1] == OPTIONS && it.returnType == "V"
        }.single()
        val remoteMethod = classDefBy(remote.definingClass).methods.single { it.sameSignature(remote) }
        check(remoteMethod.implementation!!.instructions.any {
            (it as? NarrowLiteralInstruction)?.narrowLiteral == 102
        }) { "Expected actual sign-out Binder transaction 102" }
        val callback = mutableClassDefBy(callbackType)
        check((listOf(callback) + ancestors(callback)).any { remote.parameterTypes.first() in it.interfaces })
        val statusCallback = callback.methods.single {
            it.parameterTypes == listOf(STATUS) && it.returnType == "V" &&
                it.accessFlags == (AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)
        }
        check(statusCallback.calls().single().definingClass ==
            "Lcom/google/android/gms/common/api/internal/BasePendingResult;")
        val unexpected = ancestors(callback).flatMap { it.methods }.filter {
            it.parameterTypes == listOf(ACCOUNT, STATUS) && it.returnType == "V" &&
                it.accessFlags == AccessFlags.PUBLIC.value
        }.single()
        check(unexpected.implementation!!.instructions.any {
            it.opcode == Opcode.NEW_INSTANCE &&
                ((it as ReferenceInstruction).reference as TypeReference).type == "Ljava/lang/UnsupportedOperationException;"
        })
        check(classDefBy(STATUS).methods.count {
            it.name == "<init>" && it.parameterTypes == listOf("I") && it.returnType == "V"
        } == 1)

        val selector = methodWithBody(mode.classDef.type, mode.originalMethod, 2, "const/4 v0, 0x4\nreturn v0")
        check(selector.implementation!!.instructions.map { it.opcode } == listOf(Opcode.CONST_4, Opcode.RETURN))
        check(mode.classDef.methods.remove(mode.method))
        check(mode.classDef.methods.add(selector))

        val packageMatch = hub.instructionMatches[1]
        val dispatchMatch = hub.instructionMatches[2]
        val packageRegister = packageMatch.getInstruction<OneRegisterInstruction>().registerA
        val dispatch = dispatchMatch.getInstruction<Instruction35c>()
        check(dispatch.registerCount == 2 && dispatch.registerD == packageRegister)
        hub.method.addInstructions(
            dispatchMatch.index + 1,
            """
                const-string v$packageRegister, "$GMS_PACKAGE.auth.GOOGLE_SIGN_IN"
                invoke-virtual {v${dispatch.registerC}, v$packageRegister}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;
            """.trimIndent(),
        )
        hub.method.replaceInstruction(packageMatch.index, "const-string v$packageRegister, \"$GMS_PACKAGE\"")

        val action = service.instructionMatches.single()
        val actionRegister = action.getInstruction<OneRegisterInstruction>().registerA
        service.method.replaceInstruction(
            action.index, "const-string v$actionRegister, \"$GMS_PACKAGE.auth.api.signin.service.START\"",
        )
        client.addOverride(servicePackage, 2, "const-string v0, \"$GMS_PACKAGE\"\nreturn-object v0")
        client.addOverride(requirement, 2, "const/4 v0, 0x0\nreturn v0")

        // The provider's wrong-shaped sign-out callback must fail the real PendingResult.
        val errorOverride = callback.addOverride(
            unexpected, 5,
            """
                new-instance v0, $STATUS
                const/16 v1, 0x8
                invoke-direct {v0, v1}, $STATUS-><init>(I)V
                invoke-virtual {p0, v0}, ${callback.type}->${statusCallback.name}($STATUS)V
                return-void
            """.trimIndent(),
        )
        check(errorOverride.calls().last().sameSignature(statusCallback))
        check(errorOverride.implementation!!.instructions.filterIsInstance<NarrowLiteralInstruction>()
            .map { it.narrowLiteral } == listOf(8))
    }
}
