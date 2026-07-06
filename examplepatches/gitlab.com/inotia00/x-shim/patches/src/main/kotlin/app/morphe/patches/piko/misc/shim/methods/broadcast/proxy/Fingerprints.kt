package app.morphe.patches.piko.misc.shim.methods.broadcast.proxy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val ANDROIDX_WORK_CLASS_PREFIX = "Landroidx/work"
internal const val SYSTEM_ALARM_CLASS_PREFIX =
    "$ANDROIDX_WORK_CLASS_PREFIX/impl/background/systemalarm"
internal const val CONSTRINT_PROXY_CLASS = "$SYSTEM_ALARM_CLASS_PREFIX/ConstraintProxy;"

internal object WorkSpecFingerprint : Fingerprint(
    definingClass = SYSTEM_ALARM_CLASS_PREFIX,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(SYSTEM_ALARM_CLASS_PREFIX),
    returnType = "V",
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            definingClass = ANDROIDX_WORK_CLASS_PREFIX,
            parameters = listOf(),
            returnType = ANDROIDX_WORK_CLASS_PREFIX
        ),
        string("Stopping work for WorkSpec "),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = ANDROIDX_WORK_CLASS_PREFIX,
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
            returnType = "V"
        ),
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = SYSTEM_ALARM_CLASS_PREFIX,
            type = "Ljava/lang/String;"
        )
    )
)