package app.hh.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef

context(_: BytecodePatchContext)
internal fun Fingerprint.returnVoidEarly(): Boolean {
    val method = methodOrNull ?: return false
    return method.returnVoidEarly()
}

internal fun MutableMethod.returnVoidEarly(): Boolean {
    if (!returnType.startsWith("V") || implementation == null) return false
    addInstruction(0, "return-void")
    return true
}

/**
 * Replaces a `Task`-returning Firebase/GMS method with `Tasks.forResult(...)`
 * so Flutter callbacks complete immediately without hitting the network.
 */
internal fun MutableMethod.returnCompletedTask(booleanFalse: Boolean = false): Boolean {
    if (!returnType.contains("Task") || implementation == null) return false
    val body = if (booleanFalse) {
        """
            const/4 v0, 0x0
            invoke-static { v0 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
            move-result-object v0
            invoke-static { v0 }, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
            move-result-object v0
            return-object v0
        """
    } else {
        """
            const/4 v0, 0x0
            invoke-static { v0 }, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
            move-result-object v0
            return-object v0
        """
    }
    addInstructions(0, body.trimIndent())
    return true
}

/**
 * Completes a Flutter method-channel result (last parameter) with null
 * and returns, so Dart does not hang waiting on a native callback.
 */
context(bytecodeContext: BytecodePatchContext)
internal fun MutableMethod.succeedLastCallbackAndReturn(): Boolean {
    val params = parameterTypes.map { it.toString() }
    if (params.isEmpty() || implementation == null) return false

    val callbackType = params.last()
    val callbackClass = bytecodeContext.classDefByOrNull(callbackType) ?: return false
    val success = callbackClass.findSuccessMethod() ?: return false

    val invoke = if (AccessFlags.INTERFACE.isSet(callbackClass.accessFlags)) {
        "invoke-interface"
    } else {
        "invoke-virtual"
    }

    var register = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    for (i in 0 until params.size - 1) {
        register += if (params[i] == "J" || params[i] == "D") 2 else 1
    }

    addInstructions(
        0,
        """
            move-object/from16 v0, p$register
            const/4 v1, 0x0
            $invoke { v0, v1 }, $callbackType->${success.name}(Ljava/lang/Object;)V
            return-void
        """.trimIndent(),
    )
    return true
}

private fun ClassDef.findSuccessMethod() = methods
    .filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.returnType == "V" &&
            method.parameterTypes.size == 1 &&
            method.parameterTypes[0].toString() == "Ljava/lang/Object;" &&
            method.name != "equals"
    }
    .minByOrNull { method ->
        when (method.name) {
            "success" -> 0
            "c" -> 1
            else -> 2
        }
    }

context(_: BytecodePatchContext)
internal fun Fingerprint.returnCompletedTask(booleanFalse: Boolean = false): Boolean {
    val method = methodOrNull ?: return false
    return method.returnCompletedTask(booleanFalse)
}

context(_: BytecodePatchContext)
internal fun Fingerprint.succeedLastCallbackAndReturn(): Boolean {
    val method = methodOrNull ?: return false
    return method.succeedLastCallbackAndReturn()
}
