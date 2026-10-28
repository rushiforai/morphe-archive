package app.morphe.patches.compatibility

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val BUSUU = Compatibility(
        name = "Busuu",
        packageName = "com.busuu.android.enc",
        targets = listOf(
            AppTarget(
                version = "32.41.0"
            ),
            AppTarget(
                version = null,
            )
        )
    )

    val FIRSTY = Compatibility(
        name = "Firsty",
        packageName = "com.firsty.app",
        appIconColor = 0xD7F732,
        targets = listOf(
            AppTarget(
                version = "1.8.23",
            )
        )
    )
}