package app.morphe.patches.piko.misc.shim.methods.broadcast.stuffing

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val SNAP_STUFFING_CLASS_PREFIX = "Lcom/snap/stuffing/lib/"

internal object StuffingFingerprint : Fingerprint(
    definingClass = SNAP_STUFFING_CLASS_PREFIX,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            name = "COROUTINE_SUSPENDED"
        ),
        newInstance(SNAP_STUFFING_CLASS_PREFIX),
        string("android.intent.action.PACKAGE_CHANGED")
    )
)
