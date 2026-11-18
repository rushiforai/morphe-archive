// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.ads.disableads

import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.accessFlags
import app.revanced.patcher.custom
import app.revanced.patcher.definingClass
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.extensions.type
import app.revanced.patcher.name
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// R8 kept the names of the app's ads package, classes and methods both. The manifest names the SDKs' init providers.
private const val ADS = "Lcom/andrewshu/android/reddit/ads"
internal const val NATIVE_AD_THING = "Lcom/andrewshu/android/reddit/things/objects/NativeAdThreadThing;"
private const val MAIN_ACTIVITY = "Lcom/andrewshu/android/reddit/MainActivity;"

/**
 * Starts the AppLovin SDK, then hands its configuration to a listener: the consent form's, or the one that revokes
 * consent from the settings. Feed and album ads load only once the consent form's listener has run.
 */
internal fun BytecodePatchContext.initAdsSdkMethod() = uniqueMethod("AdsGdprHelper.initAdsSdkWithListener") {
    definingClass("$ADS/AdsGdprHelper;")
    name("initAdsSdkWithListener")
    returnType("V")
    parameterTypes("Landroid/content/Context;", "Lcom/applovin/sdk/AppLovinSdk\$SdkInitializationListener;")
}

/**
 * MainActivity's feed and album ad helpers set up with the activity: each registers for the SDK-ready event, makes a
 * native ad loader manager and shows the consent form. Tearing one down, on the activity's end or its next setup, makes
 * an AppLovin ad loader only to destroy it, which starts the SDK.
 */
internal fun BytecodePatchContext.adHelperLifecycleMethods() = listOf("AdViewHelper", "ImageAlbumAdViewHelper").flatMap { helper ->
    listOf("onCreateActivity", "onDestroyActivity").map { lifecycle ->
        uniqueMethod("$helper.$lifecycle") {
            definingClass("$ADS/$helper;")
            name(lifecycle)
            accessFlags(AccessFlags.PUBLIC)
            returnType("V")
            parameterTypes()
        }
    }
}

/** Wraps an album's adapter in one that slots ads between the images. */
internal fun BytecodePatchContext.albumAdapterMethod() = uniqueMethod("ImageAlbumAdViewHelper.newRecyclerAdapter") {
    definingClass("$ADS/ImageAlbumAdViewHelper;")
    name("newRecyclerAdapter")
    accessFlags(AccessFlags.PUBLIC)
    custom { parameterTypes.size == 2 && parameterTypes[0] == "Landroid/app/Activity;" && returnType == parameterTypes[1] }
}

/**
 * The thread list loader adds a placeholder row for a feed ad when a check, true only with ads on, allows it. R8 renamed
 * the loader and the check; the row's type keeps its name.
 */
internal fun BytecodePatchContext.feedAdRowMethod() = uniqueMethod("the method that adds the feed ad row") {
    custom {
        !definingClass.startsWith(NATIVE_AD_THING.removeSuffix(";")) &&
            implementation?.instructions?.any { it.opcode == Opcode.NEW_INSTANCE && it.type == NATIVE_AD_THING } == true
    }
}

/**
 * The banner's check: ads on, and a pane layout with room for it. It is a method of the enum of MainActivity's pane
 * transitions, which keeps the banner helper in a static field; the enum's two other `(MainActivity)Z` methods call it.
 * R8 renamed the enum and its methods.
 */
internal fun BytecodePatchContext.bannerCheckMethod() = uniqueMethod("the banner ad check") {
    accessFlags(AccessFlags.PRIVATE)
    returnType("Z")
    parameterTypes(MAIN_ACTIVITY)
    custom {
        val owner = classDefs[definingClass]
        owner != null &&
            AccessFlags.ENUM.isSet(owner.accessFlags) &&
            owner.staticFields.any { it.type == "$ADS/IBannerAdViewHelper;" } &&
            implementation?.instructions?.none { it.methodReference?.definingClass == definingClass } == true
    }
}

/** AppLovin's manifest provider sets the SDK up at process start, before the app runs any code of its own. */
internal fun BytecodePatchContext.appLovinInitProviderMethod() = uniqueMethod("AppLovinInitProvider.onCreate") {
    definingClass("Lcom/applovin/sdk/AppLovinInitProvider;")
    name("onCreate")
    returnType("Z")
    parameterTypes()
}

/**
 * The Google Mobile Ads SDK's manifest provider starts that SDK at process start. Its attachInfo does nothing but that;
 * it never calls the ContentProvider's own.
 */
internal fun BytecodePatchContext.mobileAdsInitProviderMethod() = uniqueMethod("MobileAdsInitProvider.attachInfo") {
    definingClass("Lcom/google/android/gms/ads/MobileAdsInitProvider;")
    name("attachInfo")
    returnType("V")
    parameterTypes("Landroid/content/Context;", "Landroid/content/pm/ProviderInfo;")
}
