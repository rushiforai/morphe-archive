package app.template.patches.tasker.premium

import app.morphe.patcher.Fingerprint

// Tasker validates its paid license through Play LVL plus a licence server (Patreon keys).
// All of that code is R8-obfuscated in this build (6.6.18), so the anchors are the local
// choke points instead: rf.a0 maps a response code to a LicenseStatus, and rf.w$a answers
// "is licensed" from the cached / newly fetched status.
object LicenseStatusFingerprint : Fingerprint(
    definingClass = "Lrf/a0;",
    name = "c",
)

object CachedLicenseFingerprint : Fingerprint(
    definingClass = "Lrf/w\$a;",
    name = "m",
    parameters = listOf("Landroid/content/Context;", "J"),
)

object FreshLicenseFingerprint : Fingerprint(
    definingClass = "Lrf/w\$a;",
    name = "l",
    parameters = listOf("Landroid/content/Context;"),
)

object StaticLicenseFingerprint : Fingerprint(
    definingClass = "Lrf/w;",
    name = "G",
    parameters = listOf("Landroid/content/Context;"),
)
