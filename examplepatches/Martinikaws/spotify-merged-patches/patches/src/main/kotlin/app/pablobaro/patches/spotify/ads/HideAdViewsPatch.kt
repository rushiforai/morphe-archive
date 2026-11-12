package app.pablobaro.patches.spotify.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.pablobaro.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import app.pablobaro.patches.shared.EXTENSION
import app.pablobaro.patches.shared.EXTENSION_PACKAGE
import app.pablobaro.patches.shared.getReference
import app.pablobaro.patches.shared.indexOfFirstInstruction
import app.pablobaro.patches.shared.p0Register
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/spotify/HideAdViewsPatch;"

private const val INFLATE_DESCRIPTOR =
    "(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;Z)Landroid/view/View;"

/**
 * Ad views hidden as soon as they are created. Must match the list of the extension.
 */
private val AD_VIEW_CLASSES = listOf(
    // Older Spotify versions.
    "Lcom/spotify/adsinternal/playback/video/CountdownBarView;",
    "Lcom/spotify/adsinternal/display/DisplayAdView;",
    "Lcom/spotify/adsinternal/ads/AudioAdView;",
    "Lcom/spotify/nowplaying/ads/AdPlayerView;",
    // Newer Spotify versions.
    "Lcom/spotify/adsdisplay/uiusecases/adtag/AdTagView;",
    "Lcom/spotify/adsdisplay/uiusecases/videocontrolsoverlay/VideoControlsOverlayView;",
    "Lcom/spotify/nowplayingmodes/adsmode/ui/overlay/AdsOverlayControlsLayout;",
)

/**
 * Ad layouts of newer Spotify versions, inflated by obfuscated classes.
 * They are found by their resource ids, which are resolved from the APK, as the ids change between versions.
 */
private val AD_LAYOUTS = listOf(
    // Now playing page shown while an audio ad plays.
    "ads_mode_page_layout",
    // Mini player shown while an ad plays.
    "nowplayingmini_ads",
    // Ad cards embedded into the now playing view.
    "default_embeddedad_image_card",
    "default_embeddedad_video_card",
    "floating_cta_ad_card_npb",
    "ad_npb_attachment_layout",
)

/**
 * Matches the method calling `LayoutInflater.inflate(int, ViewGroup, boolean)` with the [layout] resource.
 * Does not match if the APK has no such layout.
 */
private class AdLayoutInflateFingerprint(layout: String) : Fingerprint(
    filters = listOf(
        resourceLiteral(ResourceType.LAYOUT, layout, false),
        methodCall(
            definingClass = "Landroid/view/LayoutInflater;",
            name = "inflate",
            parameters = listOf("I", "Landroid/view/ViewGroup;", "Z"),
            returnType = "Landroid/view/View;",
            location = MatchAfterWithin(8),
        ),
    ),
)

@Suppress("unused")
val hideAdViewsPatch = bytecodePatch(
    name = "Hide ad views",
    description = "Hides ad banners, ad labels, ad overlay controls, the ad player " +
        "and the audio and embedded ad layouts of the now playing view.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith(EXTENSION)

    finalize {
        // Runs in finalize, after every Spicetify patch has executed: those verify Spotify's
        // classes against pinned hashes, which must see the classes before this patch edits them.
        var patchedTargets = 0

        AD_VIEW_CLASSES.forEach { type ->
            val adView = mutableClassDefByOrNull(type) ?: return@forEach

            adView.methods.filter { it.name == "<init>" && it.implementation != null }.forEach { constructor ->
                val thisRegister = constructor.p0Register
                // `this` is initialized after the super (or delegated) constructor call.
                val superCallIndex = constructor.indexOfFirstInstruction {
                    val firstRegister = when (this) {
                        is FiveRegisterInstruction -> registerC
                        is RegisterRangeInstruction -> startRegister
                        else -> -1
                    }
                    (opcode == Opcode.INVOKE_DIRECT || opcode == Opcode.INVOKE_DIRECT_RANGE) &&
                        getReference<MethodReference>()?.name == "<init>" &&
                        firstRegister == thisRegister
                }
                if (superCallIndex < 0) return@forEach

                constructor.addInstruction(
                    superCallIndex + 1,
                    "invoke-static/range { v$thisRegister .. v$thisRegister }, " +
                        "$EXTENSION_CLASS->onAdViewCreated(Landroid/view/View;)V",
                )
            }

            adView.methods.firstOrNull { method ->
                method.name == "onMeasure" && method.returnType == "V" &&
                    method.parameterTypes.map { it.toString() } == listOf("I", "I")
            }?.apply {
                addInstructions(
                    0,
                    """
                        invoke-static/range { v$p0Register .. v$p0Register }, $EXTENSION_CLASS->hideView(Landroid/view/View;)V
                        return-void
                    """,
                )
            }

            patchedTargets++
        }

        AD_LAYOUTS.forEach { layout ->
            val fingerprint = AdLayoutInflateFingerprint(layout)
            val method = fingerprint.methodOrNull ?: return@forEach
            val inflateIndex = fingerprint.instructionMatches.last().index

            // Same arguments, so the registers of the original call can be reused as is.
            val replacement = when (val inflate = method.getInstruction(inflateIndex)) {
                is FiveRegisterInstruction -> with(inflate) {
                    "invoke-static { v$registerC, v$registerD, v$registerE, v$registerF }"
                }

                is RegisterRangeInstruction -> with(inflate) {
                    "invoke-static/range { v$startRegister .. v${startRegister + registerCount - 1} }"
                }

                else -> return@forEach
            }

            method.replaceInstruction(
                inflateIndex,
                "$replacement, $EXTENSION_CLASS->inflateAdLayout$INFLATE_DESCRIPTOR",
            )

            patchedTargets++
        }

        if (patchedTargets == 0) throw PatchException("Could not find any ad view")
    }
}
