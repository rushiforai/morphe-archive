package mightymich.morphe.patches.universal

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

/**
 * Universal: rewrite package attribute in AndroidManifest (best-effort).
 * May break providers / permissions that hardcode the original package.
 */
@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Rewrites the manifest package attribute (experimental).",
    default = false
) {
    val packageName by stringOption(
        key = "packageName",
        default = null,
        title = "Package name",
        description = "New package name, e.g. com.example.patched"
    )

    execute {
        val pkg = packageName?.trim().orEmpty()
        if (pkg.isEmpty()) return@execute

        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement ?: return@use
            if (root.hasAttribute("package")) {
                root.setAttribute("package", pkg)
            }
        }
    }
}
