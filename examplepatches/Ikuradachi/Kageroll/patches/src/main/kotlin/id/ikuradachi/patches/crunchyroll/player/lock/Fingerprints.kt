package id.ikuradachi.patches.crunchyroll.player.lock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object PlayerOrientationConfigChangeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/content/res/Configuration;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            type = "L",
            name = "FULL_SCREEN_TOGGLED",
        ),
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            type = "L",
            name = "FULL_SCREEN_DEVICE_ROTATED",
        ),
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            type = "L",
            name = "MINIMIZED",
        ),
    ),
)

object PlayerToolbarInitFingerprint : Fingerprint(
    definingClass = "Lcom/crunchyroll/player/presentation/controls/toolbar/PlayerToolbar;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;"),
    filters = listOf(
        literal(0x7f0e0460),
    ),
)

object InternalPlayerDispatchTouchFingerprint : Fingerprint(
    definingClass = "Lcom/crunchyroll/player/presentation/playerview/InternalPlayerViewLayout;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/view/MotionEvent;",
            name = "getAction",
            parameters = listOf(),
        ),
    ),
)

object ScreenLockHelperMaskFingerprint : Fingerprint(
    definingClass = "Lid/ikuradachi/kageroll/extension/crunchyroll/ScreenLockHelper;",
    name = "getOptionsMask",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf(),
)
