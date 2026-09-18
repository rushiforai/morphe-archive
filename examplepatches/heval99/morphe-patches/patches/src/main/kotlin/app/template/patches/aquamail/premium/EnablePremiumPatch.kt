package app.template.patches.aquamail.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_AQUAMAIL
import app.morphe.util.returnEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the Pro/Premium features and lifts the free-version feature locks."
) {
    compatibleWith(COMPATIBILITY_AQUAMAIL)

    execute {
        // Licence level checks.
        IsProFingerprint.methodOrNull?.returnEarly(true)
        IsPremiumFingerprint.methodOrNull?.returnEarly(true)
        IsLicensedVersionFingerprint.methodOrNull?.returnEarly(true)
        IsFreeFingerprint.methodOrNull?.returnEarly(false)

        // Per-feature locks.
        FeatureLockedForLicenseFingerprint.methodOrNull?.returnEarly(false)
        LockFeaturesIsFeatureLockedFingerprint.methodOrNull?.returnEarly(false)
    }
}
