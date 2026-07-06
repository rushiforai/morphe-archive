package app.morphe.patches.piko.misc.shim.methods.kotlin

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal object KotlinParameterCheckerFingerprint : Fingerprint(
    definingClass = "Lcom/ashampoo/kim/input/",
    name = "<init>",
    filters = listOf(
        string("prependedBytes"),
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            definingClass = "Lkotlin/jvm/internal/Intrinsics;",
            parameters = listOf("Ljava/lang/Object;", "Ljava/lang/String;"),
            returnType = "V",
            location = MatchAfterImmediately()
        )
    )
)
