package app.template.patches.aquamail.premium

import app.morphe.patcher.Fingerprint

private const val LICENSE_MANAGER = "Lorg/kman/AquaMail/data/LicenseManager;"
private const val LICENSE_DATA = "Lorg/kman/AquaMail/licensing/LicenseData;"
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

// Issue #16: the account list, the prefs license line and the account-limit logic all
// gate on getLicenseData() != null BEFORE consulting the getters above, and on a free
// install the snapshot is null (no raw license data in the prefs), so those premium
// branches never ran and the app displayed the free version even with every getter
// forced. getLicenseData() is patched to return a licensed snapshot instead.
object GetLicenseDataFingerprint : Fingerprint(
    definingClass = LICENSE_MANAGER,
    name = "getLicenseData",
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
