package app.thefit.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_DAFIT = Compatibility(
        name = "Da Fit",
        packageName = "com.crrepa.band.dafit",
        appIconColor = 0xFF6B00,
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = true
            ),
            AppTarget(
                version = "2.9.25-97-gf8b4dff77d"
            ),
            AppTarget(
                version = "v2.9.25-97-gf8b4dff77d"
            ),
            AppTarget(
                version = "2.9.25"
            ),
            AppTarget(
                version = "v2.8.4-186-g43ae5fb5ce"
            ),
            AppTarget(
                version = "2.8.4"
            )
        )
    )
}
