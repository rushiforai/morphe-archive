package app.finance.patches.sezzle.security

import app.finance.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MAIN_APPLICATION = "Lcom/sezzle/sezzlemobile/MainApplication;"
private const val CODE_PUSH = "Lcom/microsoft/codepush/react/CodePush;"

@Suppress("unused")
val disableCodePushOtaPatch = bytecodePatch(
    name = "Disable CodePush OTA Bundles",
    description = "Always starts the embedded JavaScript bundle instead of a CodePush update.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SEZZLE)

    execute {
        val application = mutableClassDefByOrNull(MAIN_APPLICATION)
            ?: throw PatchException("Sezzle MainApplication not found")
        val bundleHostMethod = application.methods.singleOrNull { method ->
            method.implementation?.instructions?.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == CODE_PUSH &&
                    reference.name == "getJSBundleFile" &&
                    reference.parameterTypes.isEmpty() &&
                    reference.returnType == "Ljava/lang/String;"
            } == true
        } ?: throw PatchException("Could not find MainApplication's CodePush bundle selector")
        val instructions = bundleHostMethod.implementation?.instructions
            ?: throw PatchException("MainApplication's CodePush bundle selector has no implementation")
        val getBundleIndex = instructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == CODE_PUSH && reference.name == "getJSBundleFile"
        }
        check(getBundleIndex >= 0) { "CodePush bundle selector disappeared during patching" }

        val result = instructions.getOrNull(getBundleIndex + 1) as? OneRegisterInstruction
            ?: throw PatchException("CodePush bundle selector has no move-result instruction")
        if (result.opcode != Opcode.MOVE_RESULT_OBJECT) {
            throw PatchException("Unexpected CodePush bundle selector result instruction: ${result.opcode}")
        }

        // DefaultReactHost treats a null bundle path as a request for assets/index.android.bundle.
        // The CodePush package remains registered so the embedded bundle can still resolve it.
        bundleHostMethod.addInstructions(getBundleIndex + 2, "const/4 v${result.registerA}, 0x0")
    }
}
