package semicoloncolonel.mobilestream.patches.yahoonews.misc

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle
import semicoloncolonel.mobilestream.patches.shared.misc.disableExpoUpdatesPatch
import semicoloncolonel.mobilestream.patches.yahoonews.shared.Constants
import semicoloncolonel.mobilestream.patches.yahoonews.shared.videoOptOutPatch

// ─────────────────────────────────────────────────────────────────────────────
// Yahoo News 100.1.1 — Hide pop-ups.
//
//   eligibleNow               decides whether the "rate the app" screen opens,
//                             from the remote config and your read count. It
//                             now answers false, so the screen and the Play
//                             review sheet behind it never open.
//   NotificationUpsellBanner  the banners and cards that ask you to turn on
//   NotificationsUpsellCard   notifications.
//   AskScoutTooltip           the Ask Scout tooltip.
//   YouTabReleaseTooltip      the tooltip that introduces the You tab.
//
// The banners, card, and tooltips render nothing.
// ─────────────────────────────────────────────────────────────────────────────

private val hidePopupsInBundlePatch = rawResourcePatch {
    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart("eligibleNow", HermesBundle.Value.FALSE)
        bundle.returnAtStart("NotificationUpsellBanner", HermesBundle.Value.NULL)
        bundle.returnAtStart("NotificationsUpsellCard", HermesBundle.Value.NULL)
        bundle.returnAtStart("AskScoutTooltip", HermesBundle.Value.NULL)
        bundle.returnAtStart("YouTabReleaseTooltip", HermesBundle.Value.NULL)
        file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val hidePopupsPatch = resourcePatch(
    name = "Hide pop-ups",
    description = "Removes the rating request, the notification prompts, and the feature tooltips.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(hidePopupsInBundlePatch, disableExpoUpdatesPatch, videoOptOutPatch)
}
