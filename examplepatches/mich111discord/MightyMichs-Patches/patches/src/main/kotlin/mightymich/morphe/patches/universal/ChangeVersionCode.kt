package mightymich.morphe.patches.universal

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

/**
 * Universal: set android:versionCode (blocks store updates / allows side-by-side tricks).
 */
@Suppress("unused")
val changeVersionCodePatch = resourcePatch(
    name = "Change version code",
    description = "Sets android:versionCode. High value can block Play Store updates.",
    default = false
) {
    val versionCode by stringOption(
        name = "Version code",
        key = "versionCode",
        default = "2147483647",
        description = "Integer versionCode to write into the manifest."
    )

    execute {
        val code = versionCode?.toIntOrNull() ?: return@execute
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement as Element
            manifest.setAttribute("android:versionCode", code.toString())
        }
    }
}
