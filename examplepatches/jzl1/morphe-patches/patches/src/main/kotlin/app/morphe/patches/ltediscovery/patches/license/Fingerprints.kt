package lab.ltediscovery.patches.license

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * `com.pairip.licensecheck.LicenseClient.checkLicense(Context)V` — PairIP App
 * Licensing entry point, called from `com.pairip.application.Application`
 * `attachBaseContext()` before the real application starts.
 *
 * On a repackaged build the installer is not `com.android.vending`, so the local
 * installer fast path fails and the full licensing-service check runs. That check
 * returns "not licensed" for a Morphe-signed APK and the app shows the
 * "Something went wrong" dialog / Play paywall and calls `System.exit(0)`.
 *
 * Matched on the unique log literal instead of the class name, which is Google
 * SDK code and may change between PairIP revisions.
 */
internal object LicenseClientCheckFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("Skipping license check in isolated process."),
    ),
)

/**
 * The `BillingEntitlements` class, found through the literal emitted by its
 * `toString()` method: `BillingEntitlements(proBasic=...`.
 *
 * R8 puts the app's obfuscated classes in the default package, so in this build
 * the class descriptor is `Ltz;`. Anchoring on the literal means the patch does
 * not depend on that single-letter name.
 */
internal object BillingEntitlementsClassFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        string("BillingEntitlements(proBasic="),
    ),
)

/**
 * The two zero-argument boolean predicates on `BillingEntitlements`:
 *
 *  - `a()` — "has any Pro access"   (`(internalOverride && !internalBillingTestMode) || proBasic || b()`)
 *  - `b()` — "has Pro Plus access"  (`(internalOverride && !internalBillingTestMode) || proPlus || donate || hobbyistSubscription || professionalSubscription`)
 *
 * They are the only `Z()` methods in the class, so matching all of them avoids
 * depending on the obfuscated method names. Every Pro / Pro Plus feature gate in
 * the app funnels through one of these two methods.
 */
internal object BillingEntitlementPredicateFingerprint : Fingerprint(
    classFingerprint = BillingEntitlementsClassFingerprint,
    returnType = "Z",
    parameters = emptyList(),
)
/**
 * The full `BillingEntitlements` constructor
 * `(ZZZZZZZZZ)V` — the only constructor with nine boolean parameters.
 *
 * `c` (third parameter) is the Pro Plus / Donate (`e6`) flag. The synthetic
 * `(ZZZZZZZI)V` constructor delegates to this one, so patching this method
 * covers every `BillingEntitlements` instance.
 */
internal object BillingEntitlementsConstructorFingerprint : Fingerprint(
    classFingerprint = BillingEntitlementsClassFingerprint,
    returnType = "V",
    parameters = listOf("Z", "Z", "Z", "Z", "Z", "Z", "Z", "Z", "Z"),
)
