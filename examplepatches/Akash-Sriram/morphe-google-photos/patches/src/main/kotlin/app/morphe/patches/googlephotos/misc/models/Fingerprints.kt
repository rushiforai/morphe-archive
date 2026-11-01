package app.morphe.patches.googlephotos.misc.models

import app.morphe.patcher.Fingerprint

internal object ModelDownloadManagerClinitFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("ModelDownloadManager"),
)

internal object MddSharedFileManagerCallbackFingerprint : Fingerprint(
    name = "a",
    strings = listOf("%s: getOnDeviceUris called on file that doesn't exist. Key = %s!"),
)

