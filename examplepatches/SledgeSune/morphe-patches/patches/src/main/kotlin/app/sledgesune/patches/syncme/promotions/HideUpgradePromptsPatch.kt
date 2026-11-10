package app.sledgesune.patches.syncme.promotions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.sledgesune.patches.shared.Constants.COMPATIBILITY_SYNCME
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/sledgesune/extension/syncme/HideUpgradePromptsPatch;"

@Suppress("unused")
val hideUpgradePromptsPatch = patch(
    name = "Hide upgrade prompts",
    description = "Skips the \"Go Pro\" screen after sign-up and hides Premium sales banners, " +
        "the Premium sheet after SMS, Premium promo notifications and upgrade banners in the call history.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SYNCME)

    extendWith("extensions/extension.mpe")

    execute {
        // End of onboarding: go straight to the app instead of the "Go Pro" / trial screen.
        val completeOnboarding = CompleteOnboardingFingerprint.method
        ShowOnboardingPaywallFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual { p0 }, $REGISTRATION_ACTIVITY->${completeOnboarding.name}()V
                return-void
            """
        )

        // No active sale campaign.
        GetActivePromotionFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )

        // Never show the after-SMS Premium sheet.
        ShouldShowAfterSmsPromoFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // Promo notification worker finishes immediately without posting anything.
        PromoNotificationWorkerFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Landroidx/work/ListenableWorker${'$'}Result;->success()Landroidx/work/ListenableWorker${'$'}Result;
                move-result-object v0
                return-object v0
            """
        )

        // Filter upsell banners out of every list getNextPromoBanner() works with.
        GetNextPromoBannerFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val resultIndexes = instructions.indices.filter { i ->
                val reference = (instructions[i] as? ReferenceInstruction)?.reference as? MethodReference
                reference?.name == "getFilteredPromoBanners" &&
                    instructions.getOrNull(i + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
            }.map { it + 1 }

            if (resultIndexes.isEmpty()) throw PatchException("getFilteredPromoBanners call not found")

            // Insert from the bottom up so earlier indexes stay valid.
            resultIndexes.reversed().forEach { index ->
                val register = (instructions[index] as OneRegisterInstruction).registerA
                addInstructions(
                    index + 1,
                    """
                        invoke-static { v$register }, $EXTENSION_CLASS->filterPromoBanners(Ljava/util/List;)Ljava/util/List;
                        move-result-object v$register
                    """
                )
            }
        }
    }
}

@Suppress("unused")
val skipAppPromotionsPatch = patch(
    name = "Skip app promotions",
    description = "Removes the \"free gift\" card after calls and banners promoting other apps.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SYNCME)

    execute {
        PrepareAppPromotionIntentFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )

        FreeGiftIsToShowFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
