package semicoloncolonel.mobilestream.patches.dealseek.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.dealseek.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.filterJsRequests

// ─────────────────────────────────────────────────────────────────────────────
// Stop behavioral tracking (OPT-IN, default OFF).
//
// Separate from "Block analytics & tracking", which handles the third-party
// SDKs. This stops DealSeek's own first-party behavior reporting: the app
// queues every deal you see (queueSeenDeal / _flushSeenDealImpressions) and
// posts your clicks, to /deal-impressions and /deal-interactions on its API
// hosts. The server turns that stream into affinity/recommendation models and
// into your viewed-deal history. Dropping the reports stops the app learning
// from your behavior and stops new history from accumulating server-side.
//
// The reports run through the app's JavaScript, so they are filtered by path
// at the same two seams as the analytics patch (Expo's expo/fetch and React
// Native's NetworkingModule). Only the outbound behavior reports are dropped.
//
// Not touched: the deal feed, search, sign-in, images, push, and the
// history/recently-viewed read endpoints, so the app's own history screen
// still works and you can clear it there. This does not delete history already
// saved to your account.
// ─────────────────────────────────────────────────────────────────────────────

private const val BEHAVIOR_BLOCKER =
    "Lsemicoloncolonel/mobilestream/extension/dealseek/privacy/BehaviorBlocker;"

@Suppress("unused")
val stopBehaviorTrackingPatch = bytecodePatch(
    name = "Stop behavioral tracking",
    description = "Stops the app from reporting the deals you view and click, which feeds " +
        "personalized ranking and your viewed-deal history. Does not delete history already saved.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        filterJsRequests(BEHAVIOR_BLOCKER)
    }
}
