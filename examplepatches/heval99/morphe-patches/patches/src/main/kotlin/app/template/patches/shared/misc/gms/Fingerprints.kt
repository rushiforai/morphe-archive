package app.template.patches.shared.misc.gms

import app.morphe.patcher.Fingerprint

// Local re-export of MorpheApp/morphe-patches-library's internal
// getMainOnCreateFingerprint (patch-library/.../extension/Fingerprints.kt),
// which is `internal` and therefore not importable cross-module.
internal fun getMainOnCreateFingerprint(activityClassType: String, targetBundleMethod: Boolean = true): Fingerprint {
    require(activityClassType.endsWith(';')) {
        "Class type must end with a semicolon: $activityClassType"
    }

    return Fingerprint(
        name = "onCreate",
        definingClass = activityClassType,
        returnType = "V",
        parameters = if (targetBundleMethod) { listOf("Landroid/os/Bundle;") } else { listOf() },
    )
}