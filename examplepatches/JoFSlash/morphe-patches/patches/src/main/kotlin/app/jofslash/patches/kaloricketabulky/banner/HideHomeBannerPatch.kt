package app.jofslash.patches.kaloricketabulky.banner

import app.jofslash.patches.kaloricketabulky.shared.Constants.APP
import app.jofslash.patches.kaloricketabulky.shared.Constants.COMPATIBILITY_KALORICKE_TABULKY
import app.jofslash.patches.kaloricketabulky.shared.methodOf
import app.jofslash.patches.kaloricketabulky.shared.returnBoolean
import app.morphe.patcher.patch.bytecodePatch

private const val BANNER = "$APP/dto/Banner;"

@Suppress("unused")
val hideHomeBannerPatch = bytecodePatch(
    name = "Hide home banner",
    description = "Hides the picture banner on the home screen that Kalorické Tabulky fills from its servers, " +
            "for example with offers and news.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_KALORICKE_TABULKY)

    execute {
        // The home screen hides a banner you closed (hiddenByUser). Every banner now counts as closed.
        methodOf(BANNER, "getHiddenByUser").returnBoolean(true)
    }
}
