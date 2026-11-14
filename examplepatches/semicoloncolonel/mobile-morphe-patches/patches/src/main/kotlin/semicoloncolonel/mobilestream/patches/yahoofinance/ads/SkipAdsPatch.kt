package semicoloncolonel.mobilestream.patches.yahoofinance.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.Constants
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.offFlags
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.onArticlePageFinished

// ─────────────────────────────────────────────────────────────────────────────
// Yahoo Finance 26.22.2 — Skip ads.
//
// Every ad slot (the Home pencil, the Markets and quote page slots, Key Stats,
// More News, the Inception and React Native slots, and the Taboola stream ads)
// gets its ad from the Sponsored Moments SDK's fetcher (sponsoredmoments
// fetcher/g, R8-renamed):
//
//   a(f, String, h)  a slot asks for an ad and waits. It now gets an ad error
//                    (100, the code the SDK uses for a failed Taboola fetch)
//                    at once, so the slot shows its empty state.
//   h(String, h)     the Google Ad Manager request, and
//   i(String, I, h)  the Taboola request: both return at once.
//   v(String, h)     "is an ad ready" answers false, and
//   m(String, h)     the cache serves no ad.
//
// Video: the Video 2.0 pencil ad is turned off in VideoKitAdsConfig, and Yahoo's
// video player (SapiMediaItemProviderConfig) is told the ads opt-out is on, so it
// sends dnt=true and no device ID, and its ad-break addresses point at an
// address that does not resolve. The flag inceptionQspNewsListAds reads as off,
// so More News on quote pages has no ad rows.
//
// A failed ad still leaves its row in the Home news list ("Your latest"): a
// card labelled AD with nothing in it. The two composables that draw that row
// (home/news/compose/d0.h and d0.i, which take the stream ad's parameters) now
// return before drawing, and so do the Google Ad Manager slot in the same list
// (d0.b, which takes GamAdParams) and its 300x250 placeholder (d0.n).
//
// The other ad slots draw a pulsing placeholder while they wait for an ad, and
// some keep waiting. Their composables now return before drawing: the Inception
// ad slot (inception/ads/compose/b: b, c, and d, the 300x250 and banner slots on
// Home, News, and quote pages), and the Home pencil ad (home/ad/compose/h: a
// and b).
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

private const val FETCHER = "Lcom/oath/mobile/ads/sponsoredmoments/fetcher/g;"
private const val LISTENER = "Lcom/oath/mobile/ads/sponsoredmoments/fetcher/f;"
private const val CALLBACK = "Lcom/oath/mobile/ads/sponsoredmoments/fetcher/h;"
private const val SAPI_CONFIG =
    "Lcom/verizondigitalmedia/mobile/client/android/sapiMediaItemProvider/config/SapiMediaItemProviderConfig;"
private const val NO_ADS_URL = "https://video-api.invalid/"

internal object AwaitAdFingerprint : Fingerprint(
    definingClass = FETCHER,
    name = "a",
    parameters = listOf(LISTENER, "Ljava/lang/String;", CALLBACK),
    returnType = "V",
)

internal object GamRequestFingerprint : Fingerprint(
    definingClass = FETCHER,
    name = "h",
    parameters = listOf("Ljava/lang/String;", CALLBACK),
    returnType = "V",
)

internal object TaboolaRequestFingerprint : Fingerprint(
    definingClass = FETCHER,
    name = "i",
    parameters = listOf("Ljava/lang/String;", "I", CALLBACK),
    returnType = "V",
)

internal object AdReadyFingerprint : Fingerprint(
    definingClass = FETCHER,
    name = "v",
    parameters = listOf("Ljava/lang/String;", CALLBACK),
    returnType = "Z",
)

internal object CachedAdFingerprint : Fingerprint(
    definingClass = FETCHER,
    name = "m",
    parameters = listOf("Ljava/lang/String;", CALLBACK),
    returnType = "Lcom/oath/mobile/ads/sponsoredmoments/models/s;",
)

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

private const val NEWS_COMPOSE = "Lcom/yahoo/mobile/client/android/finance/home/news/compose/d0;"
private val STREAM_AD_ROW_PARAMETERS = listOf(
    "Lcom/yahoo/mobile/client/android/finance/home/news/model/f;",
    "Lcom/yahoo/mobile/client/android/finance/home/news/model/e;",
    "Lkotlin/jvm/functions/Function0;",
    "Lkotlin/jvm/functions/Function0;",
    "Lkotlin/jvm/functions/Function0;",
    "Landroidx/compose/ui/s;",
    "Landroidx/compose/runtime/l;",
    "I",
)

