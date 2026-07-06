package app.morphe.patches.piko.misc.shim.methods.broadcast.tracker

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val ANDROIDX_CONSTRAINTS_CLASS_PREFIX = "Landroidx/work/impl/constraints"
internal const val ANDROIDX_TRACKERS_CLASS_PREFIX = "$ANDROIDX_CONSTRAINTS_CLASS_PREFIX/trackers/"

internal object TrackerUnregisterReceiverFingerprint : Fingerprint(
    definingClass = ANDROIDX_CONSTRAINTS_CLASS_PREFIX,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        string(": registering receiver"),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = ANDROIDX_TRACKERS_CLASS_PREFIX,
            type = ANDROIDX_TRACKERS_CLASS_PREFIX
        )
    )
)
