package app.aidan.patches.sezzle.dev

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

@Suppress("unused")
val enableAppDebuggingPatch = resourcePatch(
    name = "Enable App Debugging",
    description = "Marks the app debuggable so patch developers can use ADB run-as after reinstalling.",
    default = false
) {
    compatibleWith(COMPATIBILITY_SEZZLE)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("Application element not found in AndroidManifest.xml")
            application.setAttributeNS(ANDROID_NAMESPACE, "android:debuggable", "true")
        }
    }
}
