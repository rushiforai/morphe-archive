package semicoloncolonel.mobilestream.patches.nba.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.string
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.nba.shared.Constants

private const val WEB_ADS =
    "Lsemicoloncolonel/mobilestream/extension/nba/ads/NbaWebVideoAds;"
private const val NO_AD_TOKENS_LOG = "No ad-related CDN tokens to generate, ctype = "



// Live games and NBA TV also carry ads stitched in on the server (FreeWheel
// through MediaKind). The app asks for them with a CDN token map built by
// GetMediaKindAdMapUseCase (com.nba.video.ads.e in 1.2.0 and 1.3.0). The map already has
// an ad-free branch, taken when the account or the video is ad-free: it
// returns mapOf("ads" to "no"), and the server then sends the stream without
// ads. That branch is chosen right after the "ads" key is loaded:
//
//     const-string vK, "ads"
//     if-nez vX, :adFree
//
// Setting vX to true before that check always takes the ad-free branch.
// 1.3.0 added the ad matrix to the log, so the log is matched by its start.
internal object AdMapFingerprint : Fingerprint(
    filters = listOf(
        string("ads"),
        string(NO_AD_TOKENS_LOG, StringComparisonType.STARTS_WITH),
    ),
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads before and during videos, games, and NBA TV.",
) {
    category("Ads")
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

        skipMkPlayerAds()
    }
}
