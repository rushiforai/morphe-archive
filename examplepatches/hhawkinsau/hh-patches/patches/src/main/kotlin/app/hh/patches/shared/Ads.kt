package app.hh.patches.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext

private val AD_COMPONENTS = setOf(
    "com.google.android.gms.ads.AdActivity",
    "com.google.android.gms.ads.OutOfContextTestingActivity",
    "com.google.android.gms.ads.NotificationHandlerActivity",
    "com.google.android.gms.ads.MobileAdsInitProvider",
    "com.google.android.gms.ads.AdService",
)

private const val ADMOB_APP_ID_META = "com.google.android.gms.ads.APPLICATION_ID"

internal fun ResourcePatchContext.hideAdComponents() {
    document("AndroidManifest.xml").use { document ->
        val application = document.applicationElement()
            ?: throw PatchException("AndroidManifest.xml is missing an <application> element.")

        AD_COMPONENTS.forEach { componentName ->
            application.disableComponent(componentName)
        }
        application.removeMetaData(ADMOB_APP_ID_META)
        document.removePermissions(AD_ID_PERMISSIONS)
    }
}
