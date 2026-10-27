package app.template.patches.alarmclock.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

internal const val SHOP_FEATURE = "Lcom/alarmclock/xtreme/shop/data/ShopFeature;"

// Candidates for the shop data's entitlement check, which reads the owned flag of one feature from
// the shop list. Every ad gate (ad consent, the ad SDK start in ApplicationLazyInitializer and the
// activity ad checks) asks it for the AD_FREE feature. The class and method names are R8-renamed
// (l9.d in 26.06.0), so this matches only the shape: a concrete (ShopFeature)Z holding the
// "feature" argument-check string. That is not unique (26.06.0 has four: l9.d and three
// sd0$a.a(ShopFeature) implementations that ask the feature itself); the patch keeps the one that
// is the only implementation of its interface method (see DisableAdsPatch.kt).
object ShopEntitlementCandidateFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(SHOP_FEATURE),
    strings = listOf(string("feature", StringComparisonType.CONTAINS)),
    custom = { method, _ -> method.implementation != null },
)
