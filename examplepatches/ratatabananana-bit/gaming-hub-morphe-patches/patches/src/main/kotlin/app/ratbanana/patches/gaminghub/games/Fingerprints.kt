package app.ratbanana.patches.gaminghub.games

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val GOS_SERVICE_CLASS = "Lcom/samsung/android/game/gos/IGosService;"

/**
 * `IGosService.request(command: String, jsonStr: String): String`
 *
 * Every request to Samsung's Game Optimizing Service (GOS) goes through this helper, which
 * throws when GOS returns nothing. GOS only answers Samsung-signed callers, so for a
 * re-signed APK every request fails.
 */
internal object GosRequestFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = listOf(GOS_SERVICE_CLASS, "Ljava/lang/String;", "Ljava/lang/String;"),
    filters = listOf(
        string("jsonStr"),
        // service.requestWithJson(command, jsonStr)
        methodCall(definingClass = GOS_SERVICE_CLASS),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
    ),
)
