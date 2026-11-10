package app.zdrgon.patches.strava.misc

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.strava.shared.Constants.COMPATIBILITY_STRAVA

/**
 * Hides subscription upsells and promotional modules.
 *
 * Strava's feed and many of its screens are server-driven "modular
 * framework" content. This patch intercepts the modular model getters
 * (see [interceptModularFrameworkGetters]) so the extension can drop
 * modules Strava marks as upsells or promotions before they render.
 *
 * This is UI cleanup only. It does not change subscription state and
 * does not unlock any paid feature.
 */
@Suppress("unused")
val hideSubscriptionPromotionsPatch = bytecodePatch(
    name = "Hide subscription promotions",
    description = "Hides subscription upsell modules and promotional cards from the feed and other " +
        "modular screens. UI cleanup only: does not unlock any paid features.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STRAVA)

    extendWith(STRAVA_EXTENSION)

    val options = arrayOf(
        booleanOption(
            key = "upselling",
            title = "Upselling",
            description = "Elements that suggest you subscribe.",
            default = true,
            required = true,
        ),
        booleanOption(
            key = "promo",
            title = "Promotions",
            description = "Elements that promote features, challenges, clubs, etc.",
            default = true,
            required = true,
        ),
    )

    execute {
        writeHideDistractionsOptions(options)
        interceptModularFrameworkGetters()
    }
}
