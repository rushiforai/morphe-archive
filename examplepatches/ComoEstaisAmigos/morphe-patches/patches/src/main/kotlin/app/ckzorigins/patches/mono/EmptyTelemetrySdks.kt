package app.ckzorigins.patches.mono

import app.adebisi.patches.shared.CONSTRUCTOR
import app.adebisi.patches.shared.PUBLIC
import app.adebisi.patches.shared.addStub
import app.adebisi.patches.shared.emptySdkPrefixes
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * Java ad/analytics SDKs whose method and field string constants still hold their hosts.
 * Wrappers under `com.glu.plugins` stay; [stubTelemetryWrappers] makes them return before they
 * touch these types. Amazon IAP and GameCircle are not in this list.
 *
 * `Lcom/tapjoy/TapjoyConnect;` stays: Unity still calls `TapjoyGlu` (stubbed), and the getter
 * patch reads `tapjoyConnectInstance`. The rest of Tapjoy holds `ws.tapjoyads.com`.
 */
internal val TELEMETRY_SDK_PREFIXES = listOf(
    "Lcom/flurry/" to 940,
    "Lcom/tapjoy/" to 71,
    "Lcom/chartboost/" to 186,
    "Lcom/facebook/" to 17,
    "Lcom/amazon/device/ads/" to 126,
    "Lcom/kontagent/" to 66,
    "Lcom/mobileapptracker/" to 9,
    "Lcom/playhaven/" to 80,
    "Lcom/google/analytics/" to 81,
    "Lcom/glu/plugins/NotificationReceiver" to 5,
)

internal val TELEMETRY_SDK_KEEP = setOf(TAPJOY_CONNECT)

internal val TELEMETRY_WRAPPERS = listOf(
    "Lcom/glu/plugins/FlurryGlu;",
    "Lcom/glu/plugins/TapjoyGlu;",
    "Lcom/glu/plugins/ChartBoostGlu;",
    "Lcom/glu/plugins/PlayHavenGlu;",
    "Lcom/glu/plugins/MobileAppTrackerGlu;",
    "Lcom/glu/plugins/FacebookGlu;",
    "Lcom/glu/plugins/GluGoogleAnalytics;",
    "Lcom/glu/plugins/KontagentGlu;",
    "Lcom/glu/plugins/AmazonGlu;",
)

internal fun stubTelemetryWrappers() {
    for (type in TELEMETRY_WRAPPERS) {
        stubWrapper(mutableClassDefBy(type))
    }
}

internal fun emptyTelemetrySdks() {
    emptySdkPrefixes(TELEMETRY_SDK_PREFIXES, TELEMETRY_SDK_KEEP)
    stubNotificationReceiver()
    stubMobileAppTrackerDeviceIds()
}

private fun stubWrapper(c: MutableClass) {
    for (method in c.methods.toList()) {
        if (method.name == "<init>" || method.name == "<clinit>") continue
        if (method.implementation == null) continue
        stubReturn(method, c.type)
    }
}

private fun stubReturn(method: MutableMethod, type: String) {
    when (val kind = method.returnType.first()) {
        'V' -> method.returnEarly()
        'Z' -> method.returnEarly(false)
        'I' -> method.returnEarly(0)
        'J' -> method.returnEarly(0L)
        'L', '[' -> method.returnEarly(null)
        else -> throw PatchException("$type ${method.name} returns ${method.returnType} ($kind)")
    }
}

/**
 * [emptyClasses] will not keep a constructor: the superclass is BroadcastReceiver, outside the
 * emptied set. The system still instantiates this if the manifest lists it, so put a no-arg
 * constructor and an empty `onReceive` back.
 */
private fun stubNotificationReceiver() {
    val c = mutableClassDefBy(NOTIFICATION_RECEIVER)
    c.addStub(
        name = "<init>",
        access = PUBLIC or CONSTRUCTOR,
        registerCount = 1,
        smali = """
            invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V
            return-void
        """,
    )
    c.addStub(
        name = "onReceive",
        parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
        registerCount = 3,
        smali = "return-void",
    )
}

private const val MOBILE_APP_TRACKER = "Lcom/mobileapptracker/MobileAppTracker;"

/**
 * Modern Android used to `returnEarly` these two methods. [emptyTelemetrySdks] runs first
 * (both patches are on by default) and deletes them, so the fingerprints miss. Put the
 * empty-string stubs back: Android 10 still dies on a real `TelephonyManager.getDeviceId`
 * if Tune is ever asked, and Modern Android can skip the fingerprints.
 */
internal fun stubMobileAppTrackerDeviceIds() {
    val c = mutableClassDefBy(MOBILE_APP_TRACKER)
    stubDeviceId(c, emptyList(), AccessFlags.PUBLIC.value)
    stubDeviceId(c, listOf("Landroid/content/Context;"), AccessFlags.PRIVATE.value)
}

private fun stubDeviceId(c: MutableClass, parameters: List<String>, access: Int) {
    val existing = c.methods.find {
        it.name == "getDeviceId" && it.parameterTypes.map { p -> p.toString() } == parameters
    }
    if (existing != null) {
        if (existing.implementation != null) existing.returnEarly("")
        return
    }
    val paramRegs = 1 + parameters.size
    val method = ImmutableMethod(
        c.type,
        "getDeviceId",
        parameters.map { ImmutableMethodParameter(it, null, null) },
        "Ljava/lang/String;",
        access,
        null,
        null,
        MutableMethodImplementation(paramRegs + 1),
    ).toMutable()
    method.addInstructions(
        0,
        """
            const-string v0, ""
            return-object v0
        """,
    )
    c.methods.add(method)
    if (access and AccessFlags.PRIVATE.value != 0) c.directMethods.add(method) else c.virtualMethods.add(method)
}
