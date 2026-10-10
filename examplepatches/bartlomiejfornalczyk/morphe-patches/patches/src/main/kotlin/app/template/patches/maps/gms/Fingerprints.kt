package app.template.patches.maps.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

internal object PlayServicesSignatureCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/pm/PackageInfo;", "Z"),
    filters = listOf(string("Unable to obtain package certificate history.")),
)

internal object PlayServicesAvailabilityFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
    filters = listOf(string("com.google.android.gms.version")),
)
