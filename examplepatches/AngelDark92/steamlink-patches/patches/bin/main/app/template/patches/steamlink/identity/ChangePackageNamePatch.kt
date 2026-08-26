package app.template.patches.steamlink.identity

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Element
import org.w3c.dom.NodeList

private fun NodeList.asSequence(): Sequence<org.w3c.dom.Node> = sequence {
    for (i in 0 until length) yield(item(i))
}

@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Renames the app package so it can be installed alongside the original Steam Link. Default appends '.gxr'. Changing the package name may break features that rely on the original identity.",
    default = false,
) {
    val packageName by stringOption(
        key = "packageName",
        default = "Default",
        values = mapOf("Default" to "Default"),
        title = "Package name",
        description = "New package name, e.g. com.valvesoftware.steamlink.gxr. Leave 'Default' to append '.gxr' automatically.",
        required = true,
    ) {
        it == "Default" || it!!.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$"))
    }

    finalize {
        val original = packageMetadata.packageName
        val newName = if (packageName == "Default") "$original.gxr" else packageName!!

        if (newName == original) throw PatchException("New package name equals original: $original")

        document("AndroidManifest.xml").use { document ->
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
        }
    }
}
