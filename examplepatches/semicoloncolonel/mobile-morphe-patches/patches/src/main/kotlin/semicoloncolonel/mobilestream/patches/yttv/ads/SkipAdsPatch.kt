package semicoloncolonel.mobilestream.patches.yttv.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.yttv.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Skip ads.
//
// YouTube TV inserts on-demand and DVR ads on the server (Google DAI), and
// the native player core ("platypus") owns the ad breaks. The core has its
// own off switch, CuePointDataProviderWrapper.nativeSetDaiDisabledByNoConfig.
// PlaybackControllerWrapper calls it only when server experiment 45731777 is
// on, by scheduling a small lambda on the cue-point provider's executor.
//
// Every place PlaybackControllerWrapper stores its cue-point provider (field
// p) now also hands the provider to YttvDaiDisabler, which schedules that same
// lambda. This uses the core's own "no DAI" state instead of hiding breaks in
// Java, which the server can detect and answer with an ad-blocker error.
//
// The app also carries YouTube's client-side ad framework, which loads
// overlay, pause and squeezeback ads from each player response. As in
// Morphe's YouTube "Video ads" patch, the method that loads them and the one
// that builds their player layouts return at once.
//
// Thanks to ajstrick81 for the YouTube TV analysis that found the DAI switch.
// Commercials in live broadcasts are part of the broadcast and still play.
// ─────────────────────────────────────────────────────────────────────────────

private const val CONTROLLER =
    "Lcom/google/android/libraries/youtube/media/player/exo2/platypus/PlaybackControllerWrapper;"
private const val PROVIDER = "Lcom/google/android/libraries/youtube/media/interfaces/CuePointDataProviderWrapper;"
private const val DISABLER = "Lsemicoloncolonel/mobilestream/extension/yttv/ads/YttvDaiDisabler;"
private const val STREAMING_DATA = "Lcom/google/android/libraries/youtube/innertube/model/media/VideoStreamingData;"

// Fingerprints from Morphe's YouTube "Video ads" patch (GPL-3.0):
// https://github.com/MorpheApp/morphe-patches/blob/main/patches/src/main/kotlin/app/morphe/patches/youtube/ad/Fingerprints.kt
internal object LoadVideoAdsFingerprint : Fingerprint(
    strings = listOf(
        "TriggerBundle doesn't have the required metadata specified by the trigger ",
        "Ping migration no associated ping bindings for activated trigger: ",
    ),
)

internal object PlayerBytesAdLayoutFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    strings = listOf("Bootstrapped layout construction resulted in non PlayerBytesLayout. PlayerAds count: "),
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Turns off the ads in on-demand videos and DVR recordings, and overlay and pause ads.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        LoadVideoAdsFingerprint.method.addInstructions(0, "return-void")
        PlayerBytesAdLayoutFingerprint.method.addInstructions(0, "return-void")

        var hooked = 0
        mutableClassDefBy(CONTROLLER).methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            // Insert from the end so earlier indices stay valid.
            instructions.indices.reversed().forEach { index ->
                val instruction = instructions[index]
                if (instruction.opcode != Opcode.IPUT_OBJECT) return@forEach
                val field = (instruction as ReferenceInstruction).reference as FieldReference
                if (field.definingClass != CONTROLLER || field.type != PROVIDER) return@forEach
                val register = (instruction as TwoRegisterInstruction).registerA
                method.addInstructions(
                    index + 1,
                    """
                        invoke-static/range { p0 .. p0 }, $DISABLER->setController(Ljava/lang/Object;)V
                        invoke-static/range { v$register .. v$register }, $DISABLER->onCuePointProvider(Ljava/lang/Object;)V
                    """.trimIndent(),
                )
                hooked++
            }
        }
        if (hooked == 0) throw PatchException("cue-point provider store not found")

        // Let YttvDaiDisabler read the stream type, so "Mask live ad breaks" can
        // keep DAI on for live streams. The names are renamed in each build:
        // the controller's playback field is the one whose type holds a
        // VideoStreamingData, and the label method returns "windowed-live".
        val labelMethod = classDefBy(STREAMING_DATA).methods.firstOrNull { method ->
            method.returnType == "Ljava/lang/String;" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "windowed-live"
                } == true
        }?.name
        var playbackField: String? = null
        var streamField: String? = null
        mutableClassDefBy(CONTROLLER).fields.forEach { field ->
            if (playbackField != null || !field.type.startsWith("L")) return@forEach
            val holder = classDefByOrNull(field.type) ?: return@forEach
            holder.fields.firstOrNull { it.type == STREAMING_DATA }?.let {
                playbackField = field.name
                streamField = it.name
            }
        }
        if (labelMethod != null && playbackField != null && streamField != null) {
            val disabler = mutableClassDefBy(DISABLER)
            mapOf(
                "playbackField" to playbackField!!,
                "streamField" to streamField!!,
                "streamLabelMethod" to labelMethod,
            ).forEach { (getter, value) ->
                disabler.methods.first { it.name == getter }
                    .addInstructions(0, "const-string v0, \"$value\"\nreturn-object v0")
            }
        }
    }
}
