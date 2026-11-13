package arpit.morphe.patches.c131.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Half Marathon Trainer 13.1 (21K) by Zen Labs Fitness — the half-marathon app of
     * the same family as C25K and Couch to 10K.
     *
     * Shipped as a plain universal APK (APKPure build), not a split bundle.
     */
    val COMPATIBILITY_C131 = Compatibility(
        name = "Half Marathon 13.1",
        packageName = "com.c13_1forpink2",
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(
                version = "96.03"
            )
        )
    )
}
