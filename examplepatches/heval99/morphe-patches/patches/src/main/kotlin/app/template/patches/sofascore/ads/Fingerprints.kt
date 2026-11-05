package app.template.patches.sofascore.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

internal const val USER_ACCOUNT_CLASS = "Lcom/sofascore/local_persistance/UserAccount;"

// The modal queue's display name of the one-time "Active subscription" upgrade sheet
// (ActiveSubscriptionBottomSheet), and a preference key its eligibility predicate reads (the
// only use of the key in the shared lambda class). See sofascore/shared/ModalQueue.kt.
internal const val ACTIVE_SUBSCRIPTION_MODAL = "Active subscription"
internal const val ACTIVE_SUBSCRIPTION_PREDICATE_ANCHOR = "PR_XAIST"

/**
 * UserAccount is not obfuscated, so these getters are stable anchors.
 * Every ad decision in the app is derived from these account flags.
 */
object GetForceAdsFingerprint : Fingerprint(
    definingClass = USER_ACCOUNT_CLASS,
    name = "getForceAds",
)

object GetForceHideAdsFingerprint : Fingerprint(
    definingClass = USER_ACCOUNT_CLASS,
    name = "getForceHideAds",
)

object GetHasServerAdsFingerprint : Fingerprint(
    definingClass = USER_ACCOUNT_CLASS,
    name = "getHasServerAds",
)

/**
 * Ad SDK content providers the manifest starts in every process before Application.onCreate
 * (2026-11-03, 26.10.19). Their class names are kept because the manifest names them. Each
 * onCreate()Z only registers the SDK's activity/process lifecycle tracking (IronSource, LevelPlay,
 * Mintegral, Vungle), which nothing needs once the ad SDKs are never started. PicassoProvider is
 * deliberately not here: its onCreate only stores the context, and Picasso.get() throws without it.
 */
internal val AD_SDK_LIFECYCLE_PROVIDERS = listOf(
    "Lcom/ironsource/lifecycle/IronsourceLifecycleProvider;",
    "Lcom/ironsource/lifecycle/LevelPlayActivityLifecycleProvider;",
    "Lcom/mbridge/msdk/config/component/status/MBComponentLifecycleProvider;",
    "Lcom/vungle/ads/VungleProvider;",
)

/**
 * Unity Ads' androidx.startup Initializer (a meta-data entry of InitializationProvider, so the
 * class name is kept). Its create(Context) stores the application and starts Unity's start-up
 * coroutine; the Unity SDK itself is only started by the ad start-up thread Disable ads removes.
 */
internal const val UNITY_ADS_INITIALIZER = "Lcom/unity3d/services/core/configuration/AdsSdkInitializer;"

internal const val RELEASE_APP_CLASS = "Lcom/sofascore/results/ReleaseApp;"

/**
 * ReleaseApp (the manifest Application class, unobfuscated) sets the Firebase consent mode in a
 * no-arg void method holding the consent-type strings, then ends with
 * `new Thread(new <runnable>(this, 1)).start()`; that thread sets the ad SDKs' consent and starts
 * Mintegral, Unity, Moloco, Pangle, Equativ, Nimbus, AppHarbr and MobileAds.initialize.
 * Since 26.10.26 R8 moves the method into ReleaseApp's (obfuscated, abstract) superclass, so the
 * fingerprint has no defining class; the Thread.start() call separates it from the shared R8
 * runnable's run()V, which holds the same strings. Disable ads checks that the match is declared
 * by ReleaseApp or one of its superclasses.
 */
object AdSdkStartupFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf(
        string("ad_personalization", StringComparisonType.CONTAINS),
        string("analytics_storage", StringComparisonType.CONTAINS),
    ),
    filters = listOf(methodCall(definingClass = "Ljava/lang/Thread;", name = "start")),
)
