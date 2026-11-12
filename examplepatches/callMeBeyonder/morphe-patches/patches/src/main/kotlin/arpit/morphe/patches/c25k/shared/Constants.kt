package arpit.morphe.patches.c25k.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * C25K (Couch to 5K) by Zen Labs Fitness — the freemium runner app.
     *
     * Shipped as a plain universal APK (APKPure build), not a split bundle.
     */
    val COMPATIBILITY_C25K = Compatibility(
        name = "C25K",
        packageName = "com.c25k",
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(
                version = "144.27"
            )
        )
    )
}
