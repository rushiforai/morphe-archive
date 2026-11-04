package app.charlesattend.patches.beeper.transcribe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

/**
 * Matches the `TranscribeButton` composable: the chip below a voice message that shows
 * "Try Transcribe", or "Transcribe" (with the free transcriptions counter for free users).
 *
 * The method is obfuscated and merged into another class, so it is found by the string
 * resources it loads. Only this method uses them.
 */
object TranscribeButtonFingerprint : Fingerprint(
    // Top-level composable.
    isStatic = true,
    returnType = "V",
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "action_try_transcribe")
    ),
    custom = { method, _ ->
        val transcribeId = resourceId(ResourceType.STRING, "action_transcribe")

        // The last parameter of a composable is the Compose `$changed` flags.
        method.parameterTypes.lastOrNull()?.toString() == "I" &&
            method.instructionsOrNull?.any {
                (it as? WideLiteralInstruction)?.wideLiteral == transcribeId
            } == true
    }
)
