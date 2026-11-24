package app.jofslash.patches.speedtest.tracking

import app.jofslash.patches.speedtest.shared.Constants.COMPATIBILITY_SPEEDTEST
import app.jofslash.patches.speedtest.shared.editManifest
import app.jofslash.patches.speedtest.shared.isStatic
import app.jofslash.patches.speedtest.shared.methodOf
import app.jofslash.patches.speedtest.shared.methodsWhere
import app.jofslash.patches.speedtest.shared.returnEarly
import app.jofslash.patches.speedtest.shared.setApplicationMetaData
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

// Both manager classes keep their package; the class name is R8-assigned, so the patches throw if
// they are gone. AppvestorManagerImpl starts the Appvestor monetization/stats SDK in initialize().
private const val APPVESTOR_MANAGER_IMPL = "Lcom/ookla/mobile4/app/q9;"

// CellRebelManagerImpl wires up the CellRebel SDK (com.cellrebel.sdk) that collects and sells
// network/coverage measurements: a(...) is initializeDefault, b(...) is initialize.
private const val CELL_REBEL_MANAGER_IMPL = "Lcom/ookla/mobile4/app/fa;"

private val blockTrackingResourcePatch = resourcePatch {
    execute {
        editManifest { document ->
            // Firebase Analytics is already off in the stock manifest; pin it off for good so nothing
            // can turn it back on, and keep Crashlytics and Sessions off too.
            document.setApplicationMetaData("firebase_analytics_collection_deactivated", "true")
            document.setApplicationMetaData("firebase_analytics_collection_enabled", "false")
            document.setApplicationMetaData("google_analytics_adid_collection_enabled", "false")
            document.setApplicationMetaData("firebase_crashlytics_collection_enabled", "false")
            document.setApplicationMetaData("firebase_sessions_enabled", "false")
        }
    }
}

@Suppress("unused")
val blockTrackingPatch = bytecodePatch(
    name = "Block tracking",
    description = "Stops the third-party trackers: the Appvestor monetization SDK and the CellRebel SDK " +
            "that collects and sells network and coverage measurements. Firebase Analytics and Crashlytics " +
            "stay off (they already ship off). The speed test and your results aren't touched.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_SPEEDTEST)

    dependsOn(blockTrackingResourcePatch)

    execute {
        // Appvestor: initialize() registers the SDK and its lifecycle callbacks. Not started, it
        // sends nothing.
        methodOf(APPVESTOR_MANAGER_IMPL, "initialize").returnEarly()

        // CellRebel: both wiring methods (initialize and initializeDefault) build and start the
        // measurement SDK. The class has only these two public void methods; matched by name and
        // shape so the obfuscated parameter types don't have to be spelled out.
        methodsWhere(CELL_REBEL_MANAGER_IMPL, "initialize / initializeDefault") {
            !it.isStatic() && it.returnType == "V" && it.name in setOf("a", "b") && it.parameterTypes.size >= 2
        }.forEach { it.returnEarly() }
    }
}
