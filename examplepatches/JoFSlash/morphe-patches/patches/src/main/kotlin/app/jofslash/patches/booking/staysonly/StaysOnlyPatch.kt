package app.jofslash.patches.booking.staysonly

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val STAYS_ONLY = "Lapp/jofslash/extension/booking/StaysOnly;"

/** What the home screen's product tabs show: the products and the one picked. */
private const val PRODUCTS_HEADER_STATE = "Lcom/booking/appindex/productsheader/ProductsHeaderReactor\$State;"
private const val PRODUCT = "Lcom/booking/appindex/productsheader/ProductsHeaderReactor\$Product;"

@Suppress("unused")
val staysOnlyPatch = bytecodePatch(
    name = "Stays only",
    description = "Hides the Flights, Car rental, Taxi, Attractions and Flight + Hotel tabs on the home " +
            "screen, for when you only book places to stay. A link to one of them shows its tab next to " +
            "Stays; the bookings you have of them still show.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_BOOKING)

    extendWith("extensions/booking.mpe")

    execute {
        // The home screen draws its row of product tabs, and picks the search box, from this state.
        // Its constructor gets the list of products to show and the picked product. Only Stays is
        // kept, and with one product left the app draws no row. The app opens on Stays; a link to
        // another product (such as taxis.booking.com) opens with that one picked, and it is kept
        // next to Stays so the link works. The product screens and My Trips don't read the list.
        val constructors = mutableClassDefBy(PRODUCTS_HEADER_STATE).methods.filter { method ->
            method.name == "<init>" && method.parameterTypes.map { it.toString() }.let {
                it.size == 3 && it[0] == "Ljava/util/List;" && it[1] == PRODUCT
            }
        }
        if (constructors.size != 1) {
            throw PatchException("Expected one $PRODUCTS_HEADER_STATE constructor, found ${constructors.size}")
        }
        // p0 isn't set up before the super constructor, but the parameters can be changed.
        constructors.single().addInstructions(
            0,
            """
                invoke-static { p1, p2 }, $STAYS_ONLY->products(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;
                move-result-object p1
            """
        )
    }
}
