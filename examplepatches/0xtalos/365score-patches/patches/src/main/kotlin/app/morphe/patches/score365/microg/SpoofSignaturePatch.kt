package app.morphe.patches.score365.microg

import app.morphe.patches.score365.utils.COMPATIBILITY_365SCORE
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val SIGNATURE_SPOOF_EXTENSION_CLASS = "Lapp/template/extension/signature/SignatureSpoof;"
private const val PACKAGE_MANAGER = "Landroid/content/pm/PackageManager;"
private const val EXTENSION_PACKAGE_PREFIX = "Lapp/template/extension/"

/**
 * Spoofs the package signature returned by PackageManager.getPackageInfo(...) so that
 * Firebase (Installations, FCM, etc.) receives the genuine 365Scores certificate instead
 * of the Morphe re-signed certificate, bypassing API_KEY_ANDROID_APP_BLOCKED (HTTP 403).
 */
@Suppress("unused")
val spoofSignaturePatch = bytecodePatch(
    name = "Spoof signature",
    description = "Makes the app report its original signing certificate to itself, so Firebase and Google APIs restricted to the original app keep working.",
    default = false,
) {
    compatibleWith(*COMPATIBILITY_365SCORE)

    extendWith("extensions/signature.mpe")

    execute {
        mutableClassDefBy(SIGNATURE_SPOOF_EXTENSION_CLASS).methods.apply {
            single { it.name == "getSpoofedPackageName" }.returnEarly(MicroGConstants.SCORES365_PACKAGE_NAME)
            single { it.name == "getSpoofedCertificate" }.returnEarly(MicroGConstants.SCORES365_CERTIFICATE)
        }

        // Collect first: mutating classes while iterating them is not allowed.
        val targets = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(EXTENSION_PACKAGE_PREFIX)) return@classDefForEach
            if (classDef.methods.any { m -> m.implementation?.instructions?.any { it.isGetPackageInfo() } == true }) {
                targets += classDef
            }
        }
        if (targets.isEmpty()) throw PatchException("No PackageManager.getPackageInfo call found")

        for (classDef in targets) {
            for (method in mutableClassDefBy(classDef).methods) {
                val instructions = method.implementation?.instructions?.toList() ?: continue
                instructions.forEachIndexed { index, instruction ->
                    if (!instruction.isGetPackageInfo()) return@forEachIndexed
                    val call = (instruction as ReferenceInstruction).reference as MethodReference
                    val descriptor = "$SIGNATURE_SPOOF_EXTENSION_CLASS->getPackageInfo(" +
                        PACKAGE_MANAGER + call.parameterTypes.joinToString("") + ")" + call.returnType
                    val replacement = when (instruction) {
                        is RegisterRangeInstruction -> {
                            val last = instruction.startRegister + instruction.registerCount - 1
                            "invoke-static/range { v${instruction.startRegister} .. v$last }, $descriptor"
                        }
                        is FiveRegisterInstruction -> {
                            val registers = listOf(
                                instruction.registerC, instruction.registerD, instruction.registerE,
                                instruction.registerF, instruction.registerG,
                            ).take(instruction.registerCount)
                            "invoke-static { ${registers.joinToString { "v$it" }} }, $descriptor"
                        }
                        else -> throw PatchException("Unexpected invoke format ${instruction.opcode}")
                    }
                    method.replaceInstruction(index, replacement)
                }
            }
        }
    }
}

/** `invoke-virtual PackageManager.getPackageInfo(String, int | PackageInfoFlags)`. */
private fun Instruction.isGetPackageInfo(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val call = (this as ReferenceInstruction).reference as? MethodReference ?: return false
    return call.definingClass == PACKAGE_MANAGER && call.name == "getPackageInfo" &&
        call.returnType == "Landroid/content/pm/PackageInfo;" &&
        call.parameterTypes.firstOrNull()?.toString() == "Ljava/lang/String;"
}
