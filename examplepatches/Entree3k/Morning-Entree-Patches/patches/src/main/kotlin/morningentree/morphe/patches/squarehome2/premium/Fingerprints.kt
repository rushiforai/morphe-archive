package morningentree.morphe.patches.squarehome2.premium

import app.morphe.patcher.Fingerprint

internal object PurchaseResultFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("PurchaseManager.savedResult", "PurchaseManager.timeVerified"),
)
