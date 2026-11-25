package app.masareef.patches.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * On 2.5.2 AdsManager keeps its real class name but its Kotlin-object methods are PUBLIC+FINAL
 * instance methods whose names are obfuscated to single letters (g/i/j/l/v) that aren't stable
 * across builds. These fingerprints therefore drop definingClass and match on access flags plus
 * parameter/return shape instead, which stays unique enough given each method's distinct
 * signature. (On 2.6.1+ the same methods compiled to PUBLIC+STATIC and the cached-ad lookup
 * returned kotlin/Triple; retargeting there means flipping STATIC back on and GetCached's
 * return type.)
 *
 * The consent-form flow is driven through the Google UMP SDK here, not standalone AdsManager
 * methods, so RemoveAdsPatch only stubs the load/track/clear/cache leaves below.
 */
private val PUBLIC_FINAL = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)

/** AdsManager's clear-all — destroys/clears every tracked AdView. (V, no params) */
object AdsManagerClearAllFingerprint : Fingerprint(
    accessFlags = PUBLIC_FINAL,
    returnType = "V",
    parameters = emptyList(),
)

/**
 * AdsManager's clear-for-parent-id(String, force: Boolean) — clears stale/expired tracked ads
 * for a parent id, or unconditionally when force is true. Covers what used to be two separate
 * methods (unconditional clear and expired-only clear) in 2.6.0.
 */
object AdsManagerClearExpiredFingerprint : Fingerprint(
    accessFlags = PUBLIC_FINAL,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Z"),
)

/** AdsManager's cached-ad lookup(String, String) — returns null when there is none. */
object AdsManagerGetCachedFingerprint : Fingerprint(
    accessFlags = PUBLIC_FINAL,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

/** AdsManager's load-ad(Context, String, ListAd, callback interface) — requests/loads an ad. */
object AdsManagerLoadAdFingerprint : Fingerprint(
    accessFlags = PUBLIC_FINAL,
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/appsqueue/masareef/model/ads/ListAd;",
        "L",
    ),
)

/** AdsManager's track(String, String, Object, boolean) — stores a loaded/loading ad. */
object AdsManagerTrackFingerprint : Fingerprint(
    accessFlags = PUBLIC_FINAL,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Object;", "Z"),
)
