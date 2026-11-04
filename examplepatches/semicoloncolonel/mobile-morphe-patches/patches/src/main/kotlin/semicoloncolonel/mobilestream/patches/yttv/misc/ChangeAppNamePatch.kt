package semicoloncolonel.mobilestream.patches.yttv.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.yttv.shared.Constants

// GmsCore support installs the patched app beside the stock one, and both
// show "YouTube TV" on the home screen. This sets the application's label
// and the label of every launcher entry to the chosen name.

private const val LAUNCHER = "android.intent.category.LAUNCHER"
private const val DEFAULT_NAME = "YT TV+"

private fun Element.isLauncher(): Boolean {
    val categories = getElementsByTagName("category")
    for (i in 0 until categories.length) {
        if ((categories.item(i) as Element).getAttribute("android:name") == LAUNCHER) return true
    }
    return false
}

@Suppress("unused")
val changeAppNamePatch = resourcePatch(
    name = "Change app name",
    description = "Renames the app on the home screen, so the patched app is easy to tell apart from " +
        "the stock app.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    val appName by stringOption(
        key = "appName",
        default = DEFAULT_NAME,
        values = mapOf(
            DEFAULT_NAME to DEFAULT_NAME,
            "YT TV Plus" to "YT TV Plus",
            "YouTube TV" to "YouTube TV",
            "YTTV" to "YTTV",
        ),
        title = "App name",
        description = "The name shown under the app's icon.",
        required = true,
    ) { !it.isNullOrBlank() }

    execute {
        val name = appName!!.trim()
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            application.setAttribute("android:label", name)

            var launchers = 0
            for (tag in listOf("activity", "activity-alias")) {
                val entries = application.getElementsByTagName(tag)
                for (i in 0 until entries.length) {
                    val entry = entries.item(i) as Element
                    if (entry.isLauncher()) {
                        entry.setAttribute("android:label", name)
                        launchers++
                    }
                }
            }
            if (launchers == 0) throw PatchException("No launcher entry found")
        }
    }
}
