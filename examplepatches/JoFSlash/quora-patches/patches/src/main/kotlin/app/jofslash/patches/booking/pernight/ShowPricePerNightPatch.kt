package app.jofslash.patches.booking.pernight

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.enableSabaJsonFilter
import app.jofslash.patches.booking.shared.sabaJsonFilterPatch
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val showPricePerNightPatch = bytecodePatch(
    name = "Show price per night",
    description = "Adds the price per night (\"€ 45 per night\") under the total price of each search " +
            "result for stays of 2 or more nights. It's the total the card shows divided by the nights, " +
            "including taxes and charges when Show full price up front added them.",
    default = true
) {
    category("Prices")
    compatibleWith(COMPATIBILITY_BOOKING)

    dependsOn(sabaJsonFilterPatch)

    execute {
        // Search results are a server-driven page: each card's tap action has the stay's dates and
        // price breakdown. The filter adds a label after the card's total and a sentence to its
        // screen reader text. It runs after Show full price up front, so it divides the total the
        // card shows.
        enableSabaJsonFilter("pricePerNight")
    }
}
