package app.noam.patches.chesscom.timecontrol

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/** The custom time section's composable (Compose trace string names it). */
internal object CustomTimeSelectorFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("CustomTimeSelector ("),
)

/** Minutes slider setter: copy(minPerGameFloat = max(position, 1).toFloat()). */
internal object MinutesSetterFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lkotlin/Unit;",
    parameters = listOf("L", "I"),
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
