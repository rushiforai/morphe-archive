package semicoloncolonel.mobilestream.patches.yttv.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
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

// Up to 10.45 the controller kept its name, PlaybackControllerWrapper. From
// 10.46, R8 renames it (aonc in 10.46.0), so it is found by its shape: the
// class that extends PlaybackControllerCallbacks and keeps a cue-point
// provider in a field. The DAI switch's lambda was renamed the same way
// (CuePointDataProviderWrapper$$ExternalSyntheticLambda0, then anjh): the
// Runnable built from a provider whose run() calls nativeSetDaiDisabledByNoConfig.
private const val NAMED_CONTROLLER =
    "Lcom/google/android/libraries/youtube/media/player/exo2/platypus/PlaybackControllerWrapper;"
private const val CALLBACKS = "Lcom/google/android/libraries/youtube/media/interfaces/PlaybackControllerCallbacks;"
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

internal fun BytecodePatchContext.playbackController(): String {
    if (classDefByOrNull(NAMED_CONTROLLER) != null) return NAMED_CONTROLLER
    val matches = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.superclass == CALLBACKS && classDef.fields.any { it.type == PROVIDER }) matches += classDef.type
    }
    return matches.singleOrNull()
        ?: throw PatchException("playback controller not found (${matches.size} candidates)")
}

// The Runnable whose run() calls nativeSetDaiDisabledByNoConfig, as a Java class name.
internal fun BytecodePatchContext.daiLambdaClass(): String {
    val matches = mutableListOf<String>()
    classDefForEach { classDef ->
        if ("Ljava/lang/Runnable;" !in classDef.interfaces) return@classDefForEach
        if (classDef.methods.none { it.name == "<init>" && it.parameterTypes.map { p -> p.toString() } == listOf(PROVIDER) }) {
            return@classDefForEach
        }
        val run = classDef.methods.firstOrNull { it.name == "run" && it.parameterTypes.isEmpty() } ?: return@classDefForEach
        val callsSwitch = run.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "nativeSetDaiDisabledByNoConfig"
        } == true
        if (callsSwitch) matches += classDef.type
    }
    val type = matches.singleOrNull() ?: throw PatchException("DAI switch lambda not found (${matches.size} candidates)")
    return type.removePrefix("L").removeSuffix(";").replace('/', '.')
}

// Hands every cue-point provider PlaybackControllerWrapper stores (field p)
// to YttvDaiDisabler, with the controller. Shared by Skip ads, which turns DAI
// off there, and Mask live ad breaks, which clears its slots there.
internal val cuePointProviderHookPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        val controller = playbackController()
        mutableClassDefBy(DISABLER).methods.first { it.name == "daiLambdaClass" }
            .addInstructions(0, "const-string v0, \"${daiLambdaClass()}\"\nreturn-object v0")
        var hooked = 0
        mutableClassDefBy(controller).methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            // Insert from the end so earlier indices stay valid.
            instructions.indices.reversed().forEach { index ->
                val instruction = instructions[index]
                if (instruction.opcode != Opcode.IPUT_OBJECT) return@forEach
                val field = (instruction as ReferenceInstruction).reference as FieldReference
                if (field.definingClass != controller || field.type != PROVIDER) return@forEach
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
    }
}

// Lets YttvDaiDisabler read the stream type, so Mask live ad breaks can keep
// DAI on for live streams only. The names are renamed in each build: the
// controller's playback field is the one whose type holds a VideoStreamingData,
// and the label method returns "windowed-live".
internal val streamTypePatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        val labelMethod = classDefBy(STREAMING_DATA).methods.firstOrNull { method ->
            method.returnType == "Ljava/lang/String;" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "windowed-live"
                } == true
        }?.name ?: throw PatchException("stream type label method not found")
        var playbackField: String? = null
        var streamField: String? = null
        mutableClassDefBy(playbackController()).fields.forEach { field ->
            if (playbackField != null || !field.type.startsWith("L")) return@forEach
            val holder = classDefByOrNull(field.type) ?: return@forEach
            holder.fields.firstOrNull { it.type == STREAMING_DATA }?.let {
                playbackField = field.name
                streamField = it.name
            }
        }
        if (playbackField == null || streamField == null) throw PatchException("playback stream field not found")
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

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Turns off the ads in on-demand videos and DVR recordings, and overlay and pause ads.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(cuePointProviderHookPatch)

    extendWith("extensions/extension.mpe")

    execute {
        LoadVideoAdsFingerprint.method.addInstructions(0, "return-void")
        PlayerBytesAdLayoutFingerprint.method.addInstructions(0, "return-void")

        mutableClassDefBy(DISABLER).methods.first { it.name == "disableDai" }
            .addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
