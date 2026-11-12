package app.template.patches.all.clone

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element
import org.w3c.dom.NodeList
import java.util.logging.Logger

/**
 * Universal clone patch (Morphe-style), clone number 1–50.
 *
 * - New package: original.package.cloneN  (e.g. com.example.app.clone3)
 * - Display name: "App name N"
 * - On update: re-apply the same clone number N on the new APK;
 *   same package means Android treats it as an update of that clone.
 *
 * Does not build 50 APKs at once: in the Manager pick a number (1–50)
 * and apply once per clone you want to install.
 */
@Suppress("unused")
val cloneAppPatch = resourcePatch(
    name = "Clone app",
    description = "Installs the app as a numbered clone." +
        "Pick a clone number (1–50). Each number is a different package " +
        "(app.clone1, app.clone2…). On update, re-apply the same number on each clone.",
    default = false,
) {
    val cloneNumberOption = stringOption(
        key = "cloneNumber",
        default = "1",
        values = (1..50).associate { n -> n.toString() to n.toString() },
        title = "Clone number",
        description = "Clone number (1 to 50). Package becomes original.cloneN and the label becomes \"App N\".",
        required = true,
    ) { value ->
        val n = value?.toIntOrNull()
        n != null && n in 1..50
    }

    val customPackageOption = stringOption(
        key = "customPackageName",
        default = "",
        title = "Custom package (optional)",
        description = "Leave empty to use original.package.cloneN. " +
            "If set, that exact package is used (must be unique per clone).",
        required = false,
    ) { value ->
        value.isNullOrBlank() || value.matches(Regex("^[a-z]\\w*(\\.[a-zA-Z0-9_]+)+$"))
    }

    val updatePermissionsOption = booleanOption(
        key = "updatePermissions",
        default = true,
        title = "Update permissions",
        description = "Renames app-owned permission names to avoid conflicts when installing several clones.",
    )

    val updateProvidersOption = booleanOption(
        key = "updateProviders",
        default = true,
        title = "Update providers",
        description = "Changes ContentProvider authorities to avoid conflicts between clones.",
    )

    finalize {
        val originalPackage = packageMetadata.packageName
        val cloneNumber = cloneNumberOption.value!!.toInt()
        val custom = customPackageOption.value?.trim().orEmpty()

        val newPackageName = if (custom.isNotEmpty()) {
            custom
        } else {
            "$originalPackage.clone$cloneNumber"
        }

        if (newPackageName == originalPackage) {
            throw IllegalArgumentException(
                "Clone package cannot match the original. Pick another number or a different package.",
            )
        }

        val applyUpdatePermissions = updatePermissionsOption.value == true
        val applyUpdateProviders = updateProvidersOption.value == true
        val suffix = " $cloneNumber"
        val stringRefs = mutableSetOf<String>()

        // --- AndroidManifest.xml: package, label, permissions, providers ---
        document("AndroidManifest.xml").use { document ->
            document.documentElement.setAttribute("package", newPackageName)

            fun processLabel(element: Element) {
                val label = element.getAttribute("android:label")
                if (label.isEmpty()) return

                when {
                    label.startsWith("@string/") -> {
                        stringRefs.add(label.removePrefix("@string/"))
                    }
                    label.startsWith("@") -> {
                        // other refs (@android:…); leave alone
                    }
                    else -> {
                        if (!label.endsWith(suffix)) {
                            element.setAttribute("android:label", label + suffix)
                        }
                    }
                }
            }

            forEachElement(document.getElementsByTagName("application"), ::processLabel)
            forEachElement(document.getElementsByTagName("activity"), ::processLabel)
            forEachElement(document.getElementsByTagName("activity-alias"), ::processLabel)

            if (applyUpdatePermissions) {
                val permissions = document.getElementsByTagName("permission")
                val usesPermissions = document.getElementsByTagName("uses-permission")

                forEachElement(permissions) { perm ->
                    val oldName = perm.getAttribute("android:name")
                    if (oldName.isEmpty() || oldName.startsWith('.')) return@forEachElement

                    val newName = when {
                        oldName.startsWith("$originalPackage.") ->
                            oldName.replaceFirst(originalPackage, newPackageName)
                        else -> "${newPackageName}_$oldName"
                    }
                    perm.setAttribute("android:name", newName)

                    forEachElement(usesPermissions) { uses ->
                        if (uses.getAttribute("android:name") == oldName) {
                            uses.setAttribute("android:name", newName)
                        }
                    }
                }
            }

            if (applyUpdateProviders) {
                forEachElement(document.getElementsByTagName("provider")) { provider ->
                    val authorities = provider.getAttribute("android:authorities")
                    if (authorities.isEmpty()) return@forEachElement

                    val newAuthorities = authorities.split(';').joinToString(";") { auth ->
                        when {
                            auth.startsWith("$originalPackage.") ->
                                auth.replaceFirst(originalPackage, newPackageName)
                            auth.startsWith('@') -> auth
                            else -> "${newPackageName}_$auth"
                        }
                    }
                    provider.setAttribute("android:authorities", newAuthorities)
                }
            }
        }

        // If label had no @string/, try app_name as usual
        if (stringRefs.isEmpty()) {
            stringRefs.add("app_name")
        }

        // --- strings.xml: append " N" to those name strings ---
        val stringFiles = listOf(
            "res/values/strings.xml",
            "res/values-en/strings.xml",
            "res/values-es/strings.xml",
        )
        for (path in stringFiles) {
            try {
                document(path).use { document ->
                    forEachElement(document.getElementsByTagName("string")) { str ->
                        val name = str.getAttribute("name")
                        if (name in stringRefs) {
                            val text = str.textContent ?: return@forEachElement
                            if (!text.endsWith(suffix)) {
                                str.textContent = text + suffix
                            }
                        }
                    }
                }
            } catch (_: Exception) {
                // file may not exist
            }
        }

        Logger.getLogger(this::class.java.name).info(
            "Clone $cloneNumber ready. Package: $newPackageName. " +
                "For more clones, apply the patch again with another number (1–50).",
        )
    }
}

/** Walks a NodeList and runs the block on each Element. */
private inline fun forEachElement(list: NodeList, block: (Element) -> Unit) {
    var i = 0
    val n = list.length
    while (i < n) {
        val node = list.item(i)
        if (node is Element) block(node)
        i++
    }
}
