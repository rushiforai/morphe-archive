package semicoloncolonel.mobilestream.patches.cspan.privacy

import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.cspan.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// C-SPAN Now 1.25.0. The app's trackers send over HttpURLConnection and
// OkHttp, which the shared layer checks against the host blocklist, plus the
// SDKs' manifest kill switches. Covered: the Facebook SDK's Graph calls and
// Firebase/Google Analytics. OneSignal's host is left alone, so push
// notifications keep working.
//
// It also removes the Privacy Sandbox on-device ad-retargeting call
// (CustomAudienceManager.joinCustomAudience), so the device is never enrolled
// in an ad-targeting audience.
//
// Not touched: live and archive video, sign-in, push, or crash reporting.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the Facebook SDK, Firebase/Google Analytics, and on-device ad retargeting.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()

        // Drop every CustomAudienceManager.joinCustomAudience(request, executor,
        // receiver) call. It returns void and reports through the receiver, so
        // removing the invoke leaves no move-result behind.
        val targets = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.methods.any { m ->
                    m.implementation?.instructions?.any { it.isJoinCustomAudience() } == true
                }
            ) targets += classDef.type
        }
        targets.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.indices.reversed().forEach { index ->
                    if (instructions[index].isJoinCustomAudience()) method.removeInstruction(index)
                }
            }
        }
    }
}

private fun Instruction.isJoinCustomAudience(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return reference.definingClass == "Landroid/adservices/customaudience/CustomAudienceManager;" &&
        reference.name == "joinCustomAudience"
}
