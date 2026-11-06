// Ported from xob0t/morphe-patches (GPLv3), app/ozon/patches/shared/Constants.kt.
package app.ru_apps.ozon

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "ru.ozon.app.android"

    val COMPATIBILITY_OZON = Compatibility(
        name = "Ozon",
        packageName = PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x005BFF,
        targets = listOf(
            // 2026-10-08: same stale-pin gate bug as elsewhere in this repo — live Ozon moved to
            // 19.38.0 (versionCode 2721) and this list wasn't keeping up.
            AppTarget(
                version = "19.38.0",
                versionCode = 2721,
                minSdk = 26,
            ),
            AppTarget(
                version = "19.37.0",
                versionCode = 2720,
                minSdk = 26,
            ),
            AppTarget(
                version = "19.36.1",
                versionCode = 2719,
                minSdk = 26,
            ),
            AppTarget(
                version = "19.36.0",
                versionCode = 2718,
                minSdk = 26,
            ),
            AppTarget(
                version = "19.35.0",
                versionCode = 2717,
                minSdk = 26,
            ),
            AppTarget(
                version = "19.34.0",
                versionCode = 2714,
                minSdk = 26,
            ),
            AppTarget(
                version = "19.33.1",
                versionCode = 2712,
                minSdk = 26,
            ),
            AppTarget(
                version = "19.32.0",
                versionCode = 2710,
                minSdk = 26,
            ),
            AppTarget(
                version = "19.31.0",
                versionCode = 2706,
                minSdk = 26,
            ),
            AppTarget(
                version = "19.30.0",
                versionCode = 2705,
                minSdk = 26,
            ),
            AppTarget(
                version = "19.29.0",
                versionCode = 2700,
                minSdk = 26,
            ),
            AppTarget(
                version = "19.28.0",
                versionCode = 2698,
                minSdk = 26,
            ),
            AppTarget(
                version = "19.27.0",
                versionCode = 2697,
                minSdk = 26,
            ),
        ),
    )
}
