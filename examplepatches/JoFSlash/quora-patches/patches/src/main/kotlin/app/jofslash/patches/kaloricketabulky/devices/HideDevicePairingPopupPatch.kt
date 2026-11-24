package app.jofslash.patches.kaloricketabulky.devices

import app.jofslash.patches.kaloricketabulky.shared.Constants.APP
import app.jofslash.patches.kaloricketabulky.shared.Constants.COMPATIBILITY_KALORICKE_TABULKY
import app.jofslash.patches.kaloricketabulky.shared.methodOf
import app.jofslash.patches.kaloricketabulky.shared.returnBoolean
import app.morphe.patcher.patch.bytecodePatch

private const val DEVICE_PAIR_PROMO_CONDITION = "$APP/screenFragment/home/Conditions\$DevicePairPromo;"

@Suppress("unused")
val hideDevicePairingPopupPatch = bytecodePatch(
    name = "Hide device pairing pop-up",
    description = "Hides the screen that opens by itself two days after you install the app and asks you to " +
            "connect a watch, a fitness tracker or another app, when you have none connected yet. You can still connect them in the settings.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_KALORICKE_TABULKY)

    execute {
        methodOf(DEVICE_PAIR_PROMO_CONDITION, "evaluate").returnBoolean(false)
    }
}
