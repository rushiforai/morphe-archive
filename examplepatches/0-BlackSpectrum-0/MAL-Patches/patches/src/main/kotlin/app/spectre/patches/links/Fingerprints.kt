package app.spectre.patches.links

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

object HandleIntentFingerprint : Fingerprint(
    definingClass = "Lnet/myanimelist/presentation/activity/HomeActivity;",
    parameters = listOf("Landroid/content/Intent;"),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lnet/myanimelist/util/NotificationHelper;",
            parameters = listOf("Landroid/content/Intent;", "Lnet/myanimelist/presentation/Router;")
        )
    )
)