internal object StreamAdRowFingerprint : Fingerprint(
    definingClass = NEWS_COMPOSE,
    name = "h",
    parameters = STREAM_AD_ROW_PARAMETERS,
    returnType = "V",
)

internal object StreamAdCardFingerprint : Fingerprint(
    definingClass = NEWS_COMPOSE,
    name = "i",
    parameters = STREAM_AD_ROW_PARAMETERS,
    returnType = "V",
)

private const val INCEPTION_AD = "Lcom/yahoo/mobile/client/android/finance/inception/ads/compose/b;"
private const val PENCIL_AD = "Lcom/yahoo/mobile/client/android/finance/home/ad/compose/h;"
private const val COMPOSER = "Landroidx/compose/runtime/l;"
private const val MODIFIER = "Landroidx/compose/ui/s;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
private const val CONTROLLER = "Lcom/yahoo/mobile/client/android/finance/inception/ads/e0;"

internal object InceptionAdSlotFingerprint : Fingerprint(
    definingClass = INCEPTION_AD,
    name = "b",
    parameters = listOf(
        "Lcom/yahoo/mobile/client/android/finance/inception/ads/compose/a;",
        "Lcom/yahoo/mobile/client/android/finance/inception/ads/u;",
        FUNCTION0, MODIFIER, "Landroidx/compose/runtime/internal/d;", COMPOSER, "I", "I",
    ),
    returnType = "V",
)

internal object InceptionAdFingerprint : Fingerprint(
    definingClass = INCEPTION_AD,
    name = "c",
    parameters = listOf(CONTROLLER, FUNCTION1, FUNCTION0, FUNCTION0, MODIFIER, COMPOSER, "I", "I"),
    returnType = "V",
)

internal object InceptionAdContentFingerprint : Fingerprint(
    definingClass = INCEPTION_AD,
    name = "d",
    parameters = listOf(CONTROLLER, FUNCTION1, FUNCTION0, FUNCTION0, MODIFIER, COMPOSER, "I"),
    returnType = "V",
)

internal object PencilAdFingerprint : Fingerprint(
    definingClass = PENCIL_AD,
    name = "a",
    parameters = listOf(FUNCTION1, FUNCTION0, FUNCTION0, "Lcom/yahoo/mobile/client/android/finance/home/ad/a;", COMPOSER, "I"),
    returnType = "V",
)

internal object PencilAdSlotFingerprint : Fingerprint(
    definingClass = PENCIL_AD,
    name = "b",
    parameters = listOf(FUNCTION1, FUNCTION0, FUNCTION0, MODIFIER, "Lcom/yahoo/mobile/client/android/finance/home/ad/a;", COMPOSER, "I"),
    returnType = "V",
)

internal object GamAdRowFingerprint : Fingerprint(
    definingClass = NEWS_COMPOSE,
    name = "b",
    parameters = listOf(
        "Lcom/yahoo/mobile/client/android/finance/home/news/model/a;",
        FUNCTION0, FUNCTION0, FUNCTION0, MODIFIER, "Z", COMPOSER, "I", "I",
    ),
    returnType = "V",
)

internal object GamAdPlaceholderFingerprint : Fingerprint(
    definingClass = NEWS_COMPOSE,
    name = "n",
    parameters = listOf(COMPOSER, "I"),
    returnType = "V",
)

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
        AwaitAdFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x64
                invoke-interface { p1, v0 }, $LISTENER->a(I)V
                return-void
            """,
        )
        GamRequestFingerprint.method.addInstructions(0, "return-void")
        TaboolaRequestFingerprint.method.addInstructions(0, "return-void")
        AdReadyFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        CachedAdFingerprint.method.addInstructions(
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

        StreamAdRowFingerprint.method.addInstructions(0, "return-void")
        StreamAdCardFingerprint.method.addInstructions(0, "return-void")
        listOf(
            InceptionAdSlotFingerprint,
            InceptionAdFingerprint,
            InceptionAdContentFingerprint,
            PencilAdFingerprint,
            PencilAdSlotFingerprint,
            GamAdRowFingerprint,
            GamAdPlaceholderFingerprint,
        ).forEach { it.method.addInstructions(0, "return-void") }

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
