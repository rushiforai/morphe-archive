package patches.ftm

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").also { check(it.length == 1) }.item(0)
            for ((name, value) in mapOf("delivery_metrics_exported_to_big_query_enabled" to "false", "firebase_analytics_collection_deactivated" to "true")) {
                val nodes = doc.getElementsByTagName("meta-data")
                val matches = (0 until nodes.length).map { nodes.item(it) as Element }
                    .filter { it.getAttribute("android:name") == name }
                check(matches.size <= 1) { "Duplicate FTM metric flag $name" }
                val entry = matches.singleOrNull() ?: doc.createElement("meta-data").also {
                    it.setAttributeNS("http://schemas.android.com/apk/res/android", "android:name", name)
                    application.appendChild(it)
                }
                entry.setAttributeNS("http://schemas.android.com/apk/res/android", "android:value", value)
            }
        }
    }
}

@Suppress("unused")
val disableTracking = bytecodePatch(name = "Disable tracking", description = "Blocks identified web collectors and notification analytics exports; cleans five Eventor keys after page load while preserving account, history and push.") {
    compatibleWith(ftm)
    dependsOn(originalInput, webContent, trackingResources, hideAds)
    execute {
        // Resolve every original sink eagerly; legal additional overloads reject.
        val falseMethods = listOf(
            exact(METRICS, "deliveryMetricsExportToBigQueryEnabled", "Z"),
            exact(METRICS, "shouldUploadScionMetrics", "Z", "Landroid/os/Bundle;"),
        )
        val voidMethods = listOf(
            exact(METRICS, "logToScion", "V", "Ljava/lang/String;", "Landroid/os/Bundle;"),
            exact(METRICS, "logToFirelog", "V", "Lcom/google/firebase/messaging/reporting/MessagingClientEvent\$Event;", "Landroid/content/Intent;", "Lcom/google/android/datatransport/TransportFactory;"),
            exact(METRICS, "setUserPropertyIfRequired", "V", "Landroid/os/Bundle;"),
        )
        falseMethods.forEach { it.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }
        voidMethods.forEach { it.method.addInstructions(0, "return-void") }
        enable("Tracking")
    }
}
