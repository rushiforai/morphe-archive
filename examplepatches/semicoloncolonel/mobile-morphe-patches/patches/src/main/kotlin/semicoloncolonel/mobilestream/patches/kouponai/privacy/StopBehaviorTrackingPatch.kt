package semicoloncolonel.mobilestream.patches.kouponai.privacy

import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.requireNativeLibsPatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.enableWebFilter
import semicoloncolonel.mobilestream.patches.kouponai.shared.kouponWebFilterPatch
import semicoloncolonel.mobilestream.patches.shared.misc.filterJsRequests

// ─────────────────────────────────────────────────────────────────────────────
// Koupon 3.1.6 — Stop behavioral tracking (OPT-IN, default OFF).
//
// Each deal opens as a web page (cross-end.koupon.ai/product/detail) with the
// account's Firebase UID in its URL. On load, the page posts the deal, its
// categories, and the keywords of its title to
// /api/browse-history/add-history. That record fills Me > History ("Recently
// Viewed") and feeds the recommendations. KouponWebFilter answers that post
// with an empty 404, so the visit is not recorded.
//
// The personalized recommendations are dropped too, since they are built from
// that record and carry the account ID: the app's POST /api/recommend ("You
// might also like" on the History screen and elsewhere), filtered in React
// Native's NetworkingModule by KouponBehaviorFilter, and the deal page's
// /api/recommend/v2/related-deal ("Similar items"), filtered in the web view.
// Those lists come back empty.
//
// Not touched: the deal page itself, search, favorites, rewards, and the
// History screen, which keeps what was recorded before. Clear it there if you
// want it gone.
// ─────────────────────────────────────────────────────────────────────────────

private const val BEHAVIOR_FILTER =
    "Lsemicoloncolonel/mobilestream/extension/kouponai/privacy/KouponBehaviorFilter;"

// Part of blockAnalyticsPatch: runs only when its "behavioralTracking" option is on.
internal val stopBehaviorTrackingPatch = bytecodePatch {
    dependsOn(requireNativeLibsPatch)

    dependsOn(kouponWebFilterPatch)

    extendWith("extensions/extension.mpe")

    execute {
        if (!isOptionOn(blockAnalyticsPatch, "behavioralTracking")) return@execute
        enableWebFilter("stopHistory")
        filterJsRequests(BEHAVIOR_FILTER)
    }
}
