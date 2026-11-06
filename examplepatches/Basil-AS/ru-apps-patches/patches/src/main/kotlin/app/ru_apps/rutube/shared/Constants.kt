// Ported from virzak/morphe-patches (GPLv3), app/rutube/patches/shared/Constants.kt.
package app.ru_apps.rutube.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * RuTube.
     *
     * Confirmed against ru.rutube.app 31.14.2-rustore pulled from a device:
     * a single base.apk (no splits), 6 dex files, no Flutter/React Native.
     */
    val COMPATIBILITY_RUTUBE = Compatibility(
        name = "RuTube",
        packageName = "ru.rutube.app",
        apkFileType = ApkFileType.APK,
        // Approximate RUTUBE brand violet; adjust to the exact launcher icon background.
        appIconColor = 0x7B2FF7,
        targets = listOf(
            // A live test (2026-10-08) confirmed the `version = null,
            // isExperimental = true` wildcard target below does NOT actually
            // satisfy morphe's compatibility check in practice (every patch was
            // silently skipped as "incompatible" against this newer build) -
            // same pinning-gate issue found and fixed for RuStore this session.
            // Pin the exact newer version explicitly instead, following the
            // multi-version AppTarget list convention used by
            // ozon/avito/tbank/wildberries/rustore.
            AppTarget(
                version = "31.17.2-rustore",
            ),
            // The version these patches are developed against. Note RuTube is not on
            // apkmirror.com or uptodown.com and the site only links app stores, so the
            // practical way to obtain this exact apk is to install from RuStore and pull
            // it off the device:
            //   adb shell pm path ru.rutube.app && adb pull <path>
            AppTarget(
                version = "31.14.2-rustore",
            ),
            // Kept for documentation of intent, though not functionally
            // effective on its own (see note above) - still harmless to leave.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}
