package app.morphe.patches.busuu

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILTIY = Compatibility(
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
}