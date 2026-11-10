package app.unison.patches.deezer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * Intercepteur de l'API « pipe » : il construit l'en-tête `Authorization: Bearer <jwt>`.
 * Les chaînes ne sont pas obfusquées, donc cette empreinte survit aux changements de noms de classes.
 */
object PipeAuthorizationFingerprint : Fingerprint(
    filters = listOf(
        string("Authorization"),
        string("Bearer "),
        methodCall(definingClass = "Ljava/lang/StringBuilder;", name = "toString"),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
    ),
    strings = listOf("jwtToken is null and should not be"),
)
