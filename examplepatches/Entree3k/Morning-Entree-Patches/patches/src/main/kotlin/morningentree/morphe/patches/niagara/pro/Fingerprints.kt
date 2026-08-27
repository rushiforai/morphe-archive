package morningentree.morphe.patches.niagara.pro

import app.morphe.patcher.Fingerprint

internal object ProStateToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("E(1=", ", 2="),
)
