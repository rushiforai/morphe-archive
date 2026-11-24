/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.genius

import app.fakh.patches.genius.shared.Constants.COMPATIBILITY_GENIUS
import app.fakh.patches.shared.disableProviders
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.decode
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import org.w3c.dom.Element

private val AD_PROVIDERS = arrayOf(
    "com.applovin.sdk.AppLovinInitProvider",
    "com.google.android.gms.ads.MobileAdsInitProvider",
    "com.mobilefuse.sdk.MobileFuseSdkInitProvider",
    "com.facebook.ads.AudienceNetworkContentProvider",
    "com.ironsource.lifecycle.IronsourceLifecycleProvider",
    "com.smaato.sdk.core.lifecycle.ProcessLifecycleOwnerInitializer",
)

private val STARTUP_AD_INITIALIZERS = setOf(
    "com.moloco.sdk.internal.android_context.ApplicationContextStartupComponentInitialization",
    "com.unity3d.services.core.configuration.AdsSdkInitializer",
)

private object AdaptiveHeightFingerprint : Fingerprint(
    definingClass = "Lai/medialab/medialabads2/banners/MediaLabSharedBanner;",
    name = "getAdaptiveHeightDp",
    returnType = "F",
    parameters = emptyList(),
)

private val STUB_AD_VOID_METHODS = mapOf(
    "Lcom/genius/android/Application;" to setOf("initMediaLabSdk"),
    "Lcom/genius/android/flow/main/MainActivity;" to setOf("initMediaLabSdk", "showBanner"),
    "Lcom/genius/android/ads/MLAdViewItem;" to setOf("bind"),
    "Lcom/genius/android/ads/AdsUtils;" to setOf("addTargetingValues"),
    "Lai/medialab/medialabads2/banners/MediaLabAdView;" to setOf("initialize"),
    "Lai/medialab/medialabads2/banners/MediaLabSharedBanner;" to setOf("b", "activate", "deactivate", "destroy", "pause", "resume"),
    "Lai/medialab/medialabads2/banners/MediaLabSingletonBanner;" to setOf("c", "onResume", "onPause", "onDestroy", "destroy"),
)

private object ShowPreloadedAdFingerprint : Fingerprint(
    definingClass = "Lai/medialab/medialabads2/banners/MediaLabAdView;",
    name = "showPreloadedAd",
    returnType = "Z",
    parameters = emptyList(),
)

private object IsAdvertisingEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/genius/android/ads/AdRequestFactory;",
    name = "isAdvertisingEnabled",
    returnType = "Z",
    parameters = emptyList(),
)

/** Disables ad SDK providers/initializers and collapses the sticky and inline ad containers. */
private val adsResourcePatch = patch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            manifest.disableProviders(*AD_PROVIDERS)

            val providers = manifest.getElementsByTagName("provider")
            val startupProvider = (0 until providers.length)
                .map { providers.item(it) as Element }
                .firstOrNull { it.getAttribute("android:name") == "androidx.startup.InitializationProvider" }
                ?: throw PatchException("genius: androidx.startup.InitializationProvider not found in manifest.")

            val meta = startupProvider.getElementsByTagName("meta-data")
            (0 until meta.length)
                .map { meta.item(it) as Element }
                .filter { it.getAttribute("android:name") in STARTUP_AD_INITIALIZERS }
                .forEach { startupProvider.removeChild(it) }
        }

        decode("res/layout/activity_main.xml")
        document("res/layout/activity_main.xml").use { doc ->
            val frames = doc.getElementsByTagName("FrameLayout")
            val sticky = (0 until frames.length)
                .map { frames.item(it) as Element }
                .firstOrNull { it.getAttribute("android:id") == "@id/layout_main_sticky_ad_container" }
                ?: throw PatchException("genius: layout_main_sticky_ad_container not found in activity_main.xml.")
            sticky.setAttribute("android:visibility", "gone")
        }

        decode("res/layout/item_ad_view.xml")
        document("res/layout/item_ad_view.xml").use { doc ->
            val root = doc.documentElement
            root.setAttribute("android:visibility", "gone")
            root.setAttribute("android:paddingTop", "0.0dp")
            root.setAttribute("android:paddingBottom", "0.0dp")
            val layouts = doc.getElementsByTagName("LinearLayout")
            (0 until layouts.length)
                .map { layouts.item(it) as Element }
                .firstOrNull { it.getAttribute("android:id") == "@id/ad_container" }
                ?.setAttribute("android:minHeight", "0.0dp")
        }
    }
}

@Suppress("unused")
val hideAdsPatch = patch(
    name = "Hide ads",
    description = "Removes the sticky banner, inline feed and search ads, video pre-roll ads, and disables ad SDKs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GENIUS)
    category("Ads")
    dependsOn(adsResourcePatch)

    execute {
        var stubbed = 0
        classDefForEach { classDef ->
            val names = STUB_AD_VOID_METHODS[classDef.type] ?: return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter { it.name in names && it.returnType == "V" }
                .forEach {
                    it.addInstruction(0, "return-void")
                    stubbed++
                }
        }
        if (stubbed == 0) throw PatchException("genius: no ad methods found to stub.")

        AdaptiveHeightFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        ShowPreloadedAdFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        IsAdvertisingEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
