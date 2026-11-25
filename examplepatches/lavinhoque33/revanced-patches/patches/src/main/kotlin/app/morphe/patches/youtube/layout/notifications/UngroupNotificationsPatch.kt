/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4896
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 * Ported from anddea/revanced-patches.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.youtube.layout.notifications

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.compatibility.Constants.YOUTUBE_PACKAGE_NAME
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.UNGROUP_NOTIFICATIONS
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.patches.youtube.video.information.videoInformationPatch
import app.morphe.patches.youtube.video.videoid.hookBackgroundPlayVideoId
import app.morphe.patches.youtube.video.videoid.hookVideoId
import app.morphe.patches.youtube.video.videoid.videoIdPatch
import app.morphe.util.Utils.printWarn

private const val EXTENSION_CLASS = "Lapp/morphe/extension/youtube/patches/UngroupNotificationsPatch;"

@Suppress("unused")
val ungroupNotificationsPatch = bytecodePatch(
    name = UNGROUP_NOTIFICATIONS.title,
    description = UNGROUP_NOTIFICATIONS.summary,
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        videoIdPatch,
        // Includes the player type and Shorts state hooks used by playback tracking.
        videoInformationPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val version = packageMetadata.versionName
        val constructorFingerprints = when (version) {
            "20.05.46" -> listOf(NetworkResponseBytesConstructorOldFingerprint)
            "21.13.164", "21.39.525" -> listOf(
                NetworkResponseBytesConstructorFingerprint,
                NetworkResponseBuffersConstructorLegacyFingerprint,
            )
            "21.45.90" -> listOf(
                NetworkResponseBytesConstructorFingerprint,
                NetworkResponseBuffersConstructorFingerprint,
            )
            else -> null
        }

        if (packageMetadata.packageName != YOUTUBE_PACKAGE_NAME || constructorFingerprints == null) {
            printWarn("Ungroup notifications: unsupported app version ${packageMetadata.packageName} $version.")
            return@execute
        }

        // Find every expected response route before installing any callbacks or settings.
        val constructors = constructorFingerprints.map { fingerprint ->
            val method = try {
                fingerprint.methodOrNull
            } catch (_: PatchException) {
                null
            }
            if (method?.implementation == null) {
                printWarn("Ungroup notifications: a required response constructor was not found on YouTube $version.")
                return@execute
            }
            method
        }

        constructors.forEach { constructor ->
            val bodyType = constructor.parameterTypes[1]
            constructor.addInstructions(
                0,
                """
                    invoke-static/range { p2 .. p2 }, $EXTENSION_CLASS->ungroupNotifications($bodyType)$bodyType
                    move-result-object p2
                """,
            )
        }

        val onVideoLoaded = "$EXTENSION_CLASS->onVideoLoaded(Ljava/lang/String;)V"
        hookVideoId(onVideoLoaded)
        hookBackgroundPlayVideoId(onVideoLoaded)

        addPreference(
            arrayOf("PREFERENCE_SCREEN: FEED", "SETTINGS: UNGROUP_NOTIFICATIONS"),
            UNGROUP_NOTIFICATIONS,
        )
    }
}
