package app.morphe.patches.all.pairip.strip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object InvokeMethodCallFingerprint :
    Fingerprint(
        definingClass = "Lcom/pairip/StartupLauncher;",
        name = "launch",
        accessFlags =
            listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.DECLARED_SYNCHRONIZED),
        returnType = Type.void,
        parameters = emptyList(),
        filters =
            listOf(
                methodCall(
                    definingClass = "Lcom/pairip/VMRunner;",
                    name = "invoke",
                    parameters = listOf(Type.STRING, Type.OBJECT_ARRAY),
                    returnType = Type.OBJECT,
                    opcode = Opcode.INVOKE_STATIC,
                ),
            ),
    )
