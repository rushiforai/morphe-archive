package app.riky.patches.komoot

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

private const val routingPermissionClass =
    "Lde/komoot/android/services/api/model/RoutingPermission"

internal object AppConfigV3Fingerprint : Fingerprint(
    definingClass = "Lde/komoot/android/services/api/model/AppConfigV3;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(
        "L", "L", "L", "L", "L", "L", "L", "L", "L", "L", "L",
        "L", "L", "L", "L", "L", "L", "L", "L", "L", "L", "L", "L",
    ),
)

internal object PublicUserProfileV7Fingerprint : Fingerprint(
    definingClass = "Lde/komoot/android/services/api/model/PublicUserProfileV7;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("L", "L", "L", "L", "Z"),
)

internal object RoutingPermissionInitFingerprint : Fingerprint(
    definingClass = "$routingPermissionClass;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("${routingPermissionClass}\$StatusPermission;"),
)
