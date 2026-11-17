/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.patches.music.interaction.smartshuffle

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.music.interaction.jam.jamQueueSharingPatch
import app.morphe.patches.music.interaction.playlisttracktap.playlistTrackTapPatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.video.information.videoInformationPatch
import app.morphe.patches.shared.misc.request.authHeadersPatch
import app.morphe.util.Utils.printWarn

internal fun supportsSmartShuffle(version: String) = version in setOf("9.15.51", "9.40.51", "9.45.51")

/** Resolving one prerequisite may fail; no installer is invoked until every prerequisite has resolved. */
internal fun preflightSmartShuffle(vararg resolvers: () -> (() -> Unit)): () -> Unit {
    val installers = resolvers.map { it() }
    return { installers.forEach { it() } }
}

@Suppress("unused")
val smartShufflePatch = bytecodePatch(
    name = "Smart Shuffle",
    description = "Long press playlist-header Shuffle to mix suggested songs into shuffled playlist playback. " +
        "Suggestions can be kept or dismissed from the queue.",
    default = true,
) {
    dependsOn(
        sharedExtensionPatch,
        authHeadersPatch,
        jamQueueSharingPatch,
        playlistTrackTapPatch,
        videoInformationPatch,
    )
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        if (!supportsSmartShuffle(packageMetadata.versionName)) {
            printWarn("Smart Shuffle requires Music 9.15.51 or 9.40.51 (9.45.51 with all hooks). " +
                "Skipping the entire feature: no toggle or Smart Shuffle hooks were installed.")
            return@execute
        }
        val install = try {
            preflightSmartShuffle(
                { resolveSmartShuffleNative() },
                { resolveSmartShuffleKeep() },
                { resolveSmartShuffleAuto() },
                { resolveSmartShuffleUi() },
            )
        } catch (exception: Exception) {
            if (packageMetadata.versionName != "9.45.51") throw exception
            printWarn("Smart Shuffle prerequisites are unavailable on this Music version: ${exception.message}. " +
                "Skipping the entire feature: no toggle or Smart Shuffle hooks were installed.")
            return@execute
        }
        install()
    }
}
