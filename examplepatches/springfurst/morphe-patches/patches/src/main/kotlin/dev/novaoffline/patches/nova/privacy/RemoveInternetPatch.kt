package dev.novaoffline.patches.nova.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import dev.novaoffline.patches.nova.shared.Constants.NOVA_LAUNCHER
import org.w3c.dom.Element

/** Permissions that exist only for ads, install attribution, or licence checks. */
private val PERMISSIONS_TO_REMOVE = listOf(
    "android.permission.INTERNET",
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "BIND_GET_INSTALL_REFERRER_SERVICE",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
    "com.android.vending.CHECK_LICENSE",
)

/** Components that only serve ads, Branch search, or push telemetry. */
private val COMPONENTS_TO_DISABLE = listOf(
    "io.branch.search.internal.multiprocess.BranchSearchService",
    "io.branch.search.internal.services.stub.android.AndroidBundleUpdateService",
    "io.branch.search.internal.rawsqlite.SQLUpdaterService",
    "io.branch.search.internal.services.stub.android.AndroidScheduledQueryService",
    "io.branch.search.internal.services.stub.android.AndroidCacheUpdateService",
    "io.branch.search.internal.services.stub.android.AndroidPingService",
    "io.branch.search.internal.rawsqlite.BundleUpdateService",
    "io.branch.search.internal.services.ScheduledQueryService",
    "io.branch.search.internal.services.CacheUpdateService",
    "io.branch.search.internal.services.PingService",
    "io.branch.search.internal.multiprocess.BncContentProvider",
    "io.branch.search.internal.multiprocess.UserAgentProvider",
    "io.branch.search.internal.control.BranchAdbProvider",
    "com.facebook.ads.AudienceNetworkContentProvider",
    "com.teslacoilsw.launcher.analytics.NovaFcmService",
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
    "com.google.firebase.messaging.FirebaseMessagingService",
    "com.google.firebase.iid.FirebaseInstanceIdReceiver",
)

@Suppress("unused")
val removeInternetPatch = resourcePatch(
    name = "Remove internet & tracking permissions",
    description = "Removes the INTERNET permission (OS-enforced offline mode: the core " +
        "launcher — home, drawer, gestures, widgets, local backup/restore, local search — " +
        "keeps working; weather, Nova Now promo cards, Sesame integrations, Nova AI and " +
        "update checks simply stay empty) plus ad-tracking permissions (Ad ID, install " +
        "referrer, licence check), and disables Branch Search, Audience Network, FCM and " +
        "GMS measurement components.",
    default = true,
) {
    compatibleWith(NOVA_LAUNCHER)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement

            // Remove uses-permission entries.
            val usesPermissions = manifest.getElementsByTagName("uses-permission")
            val toRemove = (0 until usesPermissions.length).mapNotNull { index ->
                val element = usesPermissions.item(index) as? Element ?: return@mapNotNull null
                element.takeIf { it.getAttribute("android:name") in PERMISSIONS_TO_REMOVE }
            }
            if (toRemove.isEmpty()) {
                throw PatchException(
                    "Nova Launcher: no removable uses-permission entries found in AndroidManifest.xml",
                )
            }
            toRemove.forEach { it.parentNode.removeChild(it) }

            // Disable ad / Branch / push components.
            val tags = listOf("service", "provider", "receiver", "activity")
            var disabled = 0
            for (tag in tags) {
                val elements = manifest.getElementsByTagName(tag)
                for (index in 0 until elements.length) {
                    val element = elements.item(index) as? Element ?: continue
                    if (element.getAttribute("android:name") in COMPONENTS_TO_DISABLE) {
                        element.setAttribute("android:enabled", "false")
                        disabled++
                    }
                }
            }
            if (disabled == 0) {
                throw PatchException(
                    "Nova Launcher: no Branch/ad/FCM components found in AndroidManifest.xml",
                )
            }
        }
    }
}
