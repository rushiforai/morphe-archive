package app.abeja.patches.ztevideoplayer.fixpermissions

import app.morphe.patcher.Fingerprint

object PermissionUtilInitFingerprint : Fingerprint(
    definingClass = "Lcom/zte/videoplayer/util/PermissionUtil;",
    name = "<init>",
    returnType = "V",
    parameters = emptyList(),
)

object PermissionUtilCheckPermissionFingerprint : Fingerprint(
    definingClass = "Lcom/zte/videoplayer/util/PermissionUtil;",
    name = "checkPermission",
    returnType = "Z",
    parameters = listOf("Landroid/app/Activity;", "I"),
)
