package app.aphelion.patches.hint

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object EmitHintRewardFingerprint : Fingerprint(
    definingClass = "Lah;",
    name = "emit",
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;", "Lhp0;"),
    filters = listOf(
        methodCall(definingClass = "Lhs1;", name = "<init>"),
        string("not_ready"),
    )
)

object ShareGateTouchFingerprint : Fingerprint(
    definingClass = "Lgt1;",
    name = "onTouchEvent",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/view/MotionEvent;"),
    filters = listOf(
        fieldAccess(smali = "Lct1;->r:Z"),
        methodCall(definingClass = "Ld63;", name = "b"),
        fieldAccess(smali = "Lct1;->r:Z"),
    )
)

object ShareGateDrawFingerprint : Fingerprint(
    definingClass = "Lxg3;",
    name = "a",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/graphics/Canvas;", "Lft1;", "Lct1;", "Lcf5;", "J"),
    filters = listOf(
        fieldAccess(smali = "Lct1;->r:Z"),
    )
)
