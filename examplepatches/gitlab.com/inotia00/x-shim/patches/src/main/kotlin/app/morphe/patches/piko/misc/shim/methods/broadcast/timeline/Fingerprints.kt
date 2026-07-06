package app.morphe.patches.piko.misc.shim.methods.broadcast.timeline

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal const val TIMELINE_CLASS_PREFIX = "Lcom/twitter/timeline"
internal const val TIMELINE_BOTTOM_PAGING_POLICY_CLASS =
    "$TIMELINE_CLASS_PREFIX/TimelineBottomPagingPolicy;"

internal object TimelineFingerprint : Fingerprint(
    definingClass = TIMELINE_BOTTOM_PAGING_POLICY_CLASS,
    name = "<init>",
    returnType = "V",
    filters = listOf(
        newInstance(TIMELINE_CLASS_PREFIX),
        fieldAccess(
            opcode = Opcode.IPUT_BOOLEAN,
            definingClass = TIMELINE_CLASS_PREFIX
        ),
        string("android.intent.action.DEVICE_STORAGE_LOW"),
    )
)
