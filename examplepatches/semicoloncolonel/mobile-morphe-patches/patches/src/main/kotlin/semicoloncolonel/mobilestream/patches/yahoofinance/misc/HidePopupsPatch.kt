package semicoloncolonel.mobilestream.patches.yahoofinance.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.prependGate
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.Constants
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.FINANCE_FLAGS
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.offFlags

// ─────────────────────────────────────────────────────────────────────────────
// Yahoo Finance 26.22.2 — Hide pop-ups.
//
// Rating requests, announcements, tours, and coach marks are steps that
// register with one arbiter (onboarding/arbiter/c), which shows at most one at
// a time and skips any step that is not registered. Its register method m(b)
// now drops every step except FORCE_UPGRADE, PRIVACY_TRAPS (privacy and
// consent), and ATT (tracking permission). Dropped steps include the
// "Enjoying Yahoo Finance?" drawer, the store review request, the AlphaSpace
// promo banner, the announcement sheets, and the coach marks.
//
// The flags for the launch-feedback prompts, the widget prompt, the beta
// program dialog, the in-app update prompt, and tooltips also read as off
// (FinanceFlags.POPUPS).
// ─────────────────────────────────────────────────────────────────────────────

private const val ARBITER = "Lcom/yahoo/mobile/client/android/finance/onboarding/arbiter/c;"
private const val STEP = "Lcom/yahoo/mobile/client/android/finance/onboarding/arbiter/b;"
private const val STEP_ID = "Lcom/yahoo/mobile/client/android/finance/onboarding/arbiter/CampaignStepId;"

internal object RegisterStepFingerprint : Fingerprint(
    definingClass = ARBITER,
    name = "m",
    parameters = listOf(STEP),
    returnType = "V",
)

@Suppress("unused")
val hidePopupsPatch = bytecodePatch(
    name = "Hide pop-ups",
    description = "Removes the rating and feedback requests, announcements, tours, coach marks, and tooltips. " +
        "Privacy and consent screens still show.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        RegisterStepFingerprint.method.prependGate(
            """
                iget-object v0, p1, $STEP->a:$STEP_ID
                invoke-static { v0 }, $FINANCE_FLAGS->keepStep(Ljava/lang/Object;)Z
                move-result v0
                if-nez v0, :msp_orig
                return-void
            """,
        )
        offFlags("popupOff")
    }
}
