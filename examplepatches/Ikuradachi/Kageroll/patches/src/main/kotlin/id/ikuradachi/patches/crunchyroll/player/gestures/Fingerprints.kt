package id.ikuradachi.patches.crunchyroll.player.gestures

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object PlayerGesturesConfigDescriptorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("com.ellation.crunchyroll.features.configs.PlayerGesturesConfigImpl"),
        string("pinch_to_zoom"),
        string("double_tap_to_seek"),
    ),
)

object PlayerGesturesBindFingerprint : Fingerprint(
    definingClass = "Lcom/crunchyroll/player/presentation/playerview/PlayerGesturesLayout;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "Lcom/crunchyroll/player/presentation/playerview/InternalPlayerViewLayout;"),
    filters = listOf(
        newInstance("Landroid/view/ScaleGestureDetector;"),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setOnTouchListener",
            parameters = listOf("Landroid/view/View\$OnTouchListener;"),
        ),
    ),
)

object PlayerGesturesOnTouchFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroid/view/View;", "Landroid/view/MotionEvent;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "L",
            type = "Lcom/crunchyroll/player/presentation/playerview/PlayerGesturesLayout;",
        ),
        methodCall(
            definingClass = "Landroid/view/GestureDetector;",
            name = "onTouchEvent",
            parameters = listOf("Landroid/view/MotionEvent;"),
        ),
    ),
)

object SwipeGestureHelperMaskFingerprint : Fingerprint(
    definingClass = "Lid/ikuradachi/kageroll/extension/crunchyroll/SwipeGestureHelper;",
    name = "getEnabledSwipeMask",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf(),
)
