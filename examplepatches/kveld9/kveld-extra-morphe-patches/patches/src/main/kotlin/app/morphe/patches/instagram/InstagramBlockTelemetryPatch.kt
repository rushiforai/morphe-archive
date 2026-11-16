package app.morphe.patches.instagram

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.Constants
import app.morphe.patches.shared.disableComponentsByName
import app.morphe.patches.shared.replaceWithReturnVoid
import app.morphe.patches.shared.stripPermissionsWhere

private val instagramTelemetryResourcePatch = resourcePatch(
    name = "Instagram Telemetry Manifest Purge",
    description = "Strips tracking/advertising permissions and disables analytics services, providers, and receivers in AndroidManifest.xml.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY_INSTAGRAM)

    execute {
        val manifestFile = get("AndroidManifest.xml")
        if (!manifestFile.exists()) {
            println("[Instagram Telemetry] AndroidManifest.xml not found - skipping manifest purge.")
            return@execute
        }

        val blockedPermissions = setOf(
            "com.google.android.gms.permission.AD_ID",
            "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
            "android.permission.ACCESS_ADSERVICES_AD_ID",
            "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
            "android.permission.ACCESS_ADSERVICES_TOPICS",
            "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
        )

        val blockedComponents = setOf(
            // Providers
            "com.instagram.common.analytics.fdidlite.AsyncInstagramFDIDLiteProvider",
            "com.instagram.common.analytics.phoneid.AsyncInstagramPhoneIdProvider",
            "com.instagram.contentprovider.InstallReferrerProvider",

            // Services
            "com.facebook.analytics2.fabric.onefabric.FFAlarmUploadJobService",
            "com.facebook.analytics2.logger.GooglePlayUploadService",
            "com.facebook.analytics2.logger.legacy.uploader.AlarmBasedUploadService",
            "com.facebook.analytics2.logger.legacy.uploader.Analytics2UploadService",
            "com.facebook.analytics2.logger.legacy.uploader.LollipopUploadService",
            "com.facebook.analytics2.logger.service.LollipopUploadSafeService",
            "com.google.android.datatransport.runtime.backends.TransportBackendDiscovery",
            "com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService",
            "com.google.android.gms.analytics.AnalyticsJobService",
            "com.google.android.gms.analytics.AnalyticsService",
            "com.meta.mfa.service.MfaCrossAppServiceImpl",
            "com.meta.trusteddevice.service.TrustedDeviceFoundationServiceImpl",
            "com.meta.wearable.acdc.sdk.service.ACDCRegistrationService",

            // Receivers
            "com.facebook.analytics2.fabric.onefabric.OneFabricUploadAlarmReceiver",
            "com.facebook.analytics2.logger.legacy.uploader.HighPriUploadRetryReceiver",
            "com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver",
            "com.google.android.gms.analytics.AnalyticsReceiver",
            "com.instagram.analytics.uploadscheduler.AnalyticsUploadAlarmReceiver",
            "com.instagram.common.analytics.phoneid.InstagramPhoneIdRequestReceiver",
        )

        var removedPermissions = 0
        var disabledComponents = 0

        document(manifestFile.absolutePath).use { doc ->
            val application = doc.documentElement.getElementsByTagName("application").item(0) as? org.w3c.dom.Element

            // 1. Remove permissions
            removedPermissions = doc.documentElement.stripPermissionsWhere { it in blockedPermissions }.size

            if (application != null) {
                // 2. Disable blocked components
                disabledComponents = application.disableComponentsByName(*blockedComponents.toTypedArray())
            }
        }

        println("[Instagram Telemetry] Stripped $removedPermissions permissions and disabled $disabledComponents tracking components in AndroidManifest.xml.")
    }
}

@Suppress("unused")
val instagramBlockTelemetryPatch = bytecodePatch(
    name = "Block Telemetry & Trackers",
    description = "Neutralizes Facebook Analytics2, DataTransport, FDID/PhoneId providers, and strips AD_ID permissions.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_INSTAGRAM)
    dependsOn(instagramTelemetryResourcePatch)

    execute {
        val hookedMethods = mutableListOf<String>()

        Fingerprint(
            definingClass = "Lcom/instagram/analytics/analytics2/IgAnalytics2TaskBasedUploader;",
            name = "HlU",
            parameters = listOf("LX/0mQV;", "LX/0VWx;", "LX/08qB;"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("IgAnalytics2TaskBasedUploader.HlU")
        }

        Fingerprint(
            definingClass = "Lcom/instagram/analytics/analytics2/IGAnalytics2SimpleUploader;",
            name = "HlU",
            parameters = listOf("LX/0mQV;", "LX/0VWx;", "LX/08qB;"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("IGAnalytics2SimpleUploader.HlU")
        }

        Fingerprint(
            definingClass = "Lcom/facebook/analytics2/logger/legacy/uploader/PrivacyControlledUploader;",
            name = "HlU",
            parameters = listOf("LX/0mQV;", "LX/0VWx;", "LX/08qB;"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("PrivacyControlledUploader.HlU")
        }

        println("[Instagram Telemetry] Neutralized ${hookedMethods.size} telemetry dispatch methods: ${hookedMethods.joinToString(", ")}.")
    }
}
