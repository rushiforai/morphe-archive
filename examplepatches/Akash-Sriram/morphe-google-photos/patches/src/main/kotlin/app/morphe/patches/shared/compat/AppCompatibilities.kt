package app.morphe.patches.shared.compat

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object AppCompatibilities {

    val GOOGLE_PHOTOS = Compatibility(
        name = "Google Photos",
        packageName = "com.google.android.apps.photos",
        appIconColor = 0xFC3F3C,
        targets = listOf(
            AppTarget("7.94.0.984908898"),
        ),
    )
}
