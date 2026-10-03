package app.morphe.patches.all.misc.ui

import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.adoptChild
import app.morphe.util.findElementByAttributeValue
import app.morphe.util.findElementByAttributeValueOrThrow

fun addToHomeScreenPatch(
    launcher: Boolean = true,
    leanbackLauncher: Boolean = true,
) = resourcePatch {
    val categories = mapOf(
        "android.intent.category.LAUNCHER" to launcher,
        "android.intent.category.LEANBACK_LAUNCHER" to leanbackLauncher,
    )

    execute {
        document("AndroidManifest.xml").use { document ->
            val intentFilter = document.childNodes.findElementByAttributeValueOrThrow(
                "android:name", "android.intent.action.MAIN"
            ).parentNode

            categories.filterValues { it }.keys.forEach {
                intentFilter.childNodes.findElementByAttributeValue(
                    "android:name", it
                ) ?: run {
                    intentFilter.adoptChild("category") {
                        setAttribute("android:name", it)
                    }
                }
            }
        }
    }
}