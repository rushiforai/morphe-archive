package app.morphe.patches.piko.misc.shim.methods.broadcast.braze.push

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal const val BRAZE_PUSH_CLASS_PREFIX = "Lcom/braze/push"
internal const val BRAZE_PUSH_RECEIVER_CLASS = "$BRAZE_PUSH_CLASS_PREFIX/BrazePushReceiver;"
internal const val BRAZE_PUSH_RECEIVER_COMPANION_CLASS =
    $$"$$BRAZE_PUSH_CLASS_PREFIX/BrazePushReceiver$Companion;"

internal object NotificationTrampolineActivityFingerprint : Fingerprint(
    definingClass = "$BRAZE_PUSH_CLASS_PREFIX/NotificationTrampolineActivity;",
    name = "onResume",
    returnType = "V",
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            name = "isAmazonDevice",
            returnType = "Z"
        ),
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            smali = "$BRAZE_PUSH_RECEIVER_CLASS->Companion:$BRAZE_PUSH_RECEIVER_COMPANION_CLASS",
            location = MatchAfterWithin(5)
        ),
        methodCall(
            opcode = Opcode.INVOKE_STATIC_RANGE,
            smali = "$BRAZE_PUSH_RECEIVER_COMPANION_CLASS->handleReceivedIntent\$default(${BRAZE_PUSH_RECEIVER_COMPANION_CLASS}Landroid/content/Context;Landroid/content/Intent;ZILjava/lang/Object;)V",
            location = MatchAfterWithin(10)
        )
    )
)
