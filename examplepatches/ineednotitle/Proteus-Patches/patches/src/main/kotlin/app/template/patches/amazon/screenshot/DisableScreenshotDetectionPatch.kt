package app.template.patches.amazon.screenshot

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.AMAZON_BUSINESS_COMPATIBILITY
import app.template.patches.shared.Constants.AMAZON_IN_COMPATIBILITY
import app.template.patches.shared.Constants.AMAZON_SHOPPING_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// ─────────────────────────────────────────────────────────────────────────────
// Disable screenshot detection (Android 14+).
//
// Amazon Shopping, Amazon Business, and Amazon India register an
// Activity.ScreenCaptureCallback via Activity.registerScreenCaptureCallback()
// to detect when the user takes a screenshot and show a share bottom sheet
// popup.
//
// Both registerScreenCaptureCallback and unregisterScreenCaptureCallback return
// void, so replacing the invoke instructions with `nop` neutralizes the calls
// cleanly without leaving a dangling move-result or shrinking single-instruction
// try/catch blocks into zero-length ranges (VerifyError hazard).
// ─────────────────────────────────────────────────────────────────────────────

private const val ACTIVITY = "Landroid/app/Activity;"
private const val REGISTER_METHOD = "registerScreenCaptureCallback"
private const val UNREGISTER_METHOD = "unregisterScreenCaptureCallback"

private fun Instruction.isScreenCaptureCall(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    if (reference.definingClass != ACTIVITY) return false
    return reference.name == REGISTER_METHOD || reference.name == UNREGISTER_METHOD
}

@Suppress("unused")
val disableScreenshotDetectionPatch = bytecodePatch(
    name = "Disable screenshot detection",
    description = "Prevents the app from detecting screenshots and displaying the share popup on Android 14+.",
    default = true,
) {
    compatibleWith(
        AMAZON_SHOPPING_COMPATIBILITY,
        AMAZON_BUSINESS_COMPATIBILITY,
        AMAZON_IN_COMPATIBILITY,
    )

    execute {
        // Collect first, mutate after: mutableClassDefBy modifies the underlying class map.
        val targets = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.methods.any { method ->
                    method.implementation?.instructions?.any { it.isScreenCaptureCall() } == true
                }
            ) {
                targets += classDef.type
            }
        }

        var replaced = 0
        targets.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.indices.reversed().forEach { index ->
                    if (instructions[index].isScreenCaptureCall()) {
                        method.replaceInstruction(index, "nop")
                        replaced++
                    }
                }
            }
        }

        if (replaced == 0) {
            throw PatchException("No registerScreenCaptureCallback or unregisterScreenCaptureCallback call sites found")
        }
    }
}
