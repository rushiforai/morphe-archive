// patches/src/main/kotlin/app/w3s/patches/w3schools/misc/privacy/DisableTelemetryPatch.kt
package app.w3s.patches.w3schools.misc.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.w3s.patches.w3schools.misc.pairip.pairipLicenseBypassPatch
import app.w3s.patches.w3schools.shared.Constants.COMPATIBILITY_W3SCHOOLS

private const val AD_SERVICES_CONFIG_PATH = "res/xml/ad_services_config.xml"

private fun Fingerprint.stubVoid() {
    methodOrNull?.addInstructions(0, "return-void")
}

private fun Fingerprint.stubReturnZero() {
    methodOrNull?.addInstructions(
        0,
        """
            const/4 v0, 0x0
            return v0
        """,
    )
}

private fun Fingerprint.stubReturnNull() {
    methodOrNull?.addInstructions(
        0,
        """
            const/4 v0, 0x0
            return-object v0
        """,
    )
}

@Suppress("unused")
val disableTelemetryPatch = patch(
    name = "Disable tracking and analytics",
    description = "Disables Meta AppEvents, AdServices attribution, AAID/InstallReferrer harvesting, and RevenueCat diagnostic telemetry while preserving login and billing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_W3SCHOOLS)

    dependsOn(pairipLicenseBypassPatch)

    execute {
        listOf(
            FacebookAutoLogAppEventsEnabledFingerprint,
            FacebookAdvertiserIdCollectionEnabledFingerprint,
            FacebookCodelessSetupEnabledFingerprint,
            FacebookImplicitPurchaseLoggingEnabledFingerprint,
        ).forEach { it.stubReturnZero() }

        listOf(
            FacebookAndroidIdViaReflectionFingerprint,
            FacebookAndroidIdViaServiceFingerprint,
        ).forEach { it.stubReturnNull() }

        listOf(
            FacebookPublishInstallAsyncFingerprint,
            FacebookAppEventsManagerStartFingerprint,
            FacebookLogActivateAppEventFingerprint,
            FacebookStartIapLoggingFingerprint,
            FacebookGpsAraEnableFingerprint,
            FacebookGpsPaEnableFingerprint,
            FacebookGpsTopicsEnableFingerprint,
            FacebookInstallReferrerTryUpdateFingerprint,
            RevenueCatDiagnosticsTrackEntryFingerprint,
            RevenueCatDiagnosticsTrackNameMapFingerprint,
            RevenueCatEventsTrackFingerprint,
            RevenueCatEventsFlushFingerprint,
        ).forEach { it.stubVoid() }

        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.elements("application").first()
            val optOutMeta = mapOf(
                "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
                "com.facebook.sdk.CodelessDebugLogEnabled" to "false",
            )
            val existingByName = application.children("meta-data")
                .mapNotNull { element -> element.attribute("android:name")?.let { it to element } }
                .toMap()

            for ((metaName, metaValue) in optOutMeta) {
                val existing = existingByName[metaName]
                if (existing != null) {
                    existing.setAttribute("android:value", metaValue)
                } else {
                    application.appendChild("meta-data") {
                        setAttribute("android:name", metaName)
                        setAttribute("android:value", metaValue)
                    }
                }
            }
        }

        if (AD_SERVICES_CONFIG_PATH in listApkEntries("res/xml/")) {
            resourceXml(AD_SERVICES_CONFIG_PATH).use { adServicesConfig ->
                listOf("attribution", "custom-audiences", "topics").forEach { tagName ->
                    adServicesConfig.elements(tagName).forEach { element ->
                        element.setAttribute("allowAllToAccess", "false")
                    }
                }
            }
        }
    }
}
