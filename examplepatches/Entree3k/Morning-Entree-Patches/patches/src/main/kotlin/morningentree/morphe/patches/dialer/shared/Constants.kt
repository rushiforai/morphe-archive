package morningentree.morphe.patches.dialer.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Google Phone",
        packageName = "com.google.android.dialer",
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget("161.0.726587057"),
            AppTarget("161.0.726587057-downloadable"),
        ),
    )
}
