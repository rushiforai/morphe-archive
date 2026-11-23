package app.jofslash.patches.booking.upfront

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.enableSabaJsonFilter
import app.jofslash.patches.booking.shared.methodOf
import app.jofslash.patches.booking.shared.sabaJsonFilterPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/booking/UpfrontPrice;"

/** The price the app's own price views show: map cards, the property page, rooms. */
private const val PRICE_DATA = "Lcom/booking/price/data/PriceData;"

/** The price on a map marker. */
private const val MARKER_PRICE = "Lcom/booking/mapcomponents/marker/PropertyMarkerPriceProvider;"

/** Turns a PriceData into the props of a price view. */
private const val PRICE_DATA_CONVERTER = "Lcom/booking/price/state/adapter/PriceDataToPropsConverter;"

@Suppress("unused")
val showFullPriceUpFrontPatch = bytecodePatch(
    name = "Show full price up front",
    description = "Shows the total price including the taxes and charges Booking.com adds on top, such as " +
            "a city tax or cleaning fee, in search results, on the map, on the property page and in " +
            "the room list, instead of a lower price followed by \"+ € 12 taxes and charges\".",
    default = true
) {
    category("Prices")
    compatibleWith(COMPATIBILITY_BOOKING)

    dependsOn(sabaJsonFilterPatch)

    execute {
        // Search results are a server-driven page: each card's labels show the gross price and the
        // "+ € 12 taxes and charges" line, and the card's tap action carries the price breakdown
        // they come from. The filter puts the all-inclusive amounts in the labels.
        enableSabaJsonFilter("upfrontPrice")

        // The app's own views (map cards, property page, rooms, wishlists) are drawn from a
        // PriceData: before it becomes a price view, the excluded charges are added to its prices.
        methodOf(
            PRICE_DATA_CONVERTER,
            "createProsFromPriceData",
            listOf(PRICE_DATA),
        ).addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->priceData(Ljava/lang/Object;)V"
        )

        // Map markers format their own price from the marker's gross amount.
        methodOf(MARKER_PRICE, "getPrice", emptyList()).addInstructions(
            0,
            """
                invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->markerPrice(Ljava/lang/Object;)Ljava/lang/CharSequence;
                move-result-object v0
                if-eqz v0, :app_price
                return-object v0
                :app_price
                nop
            """
        )
    }
}
