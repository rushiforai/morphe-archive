package app.kplus.patches

import app.morphe.patcher.Fingerprint

object GetSecurityStatusFingerprint : Fingerprint(
    definingClass = "Lcom/vkey/android/fo;",
    name = "getSecurityStatus",
    returnType = "Lcom/vkey/android/vguard/model/VGSecurityStatus;",
    parameters = emptyList()
)
