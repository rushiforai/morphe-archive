package app.fakhradio.patches

import app.fakhradio.patches.shared.Constants.COMPATIBILITY_RADIO_ID
import app.fakhradio.patches.shared.disableProviders
import app.fakhradio.patches.shared.references
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Every premium check in the app (ads manager, mini player EQ button, paywall)
 * funnels through one getter:
 *
 * ```
 * // com.appgeneration.ituner.appunlock.b implements appunlock.a
 * boolean a() { return prefs.getBoolean(<unlock key>, false); }
 * ```
 *
 * `b()` writes `true` after a purchase, `c()` writes `false` when billing
 * reports nothing owned. R8 renames the class and its methods, but keeps the
 * `appunlock` package, and that package holds only the interface and its single
 * implementation, so the getter is the one concrete `()Z` method in it.
 */
private val isUnlockedFingerprint = Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/appgeneration/ituner/appunlock/") &&
            method.implementation != null
    },
)

/**
 * The ad manager's `Z(Activity)`, run by `Y(Activity)` when the main or player
 * screen starts. Its first call initializes every ad network and LevelPlay
 * (`usecase.a.c()`), with no premium check; the rest builds the banner,
 * interstitial, native and app open managers. With premium every display path
 * already checks `shouldShowAds()`, so skipping the method only drops the SDK
 * init.
 */
private val initAdNetworksFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/appgeneration/ituner/ad/") &&
            method.references("Lcom/appgeneration/ituner/ad/usecase/a;->c()V")
    },
)

/** `usecase.n.e()`: starts the AppHarbr ad verification SDK from the ad manager's `I()` at app start. */
private val initAppHarbrFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/appgeneration/ituner/ad/usecase/") &&
            method.references("Lcom/appgeneration/coreprovider/ads/appharbr/c;->")
    },
)

/** Ad SDKs that start themselves from a content provider before `Application.onCreate`. */
private val adSdksManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            manifest.disableProviders(
                "com.google.android.gms.ads.MobileAdsInitProvider",
                "io.bidmachine.BidMachineInitProvider",
                "com.magnite.sdk.adsbase.MagniteInitProvider",
                "com.mobilefuse.sdk.MobileFuseSdkInitProvider",
                "com.applovin.sdk.AppLovinInitProvider",
                "com.vungle.ads.VungleProvider",
                "com.facebook.ads.AudienceNetworkContentProvider",
                "com.mbridge.msdk.config.component.status.MBComponentLifecycleProvider",
                "com.smaato.sdk.core.lifecycle.ProcessLifecycleOwnerInitializer",
                "sg.bigo.ads.controller.provider.BigoAdsProvider",
            )
            // Unity runs through androidx.startup, which also hosts WorkManager
            // and lifecycle, so only its initializer entry goes.
            val metaData = manifest.getElementsByTagName("meta-data")
            (0 until metaData.length).map { metaData.item(it) as Element }
                .filter { it.getAttribute("android:name") == "com.unity3d.services.core.configuration.AdsSdkInitializer" }
                .forEach { it.parentNode.removeChild(it) }
        }
    }
}

@Suppress("unused")
val premiumUnlockPatch = bytecodePatch(
    name = "Premium unlock",
    description = "Unlocks the lifetime premium client-side (no visual ads, music equalizer) and keeps the ad networks and AppHarbr from starting at all, so they cannot track in the background.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RADIO_ID)
    category("Premium")
    dependsOn(adSdksManifestPatch)

    execute {
        isUnlockedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
        listOf(initAdNetworksFingerprint, initAppHarbrFingerprint).forEach {
            it.method.addInstructions(0, "return-void")
        }
    }
}
