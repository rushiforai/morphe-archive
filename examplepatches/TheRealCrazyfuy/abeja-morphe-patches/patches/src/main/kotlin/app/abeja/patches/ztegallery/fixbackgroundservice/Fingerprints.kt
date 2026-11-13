package app.abeja.patches.ztegallery.fixbackgroundservice

import app.morphe.patcher.Fingerprint

object WakeLockForegroundServiceHelperFingerprint : Fingerprint(
    definingClass = "Lcom/zte/smart/core/WakeLockForegroundServiceHelper;",
    name = "startForegroundService",
    returnType = "Z",
    parameters = listOf(
        "Landroid/content/Context;"
    )
)