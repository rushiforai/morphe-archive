package app.noam.patches.chesscom.timecontrol

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/**
 * Minutes slider setter: copy(minPerGameFloat = max(position, 1).toFloat()). It is a case of a
 * lambda class R8 merged several lambdas into, so it is matched by its code alone.
 */
internal object MinutesSetterFingerprint : Fingerprint(
    filters = listOf(
        methodCall(definingClass = "Ljava/lang/Math;", name = "max"),
        opcode(Opcode.INT_TO_FLOAT),
        methodCall(definingClass = "Lcom/chess/entities/GameTime;", name = "copy\$default"),
    ),
)

/** GameTime.toCompactLabel(context): "3+2", "10 min", "0:30". */
internal object CompactLabelFingerprint : Fingerprint(
    definingClass = "Lcom/chess/entities/GameTimeKt;",
    name = "toCompactLabel",
    returnType = "Ljava/lang/String;",
)
