package patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import patches.waze.CatalogCompatibility.COMPATIBILITY_WAZE

private const val NAVIGATION_BROADCASTS = "Lorg/ungoogled/waze/NavigationBroadcasts;"

private object BroadcastAlertsFingerprint : Fingerprint(
    definingClass = "Lcom/waze/alerters/AlerterNativeManager;", returnType = "V",
    parameters = listOf("Lcom/waze/jni/protos/alerters/NativeAlertRepositoryUpdate;"),
)
private object NativeSpeedLimitFingerprint : Fingerprint(
    definingClass = "Lcom/waze/location/LocationSensorListener;", name = "updateSpeedometer",
    returnType = "V", parameters = listOf("I", "Ljava/lang/String;", "I", "D"),
)
private object BroadcastLegacyZoneFingerprint : Fingerprint(
    definingClass = "Lcom/waze/navigate/NavigationInfoNativeManager;", returnType = "V",
    parameters = listOf("Lcom/waze/jni/protos/navigate/AverageSpeedCameraZoneUpdate;"),
)
private object BroadcastLegacyClearFingerprint : Fingerprint(
    definingClass = "Lcom/waze/navigate/NavigationInfoNativeManager;", name = "h",
    returnType = "V", parameters = emptyList(),
)
private object BroadcastInsightFingerprint : Fingerprint(
    definingClass = "Lcom/waze/insights_infra/InsightsInfraNativeManager;", returnType = "V",
    parameters = listOf("Lcom/waze/jni/protos/insights_infra/SegmentInsightUpdate;"),
)

@Suppress("unused")
val wazeNavigationBroadcastPatch = bytecodePatch(
    name = "Broadcast navigation data",
    description = "Broadcasts current speed, road limits, road alerts and approaching/active average-speed zones locally, including in the background. No overlay required.",
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeStayAwakePatch)
    val receiverPackage by stringOption(
        key = "receiverPackage", default = "", title = "Receiver package",
        description = "Optional target app package. Blank broadcasts to running compatible local receivers.",
    )
    execute {
        val target = receiverPackage.orEmpty().trim()
        if (target.isNotEmpty() && !Regex("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+").matches(target)) {
            throw PatchException("Receiver package is not an Android package name")
        }
        returnString(NAVIGATION_BROADCASTS, "receiverPackage", target)
        declareWazeToggle("navigationBroadcasts")
        WazeApplicationCreateFingerprint.method.addInstruction(0,
            "invoke-static { p0 }, $NAVIGATION_BROADCASTS->init(Landroid/app/Application;)V")
        NativeSpeedLimitFingerprint.method.addInstruction(0,
            "invoke-static/range { p2 .. p5 }, $NAVIGATION_BROADCASTS->speed(Ljava/lang/String;ID)V")
        BroadcastLegacyZoneFingerprint.method.addInstruction(0,
            "invoke-static/range { p1 .. p1 }, $NAVIGATION_BROADCASTS->legacy(Ljava/lang/Object;)V")
        BroadcastLegacyClearFingerprint.method.addInstruction(0,
            "invoke-static {}, $NAVIGATION_BROADCASTS->legacyClear()V")
        BroadcastAlertsFingerprint.method.addInstruction(0,
            "invoke-static/range { p1 .. p1 }, $NAVIGATION_BROADCASTS->alerts(Ljava/lang/Object;)V")
        BroadcastInsightFingerprint.method.addInstruction(0,
            "invoke-static/range { p1 .. p1 }, $NAVIGATION_BROADCASTS->insights(Ljava/lang/Object;)V")
    }
}
