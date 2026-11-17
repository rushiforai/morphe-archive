package semicoloncolonel.mobilestream.patches.kouponai.misc

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.Constants
import semicoloncolonel.mobilestream.patches.kouponai.shared.requireNativeLibsPatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.enableWebFilter
import semicoloncolonel.mobilestream.patches.kouponai.shared.kouponWebFilterPatch

// ─────────────────────────────────────────────────────────────────────────────
// Koupon 3.1.6 — Show promo codes.
//
// A deal page (a web page in React Native's web view) already holds the whole
// promo code in its Copy code button, as <div class="code">. The page's style
// lays the dark "Copy code" panel over it, cut into a peeled corner, so only
// the last letters show. KouponWebFilter adds a style rule when a Koupon page
// loads: the panel takes the left half without the peel, and the code shows
// in full on the right. Tapping the button still copies the code and opens
// the store.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val showPromoCodesPatch = bytecodePatch(
    name = "Show promo codes",
    description = "Shows the whole promo code on deal pages instead of hiding it under the Copy code button.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(requireNativeLibsPatch)

    dependsOn(kouponWebFilterPatch)

    execute {
        enableWebFilter("showCodes")
    }
}
