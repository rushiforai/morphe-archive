/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Adapted application and MediaSession fingerprints for Dyskal's standalone Discord patch.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */
package me.dyskal.patches.discord

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

internal object MusicApplicationOnCreateFingerprint : Fingerprint(
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(string("activity"))
)

internal object MediaSessionSetMetadataFingerprint : Fingerprint(
    filters = listOf(methodCall(
        definingClass = "Landroid/media/session/MediaSession;",
        name = "setMetadata",
        parameters = listOf("Landroid/media/MediaMetadata;")
    ))
)

internal object MediaSessionSetPlaybackStateFingerprint : Fingerprint(
    filters = listOf(methodCall(
        definingClass = "Landroid/media/session/MediaSession;",
        name = "setPlaybackState",
        parameters = listOf("Landroid/media/session/PlaybackState;")
    ))
)

internal object MusicMetadataAugmentFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "L"),
    filters = listOf(string("android.media.metadata.ALBUM"), string("android.media.IS_EXPLICIT"))
)

internal object MusicVideoIdFingerprint : Fingerprint(
    filters = listOf(string("Null initialPlayabilityStatus")),
    custom = { method, _ ->
        method.parameterTypes.size in 2..3 && method.parameterTypes[0].toString().startsWith("L")
                && method.parameterTypes[1].toString() == "Ljava/lang/String;"
    }
)
