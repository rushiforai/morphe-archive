package app.eurowag.patches.premium

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for Eurowag Navi 4.18.1-7eb59b0f (versionCode 41801).
 *
 * The app is an R8-obfuscated Sygic white-label. Five classes matter:
 *
 *   arn.v()   -> fallback feature set used for a signed-in non-premium user
 *   xhn.x()   -> feature set used when nobody is signed in
 *   fra.resolve(String) -> picks the feature decoder for the JWT version
 *   am9.i(Object) -> maps the feature JWT's monetization object to the
 *                    subscription status used by every paywall/premium check
 *
 * All four names are version specific on purpose. A future build fails the
 * fingerprint instead of patching the wrong method.
 */

/**
 * `arn.v() -> fd7`, static, no arguments.
 *
 * Builds the "non-premium fallback" feature set that `dra` returns when the
 * backend says the account has no features. We upgrade this object in place:
 * full traffic, all vehicle parameters, favourites/search history enabled,
 * speed cameras, lane guidance, driving restrictions and voice instructions
 * unlocked. Patching the fixture is much safer than rewriting the twenty
 * individual feature config classes.
 */
object FallbackFeatureSetFingerprint : Fingerprint(
    definingClass = "Larn;",
    name = "v",
    returnType = "Lfd7;",
    parameters = listOf(),
    isStatic = true,
)

/**
 * `xhn.x() -> fd7`, static, no arguments. Used by `dra.d()` when there is no
 * signed-in user. Redirect it to the upgraded fallback set.
 */
object AnonymousFeatureSetFingerprint : Fingerprint(
    definingClass = "Lxhn;",
    name = "x",
    returnType = "Lfd7;",
    parameters = listOf(),
    isStatic = true,
)

/**
 * `fra.resolve(String) -> fd7` dispatches to the v1/v2/v3 feature decoder
 * based on the JWT header. Returning the upgraded feature set here covers
 * signed-in accounts whose backend JWT still says "free".
 */
object FeatureResolverFingerprint : Fingerprint(
    definingClass = "Lfra;",
    name = "resolve",
    returnType = "Lfd7;",
    parameters = listOf("Ljava/lang/String;"),
    isStatic = false,
)

/**
 * `am9.i(Object) -> Object` maps the monetization object (`ehc`) from the
 * feature set to the subscription status (`bhc`): Premium / Trial / Paywall /
 * Freemium / None. This is the single value consumed by the subscription
 * screen, the profile header and every "is premium" flow.
 */
object MonetizationStatusFingerprint : Fingerprint(
    definingClass = "Lam9;",
    name = "i",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    isStatic = false,
)
