package gcam.mediaprovider

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

internal object MediaProviderFileNameFingerprint : Fingerprint(
    filters = listOf(
        string("file_name")
    )
)

internal object MediaProviderRestorePathFingerprint : Fingerprint(
    filters = listOf(
        string("restore_path")
    )
)