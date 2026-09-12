package app.morphe.patches.tiktok.interaction.gesture

import app.morphe.patcher.Fingerprint

internal object PortraitSingleTapFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
    custom = { method, classDef ->
        classDef.type == "LX/0QeR;" && method.name == "onSingleTapConfirmed"
    },
)

internal object PortraitDoubleTapFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
    custom = { method, classDef ->
        classDef.type == "LX/0QeR;" && method.name == "onDoubleTap"
    },
)

internal object PortraitLongPressFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/MotionEvent;"),
    custom = { method, classDef ->
        classDef.type == "LX/0QeR;" && method.name == "onLongPress"
    },
)
