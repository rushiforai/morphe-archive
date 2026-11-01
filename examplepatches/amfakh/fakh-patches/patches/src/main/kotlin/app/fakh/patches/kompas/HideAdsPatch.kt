package app.fakh.patches.kompas

import app.fakh.patches.kompas.shared.Constants.COMPATIBILITY_KOMPAS
import app.fakh.patches.shared.gms.mutableClass
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION = "Lapp/fakh/extension/kompas/HideAds;"
private const val AD_MANAGER_AD_VIEW = "Lcom/google/android/gms/ads/admanager/AdManagerAdView;"
private const val WEB_ADS = "Lapp/fakh/extension/kompas/WebAds;"

/** The screens that open kompas.com pages (Living Assistance, links from articles); each sets one WebViewClient. */
private val WEB_PAGE_SCREENS = listOf(
    "Lcom/ertanto/kompas/official/webview/WebviewFragment;",
    "Lcom/ertanto/kompas/official/webview/FullScreenWebview;",
)

/**
 * The app's "allowAds" preference reader. Every ad slot checks it, including the IMA pre-roll ad tag of the video
 * player, which the SDK hooks below cannot reach.
 */
private object AllowAdsFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("allowAds"),
)

/** AdManagerAdView.loadAd: every banner (home, article, lists, search, events, quiz) is requested through it. */
private object AdManagerLoadAdFingerprint : Fingerprint(
    definingClass = AD_MANAGER_AD_VIEW,
    name = "loadAd",
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;"),
)

/** AdLoader.loadAd(AdManagerAdRequest): loads the native ad the home feed inserts once it arrives. */
private object NativeLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/AdLoader;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;"),
)

/** AdManagerInterstitialAd.load: the full-screen ad shown after a number of taps. */
private object InterstitialLoadFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAd;",
    name = "load",
    returnType = "V",
)

/** The Teads in-read video row in an article; onBind requests the ad. */
private object TeadsBindFingerprint : Fingerprint(
    definingClass = "Lcom/ertanto/kompas/official/detail/itemView/ad/DetailItemTeadsAdViewHolder;",
    name = "onBind",
    returnType = "V",
)

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Removes the ad banners with their \"Iklan\" block from the home feed, articles and lists, the native ad in the feed, the Teads video ad in articles and the full-screen ad.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KOMPAS)
    category("Ads")
    extendWith("extensions/extension.mpe")

    execute {
        // Read ads as turned off, the state an ad-free account gets, so the app skips its ad slots on its own.
        AllowAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        // Hide each banner as it is built, so the wrappers of banners the app has not requested yet (it requests
        // the home banners one after the other) collapse too.
        val constructors = mutableClassDefBy(AD_MANAGER_AD_VIEW).methods.filter { it.name == "<init>" }
        if (constructors.size != 3) throw PatchException("Kompas: expected 3 AdManagerAdView constructors, found ${constructors.size}")
        constructors.forEach { constructor ->
            // Right after the super call: R8 reuses p0 for the null-check message afterwards, so it is no longer this.
            val superCall = constructor.instructions.indexOfFirst {
                (it.opcode == Opcode.INVOKE_DIRECT || it.opcode == Opcode.INVOKE_DIRECT_RANGE) &&
                    ((it as ReferenceInstruction).reference as MethodReference).name == "<init>"
            }
            if (superCall < 0) throw PatchException("Kompas: the super call was not found in an AdManagerAdView constructor")
            constructor.addInstruction(superCall + 1, "invoke-static { p0 }, $EXTENSION->hideBanner(Landroid/view/View;)V")
        }
        AdManagerLoadAdFingerprint.method.addInstruction(0, "return-void")
        NativeLoadAdFingerprint.method.addInstruction(0, "return-void")
        InterstitialLoadFingerprint.method.addInstruction(0, "return-void")
        // The kompas.com pages the app opens in a WebView carry the site's own banners.
        var webClients = 0
        WEB_PAGE_SCREENS.forEach { type ->
            mutableClass(type).methods.filter { it.implementation != null }.forEach { method ->
                method.instructions.withIndex().filter { (_, instruction) ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    instruction.opcode == Opcode.INVOKE_VIRTUAL && reference?.name == "setWebViewClient" &&
                        reference.parameterTypes == listOf("Landroid/webkit/WebViewClient;")
                }.forEach { (index, instruction) ->
                    val call = instruction as FiveRegisterInstruction
                    method.replaceInstruction(
                        index,
                        "invoke-static { v${call.registerC}, v${call.registerD} }, " +
                            "$WEB_ADS->setClient(Landroid/webkit/WebView;Landroid/webkit/WebViewClient;)V",
                    )
                    webClients++
                }
            }
        }
        if (webClients != WEB_PAGE_SCREENS.size) {
            throw PatchException("Kompas: expected ${WEB_PAGE_SCREENS.size} web page clients, found $webClients")
        }
        TeadsBindFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual { p0 }, Lcom/ertanto/kompas/official/detail/itemView/ad/DetailItemTeadsAdViewHolder;->getAdRoot()Landroid/widget/LinearLayout;
                move-result-object v0
                invoke-static { v0 }, $EXTENSION->hideRow(Landroid/view/View;)V
                return-void
            """,
        )
    }
}
