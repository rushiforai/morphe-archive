package semicoloncolonel.mobilestream.patches.wsj.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.wsj.shared.Constants

// WSJ phone 15.12.0. The ad module (com.dowjones.advertisement) is not
// obfuscated. Ads reach the screen four ways, and each is cut at its entry:
//
//   Ad slots — Compose functions in DJAdComponentKt: DJArticleAdComponent,
//     DJSectionAdComponent, and the core slot `a` that every screen and both
//     of those call. Returning before they compose anything removes the slot,
//     so no skeleton placeholder is left behind.
//   Ad requests — DJAdViewModel.createAd / createNativeAd start the Google Ad
//     Manager request (with Amazon, Prebid and Index bidding). They return a
//     Job that every caller discards, so returning null is safe.
//   Video interstitial — DiscoverVideoInterstitialAd.loadAd. Without a load,
//     there is nothing to show.
//   Video pre-rolls — ExoMediaPlayer.setPlayingVideo takes a nullable IMA ad
//     tag URI and ads loader. The playback code already null-checks both, so
//     passing null plays the video without ads.
private const val ADS = "Lcom/dowjones/advertisement/"

internal object AdSlotComponentsFingerprint : Fingerprint(
    definingClass = "${ADS}ui/component/DJAdComponentKt;",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    custom = { method, _ ->
        method.name.startsWith("DJArticleAdComponent") || method.name.startsWith("DJSectionAdComponent")
    },
)

internal object CoreAdSlotFingerprint : Fingerprint(
    definingClass = "${ADS}ui/component/DJAdComponentKt;",
    name = "a",
    returnType = "V",
    custom = { method, _ ->
        method.parameterTypes.take(4).map { it.toString() } == listOf(
            "Landroidx/compose/ui/Modifier;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroidx/compose/material3/windowsizeclass/WindowSizeClass;",
        )
    },
)

internal object CreateAdFingerprint : Fingerprint(
    definingClass = "${ADS}ui/DJAdViewModel;",
    returnType = "Lkotlinx/coroutines/Job;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, _ -> method.name.startsWith("createAd-") },
)

internal object CreateNativeAdFingerprint : Fingerprint(
    definingClass = "${ADS}ui/DJAdViewModel;",
    returnType = "Lkotlinx/coroutines/Job;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, _ -> method.name.startsWith("createNativeAd-") },
)

internal object VideoInterstitialLoadFingerprint : Fingerprint(
    definingClass = "${ADS}uac/DiscoverVideoInterstitialAd;",
    name = "loadAd",
    returnType = "V",
)

internal object SetPlayingVideoFingerprint : Fingerprint(
    definingClass = "Lcom/dowjones/video/ExoMediaPlayer;",
    name = "setPlayingVideo",
    returnType = "V",
    parameters = listOf(
        "Lcom/dowjones/video/model/MediaPlayerItem;",
        "Landroid/net/Uri;",
        "Landroidx/media3/exoplayer/ima/ImaAdsLoader;",
        "Landroidx/media3/ui/PlayerView;",
        "Lkotlin/jvm/functions/Function1;",
    ),
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes ads from the Wall Street Journal phone app: ad slots in sections " +
        "and articles, the full-screen video ad, and ads before videos. Experimental; test " +
        "on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        AdSlotComponentsFingerprint.matchAll().forEach { it.method.addInstructions(0, "return-void") }
        CoreAdSlotFingerprint.method.addInstructions(0, "return-void")

        // .locals 22 in both, so v0 is free.
        listOf(CreateAdFingerprint, CreateNativeAdFingerprint).forEach {
            it.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """.trimIndent(),
            )
        }

        VideoInterstitialLoadFingerprint.method.addInstructions(0, "return-void")

        // .locals 9, so p2/p3 are v11/v12 and fit const/4.
        SetPlayingVideoFingerprint.method.addInstructions(
            0,
            """
                const/4 p2, 0x0
                const/4 p3, 0x0
            """.trimIndent(),
        )
    }
}
