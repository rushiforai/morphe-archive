package app.jofslash.patches.googlehealth.premium

import app.jofslash.patches.googlehealth.shared.Constants.COMPATIBILITY_GOOGLE_HEALTH
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val VIEW_MODEL =
    "Lcom/google/android/apps/fitbit/app/premium/upsell/impl/nccbottomsheet/PremiumNccExpiredBottomSheetViewModel;"

// Decides whether to show the "3 months of Premium" splash offer.
internal object ShouldShowOfferSplashFingerprint : Fingerprint(
    definingClass = VIEW_MODEL,
    returnType = "Ljava/lang/Object;",
    strings = listOf("premium_3m_offer_splash_eligible"),
)

// Decides whether to show the sheet that says the Premium trial ends today or tomorrow.
internal object TrialEndingSheetFingerprint : Fingerprint(
    definingClass = VIEW_MODEL,
    returnType = "Ljava/lang/Object;",
    strings = listOf("variation_f"),
)

@Suppress("unused")
val hidePremiumOfferSheetsPatch = bytecodePatch(
    name = "Hide Premium offer sheets",
    description = "Hides the sheets that pop up to offer Premium, such as the 3 months of Premium offer " +
            "and the reminder that your Premium trial is ending. Premium itself keeps working.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_GOOGLE_HEALTH)

    execute {
        // Both are suspend functions: returning at once gives the answer without suspending.
        ShouldShowOfferSplashFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
            """
        )
        TrialEndingSheetFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
    }
}
