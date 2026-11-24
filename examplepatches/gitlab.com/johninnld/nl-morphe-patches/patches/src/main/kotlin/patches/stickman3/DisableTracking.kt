package patches.stickman3

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import patches.shared.disableComponents
import patches.shared.removePermissions
import patches.shared.setMetaData

private const val APPLOVIN_INIT = "com.applovin.sdk.AppLovinInitProvider"
private const val IRONSOURCE_LIFECYCLE = "com.ironsource.lifecycle.IronsourceLifecycleProvider"

private val trackingResources = resourcePatch {
    dependsOn(originalInput)

    execute {
        disableStickmanNativeAnalytics(get("lib/arm64-v8a/libil2cpp.so"))
        document("AndroidManifest.xml").use { manifest ->
            removePermissions(
                manifest,
                "com.google.android.gms.permission.AD_ID",
                "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
            )
            // Both providers initialize their SDK before any game code runs. The game only reaches
            // those SDKs through Unity Ads mediation, which this bundle never starts, so stopping
            // the providers keeps AppLovin and IronSource from identifying the device at launch.
            disableComponents(manifest, APPLOVIN_INIT, IRONSOURCE_LIFECYCLE)
            // The Unity Facebook plugin stays for sign-in, but neither its event upload nor the
            // advertiser identifier may leave the device.
            setMetaData(manifest, "com.facebook.sdk.AutoLogAppEventsEnabled", "false")
            setMetaData(manifest, "com.facebook.sdk.AdvertiserIDCollectionEnabled", "false")
        }
    }
}

/** Stop explicit app events at their queue boundary; retain Facebook authentication APIs. */
internal val stickmanTrackingGate = bytecodePatch {
    dependsOn(originalInput, trackingResources, stickmanTokenGate)
    execute {
        val queue = mutableClassDefBy("Lcom/facebook/appevents/AppEventQueue;")
        for ((name, parameters) in listOf(
            "add" to listOf("Lcom/facebook/appevents/AccessTokenAppIdPair;", "Lcom/facebook/appevents/AppEvent;"),
            "flush" to listOf("Lcom/facebook/appevents/FlushReason;"),
            "flushAndWait" to listOf("Lcom/facebook/appevents/FlushReason;"),
            "persistToDisk" to emptyList(),
        )) {
            val method = queue.methods.singleOrNull {
                it.name == name && it.returnType == "V" && it.parameterTypes == parameters
            } ?: error("Draw a Stickman Facebook event queue changed: $name")
            check(method.implementation?.instructions?.count()?.let { it > 1 } == true)
            method.addInstructions(0, "return-void")
        }
    }
}

@Suppress("unused")
val stickman3DisableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Removes advertising and install-referrer permissions, stops advertising startup " +
        "providers, disables Facebook identifier collection and app-event enqueue/upload, and " +
        "suppresses the game's native analytics queues.",
    default = true,
) {
    compatibleWith(stickman3)
    dependsOn(stickmanTrackingGate)
}
