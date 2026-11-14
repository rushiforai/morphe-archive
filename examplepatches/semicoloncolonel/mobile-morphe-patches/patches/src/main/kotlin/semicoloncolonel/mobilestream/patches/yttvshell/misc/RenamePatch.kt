package semicoloncolonel.mobilestream.patches.yttvshell.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val FROM_PACKAGE_NAME = "com.google.android.youtube.tv"
private const val TO_PACKAGE_NAME = "app.morphe.android.youtube.tv"
private const val APP_NAME = "YT TV+"
private const val LAUNCHER = "android.intent.category.LAUNCHER"

private fun Element.isLauncher(): Boolean {
    val categories = getElementsByTagName("category")
    for (i in 0 until categories.length) {
        if ((categories.item(i) as Element).getAttribute("android:name") == LAUNCHER) return true
    }
    return false
}

// Installs the patched app beside the stock YouTube for Android TV instead of replacing it, by
// renaming its package (and the provider authorities and permissions that are derived from it),
// and labels it "YT TV+". The manifest-rename approach is the same as the repo's GmsCore support
// resource patch, but without the GmsCore/microG metadata: YouTube TV signs in with an activation
// code (tv.youtube.com/start), which needs no Google Play services. A dependency of Skip ads.
val renamePatch = resourcePatch {
    execute {
        // Text replacements on the raw manifest rename the package and everything derived from it.
        val transformations = mapOf(
            "package=\"$FROM_PACKAGE_NAME\"" to "package=\"$TO_PACKAGE_NAME\"",
            "android:authorities=\"$FROM_PACKAGE_NAME" to "android:authorities=\"$TO_PACKAGE_NAME",
            "$FROM_PACKAGE_NAME.permission." to "$TO_PACKAGE_NAME.permission.",
            "$FROM_PACKAGE_NAME.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION" to
                "$TO_PACKAGE_NAME.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",
        )
        val manifest = get("AndroidManifest.xml")
        manifest.writeText(
            transformations.entries.fold(manifest.readText()) { text, (from, to) -> text.replace(from, to) },
        )

        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement
            if (root.getAttribute("package") != TO_PACKAGE_NAME) {
                throw PatchException("Manifest package was not renamed")
            }

            // Label the app and every launcher entry "YT TV+".
            val application = document.getElementsByTagName("application").item(0) as Element
            application.setAttribute("android:label", APP_NAME)
            var launchers = 0
            for (tag in listOf("activity", "activity-alias")) {
                val entries = application.getElementsByTagName(tag)
                for (i in 0 until entries.length) {
                    val entry = entries.item(i) as Element
                    if (entry.isLauncher()) {
                        entry.setAttribute("android:label", APP_NAME)
                        launchers++
                    }
                }
            }
            if (launchers == 0) throw PatchException("No launcher entry found")
        }
    }
}
