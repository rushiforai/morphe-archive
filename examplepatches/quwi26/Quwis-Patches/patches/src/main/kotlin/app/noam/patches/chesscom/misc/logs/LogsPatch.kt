package app.noam.patches.chesscom.misc.logs

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val LOGS_ACTIVITY = "app.noam.extension.chesscom.logs.LogsActivity"

private val appLogsResourcePatch = patch(
    description = "Adds the log screen to the app.",
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("The manifest has no application element")
            val exists = document.getElementsByTagName("activity").let { activities ->
                (0 until activities.length).any {
                    (activities.item(it) as Element).getAttributeNS(ANDROID_NAMESPACE, "name") == LOGS_ACTIVITY
                }
            }
            if (exists) return@use

            application.appendChild(
                document.createElement("activity").apply {
                    setAttributeNS(ANDROID_NAMESPACE, "android:name", LOGS_ACTIVITY)
                    setAttributeNS(ANDROID_NAMESPACE, "android:exported", "false")
                    setAttributeNS(ANDROID_NAMESPACE, "android:theme", "@android:style/Theme.Material.NoActionBar")
                },
            )
        }
    }
}

/**
 * The extension keeps the app's own logcat entries in a small rotating file from
 * MainApplication.onCreate; this patch switches that on and puts the log screen in the manifest.
 */
@Suppress("unused")
val appLogsPatch = bytecodePatch(
    name = "App logs",
    description = "Keeps the app's recent logs on this phone and shows them in Quwi's Patches, " +
        "so a bug report can include what happened before the app restarted. " +
        "The log screen does not work with root mounting.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch, appLogsResourcePatch)

    execute {
        markFeaturePatched("logsPatched")
    }
}
