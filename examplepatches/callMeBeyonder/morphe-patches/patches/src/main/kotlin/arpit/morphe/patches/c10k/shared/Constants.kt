package arpit.morphe.patches.c10k.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Couch to 10K Running Trainer by Zen Labs Fitness — the 10K sibling of C25K.
     *
     * Shipped as a plain universal APK (APKPure build), not a split bundle.
     */
    val COMPATIBILITY_C10K = Compatibility(
        name = "Couch to 10K",
        packageName = "com.c10kforpink",
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(
                version = "117.19"
            )
        )
    )
}
