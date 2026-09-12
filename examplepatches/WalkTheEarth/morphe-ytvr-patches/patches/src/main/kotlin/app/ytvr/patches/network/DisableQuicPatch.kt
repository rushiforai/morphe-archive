package app.ytvr.patches.network

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.ytvr.patches.shared.Constants.COMPATIBILITY_YOUTUBE_VR
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Matches the builder of the main Cronet engine used for all YouTube requests.
 *
 * The class and method names are obfuscated and expected to change between
 * app versions, so only the signature and distinguishing hints are matched.
 */
private val cronetEngineBuilderFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
    strings = listOf("youtubei.googleapis.com"),
    filters = listOf(
        // The constant passed to enableQuic.
        literal(1),
        methodCall(
            smali = "Lorg/chromium/net/ExperimentalCronetEngine\$Builder;->enableQuic(Z)Lorg/chromium/net/ExperimentalCronetEngine\$Builder;",
            location = MatchAfterImmediately()
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately())
    )
)

@Suppress("unused")
val disableQuicProtocolPatch = bytecodePatch(
    name = "Disable QUIC protocol",
    description = "Adds an option to disable QUIC (Quick UDP Internet Connections) network protocol.",
    default = false
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_VR)

    val disableQuic by booleanOption(
        key = "disableQuic",
        default = false,
        title = "Disable QUIC protocol",
    )

    execute {
        if (disableQuic == true) {
            cronetEngineBuilderFingerprint.let { fingerprint ->
                val literalMatch = fingerprint.instructionMatches[0]
                val moveResultMatch = fingerprint.instructionMatches[2]
                val register = fingerprint.method
                    .getInstruction<OneRegisterInstruction>(literalMatch.index).registerA

                // The register holding the constant also feeds the enableHttp2 call that
                // follows, so replace the constant passed to enableQuic with false
                // and restore it to true once the call has returned.
                fingerprint.method.replaceInstruction(literalMatch.index, "const/4 v$register, 0x0")
                fingerprint.method.addInstructions(moveResultMatch.index + 1, "const/4 v$register, 0x1")
            }
        }
    }
}
