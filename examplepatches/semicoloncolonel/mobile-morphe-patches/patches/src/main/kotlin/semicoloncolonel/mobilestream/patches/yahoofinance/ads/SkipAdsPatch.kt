package semicoloncolonel.mobilestream.patches.yahoofinance.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.Constants
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.methodByShape
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.offFlags
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.onArticlePageFinished

// ─────────────────────────────────────────────────────────────────────────────
// Yahoo Finance 26.22.2 and 26.23.0 — Skip ads.
//
// Every ad slot (the Home pencil, the Markets and quote page slots, Key Stats,
// More News, the Inception and React Native slots, and the Taboola stream ads)
// gets its ad from the Sponsored Moments SDK's fetcher. R8 renames its classes,
// and the letters shift between releases (fetcher/g in 26.22.2, fetcher/f in
// 26.23.0), so it and the composables below are found by package, method
// name, and signature (methodByShape):
//
//   a(listener, String, callback)
//                    a slot asks for an ad and waits. It now gets an ad error
//                    (100, the code the SDK uses for a failed Taboola fetch)
//                    at once, so the slot shows its empty state.
//   h(String, callback)
//                    the Google Ad Manager request, and
//   i(String, int, callback)
//                    the Taboola request: both return at once.
//   v(String, callback)
//                    "is an ad ready" answers false, and
//   m(String, callback)
//                    the cache serves no ad.
//
// Video: the Video 2.0 pencil ad is turned off in VideoKitAdsConfig, and Yahoo's
// video player (SapiMediaItemProviderConfig) is told the ads opt-out is on, so it
// sends dnt=true and no device ID, and its ad-break addresses point at an
// address that does not resolve. The flag inceptionQspNewsListAds reads as off,
// so More News on quote pages has no ad rows.
//
// A failed ad still leaves its row in the Home news list ("Your latest"): a
// card labelled AD with nothing in it. The two composables that draw that row
// (h and i in home/news/compose, which take the stream ad's parameters) now
// return before drawing, and so do the Google Ad Manager slot in the same list
// (b, which takes GamAdParams) and its 300x250 placeholder (n).
//
// The other ad slots draw a pulsing placeholder while they wait for an ad, and
// some keep waiting. Their composables now return before drawing: the Inception
// ad slot (b, c, and d in inception/ads/compose, the 300x250 and banner slots
// on Home, News, and quote pages), and the Home pencil ad (a and b in
// home/ad/compose).
//
// With the ad gone, the 45dp spacer above "Your most actives" (the section
// header after the ad, home/news/compose/j) left a wide empty band. It is now
// 12dp.
//
// Articles are finance.yahoo.com pages in a WebView, with their own ad slots.
// When a Yahoo page finishes loading, ArticleCleanup.hideAds adds a style that
// hides every element Yahoo marks as an ad container, with the space it keeps.
//
// The ad-free entitlement of Yahoo Finance Plus is not touched.
// ─────────────────────────────────────────────────────────────────────────────

// The Sponsored Moments fetcher package, and the obfuscated packages whose
// classes appear in the signatures below (any class directly in each).
private const val FETCHER = "Lcom/oath/mobile/ads/sponsoredmoments/fetcher/"
private const val AD_MODELS = "Lcom/oath/mobile/ads/sponsoredmoments/models/"
private const val SAPI_CONFIG =
    "Lcom/verizondigitalmedia/mobile/client/android/sapiMediaItemProvider/config/SapiMediaItemProviderConfig;"
private const val NO_ADS_URL = "https://video-api.invalid/"

internal object VideoKitAdsConfigFingerprint : Fingerprint(
    definingClass = "Lcom/vzmedia/android/videokit/config/VideoKitAdsConfig;",
    name = "<init>",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z"),
    returnType = "V",
)

internal object AdsOptOutFingerprint : Fingerprint(
    definingClass = SAPI_CONFIG,
    name = "isAdsOptOut",
    parameters = listOf(),
    returnType = "Z",
)

internal object AdBreaksEndpointFingerprint : Fingerprint(
    definingClass = SAPI_CONFIG,
    name = "getThunderballAdbreaksEndpoint",
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
)

internal object AdsEndpointFingerprint : Fingerprint(
    definingClass = SAPI_CONFIG,
    name = "getThunderballAdsEndpoint",
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
)

private const val FINANCE = "Lcom/yahoo/mobile/client/android/finance/"
private const val NEWS_COMPOSE = "${FINANCE}home/news/compose/"
private const val NEWS_MODEL = "${FINANCE}home/news/model/"
private const val INCEPTION_COMPOSE = "${FINANCE}inception/ads/compose/"
private const val INCEPTION = "${FINANCE}inception/ads/"
private const val PENCIL_AD = "${FINANCE}home/ad/compose/"
private const val HOME_AD = "${FINANCE}home/ad/"
private const val COMPOSER = "Landroidx/compose/runtime/"
private const val COMPOSABLE_LAMBDA = "Landroidx/compose/runtime/internal/"
private const val MODIFIER = "Landroidx/compose/ui/"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"

