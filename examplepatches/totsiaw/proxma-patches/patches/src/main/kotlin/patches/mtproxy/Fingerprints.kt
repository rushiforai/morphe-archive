package patches.mtproxy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/*
 * MTProxy runs 100% Google AdMob, but the whole GMA SDK is r8-obfuscated in this build
 * (InterstitialAd -> Lhi0;, BaseAdView -> Lwc;), so we can NOT anchor on clean SDK class
 * names the way the myzong/simosa patches do. Instead both fingerprints anchor on AdMob's
 * own hard-coded assertion strings + method shape — stable across app rebuilds, never on
 * the per-build obfuscated names.
 */

/**
 * AdMob `InterstitialAd.load(context, adUnitId, adRequest, loadCallback)` — the r8-renamed
 * static entry `Lhi0;->a(Landroid/content/Context;Ljava/lang/String;Lj3;Lii0;)V` that every
 * interstitial load in the app goes through (3x ViewActivity + 1x MainActivity exit).
 *
 * Anchored on the four AdMob SDK argument-null assertion strings, which appear together only
 * in this loader and are SDK constants (stable). Shape (public static, void, 4 params with the
 * first two being Context/String) pins it further. The 4th param is the load callback
 * (Lii0; : Lnv4;) — the register we invoke onAdFailedToLoad on to force the benign fail branch.
 */
internal val interstitialLoadFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "L", "L"),
    filters = listOf(
        string("Context cannot be null."),
        string("AdUnitId cannot be null."),
        string("AdRequest cannot be null."),
        string("#008 Must be called on the main UI thread."),
    ),
)

/**
 * AdMob `BaseAdView.loadAd(AdRequest)` — the r8-renamed `Lwc;->a(Lj3;)V` that fills the
 * on-screen banner (MainActivity home banner + ViewActivity banner). `Lwc;` is the superclass
 * of the clean-named `Lcom/google/android/gms/ads/AdView;`.
 *
 * Anchored on: the AdMob main-thread assertion string (present in the load method, absent from
 * the class's plain setters) + the declaring class being BaseAdView, which keeps the public
 * `getAdUnitId()`/`setAdUnitId(...)` names even though the class name itself is obfuscated.
 * Together these uniquely pick `loadAd` without referencing any obfuscated name.
 */
internal val bannerLoadAdFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        string("#008 Must be called on the main UI thread."),
    ),
    custom = { _, classDef ->
        classDef.methods.any { it.name == "getAdUnitId" && it.returnType == "Ljava/lang/String;" } &&
            classDef.methods.any { it.name == "setAdUnitId" }
    },
)
