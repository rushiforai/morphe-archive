package app.cesbar.patches.velov

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Vélo'v",
        packageName = "com.jcdecaux.vls.lyon",
        appIconColor = 0xF42F34,
        targets = listOf(AppTarget("3.1.1"))
    )

    const val SIGNATURE = "F7A3BCBEF27B68409D77C105243233B9BD7B4889"
}