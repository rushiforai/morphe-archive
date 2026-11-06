package app.morphe.patches.cellsurvivor

import app.morphe.patches.cellsurvivor.Constants.COMPATIBILITY_CELL_SURVIVOR
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

@Suppress("unused")
val manifestPatch =
    resourcePatch(
        name = "Fix Native Libs, Debuggable & Cleanup",
        description = "Sets extractNativeLibs and debuggable to true, and removes PairIP LicenseActivity if present.",
    ) {
        compatibleWith(COMPATIBILITY_CELL_SURVIVOR)

        execute {
            document("AndroidManifest.xml").use { document ->
                val appList = document.getElementsByTagName("application")
                if (appList.length == 0) return@use
                val appElement = appList.item(0) as Element

                // Enable native libs extraction and debuggable for adb run-as
                appElement.setAttribute("android:extractNativeLibs", "true")
                appElement.setAttribute("android:debuggable", "true")

                // Remove LicenseActivity if present
                val activityList = document.getElementsByTagName("activity")
                for (i in 0 until activityList.length) {
                    val activity = activityList.item(i) as? Element ?: continue
                    val name = activity.getAttribute("android:name")
                    if (name.contains("LicenseActivity")) {
                        activity.parentNode?.removeChild(activity)
                    }
                }
            }
        }
    }
