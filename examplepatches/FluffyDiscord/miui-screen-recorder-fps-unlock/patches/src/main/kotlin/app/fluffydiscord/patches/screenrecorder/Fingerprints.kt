package app.fluffydiscord.patches.screenrecorder

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

private const val PERMISSION_ACTIVITY_CLASS =
    "Lcom/miui/screenrecorder/activity/NativePermissionRequestActivity;"

internal object FrameRateListFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf("I", "I"),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, type = "[I"),
        string("Error when set frame value, maxValue = "),
    ),
)

internal object PrivilegedProjectionFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Landroid/content/Intent;",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("createProjection", "media_projection"),
)

internal object StartPermissionActivityFingerprint : Fingerprint(
    definingClass = PERMISSION_ACTIVITY_CLASS,
    isStatic = true,
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "I", "Z"),
    strings = listOf("key_permission", "key_need_start_service"),
)

internal object CaptureConsentRequestFingerprint : Fingerprint(
    definingClass = PERMISSION_ACTIVITY_CLASS,
    name = "onCreate",
    filters = listOf(
        string("media_projection"),
        methodCall(
            smali = "Landroid/media/projection/MediaProjectionManager;->createScreenCaptureIntent()Landroid/content/Intent;",
        ),
    ),
)

internal object CaptureConsentResultFingerprint : Fingerprint(
    definingClass = PERMISSION_ACTIVITY_CLASS,
    name = "onActivityResult",
    filters = listOf(
        methodCall(
            smali = "Landroid/media/projection/MediaProjectionManager;->getMediaProjection(ILandroid/content/Intent;)Landroid/media/projection/MediaProjection;",
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf("Landroid/media/projection/MediaProjection;"),
            returnType = "V",
        ),
    ),
)

internal object PermissionResultFingerprint : Fingerprint(
    definingClass = PERMISSION_ACTIVITY_CLASS,
    name = "onRequestPermissionsResult",
    filters = listOf(
        methodCall(name = "onRequestPermissionsResult", opcode = Opcode.INVOKE_SUPER),
    ),
)

internal object SettingsScreenFingerprint : Fingerprint(
    definingClass = "Lcom/miui/screenrecorder/activity/ScreenRecorderSettingActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object TileClickFingerprint : Fingerprint(
    definingClass = "Lcom/miui/screenrecorder/service/QuickService;",
    name = "onClick",
    returnType = "V",
    parameters = listOf(),
)

private object FrameRendererConstructorFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("initFPs :"),
)

internal object FrameAvailableFingerprint : Fingerprint(
    classFingerprint = FrameRendererConstructorFingerprint,
    name = "onFrameAvailable",
    parameters = listOf("Landroid/graphics/SurfaceTexture;"),
)

internal object PresentationTimeFingerprint : Fingerprint(
    classFingerprint = FrameRendererConstructorFingerprint,
    returnType = "V",
    parameters = listOf("J"),
    filters = listOf(
        methodCall(
            smali = "Landroid/opengl/EGLExt;->eglPresentationTimeANDROID(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;J)Z",
        ),
    ),
)

internal object RenderLoopFingerprint : Fingerprint(
    superclass = "Landroid/os/Handler;",
    name = "handleMessage",
    parameters = listOf("Landroid/os/Message;"),
    strings = listOf("MSG_SET_PRIORITY: getThreadId:"),
    filters = listOf(
        fieldAccess(definingClass = "Landroid/os/Message;", name = "what"),
        opcode(Opcode.INT_TO_LONG),
        methodCall(
            smali = "Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z",
            location = MatchAfterImmediately(),
        ),
    ),
)

internal object MuxerNotStartedFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("video trackId is error,mTrackId = "),
    ),
)
