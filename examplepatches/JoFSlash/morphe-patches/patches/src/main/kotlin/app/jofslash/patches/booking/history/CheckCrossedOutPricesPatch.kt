package app.jofslash.patches.booking.history

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.callAfterIn
import app.jofslash.patches.booking.shared.priceRecordingPatch
import app.jofslash.patches.booking.shared.methodOf
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/booking/DiscountCheck;"

// The property page's price ("Price for 2 nights, € 79 € 59") is drawn by this facet's Compose
// content, which calls PriceViewHPComposeView(modifier, props, onClick, onReward, onDetails,
// composer, changed).
private const val PRICE_FACET = "Lcom/booking/price/ui/marken/priceview/FacetHpPriceViewCompose"
private const val PRICE_VIEW = "Lcom/booking/price/ui/compose/PriceViewHPComposeKt;"

// The action that hands the property page's price view its PriceData (the price it shows, the
// crossed-out price and the badges such as "Genius discount" and "Mobile-only price").
private const val SHOW_PRICE_DATA = "Lcom/booking/price/ui/marken/priceview/ReactorPriceView\$ShowPriceData;"

@Suppress("unused")
val checkCrossedOutPricesPatch = bytecodePatch(
    name = "Check crossed-out prices",
    description = "When a hotel's page shows a crossed-out \"original\" price, adds a line under " +
            "the price that compares it with the prices saved on your phone for the same dates " +
            "and guests: whether you ever saw that price, or only lower ones. Says so when there " +
            "aren't enough saved prices yet, and when the discount is your Genius or app-only price.",
    default = true
) {
    category("Prices")
    compatibleWith(COMPATIBILITY_BOOKING)

    // Saves the prices the app shows, which the check compares with.
    dependsOn(priceRecordingPatch)

    execute {
        methodOf(SHOW_PRICE_DATA, "<init>").addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onPriceData(Ljava/lang/Object;)V"
        )
        callAfterIn(
            PRICE_FACET,
            PRICE_VIEW,
            "PriceViewHPComposeView",
            6,
            "$EXTENSION_CLASS->priceView(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;" +
                    "Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V"
        )
    }
}
