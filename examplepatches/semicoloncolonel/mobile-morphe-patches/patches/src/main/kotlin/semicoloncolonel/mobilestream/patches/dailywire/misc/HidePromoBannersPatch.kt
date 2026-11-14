package semicoloncolonel.mobilestream.patches.dailywire.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.dailywire.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// The Daily Wire 3.5.21 / 3.5.22.
//
// DailyWire+ cross-promotes its own streaming content ("Now Streaming", "Watch
// Movie") in two places, and this removes both:
//
//  - The in-feed promo card is built from the API by
//    PromoItemMapperKt.toPromoItem(PromoItemDto), which already returns null for
//    a promo it cannot build; the screens drop the nulls. It now always returns
//    null, so no promo item is created and the card is never drawn. This also
//    removes the plan-promotion ("upgrade") promos in the feed.
//  - The docked banner pinned above the bottom bar is a Dynamic Message, drawn
//    by the DynamicMessagesHost composable. It now returns without composing, so
//    the banner and its slot are gone (the same way "Skip ads" drops its ad
//    container).
//
// This is DailyWire's own first-party promotion, not a paid ad placement (those
// are handled by "Skip ads"). Content stays gated on the server, so hiding the
// promo does not unlock anything.

internal object ToPromoItemFingerprint : Fingerprint(
    definingClass = "Lcom/dailywire/thedailywire/app/domain/retrofit_dw/PromoItemMapperKt;",
    name = "toPromoItem",
    parameters = listOf("Lcom/dailywire/thedailywire/components/api/retrofit_dw/dtos/PromoItemDto;"),
    returnType = "Lcom/dailywire/thedailywire/app/domain/retrofit_dw/models/PromoItem;",
)

// Parameters are left off so the match survives the obfuscated Compose argument
// types changing between builds; there is only one DynamicMessagesHost.
internal object DynamicMessagesHostFingerprint : Fingerprint(
    definingClass = "Lcom/dailywire/thedailywire/app/ui/activity/components/DynamicMessagesKt;",
    name = "DynamicMessagesHost",
    returnType = "V",
)

@Suppress("unused")
val hidePromoBannersPatch = bytecodePatch(
    name = "Hide promo banners",
    description = "Removes the DailyWire+ \"Now Streaming\" promo card and the docked banner that promote " +
        "the app's own streaming content.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        ToPromoItemFingerprint.method.returnEarly(
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        DynamicMessagesHostFingerprint.method.returnEarly("return-void")
    }
}
