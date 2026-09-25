package app.morphe.patches.tiktok.interaction.antirecording

import app.morphe.patches.tiktok.shared.discovery.TikTokFingerprint as Fingerprint

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
