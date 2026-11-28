package semicoloncolonel.mobilestream.patches.ebay.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import semicoloncolonel.mobilestream.patches.ebay.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.misc.returnUnitSmali

// ─────────────────────────────────────────────────────────────────────────────
// Hide live listings (experimental).
//
// eBay 6.244.0.1 spreads eBay Live, the shopping-stream feature, across many
// surfaces, each a self-contained Compose composable that draws a carousel or
// tile of live-event listings with an auto-playing video preview. There is no
// single shared renderer: the Home feed, recommendations rows, search, the
// vertical landing pages, the item page, and promoted ads each build the live
// shelf a different way. So every live surface's own composable is emptied, and
// the auto-playing preview inside it never starts.
//
// Covered:
//   • Home feed. The home feed is a module framework. Its live modules are the
//     live-events carousel (shared by the generic and the personalized home
//     modules, drawn by one composer lambda that reads LiveEventsCarouselModule-
//     UiState and calls VideoCarouselCoordinatorAware), the avatar carousel
//     (LiveEventsAvatarCarousel), and the live video card (the VideoTile
//     composables in LiveVideoUiComposerProvider).
//   • Recommendations rows. LiveEventCarouselTreatment.Content, the treatment
//     for the live-event placement. The framework renders nothing for a
//     placement with no treatment, so an empty Content() leaves no gap.
//   • Search results. LiveCarouselComposableComponent (the carousel) and
//     EbayLiveEntryComposableComponent (the entry chip).
//   • Vertical landing pages. LiveEventsCarouselComponent.
//   • Item page. LiveSellerComposableComponent and the live promoted-store ad
//     backfill.
//   • Promoted-display ads. AdsLiveComposableComponent.
//
// Only live-named composables are touched. The generic video carousel and the
// shared video player are left alone, so ordinary product videos still play.
// The patch hides these surfaces; it does not disable the Live Hub activities
// or the links that open a stream directly. On by default.
//
// Targets are matched best-effort: a surface eBay renames or drops is skipped,
// not a hard error, so the rest of the eBay patches still apply. The patch
// fails only if no live surface matches at all.
//
// Experimental: the surfaces have not all been confirmed hidden on a device,
// and whether a live event is currently running affects whether they appear.
// ─────────────────────────────────────────────────────────────────────────────

private const val LIVE_EVENTS_MODULE_UI_STATE =
    "Lcom/ebay/mobile/discovery/moduledelegates/live/liveevents/LiveEventsCarouselModuleUiState;"

// Home live-events carousel (generic + personalized). The Compose content
// lambda in the module's composer; pinned by the module state it captures, not
// its synthetic name, so it survives a recompile.
internal object HomeLiveEventsCarouselContentFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    custom = { method, classDef ->
        method.name == "invoke" &&
            classDef.type.startsWith("Lcom/ebay/mobile/discovery/moduledelegates/live/liveevents/") &&
            classDef.interfaces.contains("Lkotlin/jvm/functions/Function3;") &&
            classDef.methods.any { constructor ->
                constructor.name == "<init>" &&
                    constructor.parameterTypes.any { it.toString() == LIVE_EVENTS_MODULE_UI_STATE }
            }
    },
)

// Home live-events avatar carousel.
internal object HomeLiveAvatarCarouselFingerprint : Fingerprint(
    definingClass =
        "Lcom/ebay/mobile/discovery/moduledelegates/live/avatarcarousel/ui/LiveEventsAvatarCarouselKt;",
    name = "LiveEventsAvatarCarousel",
    returnType = "V",
)

// Home live video card. CoordinatorAware wraps the plain tile; both empty out.
internal object HomeLiveVideoTileCoordinatorFingerprint : Fingerprint(
    definingClass =
        "Lcom/ebay/mobile/discovery/moduledelegates/core/videotile/LiveVideoUiComposerProvider;",
    name = "VideoTileCoordinatorAwareComposable",
    returnType = "V",
)

internal object HomeLiveVideoTileFingerprint : Fingerprint(
    definingClass =
        "Lcom/ebay/mobile/discovery/moduledelegates/core/videotile/LiveVideoUiComposerProvider;",
    name = "VideoTileComposable",
    returnType = "V",
)

// Recommendations live-event carousel.
internal object LiveEventCarouselTreatmentContentFingerprint : Fingerprint(
    definingClass =
        "Lcom/ebay/mobile/businesscomponent/recommendations/impl/composables/selectors/treatments/" +
            "LiveEventCarouselTreatment;",
    name = "Content",
    returnType = "V",
)

// Search-results live carousel and the live entry chip.
internal object SearchLiveCarouselComponentFingerprint : Fingerprint(
    definingClass = "Lcom/ebay/mobile/search/result/live/view/LiveCarouselComposableComponent;",
    name = "ComposeContent",
    returnType = "V",
)

internal object SearchEbayLiveEntryComponentFingerprint : Fingerprint(
    definingClass = "Lcom/ebay/mobile/search/result/viewmodels/EbayLiveEntryComposableComponent;",
    name = "ComposeContent",
    returnType = "V",
)

// Vertical landing live-events carousel.
internal object VerticalLandingLiveEventsComponentFingerprint : Fingerprint(
    definingClass =
        "Lcom/ebay/mobile/verticals/verticallanding/component/liveevents/LiveEventsCarouselComponent;",
    name = "ComposeContent",
    returnType = "V",
)

// Item-page live surfaces.
internal object ViewItemLiveSellerComponentFingerprint : Fingerprint(
    definingClass =
        "Lcom/ebay/mobile/viewitem/pages/component/composable/LiveSellerComposableComponent;",
    name = "ComposeContent",
    returnType = "V",
)

internal object ViewItemLivePromotedStoreAdComponentFingerprint : Fingerprint(
    definingClass =
        "Lcom/ebay/mobile/viewitem/pages/component/composable/" +
            "LivePromotedStoreAdBackfillComposableComponent;",
    name = "ComposeContent",
    returnType = "V",
)

// Promoted-display live ad.
internal object AdsLiveComponentFingerprint : Fingerprint(
    definingClass =
        "Lcom/ebay/mobile/ads/firstparty/promoteddisplay/components/live/AdsLiveComposableComponent;",
    name = "ComposeContent",
    returnType = "V",
)

// Composables that return void and are drawn only for a live surface.
private val voidLiveComposables = listOf(
    HomeLiveAvatarCarouselFingerprint,
    HomeLiveVideoTileCoordinatorFingerprint,
    HomeLiveVideoTileFingerprint,
    LiveEventCarouselTreatmentContentFingerprint,
    SearchLiveCarouselComponentFingerprint,
    SearchEbayLiveEntryComponentFingerprint,
    VerticalLandingLiveEventsComponentFingerprint,
    ViewItemLiveSellerComponentFingerprint,
    ViewItemLivePromotedStoreAdComponentFingerprint,
    AdsLiveComponentFingerprint,
)

@Suppress("unused")
val hideLiveListingsPatch = bytecodePatch(
    name = "Hide live listings",
    description = "Removes the eBay Live carousels of live-stream listings from the home tab, " +
        "recommendations, search, vertical pages, item pages, and ads.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        var hidden = 0

        fun MutableMethod?.hide(smali: String) {
            this ?: return
            returnEarly(smali)
            hidden++
        }

        voidLiveComposables.forEach { it.methodOrNull.hide("return-void") }
        // The home carousel content lambda returns Unit, not void.
        HomeLiveEventsCarouselContentFingerprint.methodOrNull.hide(returnUnitSmali())

        if (hidden == 0) throw PatchException("Hide live listings: no eBay Live surface matched")
    }
}
