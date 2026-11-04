package app.fakh.patches.cnn

import app.fakh.patches.cnn.shared.Constants.COMPATIBILITY_CNN
import app.fakh.patches.shared.web.wrapWebClients
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val WEB_ADS = "Lapp/fakh/extension/shared/WebAds;"

/** The screens that show cnnindonesia.com HTML: the article body, the web articles and the in-app browsers. */
private val WEB_SCREENS = listOf(
    "Lcom/cnn/indonesia/custom/CustomContentView;",
    "Lcom/cnn/indonesia/feature/fragment/FragmentContentWeb;",
    "Lcom/cnn/indonesia/feature/activity/ActivityBrowser;",
    "Lcom/cnn/indonesia/feature/activity/ActivityBrowserInline;",
)

/** The placement lookup every banner, native ad and sticky ad starts from; each caller skips a missing placement. */
private object MonetizeFingerprint : Fingerprint(
    definingClass = "Lcom/cnn/indonesia/utils/UtilMonetize;",
    name = "getMonetize",
)

/** The entry of the full-screen ad. */
private object InterstitialFingerprint : Fingerprint(
    definingClass = "Lcom/cnn/indonesia/monetize/builder/FetcherInterstitialAd;",
    name = "checkEligibleShowInterstitialAd",
    returnType = "V",
)

/** MobileAds.initialize, called from the application. Nothing waits for its callback. */
private object MobileAdsInitFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAds;",
    name = "initialize",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/google/android/gms/ads/initialization/OnInitializationCompleteListener;",
    ),
)

/** The Google Mobile Ads SDK starts itself from this provider, before Application.onCreate. */
private val adsProviderPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val providers = document.getElementsByTagName("provider")
            (0 until providers.length).map { providers.item(it) as Element }
                .filter { it.getAttribute("android:name") == "com.google.android.gms.ads.MobileAdsInitProvider" }
                .also { if (it.size != 1) throw PatchException("CNN Indonesia: MobileAdsInitProvider not found in the manifest.") }
                .forEach { it.setAttribute("android:enabled", "false") }
        }
    }
}

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Removes the ad banners, native ads, sticky ads and full-screen ads, and the ads on cnnindonesia.com pages opened in the app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CNN)
    category("Ads")
    extendWith("extensions/extension.mpe")
    dependsOn(adsProviderPatch)

    execute {
        MonetizeFingerprint.method.addInstructions(
            0,
            """
                const/4 p0, 0x0
                return-object p0
            """,
        )
        InterstitialFingerprint.method.addInstruction(0, "return-void")
        MobileAdsInitFingerprint.method.addInstruction(0, "return-void")
        wrapWebClients(WEB_SCREENS, WEB_ADS)
    }
}
