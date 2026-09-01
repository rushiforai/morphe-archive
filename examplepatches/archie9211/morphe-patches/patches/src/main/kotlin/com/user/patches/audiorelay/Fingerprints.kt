package com.user.patches.audiorelay

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

val premiumResponseFingerprint = Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        string("PremiumResponse(value=")
    )
)