private val STREAM_AD_ROW_PARAMETERS =
    listOf(NEWS_MODEL, NEWS_MODEL, FUNCTION0, FUNCTION0, FUNCTION0, MODIFIER, COMPOSER, "I")

internal object MostActivesHeaderFingerprint : Fingerprint(
    definingClass = "Lcom/yahoo/mobile/client/android/finance/home/news/compose/j;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it.opcode == Opcode.CONST_HIGH16 && (it as NarrowLiteralInstruction).narrowLiteral == HEADER_SPACER
        } == true
    },
)

/** 45.0f and 12.0f as float bits. */
private const val HEADER_SPACER = 0x42340000
private const val TIGHT_SPACER = 0x41400000

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads on Home, Markets, quote pages, and news, and the ads in videos.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        val awaitAd = methodByShape(FETCHER, "a", listOf(FETCHER, "Ljava/lang/String;", FETCHER), "V")
        // The injected call uses p1 as the listener, so a must be an instance method.
        if (AccessFlags.STATIC.isSet(awaitAd.accessFlags)) throw PatchException("Sponsored Moments a() is static")
        val listener = awaitAd.parameterTypes.first().toString()
        awaitAd.addInstructions(
            0,
            """
                const/16 v0, 0x64
                invoke-interface { p1, v0 }, $listener->a(I)V
                return-void
            """,
        )
        methodByShape(FETCHER, "h", listOf("Ljava/lang/String;", FETCHER), "V").addInstructions(0, "return-void")
        methodByShape(FETCHER, "i", listOf("Ljava/lang/String;", "I", FETCHER), "V")
            .addInstructions(0, "return-void")
        methodByShape(FETCHER, "v", listOf("Ljava/lang/String;", FETCHER), "Z").addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        methodByShape(FETCHER, "m", listOf("Ljava/lang/String;", FETCHER), AD_MODELS).addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        VideoKitAdsConfigFingerprint.method.addInstructions(0, "const/4 p3, 0x0")
        AdsOptOutFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
        listOf(AdBreaksEndpointFingerprint, AdsEndpointFingerprint).forEach {
            it.method.addInstructions(
                0,
                """
                    const-string v0, "$NO_ADS_URL"
                    return-object v0
                """,
            )
        }

        listOf(
            // The Home news list's stream ad row and card.
            methodByShape(NEWS_COMPOSE, "h", STREAM_AD_ROW_PARAMETERS, "V"),
            methodByShape(NEWS_COMPOSE, "i", STREAM_AD_ROW_PARAMETERS, "V"),
            // The Inception ad slots.
            methodByShape(
                INCEPTION_COMPOSE, "b",
                listOf(INCEPTION_COMPOSE, INCEPTION, FUNCTION0, MODIFIER, COMPOSABLE_LAMBDA, COMPOSER, "I", "I"), "V",
            ),
            methodByShape(
                INCEPTION_COMPOSE, "c",
                listOf(INCEPTION, FUNCTION1, FUNCTION0, FUNCTION0, MODIFIER, COMPOSER, "I", "I"), "V",
            ),
            methodByShape(
                INCEPTION_COMPOSE, "d",
                listOf(INCEPTION, FUNCTION1, FUNCTION0, FUNCTION0, MODIFIER, COMPOSER, "I"), "V",
            ),
            // The Home pencil ad.
            methodByShape(PENCIL_AD, "a", listOf(FUNCTION1, FUNCTION0, FUNCTION0, HOME_AD, COMPOSER, "I"), "V"),
            methodByShape(
                PENCIL_AD, "b", listOf(FUNCTION1, FUNCTION0, FUNCTION0, MODIFIER, HOME_AD, COMPOSER, "I"), "V",
            ),
            // The Google Ad Manager row in the Home news list, and its placeholder.
            methodByShape(
                NEWS_COMPOSE, "b",
                listOf(NEWS_MODEL, FUNCTION0, FUNCTION0, FUNCTION0, MODIFIER, "Z", COMPOSER, "I", "I"), "V",
            ),
            methodByShape(NEWS_COMPOSE, "n", listOf(COMPOSER, "I"), "V"),
        ).forEach { it.addInstructions(0, "return-void") }

        MostActivesHeaderFingerprint.method.apply {
            val index = implementation!!.instructions.indexOfFirst {
                it.opcode == Opcode.CONST_HIGH16 && (it as NarrowLiteralInstruction).narrowLiteral == HEADER_SPACER
            }
            if (index < 0) throw PatchException("Your most actives spacer not found")
            val register = (implementation!!.instructions.elementAt(index) as OneRegisterInstruction).registerA
            replaceInstruction(index, "const/high16 v$register, $TIGHT_SPACER")
        }

        offFlags("adsOff")
        onArticlePageFinished("hideAds")
    }
}
