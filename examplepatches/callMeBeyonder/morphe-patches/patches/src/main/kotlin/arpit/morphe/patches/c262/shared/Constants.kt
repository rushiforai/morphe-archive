package arpit.morphe.patches.c262.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Marathon Trainer 26.2 (42K) by Zen Labs Fitness — the marathon app of the same
     * family as C25K, Couch to 10K and Half Marathon 13.1.
     *
     * Shipped as a plain universal APK (APKPure build), not a split bundle.
     */
    val COMPATIBILITY_C262 = Compatibility(
        name = "Marathon 26.2",
        packageName = "com.c26_2forpink",
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(
                version = "2.58"
            )
        )
    )
}
