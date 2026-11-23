package app.bin0culars.patches.reddit.misc.autorefresh

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

object AutoRefreshFeedFingerprint : Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(),
    filters = listOf(
        newInstance("Lcom/reddit/feeds/ui/events/OnAutoRefreshFeed;"),
        opcode(Opcode.INVOKE_DIRECT, MatchAfterImmediately()),
        opcode(Opcode.INVOKE_INTERFACE, MatchAfterImmediately()),
    ),
)
