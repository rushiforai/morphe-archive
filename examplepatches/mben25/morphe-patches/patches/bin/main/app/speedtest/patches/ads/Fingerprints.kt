package app.speedtest.patches.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Speedtest by Ookla gates ad display behind three independent boolean checks, verified
 * against obfuscated R8 output for v7.1.1. The ad-free status flows through:
 *
 * `H` (implements `com.ookla.speedtest.purchase.j`) — the live purchase/billing manager —
 * which calls into `p0` (`@JvmName("GooglePurchaseDataCompat")`), a static Kotlin-file-class
 * utility, which in turn reads from whichever `q0` implementation was injected (`r0`, backed
 * by `SharedPreferences`, for the legacy pre-4.4.11 path).
 */

/**
 * `H.b()Z` — main ad-free runtime check inside the purchase-manager implementation.
 * Called from the purchase/ads pipeline to decide whether ads run. Forcing true → app
 * treats the user as an ad-free subscriber.
 */
object PurchaseManagerIsAdFreeFingerprint : Fingerprint(
    definingClass = "Lcom/ookla/speedtest/purchase/google/H;",
    name = "b",
    parameters = emptyList(),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
)

/**
 * `GooglePurchaseDataCompat.b(q0)Z` (isUserAdFree) — static util: checks the legacy isAdFree
 * flag AND the purchase token map. Called from `H.b()` and UI entry points. Forcing true
 * covers both paths.
 */
object PurchaseDataCompatIsUserAdFreeFingerprint : Fingerprint(
    definingClass = "Lcom/ookla/speedtest/purchase/google/p0;",
    name = "b",
    parameters = listOf("Lcom/ookla/speedtest/purchase/google/q0;"),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
)

/**
 * `GooglePurchaseDataCompat.c(q0)Z` (hasInAppTokens) — checks the in-app purchase token
 * count ≥ 1 (active in-app purchase gate). Forcing true prevents the "no active purchase"
 * fallback flow.
 */
object PurchaseDataCompatHasInAppTokensFingerprint : Fingerprint(
    definingClass = "Lcom/ookla/speedtest/purchase/google/p0;",
    name = "c",
    parameters = listOf("Lcom/ookla/speedtest/purchase/google/q0;"),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
)

/**
 * `r0.b()Z` (SharedPrefsAdFreeCache.isAdFree, `@Deprecated` legacy pre-4.4.11 compat path) —
 * reads the `purchase/feature.ad_free` SharedPreferences flag. Forcing true keeps the cached
 * state as ad-free across cold starts and process kills.
 */
object SharedPrefsIsAdFreeFingerprint : Fingerprint(
    definingClass = "Lcom/ookla/speedtest/purchase/google/r0;",
    name = "b",
    parameters = emptyList(),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    strings = listOf("purchase/feature.ad_free"),
)
