package app.template.patches.reversocontext

import app.morphe.patcher.Fingerprint

object PremiumFingerprint : Fingerprint(
    definingClass = "Lcom/softissimo/reverso/context/CTXPreferences;",
    name = "b1",
    returnType = "V",
    parameters = listOf("Z"),
)