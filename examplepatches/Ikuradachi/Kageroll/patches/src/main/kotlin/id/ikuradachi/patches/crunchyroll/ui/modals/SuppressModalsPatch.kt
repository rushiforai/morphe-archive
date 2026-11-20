package id.ikuradachi.patches.crunchyroll.ui.modals

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21t
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

private fun BytecodePatchContext.suppressNotificationPromptCheck(
    fingerprint: Fingerprint,
    activityName: String,
) {
    val match = fingerprint.matchAll(1..1).single()
    val moveResult = match.instructionMatches[2]
    val register = moveResult.getInstruction<OneRegisterInstruction>().registerA
    val branch = match.instructionMatches[3].getInstruction<Instruction21t>()
    check(register in 0..15 && branch.registerA == register) {
        "Unexpected POST_NOTIFICATIONS check register in $activityName: v$register (branch v${branch.registerA})"
    }
    match.method.replaceInstruction(moveResult.index, "const/4 v$register, 0x0")
}

@Suppress("unused")
val suppressModalsPatch = bytecodePatch(
    name = "Suppress modals & prompts",
    description = "Suppresses Braze in-app message overlays, Play in-app review prompts, Play in-app update prompts, and the startup notification permission prompt.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("UI")

    val discardBrazeInAppMessages = booleanOption(
        key = "discardBrazeInAppMessages",
        default = true,
        title = "Discard Braze in-app messages",
        description = "Discards Braze promotional in-app message overlays immediately instead of displaying or deferring them.",
    )
    val disableInAppReview = booleanOption(
        key = "disableInAppReview",
        default = true,
        title = "Disable Play in-app review",
        description = "Prevents the Google Play in-app review rating prompt from being bound and launched.",
    )
    val disableInAppUpdates = booleanOption(
        key = "disableInAppUpdates",
        default = true,
        title = "Disable Play in-app updates",
        description = "Disables Google Play in-app update checks and hides the in-app update prompt banner.",
    )
    val suppressNotificationPrompt = booleanOption(
        key = "suppressNotificationPrompt",
        default = true,
        title = "Suppress notification permission prompt",
        description = "Prevents the automatic POST_NOTIFICATIONS runtime permission prompt on startup.",
    )

    execute {
        if (discardBrazeInAppMessages.value == true) {
            val match = BrazeBeforeInAppMessageDisplayedFingerprint.matchAll(1..1).single()
            val impl = requireNotNull(match.method.implementation) {
                "Missing implementation for BrazeInAppMessageListener.beforeInAppMessageDisplayed"
            }
            check(impl.registerCount >= 3) {
                "Unexpected register count in BrazeInAppMessageListener.beforeInAppMessageDisplayed: ${impl.registerCount}"
            }

            match.method.addInstructions(
                0,
                """
                    sget-object v0, Lcom/braze/ui/inappmessage/InAppMessageOperation;->DISCARD:Lcom/braze/ui/inappmessage/InAppMessageOperation;
                    return-object v0
                """.trimIndent(),
            )
        }

        if (disableInAppReview.value == true) {
            InAppReviewBindToLifecycleFingerprint.matchAll(1..1)
                .single()
                .method
                .addInstruction(0, "return-void")
        }

        if (disableInAppUpdates.value == true) {
            val stateMatch = InAppUpdatesUpdateStateFingerprint.matchAll(1..1).single()
            val moveResult = stateMatch.instructionMatches.last()
            val stateReg = moveResult.getInstruction<OneRegisterInstruction>().registerA
            check(stateReg in 0..15) {
                "Unexpected InAppUpdatesPresenter update state register: v$stateReg"
            }
            stateMatch.method.replaceInstruction(moveResult.index, "const/4 v$stateReg, 0x0")

            val initMatch = InAppUpdatesModuleInitFingerprint.matchAll(1..1).single()
            val enabledGet = initMatch.instructionMatches[1]
            val enabledReg = enabledGet.getInstruction<TwoRegisterInstruction>().registerA
            val branch = initMatch.instructionMatches[2].getInstruction<Instruction21t>()
            check(enabledReg in 0..15 && branch.registerA == enabledReg) {
                "Unexpected InAppUpdates config register: v$enabledReg (branch v${branch.registerA})"
            }
            initMatch.method.replaceInstruction(enabledGet.index, "const/4 v$enabledReg, 0x0")
        }

        if (suppressNotificationPrompt.value == true) {
            suppressNotificationPromptCheck(MobileMainNotificationPromptFingerprint, "MobileMainActivity")
            suppressNotificationPromptCheck(HomeBottomBarNotificationPromptFingerprint, "HomeBottomBarActivity")
        }
    }
}
