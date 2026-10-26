package app.sqzass.patches.all.heavy

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.sqzass.patches.shared.PERMISSION_TAGS
import app.sqzass.patches.shared.collectElements
import java.util.logging.Logger

private val logger = Logger.getLogger("ChangePackageNamePatch")

private const val PACKAGE_ATTR = "package"
private const val ANDROID_NAME = "android:name"
private const val ANDROID_AUTHORITIES = "android:authorities"

private val COMPONENT_TAGS = mapOf(
    "activity" to listOf(ANDROID_NAME),
    "activity-alias" to listOf(ANDROID_NAME),
    "service" to listOf(ANDROID_NAME),
    "receiver" to listOf(ANDROID_NAME),
    "provider" to listOf(ANDROID_NAME, ANDROID_AUTHORITIES),
)

internal val newPackageOption = stringOption(
    key = "newPackageName",
    default = "com.example.renamed",
    title = "New Package Name",
    description = "Replacement package name written into the manifest and dex strings.",
    validator = { value -> value.isNullOrBlank() || value!!.matches(Regex("[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+")) },
)

private val rewriteManifestOption = booleanOption(
    key = "rewriteManifest",
    default = true,
    title = "Rewrite Manifest",
    description = "Rename the manifest package, component class names, and authorities.",
)
private val stripPermissionsOption = booleanOption(
    key = "stripPermissions",
    default = false,
    title = "Strip Permissions",
    description = "Remove uses-permission entries instead of renaming them.",
)

private fun resolveClassName(raw: String, packageName: String): String = when {
    raw.startsWith(".") -> packageName + raw
    "." !in raw -> "$packageName.$raw"
    else -> raw
}

private fun rebaseClassName(resolved: String, oldPackage: String, newPackage: String): String =
    if (resolved == oldPackage || resolved.startsWith("$oldPackage.")) {
        newPackage + resolved.removePrefix(oldPackage)
    } else {
        resolved
    }

@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Renames the app package: rewrites the manifest package, components, and authorities plus matching dex strings, and can report the original package to the app. Permissions are stripped, never renamed. Binary assets referencing the package are left untouched.",
    default = false,
) {
    category("Heavy")

    newPackageOption()
    rewriteManifestOption()
    stripPermissionsOption()

    dependsOn(changePackageNameDexPatch)

    execute {
        val newPackage = newPackageOption.value?.takeIf { it.isNotBlank() }
        if (newPackage == null) {
            logger.info("New package name missing or invalid.")
            return@execute
        }

        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement
            val oldPackage = root.getAttribute(PACKAGE_ATTR).ifEmpty { null }
            if (oldPackage == null) {
                logger.info("Manifest has no package attribute.")
                return@use
            }

            if (rewriteManifestOption.value == true) {
                root.setAttribute(PACKAGE_ATTR, newPackage)
                for ((tag, attrs) in COMPONENT_TAGS) {
                    for (element in collectElements(document, listOf(tag)) { true }) {
                        for (attr in attrs) {
                            val raw = element.getAttribute(attr).ifEmpty { continue }
                            if (attr == ANDROID_AUTHORITIES) {
                                val rebased = raw.split(";").joinToString(";") { authority ->
                                    if (authority == oldPackage || authority.startsWith("$oldPackage.")) {
                                        newPackage + authority.removePrefix(oldPackage)
                                    } else {
                                        authority
                                    }
                                }
                                element.setAttribute(attr, rebased)
                            } else {
                                element.setAttribute(
                                    attr,
                                    rebaseClassName(resolveClassName(raw, oldPackage), oldPackage, newPackage),
                                )
                            }
                        }
                    }
                }
                for (element in collectElements(document, listOf("action")) { true }) {
                    val raw = element.getAttribute(ANDROID_NAME).ifEmpty { continue }
                    if (raw == oldPackage || raw.startsWith("$oldPackage.")) {
                        element.setAttribute(ANDROID_NAME, newPackage + raw.removePrefix(oldPackage))
                    }
                }
            }

            if (stripPermissionsOption.value == true) {
                val removed = collectElements(document, PERMISSION_TAGS) { true }
                for (element in removed) {
                    element.parentNode?.removeChild(element)
                }
                if (removed.isNotEmpty()) {
                    logger.info("Stripped ${removed.size} permission entries.")
                }
            }

            logger.info("Renamed manifest package $oldPackage -> $newPackage.")
        }
    }
}
