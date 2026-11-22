package app.template.patches.duolingo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

object SessionEndFingerprint : Fingerprint(
    definingClass = "Lxs2;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        methodCall(
            definingClass = "Lx020;",
            name = "h",
            parameters = listOf(
                "Lx020;",
                "Ljava/util/List;",
                "Lcom/duolingo/core/sessionend/api/SessionEndId;",
                "Ljava/lang/String;",
                "Lcom/duolingo/core/session/DailySessionCount;",
                "Ljava/lang/Integer;",
                "Lhv10;",
                "Lbw70;",
                "I",
            ),
            returnType = "Ljava/lang/Object;",
            opcode = Opcode.INVOKE_STATIC_RANGE,
        ),
    ),
)
