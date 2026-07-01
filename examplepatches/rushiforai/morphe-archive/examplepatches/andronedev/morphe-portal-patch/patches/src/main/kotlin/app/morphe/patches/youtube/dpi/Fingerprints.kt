package app.morphe.patches.youtube.dpi

import app.morphe.patcher.Fingerprint

internal object ApplicationFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = emptyList(),
    custom = { _, classDef ->
        classDef.type.endsWith("Root_Application;")
    },
)
