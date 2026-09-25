package app.aphelion.patches.hint

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object EmitHintRewardFingerprint : Fingerprint(
    definingClass = "Ljz;",
    name = "emit",
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;", "Lcg0;"),
    filters = listOf(
        methodCall(definingClass = "Lvc2;", name = "<init>"),
        string("not_ready"),
    )
)

object ShareGateTouchFingerprint : Fingerprint(
    definingClass = "Lxe1;",
    name = "onTouchEvent",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/view/MotionEvent;"),
    filters = listOf(
        fieldAccess(smali = "Lse1;->m:Z"),
        methodCall(definingClass = "Li25;", name = "p"),
        fieldAccess(smali = "Lse1;->m:Z"),
    )
)

object ShareGateDrawFingerprint : Fingerprint(
    definingClass = "Liw2;",
    name = "a",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/graphics/Canvas;", "Lwe1;", "Lse1;", "Lth4;", "J"),
    filters = listOf(
        fieldAccess(smali = "Lse1;->m:Z"),
    )
)
