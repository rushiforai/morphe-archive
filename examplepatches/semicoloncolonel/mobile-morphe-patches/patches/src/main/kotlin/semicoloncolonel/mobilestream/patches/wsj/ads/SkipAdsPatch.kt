package semicoloncolonel.mobilestream.patches.wsj.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.wsj.shared.Constants

// WSJ phone 15.12.0 and 15.13.0. The ad module (com.dowjones.advertisement) is not
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
//   Video pre-rolls — the player's setPlayingVideo takes a nullable IMA ads
//     loader, and the playback code null-checks it before it builds the ad
//     media source, so passing null plays the video without ads. 15.12.0 has
//     one player, ExoMediaPlayer, which also takes the ad tag URI. 15.13.0
//     splits it into PreloadMediaPlayer and SingleMediaPlayer, which read the
//     tag from the item instead. Each setPlayingVideo in the video package
//     that takes a loader is found by that parameter, so both builds match.
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

// Section feeds wrap the slot in SectionPageAd, which shows a 326dp loading
// placeholder (AdLoader) until the container is on screen and then swaps in the
// slot. With the slot empty, the container collapses to nothing, counts as off
// screen again, and brings the placeholder back. Scrolling up through it jumps
// back and forth and never gets past it (issue 112). Cutting the container, its
// prefetch wrapper, and the placeholder removes the feed item instead.
private const val SECTION_ADS = "Lcom/dowjones/ads/"

internal object SectionAdContainersFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    custom = { method, classDef ->
        when (classDef.type) {
            "${SECTION_ADS}SectionPageAdKt;" -> method.name == "SectionPageAd" || method.name == "AdLoader"
            "${SECTION_ADS}SectionPageAdWithPrefetchKt;" -> method.name.startsWith("SectionPageAdWithPrefetch")
            else -> false
        }
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

private const val VIDEO = "Lcom/dowjones/video/"
private const val IMA_ADS_LOADER = "Landroidx/media3/exoplayer/ima/ImaAdsLoader;"

private fun Method.isSetPlayingVideo() =
    name == "setPlayingVideo" && returnType == "V" && implementation != null &&
        !AccessFlags.STATIC.isSet(accessFlags) &&
        parameterTypes.any { it.toString() == IMA_ADS_LOADER }

// The smali name ("p3") of each parameter of these types. p0 is this, and
// long and double take two registers.
private fun Method.parameterRegisters(types: Set<String>): List<String> {
    var register = 1
    return parameterTypes.mapNotNull { parameter ->
        val type = parameter.toString()
        val name = "p$register".takeIf { type in types }
        register += if (type == "J" || type == "D") 2 else 1
        name
    }
}

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads in sections, articles, and videos, and the full-screen video ad.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        AdSlotComponentsFingerprint.matchAll().forEach { it.method.addInstructions(0, "return-void") }
        CoreAdSlotFingerprint.method.addInstructions(0, "return-void")

        val containers = SectionAdContainersFingerprint.matchAll()
        if (containers.size != 3) throw PatchException("Expected 3 section ad containers, found ${containers.size}")
        containers.forEach { it.method.addInstructions(0, "return-void") }

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

        // Null the ads loader, and on 15.12.0 the ad tag URI. const/16 takes
        // any register below 256, so the method's size does not matter.
        val players = forEachMatchingMethod({ it.type.startsWith(VIDEO) }, { it.isSetPlayingVideo() }) { method ->
            val nulled = method.parameterRegisters(setOf(IMA_ADS_LOADER, "Landroid/net/Uri;"))
            method.addInstructions(0, nulled.joinToString("\n") { "const/16 $it, 0x0" })
        }
        if (players == 0) throw PatchException("No video player setPlayingVideo takes an ads loader")
    }
}
