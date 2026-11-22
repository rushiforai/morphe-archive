/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    /**
     * Yandex Music 2026.11.1 (versionCode 24026561) and 2026.11.2 (versionCode 24026572).
     *
     * The patches use exact obfuscated class names from these builds. They are deliberately
     * pinned to the tested versions instead of matching older builds with different R8 names.
     *
     * The version strings include the build suffix because that is the complete versionName
     * reported by the APK (`aapt2 dump badging`), and Morphe Manager compares it as-is.
     * A target declared only as "2026.11.2" is shown as unsupported for an APK whose
     * versionName is "2026.11.2 #172.1gpr".
     */
    val COMPATIBILITY_YANDEX_MUSIC = Compatibility(
        name = "Yandex Music",
        packageName = "ru.yandex.music",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFFCC00,
        targets = listOf(
            AppTarget(
                version = "2026.11.1 #171gpr",
                versionCode = 24026561,
                minSdk = 24,
            ),
            AppTarget(
                version = "2026.11.2 #172.1gpr",
                versionCode = 24026572,
                minSdk = 32,
            ),
        ),
    )
}
