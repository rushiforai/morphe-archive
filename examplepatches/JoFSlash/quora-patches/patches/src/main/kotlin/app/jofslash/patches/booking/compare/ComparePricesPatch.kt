package app.jofslash.patches.booking.compare

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.callFromPropertyPageConstructor
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/booking/ComparePrices;"

@Suppress("unused")
val comparePricesPatch = bytecodePatch(
    name = "Compare prices",
    description = "Adds a Compare prices button to the property page. It shows the price on the " +
            "hotel's own website from Google Hotels next to the Booking.com price, for the same " +
            "dates and guests, and links to the hotel's website.",
    default = true
) {
    category("Prices")
    compatibleWith(COMPATIBILITY_BOOKING)

    extendWith("extensions/booking.mpe")

    execute {
        callFromPropertyPageConstructor("$EXTENSION_CLASS->onPropertyPage(Landroid/app/Activity;)V")
    }
}
