package app.morphe.patches.assemble

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

private const val LSPOSED_MAIN_CLASS = "Lcom/java/inspector/Main;"

internal object GetClassesFingerprint : Fingerprint(
    definingClass = LSPOSED_MAIN_CLASS,
    name = "getClasses",
    returnType = "Ljava/util/List;",
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            parameters = listOf("[Ljava/lang/Object;"),
            returnType = "Ljava/util/List;",
        )
    )
)

internal object GetPackageNameFingerprint : Fingerprint(
    definingClass = LSPOSED_MAIN_CLASS,
    name = "getPackageName",
    returnType = "Ljava/lang/String;"
)
