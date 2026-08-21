package app.morphe.patches.delonghi.notifications

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/** Matches NewBaseActivity.askNotificationPermission(). */
internal object AskNotificationPermissionFingerprint : Fingerprint(
    definingClass = "Lcom/ddsx_ayla_android/view/comfort_v4/base/NewBaseActivity;",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        literal(33),
        string("android.permission.POST_NOTIFICATIONS"),
        literal(10005),
        methodCall(
            smali = "Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V",
        ),
    ),
)
