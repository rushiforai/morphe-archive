package com.ameen.morphe.patches.foodvisor.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object PremiumManagerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lorg/threeten/bp/ZonedDateTime;"),
    filters = listOf(
        string("DID_SEE_FREE_TRIAL"),
        string("premiumExpirationDate")
    )
)
