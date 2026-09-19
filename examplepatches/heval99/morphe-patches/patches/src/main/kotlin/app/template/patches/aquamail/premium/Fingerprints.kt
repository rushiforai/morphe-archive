package app.template.patches.aquamail.premium

import app.morphe.patcher.Fingerprint

private const val LICENSE_MANAGER = "Lorg/kman/AquaMail/data/LicenseManager;"
private const val FEATURE = "Lorg/kman/AquaMail/coredefs/Feature;"

// Aqua Mail computes a licence level (0 free, 10/20 Pro, 30 migration, 40 Pro+ subscription)
// and then answers every UI/feature gate from it. LicenseManager and LockFeatures are not
// obfuscated, so these getters are stable anchors.
object LicenseLevelFingerprint : Fingerprint(
    definingClass = LICENSE_MANAGER,
    name = "getLicenseLevel",
)

object LicenseTypeFingerprint : Fingerprint(
    definingClass = LICENSE_MANAGER,
    name = "getLicenseType",
)

object IsProFingerprint : Fingerprint(
    definingClass = LICENSE_MANAGER,
    name = "isPro",
)

object IsPremiumFingerprint : Fingerprint(
    definingClass = LICENSE_MANAGER,
    name = "isPremium",
)

object IsFreeFingerprint : Fingerprint(
    definingClass = LICENSE_MANAGER,
    name = "isFree",
)

object IsLicensedVersionFingerprint : Fingerprint(
    definingClass = LICENSE_MANAGER,
    name = "isLicensedVersion",
)

object FeatureLockedForLicenseFingerprint : Fingerprint(
    definingClass = LICENSE_MANAGER,
    name = "isFeatureLockedForLicense",
    parameters = listOf(FEATURE),
)

object LockFeaturesIsFeatureLockedFingerprint : Fingerprint(
    definingClass = "Lorg/kman/AquaMail/data/LockFeatures;",
    name = "isFeatureLocked",
    parameters = listOf(FEATURE),
)
