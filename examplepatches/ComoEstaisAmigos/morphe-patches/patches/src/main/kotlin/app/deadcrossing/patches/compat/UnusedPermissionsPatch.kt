package app.deadcrossing.patches.compat

import app.deadcrossing.patches.shared.Constants.COMPATIBILITY
import app.adebisi.patches.shared.removeMetaData
import app.adebisi.patches.shared.removeUnusedNamedEntries
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import org.w3c.dom.Document

/**
 * Push-ad receivers and the Analytics receiver that fire on their own. Youmi's activity is
 * already dropped by [emptyYoumiSdksPatch]. Mobclix has no classes in this APK, only a
 * leftover activity. Billing and the game activity stay.
 */
internal val REMOVED_COMPONENTS = listOf(
    "receiver" to "com.feelingtouch.bannerad.pushAd.PushAdReceiver",
    "receiver" to "com.feelingtouch.bannerad.pushAd.PushAdClickReceiver",
    "receiver" to "com.google.android.apps.analytics.AnalyticsReceiver",
    "service" to "com.feelingtouch.bannerad.pushAd.PushAdService",
    "activity" to "com.mobclix.android.sdk.MobclixBrowserActivity",
)

internal val REMOVED_META = listOf(
    "com.mobclix.APPLICATION_ID",
)

/**
 * Phone and wifi are the ad/tracker identifiers. The rest stay because the game still
 * names them: UnityPlayer uses WAKE_LOCK, VIBRATE, WRITE_EXTERNAL_STORAGE and
 * ACCESS_NETWORK_STATE (`getInternetReachability`); IOUtil writes `/sdcard/.ftbackup`
 * through WRITE_EXTERNAL_STORAGE; INTERNET and BILLING stay for Play billing.
 */
internal val REMOVED_PERMISSIONS = listOf(
    "android.permission.READ_PHONE_STATE",
    "android.permission.ACCESS_WIFI_STATE",
)

/**
 * Removes [REMOVED_COMPONENTS] and every uses-permission in [REMOVED_PERMISSIONS].
 * Every one of them must be there, or the manifest is refused, not half edited.
 */
internal fun removeUnusedEntries(document: Document) {
    val wanted = REMOVED_COMPONENTS + REMOVED_PERMISSIONS.map { "uses-permission" to it }
    removeUnusedNamedEntries(document, wanted)
}

@Suppress("unused")
val unusedPermissionsPatch = patch(
    name = "Remove unused permissions",
    description = "Removes permissions the game no longer needs, such as phone and accounts, " +
        "along with the dead services that needed them.",
) {
    compatibleWith(COMPATIBILITY)
    dependsOn(emptyYoumiSdksPatch)

    execute {
        document("AndroidManifest.xml").use { document ->
            removeUnusedEntries(document)
            removeMetaData(document, REMOVED_META)
        }
    }
}
