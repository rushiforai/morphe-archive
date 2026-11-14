package app.xiondigital.patches.atoz.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Amazon A to Z (`com.amazon.atozm`).
 *
 * Unlike the Tandem patches, this one is declared for **every** version: a null [AppTarget.version]
 * means Morphe will offer it for whatever build the user supplies instead of refusing a version it
 * has not seen. That is deliberate, because the two anchors it relies on are structural rather than
 * version-specific:
 *
 * - the theme names are `AppTheme` / `AppTheme.Launcher`, inherited from the React Native template
 *   and unchanged in every build inspected (6.0.2065.0, 6.0.2988.0, 6.0.3553.0, 6.0.5098.0);
 * - `com.amazon.atozm.MainApplication` is the class the manifest names as `android:name` on
 *   `<application>`, and it overrides `onCreate()` in every one of those builds.
 *
 * The patch still fails loudly instead of silently doing nothing: if a future build renames the
 * theme or stops overriding `onCreate()`, the patch aborts with a message naming what is missing.
 *
 * `APK` is declared as the preferred input. A to Z is distributed as a single APK per ABI; the
 * arm64 build is the only one that installs on a 64-bit-only device such as the Galaxy S25 Ultra.
 */
object Constants {
    val COMPATIBILITY_ATOZ_APK = Compatibility(
        name = "Amazon A to Z",
        packageName = "com.amazon.atozm",
        description = "Amazon's associate app. Any version is accepted; the dark-mode patch only " +
            "needs the app's AppTheme styles and MainApplication.onCreate().",
        apkFileType = ApkFileType.APK,
        // Amazon orange, the accent of the A to Z launcher icon.
        appIconColor = 0xFF9900,
        targets = listOf(AppTarget(version = null)),
    )
}
