// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.ads.disableads

import app.edbfi.patches.shared.hasFlags
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.newInstance
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// R8 kept the names of the app's ads package, classes and methods both. The manifest names the SDKs' init providers.
private const val ADS = "Lcom/andrewshu/android/reddit/ads"
internal const val NATIVE_AD_THING = "Lcom/andrewshu/android/reddit/things/objects/NativeAdThreadThing;"
private const val MAIN_ACTIVITY = "Lcom/andrewshu/android/reddit/MainActivity;"

/**
 * Starts the AppLovin SDK, then hands its configuration to a listener: the consent form's, or the one that revokes
 * consent from the settings. Feed and album ads load only once the consent form's listener has run.
 */
internal object InitAdsSdkFingerprint : Fingerprint(
    definingClass = "$ADS/AdsGdprHelper;",
    name = "initAdsSdkWithListener",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lcom/applovin/sdk/AppLovinSdk\$SdkInitializationListener;"),
)

/**
 * MainActivity's feed and album ad helpers set up with the activity: each registers for the SDK-ready event, makes a
 * native ad loader manager and shows the consent form. Tearing one down, on the activity's end or its next setup, makes
 * an AppLovin ad loader only to destroy it, which starts the SDK.
 */
internal class AdHelperLifecycleFingerprint(
    helper: String,
    lifecycle: String,
) : Fingerprint(
    definingClass = "$ADS/$helper;",
    name = lifecycle,
    returnType = "V",
    parameters = listOf(),
    custom = { method, _ -> method.hasFlags(AccessFlags.PUBLIC) },
)

/** The ad helpers' lifecycle methods [AdHelperLifecycleFingerprint] matches. */
internal val AD_HELPER_LIFECYCLES = listOf("AdViewHelper", "ImageAlbumAdViewHelper").flatMap { helper ->
    listOf("onCreateActivity", "onDestroyActivity").map { lifecycle -> helper to lifecycle }
}

/** Wraps an album's adapter in one that slots ads between the images. */
internal object AlbumAdapterFingerprint : Fingerprint(
    definingClass = "$ADS/ImageAlbumAdViewHelper;",
    name = "newRecyclerAdapter",
    custom = { method, _ ->
        val parameters = method.parameterTypes
        method.hasFlags(AccessFlags.PUBLIC) && parameters.size == 2 && parameters[0] == "Landroid/app/Activity;" && method.returnType == parameters[1]
    },
)

/**
 * The thread list loader adds a placeholder row for a feed ad when a check, true only with ads on, allows it. R8 renamed
 * the loader and the check; the row's type keeps its name.
 */
internal object FeedAdRowFingerprint : Fingerprint(
    filters = listOf(newInstance(NATIVE_AD_THING)),
    custom = { method, _ -> !method.definingClass.startsWith(NATIVE_AD_THING.removeSuffix(";")) },
)

/**
 * The banner's check: ads on, and a pane layout with room for it. It is a method of the enum of MainActivity's pane
 * transitions, which keeps the banner helper in a static field; the enum's two other `(MainActivity)Z` methods call it.
 * R8 renamed the enum and its methods.
 */
internal object BannerCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(MAIN_ACTIVITY),
    custom = { method, owner ->
        method.hasFlags(AccessFlags.PRIVATE) &&
            AccessFlags.ENUM.isSet(owner.accessFlags) &&
            owner.staticFields.any { it.type == "$ADS/IBannerAdViewHelper;" } &&
            method.implementation?.instructions?.none { it.getReference<MethodReference>()?.definingClass == method.definingClass } == true
    },
)

/** AppLovin's manifest provider sets the SDK up at process start, before the app runs any code of its own. */
internal object AppLovinInitProviderFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/sdk/AppLovinInitProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = listOf(),
)

/**
 * The Google Mobile Ads SDK's manifest provider starts that SDK at process start. Its attachInfo does nothing but that;
 * it never calls the ContentProvider's own.
 */
internal object MobileAdsInitProviderFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAdsInitProvider;",
    name = "attachInfo",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/content/pm/ProviderInfo;"),
)
