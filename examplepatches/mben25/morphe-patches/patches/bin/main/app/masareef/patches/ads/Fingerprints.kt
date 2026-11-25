package app.masareef.patches.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * As of 2.6.1 AdsManager's simple name is R8-obfuscated to a single letter that isn't stable
 * across builds (e.g. `com.appsqueue.masareef.manager.a`), and its Kotlin-object methods
 * compiled to PUBLIC+STATIC rather than the PUBLIC+FINAL instance methods used in 2.6.0. These
 * fingerprints therefore drop definingClass and match on parameter/return shape instead, which
 * stays unique enough given each method's distinct signature.
 *
 * The 2.6.1 ad SDK migration (legacy AdMob -> com.google.android.libraries.ads.mobile.sdk) also
 * removed the standalone consent-form methods (old ShowConsentForm/RequestConsent/
 * PresentConsentForm) from AdsManager entirely — that flow is now inlined into
 * BaseActivity.onStart(). Patching it there would mean rewriting activity lifecycle bytecode
 * instead of stubbing a leaf method, so it's out of scope here; RemoveAdsPatch no longer stubs
 * those three.
 */
private val PUBLIC_STATIC = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)

/** AdsManager's clear-all — destroys/clears every tracked AdView. (V, no params) */
object AdsManagerClearAllFingerprint : Fingerprint(
    accessFlags = PUBLIC_STATIC,
    returnType = "V",
    parameters = emptyList(),
)

/**
 * AdsManager's clear-for-parent-id(String, force: Boolean) — clears stale/expired tracked ads
 * for a parent id, or unconditionally when force is true. Covers what used to be two separate
 * methods (unconditional clear and expired-only clear) in 2.6.0.
 */
object AdsManagerClearExpiredFingerprint : Fingerprint(
    accessFlags = PUBLIC_STATIC,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Z"),
)

/** AdsManager's cached-ad lookup(String, String) — returns null when there is none. */
object AdsManagerGetCachedFingerprint : Fingerprint(
    accessFlags = PUBLIC_STATIC,
    returnType = "Lkotlin/Triple;",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

/** AdsManager's load-ad(Context, String, ListAd, callback interface) — requests/loads an ad. */
object AdsManagerLoadAdFingerprint : Fingerprint(
    accessFlags = PUBLIC_STATIC,
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
    accessFlags = PUBLIC_STATIC,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Object;", "Z"),
)
