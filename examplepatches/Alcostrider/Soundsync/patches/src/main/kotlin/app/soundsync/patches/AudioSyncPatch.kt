package app.soundsync.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.logging.Logger

private const val EXTENSION_CLASS = "Lapp/soundsync/extension/AudioSync;"
private const val AUDIO_TRACK = "Landroid/media/AudioTrack;"
private const val AUDIO_TIMESTAMP = "Landroid/media/AudioTimestamp;"
private const val SETTINGS_AUTHORITY = "app.soundsync.settings"
private const val CAR_CONNECTION_AUTHORITY = "androidx.car.app.connection"

/**
 * Code that must keep the real audio position: our own extension, and voice/video call engines,
 * which use it for echo cancellation rather than for showing video.
 */
private val SKIPPED_PACKAGES = listOf(
    "Lapp/soundsync/",
    "Lorg/webrtc/",
    "Lio/agora/",
    "Lcom/twilio/",
    "Llivekit/",
)

/** The two AudioTrack calls players use to find out how much sound has been played. */
private enum class Target(val methodName: String, val parameters: List<String>, val returnType: String) {
    TIMESTAMP("getTimestamp", listOf(AUDIO_TIMESTAMP), "Z"),
    HEAD_POSITION("getPlaybackHeadPosition", emptyList(), "I");

    /** The extension method that replaces the call: same, but static, with the track first. */
    val replacement = "$EXTENSION_CLASS->$methodName($AUDIO_TRACK${parameters.joinToString("")})$returnType"
}

private fun targetOf(instruction: Instruction): Target? {
    if (instruction.opcode != Opcode.INVOKE_VIRTUAL && instruction.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return null
    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    if (reference.definingClass != AUDIO_TRACK) return null
    return Target.entries.firstOrNull { target ->
        reference.name == target.methodName &&
            reference.returnType == target.returnType &&
            reference.parameterTypes.map { it.toString() } == target.parameters
    }
}

/** The same registers, as an invoke-static of the extension method. */
private fun replacementSmali(instruction: Instruction, target: Target): String = when (instruction) {
    is Instruction35c -> {
        val registers = listOf(
            instruction.registerC, instruction.registerD, instruction.registerE,
            instruction.registerF, instruction.registerG,
        ).take(instruction.registerCount)
        "invoke-static { ${registers.joinToString { "v$it" }} }, ${target.replacement}"
    }

    is Instruction3rc -> {
        val first = instruction.startRegister
        val last = first + instruction.registerCount - 1
        "invoke-static/range { v$first .. v$last }, ${target.replacement}"
    }

    else -> throw PatchException("Unexpected instruction format: ${instruction.opcode}")
}

private fun Method.hasTarget() = implementation?.instructions?.any { targetOf(it) != null } == true

private fun Method.sameSignature(other: Method) =
    name == other.name &&
        returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }

@Suppress("unused")
val androidAutoAudioSyncPatch = patch(
    name = "Android Auto audio sync",
    description = "Holds video back so it lines up with the sound from the car over wireless " +
        "Android Auto, which plays sound later than the phone expects. Works with apps whose " +
        "video player uses Android's standard audio output (YouTube, Instagram, Facebook, " +
        "Reddit and most others). Change the delay later in the SoundSync app.",
    default = false,
) {
    // No compatibleWith(): a universal patch, offered for every app.

    extendWith("extensions/extension.mpe")

    val delayMs by intOption(
        key = "delayMs",
        default = 750,
        title = "Delay (ms)",
        description = "How far behind the car plays the sound. Used until you change it in the " +
            "SoundSync app, or always if that app isn't installed.",
        required = true,
    ) { it != null && it in 0..5000 }

    val mode by stringOption(
        key = "mode",
        default = "android-auto",
        values = mapOf(
            "Only while connected to Android Auto" to "android-auto",
            "Always" to "always",
        ),
        title = "When to apply",
        description = "Used until you change it in the SoundSync app.",
        required = true,
    )

    execute {
        val logger = Logger.getLogger("SoundSync")

        // Let the patched app read the SoundSync app's settings and ask Android Auto whether it's
        // connected (Android 11+ hides other apps' providers unless they're listed here).
        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.root.appendChild("queries") {
                for (authority in listOf(SETTINGS_AUTHORITY, CAR_CONNECTION_AUTHORITY)) {
                    appendChild("provider") {
                        setAttribute("android:authorities", authority)
                    }
                }
            }
        }

        // The values chosen when patching become the extension's defaults.
        val modeValue = if (mode == "always") 2 else 1
        mutableClassDefBy(EXTENSION_CLASS).methods.apply {
            first { it.name == "defaultDelayMs" }.addInstructions(
                0,
                """
                    const v0, ${delayMs!!}
                    return v0
                """,
            )
            first { it.name == "defaultMode" }.addInstructions(
                0,
                """
                    const v0, $modeValue
                    return v0
                """,
            )
        }

        // Redirect every call to the two AudioTrack position functions through the extension.
        var replaced = 0
        val classes = mutableSetOf<String>()
        classDefForEach { classDef ->
            if (SKIPPED_PACKAGES.any { classDef.type.startsWith(it) }) return@classDefForEach
            val methods = classDef.methods.filter { it.hasTarget() }
            if (methods.isEmpty()) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)
            methods.forEach { original ->
                val method = mutableClass.methods.first { it.sameSignature(original) }
                val instructions = method.implementation!!.instructions
                // Backwards, so indices stay valid (each replacement is one instruction anyway).
                for (index in instructions.indices.reversed()) {
                    val instruction = instructions[index]
                    val target = targetOf(instruction) ?: continue
                    method.replaceInstruction(index, replacementSmali(instruction, target))
                    replaced++
                }
            }
            classes += classDef.type
        }

        if (replaced == 0) {
            logger.warning(
                "No AudioTrack position calls found: this app's player doesn't use Android's " +
                    "standard audio output from regular code, so this patch has no effect on it.",
            )
        } else {
            logger.info("Redirected $replaced AudioTrack position calls in ${classes.size} classes")
        }
    }
}
