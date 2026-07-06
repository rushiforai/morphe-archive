package app.morphe.patches.piko.misc.shim.methods.broadcast.exoplayer.handler

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val EXOPLAYER2_CLASS_PREFIX = "Lcom/google/android/exoplayer2/"

internal object ExoPlayerHandlerFingerprint : Fingerprint(
    definingClass = EXOPLAYER2_CLASS_PREFIX,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "this"
        ),
        opcode(
            opcode = Opcode.IF_EQZ,
            location = MatchAfterImmediately()
        ),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = "Landroid/content/Context;",
            location = MatchAfterImmediately()
        ),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = EXOPLAYER2_CLASS_PREFIX,
            location = MatchAfterImmediately()
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V",
            location = MatchAfterImmediately()
        )
    )
)
