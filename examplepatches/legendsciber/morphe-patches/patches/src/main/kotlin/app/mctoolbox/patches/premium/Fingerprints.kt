package app.mctoolbox.patches.premium

import app.morphe.patcher.Fingerprint

object PremiumStateFingerprint : Fingerprint(
    definingClass = "Ltc0;",
    name = "d",
    returnType = "V",
    parameters = listOf("Z")
)

object SubscribeBypassFingerprint : Fingerprint(
    definingClass = "Ln21;",
    name = "k",
    returnType = "V",
    parameters = listOf("Luv;", "Landroid/content/Context;", "Landroid/view/View;")
)
