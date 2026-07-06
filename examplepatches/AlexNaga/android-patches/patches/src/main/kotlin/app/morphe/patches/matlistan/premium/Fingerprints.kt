package app.morphe.patches.matlistan.premium

import app.morphe.patcher.Fingerprint

object IsPremiumUiFingerprint : Fingerprint(
    name = "p",
    returnType = "Z",
    definingClass = "LN4/d;"
)

object IsPremiumAppFingerprint : Fingerprint(
    name = "i",
    returnType = "Z",
    definingClass = "Lse/matlistan/MatlistanApp;"
)
