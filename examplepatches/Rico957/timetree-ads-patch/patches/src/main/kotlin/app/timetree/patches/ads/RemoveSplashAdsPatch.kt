package app.timetree.patches.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.timetree.patches.shared.PACKAGE_NAME
import app.timetree.patches.shared.SPLASH_ADS_ACTIVITY
import app.timetree.patches.shared.SplashAdsGateFingerprint

/**
 * Kills the cold-start / foreground open ad.
 *
 * `SplashAdsActivity` is a dedicated, `singleTop` screen that TimeTree launches on top of the
 * launcher to show a full screen interstitial (image or video) before the calendar appears.
 * Its gate method already contains a "nothing to show -> finish()" path, which is what the app
 * itself does when no ad was sold. The patch forces that path every time, so the ad screen
 * opens and closes immediately instead of covering the calendar.
 */
@Suppress("unused")
val removeSplashAdsPatch = bytecodePatch(
    name = "Remove splash/open ads",
    description = "Forces the splash ad screen to take its built-in \"no ad to show\" path, " +
        "so no full screen ad covers the app on cold start.",
) {
    compatibleWith(
        Compatibility(
            packageName = PACKAGE_NAME,
            name = "TimeTree",
            description = "Shared calendar app. Patch targets the open-ad screen.",
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = null)),
        ),
    )

    execute {
        SplashAdsGateFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, $SPLASH_ADS_ACTIVITY->finish()V
                return-void
            """,
        )
    }
}
