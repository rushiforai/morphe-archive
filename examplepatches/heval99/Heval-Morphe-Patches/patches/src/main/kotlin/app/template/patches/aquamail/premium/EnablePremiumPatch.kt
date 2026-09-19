package app.template.patches.aquamail.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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
        // The UI reads getLicenseLevel() directly (AccountListActivity compares it to 40,
        // the Compose state carries level + type into every screen), so forcing the derived
        // booleans alone is not enough - force the level itself.
        LicenseLevelFingerprint.methodOrNull?.returnEarly(40)

        // getLicenseType() drives the plan label ("Free"); report the in-app license type.
        LicenseTypeFingerprint.methodOrNull?.addInstructions(
            0,
            """
                invoke-virtual {p0}, Lorg/kman/AquaMail/data/LicenseManager;->getLicenseTypeInApp()Lorg/kman/AquaMail/data/LicenseType;
                move-result-object v0
                return-object v0
            """.trimIndent()
        )

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
