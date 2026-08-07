package com.p1.mobile.putong.data

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val RETURN_VOID = "return-void"

private const val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

private const val RETURN_TRUE = """
    const/4 v0, 0x1
    return v0
"""

private const val RETURN_EMPTY_LIST = """
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    move-result-object v0
    return-object v0
"""

private fun isConstructor(method: Method): Boolean =
    method.name == "<init>" || method.name == "<clinit>"

private val ROOT_ANCHOR_STRINGS = setOf(
    "/system/app/Superuser.apk", "/system/xbin/daemonsu",
    "/system/bin/cufsdosck", "/system/bin/conbb",
)

private val EMULATOR_ANCHOR_STRINGS = setOf(
    "ranchu", "generic", "emulator",
    "google_sdk", "Genymotion",
)

private val shuMengSdkFingerprint = Fingerprint(
    filters = listOf(string("shumeng_init"), string("shuzilm")),
)

private val packageEnumerationFingerprint = Fingerprint(
    filters = listOf(string("getInstalledPackages"), string("firstInstallTime")),
)

private val apkSignatureVerificationFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(type = "Ljavax/security/auth/x500/X500Principal;"),
        methodCall(name = "getSubjectX500Principal"),
    ),
)

private const val ROOT_TOTAL_EXPECTED = 2
private const val EMULATOR_TOTAL_EXPECTED = 2

@Suppress("unused")
@JvmField
val privacyEnhancementPatch = bytecodePatch(
    name = "Privacy Enhancement",
    description = "Advanced privacy protections: root/emulator detection bypass, ShuMeng SDK blocking, Facebook SDK emulator detection bypass, APK signature verification bypass, package enumeration prevention",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        val rootClasses = mutableMapOf<String, ClassDef>()
        val emulatorClasses = mutableMapOf<String, ClassDef>()

        classDefForEach { classDef ->
            val rootDone = rootClasses.size == ROOT_TOTAL_EXPECTED
            val emulatorDone = emulatorClasses.size == EMULATOR_TOTAL_EXPECTED
            if (rootDone && emulatorDone) return@classDefForEach

            var foundRoot: MutableSet<String>? = if (!rootDone) mutableSetOf() else null
            var foundEmulator: MutableSet<String>? = if (!emulatorDone) mutableSetOf() else null

            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                for (instr in impl.instructions) {
                    if (instr is ReferenceInstruction && instr.reference is StringReference) {
                        val s = (instr.reference as StringReference).string
                        if (foundRoot != null && s in ROOT_ANCHOR_STRINGS) foundRoot.add(s)
                        if (foundEmulator != null && s in EMULATOR_ANCHOR_STRINGS) foundEmulator.add(s)
                    }
                }
            }

            if (foundRoot != null) {
                if ("/system/app/Superuser.apk" in foundRoot && "/system/xbin/daemonsu" in foundRoot) {
                    rootClasses.putIfAbsent("jmd0", classDef)
                }
                if ("/system/bin/cufsdosck" in foundRoot && "/system/bin/conbb" in foundRoot) {
                    rootClasses.putIfAbsent("mmd0", classDef)
                }
            }

            if (foundEmulator != null) {
                if ("ranchu" in foundEmulator && "generic" in foundEmulator && "emulator" in foundEmulator) {
                    emulatorClasses.putIfAbsent("ert0", classDef)
                }
                if ("google_sdk" in foundEmulator && "Genymotion" in foundEmulator) {
                    emulatorClasses.putIfAbsent("facebook", classDef)
                }
            }
        }

        rootClasses["jmd0"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && method.parameterTypes.isEmpty()) {
                    method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        rootClasses["mmd0"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && method.parameterTypes.isEmpty()) {
                    method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        classDefByOrNull("Lcom/tantanapp/beatles/utils/DeviceUtil;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Ljava/lang/Boolean;" && method.parameterTypes.isEmpty()) {
                    method.addInstructions(0, """
                        const/4 v0, 0x0
                        invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                        move-result-object v0
                        return-object v0
                    """)
                }
            }
        }

        emulatorClasses["ert0"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "Z") {
                    method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        emulatorClasses["facebook"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && method.parameterTypes.isEmpty() && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    val hasEmulatorStrings = method.implementation!!.instructions.any { instr ->
                        instr is ReferenceInstruction && instr.reference is StringReference &&
                            (instr.reference as StringReference).string in setOf("google_sdk", "Genymotion", "generic", "Emulator")
                    }
                    if (hasEmulatorStrings) {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                }
            }
        }

        shuMengSdkFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "V" && method.parameterTypes.isNotEmpty() && method.parameterTypes[0] == "Landroid/content/Context;") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        apkSignatureVerificationFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "Landroid/content/Context;" && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_TRUE)
                }
            }
        }

        packageEnumerationFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                val callsGetInstalledPackages = method.implementation!!.instructions.any { instr ->
                    instr is ReferenceInstruction && instr.reference is MethodReference &&
                        (instr.reference as MethodReference).name == "getInstalledPackages"
                }
                if (callsGetInstalledPackages && method.returnType.startsWith("L") && method.returnType.endsWith(";")) {
                    method.addInstructions(0, RETURN_EMPTY_LIST)
                }
            }
        }

        classDefByOrNull("Ll/e8r0;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && method.parameterTypes.isEmpty() && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    val hasSuPaths = method.implementation!!.instructions.any { instr ->
                        instr is ReferenceInstruction && instr.reference is StringReference &&
                            (instr.reference as StringReference).string in setOf("/data/local/su", "/system/xbin/su", "/su/bin/su")
                    }
                    if (hasSuPaths) {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                }
            }
        }
    }
}
