package id.ikuradachi.patches.crunchyroll.player.aspect

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object ScaleGestureOnScaleEndFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/view/ScaleGestureDetector;"),
    filters = listOf(
        string("detector"),
        literal(1.0f),
        literal(4),
    ),
)

object PlayerViewResizeInvokeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        checkCast("Lcom/crunchyroll/player/presentation/playerview/InternalPlayerViewLayout;"),
        methodCall(
            definingClass = "Ljava/lang/Integer;",
            name = "intValue",
            parameters = listOf(),
        ),
        methodCall(
            definingClass = "Landroidx/media3/ui/PlayerView;",
            name = "setResizeMode",
            parameters = listOf("I"),
        ),
    ),
)

object PlayerGesturesAttachAspectFingerprint : Fingerprint(
    definingClass = "Lcom/crunchyroll/player/presentation/playerview/PlayerGesturesLayout;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "Lcom/crunchyroll/player/presentation/playerview/InternalPlayerViewLayout;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            definingClass = "Lcom/crunchyroll/player/presentation/playerview/PlayerGesturesLayout;",
            type = "Lcom/crunchyroll/player/presentation/playerview/InternalPlayerViewLayout;",
        ),
        newInstance("Landroid/view/ScaleGestureDetector;"),
    ),
)

object AspectHelperDefaultModeFingerprint : Fingerprint(
    definingClass = "Lid/ikuradachi/kageroll/extension/crunchyroll/AspectHelper;",
    name = "getDefaultResizeMode",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf(),
)

object AspectHelperThreeWayFingerprint : Fingerprint(
    definingClass = "Lid/ikuradachi/kageroll/extension/crunchyroll/AspectHelper;",
    name = "isThreeWayCycleEnabled",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(),
)
