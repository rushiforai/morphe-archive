package app.template.patches.usenetpanda.premium

import app.morphe.patcher.Fingerprint

object IsPremiumFingerprint : Fingerprint(
    definingClass = "Lat/mann/usenetpanda/preference/a;",
    name = "q",
    returnType = "Z",
    parameters = listOf()
)

object RevokePremiumFingerprint : Fingerprint(
    definingClass = "Lxm1;",
    name = "P",
    returnType = "V",
    parameters = listOf("Lat/mann/usenetpanda/MainActivity;")
)