package semicoloncolonel.mobilestream.patches.nfl.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.nfl.shared.Constants

private const val ADS_KEY = "ads"

// The NFL app is React Native and plays video with THEOplayer through
// react-native-theoplayer. Every source the JavaScript sends to the player
// passes through the bridge's SourceAdapter (zl/f in 61.0.18, R8-renamed),
// which turns the JS map into a SourceDescription. Its parse method reads the
// "ads" array with optJSONArray("ads"), converts each entry (Google IMA or
// THEOads) into an AdDescription, and hands the list to
// SourceDescription.Builder.ads().
//
// Replacing that optJSONArray result with null sends the parser down its own
// "no ads" branch, so the player is built with an empty ad list. Stream URLs,
// DRM, text tracks and metadata are unchanged. Google DAI and other
// server-stitched streams are set on the source itself, not in this list,
// and are left alone.
//
// Clips on article pages play elsewhere: the article opens in React Native's
// web view, and the website's own player gets its pre-rolls through Google's
// IMA SDK. React Native's web view client (a WebViewClient in
// com/reactnativecommunity/webview, R8-renamed) gets a shouldInterceptRequest
// that answers IMA's video ad requests with 404 through NflWebAds, so the
// player plays the clip without the ad. The SDK itself still loads, because
// the page shows an ad-blocker message when it cannot.
internal object SourceAdapterParseFingerprint : Fingerprint(
    returnType = "Lcom/theoplayer/android/api/source/SourceDescription;",
    parameters = listOf("Lcom/facebook/react/bridge/ReadableMap;"),
    strings = listOf("sources", "poster", ADS_KEY, "textTracks"),
)

private const val WEB_ADS = "Lsemicoloncolonel/mobilestream/extension/nfl/NflWebAds;"
private const val WEB_VIEW_CLIENT = "Landroid/webkit/WebViewClient;"
private val INTERCEPT_PARAMETERS = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;")

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Stops the video ads before and during clips and highlights.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        SourceAdapterParseFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val keyIndex = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == ADS_KEY
            }
            val resultIndex = (keyIndex + 1 until instructions.size).firstOrNull {
                instructions[it].opcode == Opcode.MOVE_RESULT_OBJECT
            } ?: throw PatchException("ads array read not found")

            val register = (instructions[resultIndex] as OneRegisterInstruction).registerA
            addInstructions(resultIndex + 1, "const/4 v$register, 0x0")
        }

        // React Native's web view clients, for the clips on article pages.
        val clients = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lcom/reactnativecommunity/webview/") && classDef.superclass == WEB_VIEW_CLIENT &&
                classDef.methods.none { it.name == "shouldInterceptRequest" }
            ) {
                clients += classDef.type
            }
        }
        clients.forEach { type ->
            val client = mutableClassDefBy(type)
            val method = ImmutableMethod(
                type,
                "shouldInterceptRequest",
                INTERCEPT_PARAMETERS.map { ImmutableMethodParameter(it, null, null) },
                "Landroid/webkit/WebResourceResponse;",
                AccessFlags.PUBLIC.value,
                null,
                null,
                MutableMethodImplementation(4),
            ).toMutable()
            method.addInstructions(
                0,
                """
                    invoke-static { p2 }, $WEB_ADS->intercept(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                    move-result-object v0
                    if-eqz v0, :pass
                    return-object v0
                    :pass
                    invoke-super { p0, p1, p2 }, $WEB_VIEW_CLIENT->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                    move-result-object v0
                    return-object v0
                """,
            )
            client.methods.add(method)
        }
    }
}
