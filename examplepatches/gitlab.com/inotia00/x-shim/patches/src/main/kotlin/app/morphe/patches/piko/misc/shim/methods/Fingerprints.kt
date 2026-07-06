package app.morphe.patches.piko.misc.shim.methods

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode

internal object BytecodeLoaderFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("Error while loading bytecode.")
    )
)

internal object DexLoaderFingerprint : Fingerprint(
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "this",
            name = "startupProgramName",
            type = "Ljava/lang/String;"
        )
    )
)

internal fun bytecodeLoaderSyntheticMethodFingerprint(method: MutableMethod) = object : Fingerprint(
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            smali = method.toString()
        ),
        opcode(
            opcode = Opcode.MOVE_RESULT_OBJECT,
            location = MatchAfterImmediately()
        )
    )
) {}

internal fun originalMethodFingerprint(definingClass: String, name: String) = object : Fingerprint(
    definingClass = definingClass,
    name = name,
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            type = "Ljava/lang/reflect/Method;",
        )
    )
) {}

internal fun onReceiveFingerprint(definingClass: String) = object : Fingerprint(
    definingClass = definingClass,
    name = "onReceive",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;")
) {}