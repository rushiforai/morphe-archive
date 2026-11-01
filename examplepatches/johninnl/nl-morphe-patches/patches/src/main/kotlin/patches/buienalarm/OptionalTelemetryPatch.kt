package patches.buienalarm

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/** Optional subscription SDK telemetry, separate from purchases and entitlements. */
internal val optionalTelemetry = bytecodePatch {
    dependsOn(originalInput)
    execute {
        val prefix = "Lcom/revenuecat/purchases/"
        for (name in listOf("getAutomaticDeviceIdentifierCollectionEnabled", "getDiagnosticsEnabled")) {
            Fingerprint(definingClass = "${prefix}PurchasesConfiguration;", name = name,
                returnType = "Z", parameters = emptyList()).method
                .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }
        fun stop(cls: String, name: String, parameters: List<String>) {
            Fingerprint(definingClass = "$prefix$cls;", name = name, returnType = "V",
                parameters = parameters).method.addInstructions(0, "return-void")
        }
        stop("PurchasesOrchestrator", "setFirebaseAppInstanceID", listOf("Ljava/lang/String;"))
        stop("PurchasesOrchestrator", "setAttributes", listOf("Ljava/util/Map;"))
        stop("subscriberattributes/SubscriberAttributesManager", "collectDeviceIdentifiers",
            listOf("Ljava/lang/String;", "Landroid/app/Application;"))
        stop("common/events/EventsManager", "track", listOf("${prefix}common/events/FeatureEvent;"))
        stop("common/events/EventsManager", "flushEvents", listOf("${prefix}common/Delay;"))
        stop("common/events/EventsManager", "flushLegacyEvents", emptyList())
        stop("common/events/EventsManager", "performPriorityFlush", emptyList())
        stop("common/diagnostics/DiagnosticsSynchronizer", "syncDiagnosticsFileIfNeeded", emptyList())
        stop("common/diagnostics/DiagnosticsSynchronizer", "syncDiagnosticsFileIfBigEnough", emptyList())
        stop("common/diagnostics/DiagnosticsTracker", "trackEvent", listOf("${prefix}common/diagnostics/DiagnosticsEntry;"))
        stop("common/diagnostics/DiagnosticsTracker", "trackEventInCurrentThread\$purchases_defaultsBc8Release",
            listOf("${prefix}common/diagnostics/DiagnosticsEntry;"))

        // Existing synchronization code completes its normal callback for an
        // empty attribute map. Do not stub callback-bearing transport methods.
        Fingerprint(definingClass = "${prefix}subscriberattributes/caching/SubscriberAttributesCache;",
            name = "getUnsyncedSubscriberAttributes", returnType = "Ljava/util/Map;")
            .matchAll(2..2).forEach { match ->
                match.method.addInstructions(0, """
                    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;
                    move-result-object v0
                    return-object v0
                """.trimIndent())
            }
    }
}
