package patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import patches.waze.CatalogCompatibility.COMPATIBILITY_WAZE

private const val NAVIGATION_BROADCASTS = "Lorg/ungoogled/waze/NavigationBroadcasts;"
private val startupResources = patches.shared.navigationStartupResources("org.ungoogled.waze", warningRecovery = true)

/** Clear copied camera values after the engine has actually marked itself shut down. */
internal fun bindWazeCameraShutdown(method: MutableMethod) {
    val body = method.instructions
    val field = "Lcom/waze/NativeManager;->isNativeLayerShutdown:Z"
    val hook = "Lorg/ungoogled/waze/NativeWarnings;->engineStopped()V"
    check(method.definingClass == "Lcom/waze/NativeManager;" && method.name == "onNativeLayerShutDown" &&
        method.parameterTypes.map(CharSequence::toString) == listOf("Z") && method.returnType == "V" &&
        body.none { (it as? ReferenceInstruction)?.reference.toString() == hook }) { "Changed Waze native shutdown ABI" }
    val writes = body.indices.filter { body[it].opcode == Opcode.IPUT_BOOLEAN &&
        (body[it] as? ReferenceInstruction)?.reference.toString() == field }
    check(writes.size == 1 && writes.single() > 0) { "Changed Waze native shutdown flag" }
    val index = writes.single()
    val value = body[index - 1]
    check(value.opcode == Opcode.CONST_4 &&
        (value as com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction).narrowLiteral == 1 &&
        (value as OneRegisterInstruction).registerA ==
            (body[index] as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerA) {
        "Waze native shutdown does not set its completed flag"
    }
    method.addInstruction(index + 1, "invoke-static {}, $hook")
}

/** Keep-alive belongs only to teardown; the shared AAOS flag also controls native login. */
internal fun preserveBroadcastsAfterCarSession(method: MutableMethod) {
    val body = method.instructions
    val service = "Lcom/waze/car_lib/WazeCarAppService;"
    val flag = "Lcom/waze/car_lib/w;->b()Z"
    check(method.definingClass == service && method.name == "a" &&
        method.parameterTypes.map(CharSequence::toString) == listOf(service) && method.returnType == "V") {
        "Changed Waze car teardown ABI"
    }
    val calls = body.withIndex().filter { (it.value as? ReferenceInstruction)?.reference.toString() == flag }
    check(calls.size == 1 && calls.single().value.opcode == Opcode.INVOKE_INTERFACE &&
        body.count { it.opcode == Opcode.RETURN_VOID } == 1 && body.last().opcode == Opcode.RETURN_VOID &&
        body.count { (it as? ReferenceInstruction)?.reference.toString() == "Lcom/waze/car_lib/w;->c()Z" } == 1 &&
        body.count { (it as? ReferenceInstruction)?.reference.toString() == "Lcom/waze/kn;->shutDown()V" } == 1 &&
        body.count { (it as? ReferenceInstruction)?.reference.toString() == "$NAVIGATION_BROADCASTS->keepAliveAfterCarSession(Z)Z" } == 0
    ) { "Changed or already bound Waze car teardown decision" }
    val index = calls.single().index + 1
    check(body[index].opcode == Opcode.MOVE_RESULT && body[index] is OneRegisterInstruction) {
        "Changed Waze car teardown result"
    }
    val register = (body[index] as OneRegisterInstruction).registerA
    // Preserve the platform policy, deferred-shutdown branch and native shutdown
    // body. Only this service-destruction decision can include the local feed.
    method.addInstructions(index + 1, """
        invoke-static/range {v$register .. v$register}, $NAVIGATION_BROADCASTS->keepAliveAfterCarSession(Z)Z
        move-result v$register
    """)
}

/** Application startup also runs for a cold service bind. Old tasks must not force a UI restart. */
internal fun suppressTaskRelaunch(method: MutableMethod) {
    val body = method.instructions
    val field = "Landroid/app/ActivityManager\$RecentTaskInfo;->numActivities:I"
    val reads = body.indices.filter { body[it].opcode == Opcode.IGET && (body[it] as? ReferenceInstruction)?.reference.toString() == field }
    check(reads.size == 2 && body[reads.last() + 1].opcode == Opcode.IF_LE) { "Changed Waze task relaunch guard" }
    check(body.count { (it as? ReferenceInstruction)?.reference.toString() == "Ljava/lang/System;->exit(I)V" } == 1)
    check(body.count { (it as? ReferenceInstruction)?.reference.toString() == "Landroid/content/Context;->startActivity(Landroid/content/Intent;)V" } == 1)
    val branch = body[reads.last() + 1] as BuilderOffsetInstruction
    method.implementation!!.replaceInstruction(reads.last() + 1, BuilderInstruction30t(Opcode.GOTO_32, branch.target))
}

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
    description = "Broadcasts current speed, road limits, road alerts and approaching/active average-speed zones locally, including in the background. Includes a silent startup and health API for patched Maps/Vela; no overlay required.",
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeStayAwakePatch, startupResources, wazeConfigOverridesPatch, wazeNativeTileResources)
    val receiverPackage by stringOption(
        key = "receiverPackage", default = "", title = "Receiver package",
        description = "Optional target app package. Blank broadcasts to running compatible local receivers.",
    )
    execute {
        // Resolve the exact native startup/health ABI before injecting the API.
        Fingerprint(definingClass = "Lcom/waze/ls;", name = "d", parameters = listOf("Lg/d/e;"), returnType = "Ljava/lang/Object;").method
        Fingerprint(definingClass = "Lcom/waze/NativeManager;", name = "isAppStarted", parameters = emptyList(), returnType = "Z").method
        Fingerprint(definingClass = "Lcom/waze/NativeManager;", name = "getInitializedStatus", parameters = emptyList(), returnType = "Z").method
        Fingerprint(definingClass = "Lcom/waze/NativeManager;", name = "isShutdown", parameters = emptyList(), returnType = "Z").method
        Fingerprint(definingClass = "Lcom/waze/NativeManager;", name = "shutDown", parameters = emptyList(), returnType = "V").method
        bindWazeCameraShutdown(Fingerprint(definingClass = "Lcom/waze/NativeManager;", name = "onNativeLayerShutDown",
            parameters = listOf("Z"), returnType = "V").method)
        patches.shared.bindNavigationProviderLifecycle()
        check(mutableClassDefBy("Lg/d/k;").fields.any { it.name == "a" && it.type == "Lg/d/k;" })
        bindWazeNativeWarnings()
        suppressTaskRelaunch(Fingerprint(definingClass = "Lcom/waze/ls;", name = "onCreate", parameters = emptyList(), returnType = "V").method)
        bindWazeNavigationAudio()
        Fingerprint(definingClass = NAVIGATION_BROADCASTS, name = "keepAliveAfterCarSession",
            parameters = listOf("Z"), returnType = "Z").method
        preserveBroadcastsAfterCarSession(Fingerprint(definingClass = "Lcom/waze/car_lib/WazeCarAppService;",
            name = "a", parameters = listOf("Lcom/waze/car_lib/WazeCarAppService;"), returnType = "V").method)
        val target = receiverPackage.orEmpty().trim()
        if (target.isNotEmpty() && !Regex("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+").matches(target)) {
            throw PatchException("Receiver package is not an Android package name")
        }
        returnString(NAVIGATION_BROADCASTS, "receiverPackage", target)
        declareWazeToggle("navigationBroadcasts")
        // Waze's classic report feed follows the map area it last showed on screen: in the background
        // (feeding Maps/Vela, no Waze map drawn) it stops reporting that area and keeps the reports of
        // where it started. Waze's insights feed loads reports by map cells around the car instead,
        // without a map. Waze reads this value once at startup, so a change applies after a restart.
        keepWazeConfig("areaReports", "CONFIG_VALUE_INSIGHTS_INFRA_INSIGHTS_API_ENABLED", true)
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
