package app.paresh.patches.jiohotstar.mirroring

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// Zq/g5.R1 — checks DisplayManager.getDisplays().length > 1 and blocks playback
object MultipleDisplayCheckFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    filters = listOf(
        methodCall(definingClass = "Landroid/hardware/display/DisplayManager;", name = "getDisplays"),
        opcode(Opcode.ARRAY_LENGTH),
        literal(1)
    )
)
