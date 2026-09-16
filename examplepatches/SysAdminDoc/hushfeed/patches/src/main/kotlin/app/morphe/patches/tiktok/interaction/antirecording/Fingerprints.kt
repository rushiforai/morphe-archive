/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 *
 * Thanks to lyyako for the original implementation and help with this patch.
 */
package app.morphe.patches.tiktok.interaction.antirecording

import app.morphe.patcher.Fingerprint

private fun antiRecordingFingerprint(marker: String) = Fingerprint(
    returnType = "V",
    parameters = listOf("I"),
    strings = listOf(marker),
    custom = { method, _ ->
        method.definingClass.endsWith("/ClearModePanelComponent;")
    },
)

internal val antiRecordingAddedFingerprint = antiRecordingFingerprint("[onDisplayAdded]")
internal val antiRecordingRemovedFingerprint = antiRecordingFingerprint("[onDisplayRemoved]")
