package semicoloncolonel.mobilestream.patches.nba.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.nba.shared.Constants

private const val AD_CONFIG = "Lcom/mediakind/mkplayer/config/clientsideads/MKAdvertisingConfiguration;"
private const val AD_BREAK = "Lcom/mediakind/mkplayer/config/clientsideads/MKAdBreak;"
private const val WEB_ADS =
    "Lsemicoloncolonel/mobilestream/extension/nba/ads/NbaWebVideoAds;"
private const val NO_AD_TOKENS_LOG = "No ad-related CDN tokens to generate, ctype = "
private const val NO_ADS_LOG =
    "Playing media without ads. Configure ad support by calling setAdsLoaderProvider and setAdViewProvider."

// The NBA app plays video with MediaKind's MKPlayer, which wraps the Bitmovin
// player. Client-side ads (Google IMA, and the ad manifests MediaKind loads
// for a stream) reach Bitmovin through MKAdvertisingConfiguration, whose
// names are not obfuscated in 1.2.0:
//
// - getSchedule() is copied into Bitmovin's AdvertisingConfig as the list of
//   ads to load with the video.
// - Before Bitmovin plays any ad break, scheduled or added later, it asks
//   MediaKind's shouldPlayAdBreak callback. NBA never sets its own, so the
//   default from the constructor answers, and it always returns true.
//
// Returning an empty schedule and making the default callback return false
// means no client-side ad break plays. Ads stitched into a stream on the
// server are not affected.
internal object AdScheduleFingerprint : Fingerprint(
    definingClass = AD_CONFIG,
    name = "getSchedule",
    returnType = "Ljava/util/List;",
    parameters = listOf(),
)

internal object DefaultShouldPlayAdBreakFingerprint : Fingerprint(
    definingClass = AD_CONFIG,
    returnType = "Z",
    parameters = listOf(AD_BREAK),
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
)

// Some videos skip MKPlayer and play in a plain media3 ExoPlayer with Google
// IMA (media3's ImaAdsLoader, R8-renamed). media3's DefaultMediaSourceFactory
// wraps an item in an AdsMediaSource only when its localConfiguration has an
// AdsConfiguration. The check is:
//
//     iget-object vX, ..., AdsConfiguration   (adsConfiguration)
//     if-nez vX, :wrap
//     return-object <content source>
//
// and the log above sits on the same no-ads path. The app carries more than one
// media3 copy, so every method holding that log is patched: the AdsConfiguration
// read is set to null, and the factory returns the plain content source.
private fun Method.isMediaSourceFactory() = implementation?.instructions?.any {
    it.opcode == Opcode.CONST_STRING &&
        ((it as ReferenceInstruction).reference as StringReference).string == NO_ADS_LOG
} == true

// Live games and NBA TV also carry ads stitched in on the server (FreeWheel
// through MediaKind). The app asks for them with a CDN token map built by
// GetMediaKindAdMapUseCase (com.nba.video.ads.e in 1.2.0). The map already has
// an ad-free branch, taken when the account or the video is ad-free: it
// returns mapOf("ads" to "no"), and the server then sends the stream without
// ads. That branch is chosen right after the "ads" key is loaded:
//
//     const-string vK, "ads"
//     if-nez vX, :adFree
//
// Setting vX to true before that check always takes the ad-free branch.
internal object AdMapFingerprint : Fingerprint(
    strings = listOf(NO_AD_TOKENS_LOG, "ads"),
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads before and during NBA videos, games and NBA TV, including " +
        "videos inside news articles. Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        AdMapFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val keyIndex = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == "ads"
            }
            val check = instructions.getOrNull(keyIndex + 1)
            if (keyIndex < 0 || check?.opcode != Opcode.IF_NEZ) {
                throw PatchException("ad-free branch check not found")
            }
            val register = (check as OneRegisterInstruction).registerA
            addInstructions(keyIndex + 1, "const/16 v$register, 0x1")
        }

        // News articles play video in nba.com's web player inside the app's
        // web views. Every WebViewClient page callback hands the page to the
        // extension, which only acts on nba.com pages.
        val clients = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.superclass == "Landroid/webkit/WebViewClient;") clients += classDef.type
        }
        var webHooks = 0
        clients.forEach { type ->
            mutableClassDefBy(type).methods.filter {
                (it.name == "onPageStarted" || it.name == "onPageFinished") &&
                    it.parameterTypes.size >= 2 &&
                    it.parameterTypes[0] == "Landroid/webkit/WebView;" &&
                    it.parameterTypes[1] == "Ljava/lang/String;" &&
                    it.implementation != null
            }.forEach { method ->
                method.addInstructions(
                    0,
                    "invoke-static/range { p1 .. p2 }, $WEB_ADS->inject(Landroid/webkit/WebView;Ljava/lang/String;)V",
                )
                webHooks++
            }
        }
        if (webHooks == 0) throw PatchException("no WebViewClient page callbacks found")

        AdScheduleFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
                return-object v0
            """,
        )

        DefaultShouldPlayAdBreakFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        var patched = 0
        classDefByStrings(NO_ADS_LOG, StringComparisonType.EQUALS).map { it.type }.distinct().forEach { type ->
            mutableClassDefBy(type).methods.filter { it.isMediaSourceFactory() }.forEach { method ->
                val instructions = method.implementation!!.instructions.toList()
                val logIndex = instructions.indexOfFirst {
                    it.opcode == Opcode.CONST_STRING &&
                        ((it as ReferenceInstruction).reference as StringReference).string == NO_ADS_LOG
                }
                // The adsConfiguration check: iget-object vX; if-nez vX; return-object.
                val readIndex = (logIndex - 1 downTo 2).firstOrNull { i ->
                    instructions[i - 2].opcode == Opcode.IGET_OBJECT &&
                        instructions[i - 1].opcode == Opcode.IF_NEZ &&
                        instructions[i].opcode == Opcode.RETURN_OBJECT &&
                        (instructions[i - 2] as OneRegisterInstruction).registerA ==
                        (instructions[i - 1] as OneRegisterInstruction).registerA
                }?.minus(2) ?: return@forEach

                val register = (instructions[readIndex] as OneRegisterInstruction).registerA
                method.addInstructions(readIndex + 1, "const/16 v$register, 0x0")
                patched++
            }
        }
        if (patched == 0) throw PatchException("media3 ads configuration check not found")
    }
}
