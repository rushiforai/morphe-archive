package com.p1.mobile.putong.data

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val RETURN_VOID = "return-void"

private const val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

private const val RETURN_TRUE = """
    const/4 v0, 0x1
    return v0
"""

private const val RETURN_NULL_OBJECT = """
    const/4 v0, 0x0
    return-object v0
"""

private const val RETURN_EMPTY_LIST = """
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    move-result-object v0
    return-object v0
"""

private fun isConstructor(method: Method): Boolean =
    method.name == "<init>" || method.name == "<clinit>"

private val jmd0RootDetectionFingerprint = Fingerprint(
    filters = listOf(string("/system/app/Superuser.apk"), string("/system/xbin/daemonsu")),
)

private val mmd0RootDetectionFingerprint = Fingerprint(
    filters = listOf(string("/system/bin/cufsdosck"), string("/system/bin/conbb")),
)

private val emulatorDetectionFingerprint = Fingerprint(
    filters = listOf(string("ranchu"), string("generic"), string("emulator")),
)

private val deviceUtilEmulatorFingerprint = Fingerprint(
    filters = listOf(string("goldfish"), string("Genymotion"), string("vbox86p")),
)

private val shuMengSdkFingerprint = Fingerprint(
    filters = listOf(string("shumeng_init"), string("shuzilm")),
)

private val facebookEmulatorDetectionFingerprint = Fingerprint(
    filters = listOf(string("google_sdk"), string("Genymotion")),
)

private val packageEnumerationFingerprint = Fingerprint(
    filters = listOf(string("getInstalledPackages"), string("firstInstallTime")),
)

@Suppress("unused")
@JvmField
val privacyEnhancementPatch = bytecodePatch(
    name = "Privacy Enhancement",
    description = "Advanced privacy protections: root/emulator detection bypass, ShuMeng SDK blocking, Facebook SDK emulator detection bypass, APK signature verification bypass, package enumeration prevention",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        jmd0RootDetectionFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && method.parameterTypes.isEmpty()) {
                    method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        mmd0RootDetectionFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && method.parameterTypes.isEmpty()) {
                    method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        emulatorDetectionFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "Z") {
                    method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        deviceUtilEmulatorFingerprint.matchOrNull()?.classDef?.let { classDef ->
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

        shuMengSdkFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "V" && method.parameterTypes.isNotEmpty() && method.parameterTypes[0] == "Landroid/content/Context;") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        facebookEmulatorDetectionFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && method.parameterTypes.isEmpty() && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    val hasEmulatorStrings = method.implementation!!.instructions.any { instr ->
                        instr is ReferenceInstruction && instr.reference is com.android.tools.smali.dexlib2.iface.reference.StringReference &&
                            (instr.reference as com.android.tools.smali.dexlib2.iface.reference.StringReference).string in setOf("google_sdk", "Genymotion", "generic", "Emulator")
                    }
                    if (hasEmulatorStrings) {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                }
            }
        }

        classDefForEach { classDef ->
            val hasX500PrincipalField = classDef.fields.any { field ->
                field.type == "Ljavax/security/auth/x500/X500Principal;" && AccessFlags.STATIC.isSet(field.accessFlags)
            }
            if (!hasX500PrincipalField) return@classDefForEach
            val hasSignatureCheck = classDef.methods.any { method ->
                method.implementation?.instructions?.any { instr ->
                    instr is ReferenceInstruction && instr.reference is MethodReference &&
                        (instr.reference as MethodReference).name == "getSubjectX500Principal"
                } == true
            }
            if (!hasSignatureCheck) return@classDefForEach
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
    }
}
