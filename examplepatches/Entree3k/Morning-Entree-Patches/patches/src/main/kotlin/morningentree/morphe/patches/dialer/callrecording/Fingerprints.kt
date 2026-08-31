package morningentree.morphe.patches.dialer.callrecording

import app.morphe.patcher.Fingerprint

internal object CallRecordingCountryGateFingerprint : Fingerprint(
    strings = listOf("Call recording is disabled in the current country"),
)
