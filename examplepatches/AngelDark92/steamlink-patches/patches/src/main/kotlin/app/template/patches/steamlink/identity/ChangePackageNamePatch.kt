package app.template.patches.steamlink.identity

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_LEGACY
import org.w3c.dom.Element
import org.w3c.dom.NodeList
import java.util.Locale

private fun NodeList.asSequence(): Sequence<org.w3c.dom.Node> = sequence {
    for (i in 0 until length) yield(item(i))
}

private val PACKAGE_NAME_REGEX = Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")

private fun toPackageSuffixSegment(input: String): String {
    val normalized = input.lowercase(Locale.ROOT)
        .trim()
        .replace(Regex("\\s+"), "_")
        .replace(Regex("[^a-z0-9_]"), "_")
        .replace(Regex("_{2,}"), "_")
        .trim('_')
    return when {
        normalized.isEmpty() -> "gxr"
        normalized.first().isDigit() -> "x_$normalized"
        else -> normalized
    }
}

private fun Element.isLauncherActivity(): Boolean {
    val filters = getElementsByTagName("intent-filter")
    for (i in 0 until filters.length) {
        val filter = filters.item(i) as? Element ?: continue
        val hasMain = filter.getElementsByTagName("action").asSequence()
            .filterIsInstance<Element>()
            .any { it.getAttribute("android:name") == "android.intent.action.MAIN" }
        val hasLauncher = filter.getElementsByTagName("category").asSequence()
            .filterIsInstance<Element>()
            .any { it.getAttribute("android:name") == "android.intent.category.LAUNCHER" }
        if (hasMain && hasLauncher) return true
    }
    return false
}

@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Renames the app package so it can be installed alongside the original Steam Link. Default appends '.gxr'. Changing the package name may break features that rely on the original identity.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())

    val packageName by stringOption(
        key = "packageName",
        default = "Default",
        values = mapOf("Default" to "Default"),
        title = "Package name",
        description = "Accepts either a full Java package name (for example, com.valvesoftware.steamlinkvr.galaxyxr) or a display suffix (for example, Galaxy XR). Suffix input appends to app name and generates a package suffix automatically.",
        required = true,
    ) {
        it == "Default" || (it != null && it.isNotBlank())
    }

    finalize {
        val original = packageMetadata.packageName
        val selected = packageName!!
        val useExplicitPackageName = selected != "Default" && selected.matches(PACKAGE_NAME_REGEX)
        val suffixInput = if (!useExplicitPackageName && selected != "Default") selected.trim() else null
        val newName = when {
            selected == "Default" -> "$original.gxr"
            useExplicitPackageName -> selected
            else -> "$original.${toPackageSuffixSegment(selected)}"
        }

        if (newName == original) throw PatchException("New package name equals original: $original")

        document("AndroidManifest.xml").use { document ->
            // AndroidManifest.xml: manifest@package attribute (top-level package identifier)
            document.documentElement.setAttribute("package", newName)

            // Update custom permissions declared by this package.
            document.getElementsByTagName("permission").asSequence()
                .filterIsInstance<Element>()
                .forEach { el ->
                    val name = el.getAttribute("android:name")
                    if (name.startsWith("$original.")) {
                        el.setAttribute("android:name", name.replaceFirst(original, newName))
                    }
                }

            // Update uses-permission entries for custom permissions.
            document.getElementsByTagName("uses-permission").asSequence()
                .filterIsInstance<Element>()
                .forEach { el ->
                    val name = el.getAttribute("android:name")
                    if (name.startsWith("$original.")) {
                        el.setAttribute("android:name", name.replaceFirst(original, newName))
                    }
                }

            // Update content provider authorities.
            document.getElementsByTagName("provider").asSequence()
                .filterIsInstance<Element>()
                .forEach { el ->
                    val authorities = el.getAttribute("android:authorities")
                    if (authorities.contains(original)) {
                        el.setAttribute("android:authorities", authorities.replace(original, newName))
                    }
                }

            if (!suffixInput.isNullOrBlank()) {
                val displayName = "Steam Link $suffixInput"
                val app = document.documentElement.getElementsByTagName("application").item(0) as? Element
                app?.setAttribute("android:label", displayName)

                app?.getElementsByTagName("activity")?.asSequence()
                    ?.filterIsInstance<Element>()
                    ?.filter { it.isLauncherActivity() }
                    ?.forEach { it.setAttribute("android:label", displayName) }
            }
        }
    }
}
