package app.bin0culars.patches.reddit.misc.backtoexit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

object BackToExitFingerprint : Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_INTERFACE, returnType = "Z", parameters = listOf()),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        methodCall(definingClass = "Landroid/os/SystemClock;", name = "uptimeMillis"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, returnType = "Z", parameters = listOf()),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        string("onBackPressedHandler"),
        newInstance("Lcom/reddit/feedslegacy/switcher/impl/exitapp/RedditExitAppOnDoubleBackClickDelegate\$handleAppExit\$1;"),
    ),
)
