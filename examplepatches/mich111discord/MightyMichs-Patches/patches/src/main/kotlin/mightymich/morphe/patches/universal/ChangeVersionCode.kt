package mightymich.morphe.patches.universal

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

/**
 * Universal: set android:versionCode / versionName on the manifest root.
 */
@Suppress("unused")
val changeVersionCodePatch = resourcePatch(
    name = "Change version code",
    description = "Overrides android:versionCode (and optional versionName).",
    default = false
) {
    val versionCode by stringOption(
        key = "versionCode",
        default = "999999999",
        title = "Version code",
        description = "Integer versionCode to write into the manifest."
    )

    val versionName by stringOption(
        key = "versionName",
        default = null,
        title = "Version name",
        description = "Optional versionName string."
    )

    execute {
        val code = versionCode?.trim().orEmpty()
        if (code.isEmpty()) return@execute

        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement ?: return@use
            root.setAttribute("android:versionCode", code)
            val vn = versionName?.trim()
            if (!vn.isNullOrEmpty()) {
                root.setAttribute("android:versionName", vn)
            }
        }
    }
}
