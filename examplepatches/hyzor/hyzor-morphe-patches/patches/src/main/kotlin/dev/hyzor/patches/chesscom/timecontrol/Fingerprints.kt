package dev.hyzor.patches.chesscom.timecontrol

import app.morphe.patcher.Fingerprint

/** GameTime.toCompactLabel(context): "3+2", "10 min", "0:30". */
internal object CompactLabelFingerprint : Fingerprint(
    definingClass = "Lcom/chess/entities/GameTimeKt;",
    name = "toCompactLabel",
    returnType = "Ljava/lang/String;",
)
