package app.template.patches.duplila.misc.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.duplila.misc.license.disableLicenseCheckPatch
import app.template.patches.shared.Constants.COMPATIBILITY_DUPLILA
import com.android.tools.smali.dexlib2.AccessFlags

private const val MOBILE_ADS = GMA + "MobileAds;"

// The banner composable: BannerView(Modifier, canShowAds, Composer, changed, default).
private val BANNER_VIEW_PARAMETERS = listOf(
    "Landroidx/compose/ui/Modifier;",
    "Z",
    "Landroidx/compose/runtime/Composer;",
    "I",
    "I",
)

// Duplila's only ad is a Google Mobile Ads banner under the device list, shown to free users once
// UMP consent allows ads. Enable Premium already removes it through the app's own premium branch;
// this patch works on its own as well.
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes ads and the ad consent form."
) {
    compatibleWith(COMPATIBILITY_DUPLILA)

    // Every patched build is re-signed and would otherwise stop at the license paywall.
    dependsOn(disableLicenseCheckPatch)

    execute {
        // 1. Skip the UMP consent flow. No consent form is requested or shown, the "consent is
        // required for the free version" exit never runs, and initAds() is never reached, so
        // canShowAds stays false. The flow also turns Firebase Analytics collection on; that is
        // skipped too (the manifest default stays in force). Its consent callback is also where
        // the app sets up Crashlytics and enables the privacy options entry
        // (requireShowPrivacyOptions), so neither happens.
        ConsentFlowFingerprint.method.returnEarly()

        // 2. The banner composable emits nothing, so no AdView and no "Cannot show ads" filler
        // row (shown when canShowAds is false) are left under the device list. It returns before
        // startRestartGroup, so the caller's groups stay balanced.
        val bannerClass = BannerAdViewFactoryFingerprint.classDef
        val bannerViews = bannerClass.methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
                it.implementation != null &&
                it.parameterTypes.map(CharSequence::toString) == BANNER_VIEW_PARAMETERS
        }
        if (bannerViews.size != 1) {
            throw PatchException(
                "Disable ads: expected one banner composable in ${bannerClass.type}, found ${bannerViews.size}"
            )
        }
        bannerViews.single().returnEarly()

        // 3. Backstop at the SDK: never initialize Google Mobile Ads, and neuter every MobileAds
        // static that needs it (setAppVolume, setAppMuted, openDebugMenu, ... throw
        // "MobileAds.initialize() must be called prior to ..." otherwise). The banner calls
        // setRequestConfiguration and initialize; both are covered. putPublisherFirstPartyIdEnabled
        // answers false.
        val mobileAds = mutableClassDefByOrNull(MOBILE_ADS)?.methods
            ?: throw PatchException("Disable ads: $MOBILE_ADS not found")
        val staticVoids = mobileAds.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
                it.implementation != null && it.name != "<clinit>"
        }
        for (required in listOf("initialize", "setRequestConfiguration")) {
            if (staticVoids.none { it.name == required }) {
                throw PatchException("Disable ads: no concrete static void $MOBILE_ADS->$required")
            }
        }
        staticVoids.forEach { it.returnEarly() }
        mobileAds.filter {
            it.name == "putPublisherFirstPartyIdEnabled" && it.returnType == "Z" &&
                it.implementation != null
        }.forEach { it.returnEarly(false) }

        // Banner loads: AdView has no loadAd of its own, it inherits BaseAdView.loadAd.
        val loads = mutableClassDefBy("${GMA}BaseAdView;").methods.filter {
            it.name == "loadAd" && it.returnType == "V" && it.implementation != null
        }
        if (loads.isEmpty()) throw PatchException("Disable ads: no concrete BaseAdView.loadAd")
        loads.forEach { it.returnEarly() }
    }
}
