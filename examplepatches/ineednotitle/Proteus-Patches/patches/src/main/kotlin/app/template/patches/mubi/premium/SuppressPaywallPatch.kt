package app.template.patches.mubi.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.mubi.shared.finishActivityOnCreate
import app.template.patches.shared.Constants.MUBI_COMPATIBILITY

// Close MUBI's subscription paywall as soon as it opens.
//
// MUBI's upgrade screen is com.mubi.ui.subscriptions.UpgradeSubscriptionsActivity.
// The activity is declared in the manifest and can be started from the account
// tab, from a locked film, or from the `mubi://subscribe` deep links.
//
// This patch inserts `finish()` right after onCreate()'s super call and returns,
// so the screen never renders. Internal navigation still works; the user simply
// lands back where they came from instead of on the purchase page.
//
// WHAT THIS DOES NOT DO:
//   • It does not grant a subscription, unlock films, or bypass entitlement
//     checks. Playback and streaming manifests are authorized server-side and
//     are unaffected.
//   • It can leave a dead-end if MUBI treats the upgrade screen as a required
//     step (for example an expired-account wall). Opt-in (default = false).
//
// Fail-safe: if the class or its onCreate(Bundle) super call is absent, the
// patch does nothing.

@Suppress("unused")
val mubiSuppressPaywallPatch = bytecodePatch(
    name = "Suppress subscription paywall",
    description = "Closes MUBI's upgrade screen immediately instead of showing it. " +
        "Does not unlock playback or grant a subscription; only hides the upsell screen.",
    default = false,
) {
    compatibleWith(MUBI_COMPATIBILITY)

    execute {
        finishActivityOnCreate("Lcom/mubi/ui/subscriptions/UpgradeSubscriptionsActivity;")
    }
}
