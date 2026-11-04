package app.morphe.patches.mapsautomotive

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.util.logging.Logger

// Ported from the phone patch (GoogleMapsMicroGPatch.kt, patchBydNavigationAudio). Maps plays spoken
// directions and alert sounds through its MediaAlert player, which asks for the music stream, so on
// DiLink the voice followed the media volume. The player's two setAudioStreamType calls (file and
// resource sounds) and its one setAudioAttributes call go to BydNavigationAudioPatch, which uses BYD's
// navigation stream 14 when it has a volume range and Maps' own call otherwise. In 120003.E these
// are the only callers of both methods. A separate patch on top of the core one.
// Required: a missing anchor, an ambiguity or a second call in a hooked method fails the patch.

private const val BYD_AUDIO_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/BydNavigationAudioPatch;"
private const val MEDIA_PLAYER = "Landroid/media/MediaPlayer;"
private const val AUDIO_ATTRIBUTES = "Landroid/media/AudioAttributes;"
private const val AUDIO_ATTRIBUTES_BUILDER = "Landroid/media/AudioAttributes\$Builder;"
private const val SET_AUDIO_STREAM_TYPE = "$MEDIA_PLAYER->setAudioStreamType(I)V"
private const val SET_AUDIO_ATTRIBUTES = "$MEDIA_PLAYER->setAudioAttributes($AUDIO_ATTRIBUTES)V"
private const val SET_USAGE = "$AUDIO_ATTRIBUTES_BUILDER->setUsage(I)$AUDIO_ATTRIBUTES_BUILDER"
private const val SET_CONTENT_TYPE = "$AUDIO_ATTRIBUTES_BUILDER->setContentType(I)$AUDIO_ATTRIBUTES_BUILDER"
private val navigationVolumeLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.BydNavigationVolumePatch")

@Suppress("unused")
val bydNavigationVolumePatch = bytecodePatch(
    name = "BYD navigation volume",
    description = "Plays Maps' spoken directions on BYD's navigation volume instead of the media volume.",
    default = true,
) {
    compatibleWith(compatibility)
    dependsOn(automotiveMicroGPatch)

    execute {
        routeMediaAlertAudio()
        IncludedFeatures.features += "byd_navigation_volume"
    }
}

private fun Method.calls(key: String) = implementation?.instructions?.any { memberKey(it) == key } == true

private val mediaAlertFileFingerprint = Fingerprint(
    strings = listOf("MediaAlert file doesn't exist", "Exception creating MediaAlert from file"),
    custom = { method, _ -> method.calls(SET_AUDIO_STREAM_TYPE) },
)

private val mediaAlertResourceFingerprint = Fingerprint(
    strings = listOf("Error loading sound file from resource"),
    custom = { method, _ -> method.calls(SET_AUDIO_STREAM_TYPE) },
)

private val mediaAlertAudioAttributesFingerprint = Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf(MEDIA_PLAYER, "L", "Ljava/util/concurrent/Executor;", "L"),
    custom = { method, _ ->
        method.calls(SET_USAGE) && method.calls(SET_CONTENT_TYPE) && method.calls(SET_AUDIO_ATTRIBUTES)
    },
)

private fun BytecodePatchContext.routeMediaAlertAudio() {
    requireExtensionMethod(BYD_AUDIO_CLASS, "setAudioStreamType", listOf(MEDIA_PLAYER, "I"), "V")
    requireExtensionMethod(BYD_AUDIO_CLASS, "setAudioAttributes", listOf(MEDIA_PLAYER, AUDIO_ATTRIBUTES), "V")
    listOf(
        Triple("file MediaAlert audio stream", mediaAlertFileFingerprint, SET_AUDIO_STREAM_TYPE),
        Triple("resource MediaAlert audio stream", mediaAlertResourceFingerprint, SET_AUDIO_STREAM_TYPE),
        Triple("MediaAlert AudioAttributes", mediaAlertAudioAttributesFingerprint, SET_AUDIO_ATTRIBUTES),
    ).forEach { (label, fingerprint, call) ->
        val method = uniqueMapsHook(fingerprint, "$label hook")!!
        val matches = method.implementation!!.instructions.withIndex().filter { memberKey(it.value) == call }
        val (index, instruction) = matches.singleOrNull()
            ?: throw PatchException("Expected exactly one $call in the $label hook, found ${matches.size}")
        // Same name, with the player as the first parameter: setAudioStreamType(MediaPlayer, int).
        val wrapper = "$BYD_AUDIO_CLASS->${call.substringAfter("->").replaceFirst("(", "($MEDIA_PLAYER")}"
        method.replaceInstruction(index, staticInvokeOf(instruction, wrapper))
        navigationVolumeLogger.info("BYD navigation volume: $label in $method")
    }
}

// The same two registers (player, argument) as Maps' invoke-virtual, now passed to the static wrapper.
private fun staticInvokeOf(instruction: Instruction, wrapper: String): String = when (instruction) {
    is FiveRegisterInstruction -> {
        if (instruction.registerCount != 2) throw PatchException("Unexpected register count in $instruction")
        "invoke-static { v${instruction.registerC}, v${instruction.registerD} }, $wrapper"
    }
    is RegisterRangeInstruction -> {
        if (instruction.registerCount != 2) throw PatchException("Unexpected range count in $instruction")
        "invoke-static/range { v${instruction.startRegister} .. v${instruction.startRegister + 1} }, $wrapper"
    }
    else -> throw PatchException("Unsupported instruction format for $wrapper")
}
