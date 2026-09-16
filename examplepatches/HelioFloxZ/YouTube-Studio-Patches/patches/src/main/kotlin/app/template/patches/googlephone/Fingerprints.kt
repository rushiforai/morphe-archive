package app.template.patches.googlephone

import app.morphe.patcher.Fingerprint

internal object CallRecordingCountryGateFingerprint : Fingerprint(
    strings = listOf(
        "Call recording is disabled in the current country",
    ),
)
