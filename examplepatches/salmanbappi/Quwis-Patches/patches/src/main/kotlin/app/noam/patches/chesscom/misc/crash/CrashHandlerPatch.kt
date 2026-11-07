package app.noam.patches.chesscom.misc.crash

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val CRASH_ACTIVITY = "app.noam.extension.chesscom.crash.CrashActivity"

private val crashHandlerResourcePatch = resourcePatch(
    description = "Adds the crash screen to the app.",
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("The manifest has no application element")
            val exists = document.getElementsByTagName("activity").let { activities ->
                (0 until activities.length).any {
                    (activities.item(it) as Element).getAttributeNS(ANDROID_NAMESPACE, "name") == CRASH_ACTIVITY
                }
            }
            if (exists) return@use

            application.appendChild(
                document.createElement("activity").apply {
                    setAttributeNS(ANDROID_NAMESPACE, "android:name", CRASH_ACTIVITY)
                    setAttributeNS(ANDROID_NAMESPACE, "android:exported", "false")
                    setAttributeNS(ANDROID_NAMESPACE, "android:theme", "@android:style/Theme.Material.NoActionBar")
                },
            )
        }
    }
}

/**
 * The extension installs the handler from MainApplication.onCreate; this patch only switches it on
 * and puts its screen in the manifest, so it can be left out.
 */
@Suppress("unused")
val crashHandlerPatch = bytecodePatch(
    name = "Global Crash Handler",
    description = "Catches uncaught exceptions and displays a custom crash screen with details to report issues.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch, crashHandlerResourcePatch)

    execute {
        markFeaturePatched("crashPatched")
    }
}
