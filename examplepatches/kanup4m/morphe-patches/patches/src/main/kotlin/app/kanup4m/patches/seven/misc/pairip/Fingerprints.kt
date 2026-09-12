package app.kanup4m.patches.seven.misc.pairip

import app.morphe.patcher.Fingerprint

// PairIP LicenseClient.startPaywallActivity — opens Play Store + shuts app down on NOT_LICENSED.
// Verified in se.perigee.android.seven 9.25.15 smali/classes. PairIP class names are stable (not obfuscated).
object StartPaywallActivityFingerprint : Fingerprint(
    name = "startPaywallActivity",
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    returnType = "V",
    parameters = listOf("Landroid/app/PendingIntent;")
)

// PairIP LicenseClient.startErrorDialogActivity — same kill-switch family for license errors.
object StartErrorDialogActivityFingerprint : Fingerprint(
    name = "startErrorDialogActivity",
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    returnType = "V",
    parameters = listOf()
)
