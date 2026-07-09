package app.template.patches.instapaper

import app.morphe.patcher.Fingerprint

object PremiumCheckFingerprint : Fingerprint(
    strings = listOf("subscription_is_active", "0"),
    returnType = "Ljava/lang/String;",
    parameters = listOf()
)