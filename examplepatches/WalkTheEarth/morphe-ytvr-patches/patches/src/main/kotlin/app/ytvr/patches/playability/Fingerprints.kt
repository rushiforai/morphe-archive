package app.ytvr.patches.playability

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/**
 * Matches the method that routes a player response based on its playability
 * status and shows the confirm dialog ("viewer discretion") for videos that
 * require age or content confirmation.
 *
 * The class and method names are obfuscated and expected to change between
 * app versions, so only the signature and distinguishing calls are matched.
 */
object PlayabilityRouterFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lvze;", "Llni;", "Ljava/lang/String;"),
    filters = listOf(
        // The check for the "OK" playability status.
        methodCall(
            definingClass = "Lqvc;",
            name = "aK",
            returnType = "Z",
            opcode = Opcode.INVOKE_STATIC,
        ),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    )
)
