package app.morphe.patches.piko.misc.shim.methods.broadcast.bug

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val BUG_REPORTER_CLASS_PREFIX = "Lcom/twitter/bugreporter/"

internal object BugReporterFingerprint : Fingerprint(
    definingClass = BUG_REPORTER_CLASS_PREFIX,
    name = "run",
    returnType = "V",
    filters = listOf(
        newInstance(BUG_REPORTER_CLASS_PREFIX),
        methodCall(
            opcode = Opcode.INVOKE_DIRECT,
            smali = "Landroid/content/BroadcastReceiver;-><init>()V"
        )
    )
)

internal object BugReportMenuFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroid/view/MenuItem;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = BUG_REPORTER_CLASS_PREFIX,
            name = "Companion",
            type = BUG_REPORTER_CLASS_PREFIX
        ),
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            definingClass = BUG_REPORTER_CLASS_PREFIX,
            parameters = listOf(),
            returnType = BUG_REPORTER_CLASS_PREFIX
        ),
        string("Bad search for [")
    )
)
