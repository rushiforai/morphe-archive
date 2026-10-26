package dev.jkcarino.adobo.patches.all.detection.signature.pms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

internal object StaticConstructorFingerprint : Fingerprint(
    definingClass = "/SignatureHookApp;",
    isStatic = true,
    parameters = listOf(),
    filters = listOf(
        string("<package-name>"),
        string("<signature>")
    )
)
