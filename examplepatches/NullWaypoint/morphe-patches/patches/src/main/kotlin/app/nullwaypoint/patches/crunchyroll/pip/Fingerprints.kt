package app.nullwaypoint.patches.crunchyroll.pip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

internal object PictureInPictureProviderFingerprint : Fingerprint(
    filters = listOf(
        string("picture_in_picture"),
    ),
)

internal object PictureInPictureAutoEnterFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        string("SecurityException registering pipActionReceiver: "),
        methodCall(
            definingClass = "Landroid/app/PictureInPictureParams\$Builder;",
            name = "setAutoEnterEnabled",
        ),
    ),
)

internal object WatchScreenUserLeaveHintFingerprint : Fingerprint(
    definingClass =
        "Lcom/crunchyroll/watchscreen/screen/WatchScreenActivity;",
    name = "onUserLeaveHint",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "post",
        ),
    ),
)