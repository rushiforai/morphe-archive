package app.morphe.patches.waze

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

// Google's Waze from the Play Store / APKMirror, renamed so it installs next to it. NmaxConnect binds
// WAZE_PACKAGE's WAZE_SERVICE (WazeModClient.DASH_HOST / ACTION_BIND in that repo).
internal const val WAZE_ORIGINAL_PACKAGE = "com.waze"
internal const val WAZE_PACKAGE = "com.lampp.wazenmax"
internal const val WAZE_SERVICE = "com.lampp.wazenmax.WazeDashService"
internal const val WAZE_BIND_ACTION = "com.lampp.nmaxconnect.waze.action.BIND"

// Extension classes (extensions/waze); their Java package stays com.lampp.wazenmax.
internal const val WAZE_BRIDGE = "Lcom/lampp/wazenmax/DashSurfaceBridge;"
internal const val WAZE_NAV = "Lcom/lampp/wazenmax/WazeNav;"
internal const val WAZE_ZOOM = "Lcom/lampp/wazenmax/WazeZoom;"
internal const val WAZE_DASH_NAMES = "Lcom/lampp/wazenmax/DashNames;"

private const val WAZE_CERT_SHA256 = "03637f6c5d8f604e6fdb79a6ffbfa578de4e318f8da22fc6106665247f8807d7"

internal val wazeCompatibility = Compatibility(
    name = "Waze NMAX",
    packageName = WAZE_ORIGINAL_PACKAGE,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x33CCFF,
    signatures = setOf(WAZE_CERT_SHA256),
    targets = listOf(AppTarget(version = "5.27.0.1", isExperimental = false, minSdk = 29)),
)
