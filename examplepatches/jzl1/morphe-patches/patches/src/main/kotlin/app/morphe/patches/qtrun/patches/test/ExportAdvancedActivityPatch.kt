package lab.qtrun.patches.test

import app.morphe.patcher.patch.resourcePatch
import lab.qtrun.patches.shared.COMPATIBILITY_QUICKTEST

/**
 * Test-only helper: adds `android:exported="true"` to `AdvancedActivity` so the
 * license marker can be inspected with:
 *
 *   adb shell am start -n com.qtrun.QuickTest/com.qtrun.nsg.AdvancedActivity
 *
 * Disabled by default; not required for normal use.
 */
@Suppress("unused")
val exportAdvancedActivityTestPatch = resourcePatch(
    name = "Export AdvancedActivity (test only)",
    description = "Marks AdvancedActivity as exported for adb-based license-state verification. " +
            "Disabled by default; not needed for normal use.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_QUICKTEST)

    execute {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")
            for (index in 0 until activities.length) {
                val activity = activities.item(index) as? org.w3c.dom.Element ?: continue
                if (activity.getAttribute("android:name") == "com.qtrun.nsg.AdvancedActivity") {
                    activity.setAttribute("android:exported", "true")
                }
            }
        }
    }
}
