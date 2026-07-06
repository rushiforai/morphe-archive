package app.morphe.patches.piko.misc.shim.methods.broadcast.telephony

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal const val TELEPHONY_CLASS_PREFIX = "Lcom/twitter/util/telephony/"

internal object ConnectivityChangedListenerFingerprint : Fingerprint(
    definingClass = TELEPHONY_CLASS_PREFIX,
    name = "<init>",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            definingClass = TELEPHONY_CLASS_PREFIX,
            type = TELEPHONY_CLASS_PREFIX
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = TELEPHONY_CLASS_PREFIX,
            parameters = listOf(),
            returnType = "Z"
        ),
        fieldAccess(
            opcode = Opcode.IPUT_BOOLEAN,
            definingClass = TELEPHONY_CLASS_PREFIX
        ),
        string("android.net.conn.CONNECTIVITY_CHANGE")
    )
)
