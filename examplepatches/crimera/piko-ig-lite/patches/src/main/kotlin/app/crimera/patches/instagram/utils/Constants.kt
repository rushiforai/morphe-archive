/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.utils

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi.ARM64_V8A

object Constants {
    val COMPATIBILITY_INSTAGRAM =
        Compatibility(
            name = "Instagram",
            packageName = "com.instagram.android",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFC483C,
            targets =
                listOf(
                    // Stable
                    AppTarget(
                        version = "452.1.0.53.64",
                        versionCodes =
                            mapOf(
                                ARM64_V8A to 385811006,
                            ),
                    ),
                    AppTarget(
                        version = "452.0.0.48.64",
                        versionCodes =
                            mapOf(
                                ARM64_V8A to 385810228,
                            ),
                    ),
                    AppTarget(
                        version = "451.0.0.53.80",
                        versionCodes =
                            mapOf(
                                ARM64_V8A to 385713073,
                            ),
                    ),
                    AppTarget(
                        version = "449.0.0.52.84",
                        versionCodes =
                            mapOf(
                                ARM64_V8A to 385511871,
                            ),
                    ),
                    AppTarget(
                        version = "448.0.0.52.84",
                        versionCodes =
                            mapOf(
                                ARM64_V8A to 385412061,
                            ),
                    ),
                ),
        )

    // Instagram classes.
    const val EDIT_MEDIA_INFO_FRAGMENT_CLASS = "Linstagram/features/creation/fragment/EditMediaInfoFragment;"

    // Extension classes.
    const val INTEGRATIONS_PACKAGE = "Lapp/morphe/extension/instagram"
    const val ENTITY_CLASS = "$INTEGRATIONS_PACKAGE/entity"

    const val PATCHES_DESCRIPTOR = "$INTEGRATIONS_PACKAGE/patches"

    const val DOWNLOAD_DESCRIPTOR = "$PATCHES_DESCRIPTOR/download"

    const val ADS_DESCRIPTOR = "$PATCHES_DESCRIPTOR/ads"

    const val GHOST_DESCRIPTOR = "$PATCHES_DESCRIPTOR/ghost"

    const val SWIPE_CAMERA_DESCRIPTOR = "$PATCHES_DESCRIPTOR/navigation/SwipeCamera"

    const val THEME_DESCRIPTOR = "$PATCHES_DESCRIPTOR/theme/AmoledMessages"

    const val SETTINGS_DESCRIPTOR = "$INTEGRATIONS_PACKAGE/settings"
}
