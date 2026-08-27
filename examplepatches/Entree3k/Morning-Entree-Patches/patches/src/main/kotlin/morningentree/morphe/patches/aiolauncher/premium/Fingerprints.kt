package morningentree.morphe.patches.aiolauncher.premium

import app.morphe.patcher.Fingerprint

internal object PremiumPrefsClinitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("premiumKeyCheckResult", "premiumGPlay", "premium"),
)
