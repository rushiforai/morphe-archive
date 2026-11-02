package app.aeong.patches.twitch.debug

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal object BottomPlayerOverlayViewModelToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        string("BottomPlayerOverlayViewModel(overlayStats="),
        string(", isVideoDebugEnabled=")
    )
)

internal object BottomPlayerOverlayViewModelConstructorFingerprint : Fingerprint(
    classFingerprint = BottomPlayerOverlayViewModelToStringFingerprint,
    name = "<init>",
    accessFlags = listOf(
        AccessFlags.PUBLIC,
        AccessFlags.CONSTRUCTOR
    ),
    parameters = listOf(
        "L",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "Z"
    )
)
