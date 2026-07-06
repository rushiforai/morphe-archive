package ee.morphe.patches.all.manifest.clone

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.util.asSequence
import app.morphe.util.childElementsSequence
import app.morphe.util.getNode
import org.w3c.dom.Element
import java.io.File
import java.util.logging.Logger

private const val DEFAULT_OPTION_VALUE = "Default"
private val fullPackageNameRegex = Regex("^[a-z]\\w*(\\.[a-z]\\w*)+\$")
private val packagePrefixRegex = Regex("^[a-z]\\w*(\\.[a-z]\\w*)*\$")
private val packageSuffixRegex = Regex("^[A-Za-z0-9_]+\$")
private val genericPackageSegments = setOf("android", "app", "mobile", "debug", "release")

private fun String.toClonedPackageSuffix(packageSuffix: String): String {
    val segments = split('.').toMutableList()
    val targetIndex = if (segments.size >= 2) segments.lastIndex - 1 else segments.lastIndex

    segments[targetIndex] = segments[targetIndex] + packageSuffix
    return segments.joinToString(".")
}

private fun String.prependPackagePrefix(packagePrefix: String): String =
    if (packagePrefix.isBlank()) this else "$packagePrefix.$this"

private fun deriveFallbackDisplayName(packageName: String): String {
    val displaySegment = packageName.split('.')
        .asReversed()
        .firstOrNull { it.lowercase() !in genericPackageSegments }
        ?: packageName.substringAfterLast('.')

    return displaySegment
        .replace('_', ' ')
        .replaceFirstChar { if (it.isLowerCase()) it.titlecase() else it.toString() }
}

@Suppress("unused")
val cloneAppPatch = resourcePatch(
    name = "Clone app",
    description = "Renames the app and manifest package so it can be installed alongside another copy. " +
            "By default this appends \" B\" to the launcher name and appends \"B\" to the package's main segment.",
    default = false
) {
    val appName by stringOption(
        key = "appName",
        default = DEFAULT_OPTION_VALUE,
        values = mapOf(DEFAULT_OPTION_VALUE to DEFAULT_OPTION_VALUE),
        title = "App name",
        description = "The app name to use. Leave as Default to keep the original name and append the configured suffix.",
        required = true,
    ) {
        it == DEFAULT_OPTION_VALUE || !it.isNullOrBlank()
    }

    val appNameSuffix by stringOption(
        key = "appNameSuffix",
        default = " B",
        values = emptyMap<String, String>(),
        title = "App name suffix",
        description = "Suffix appended to the original app name when App name is left on Default.",
        required = true,
    ) {
        !it.isNullOrEmpty()
    }

    val packageName by stringOption(
        key = "packageName",
        default = DEFAULT_OPTION_VALUE,
        values = mapOf(DEFAULT_OPTION_VALUE to DEFAULT_OPTION_VALUE),
        title = "Package name",
        description = "Full package name to use. Leave as Default to generate one from the original package name.",
        required = true,
    ) {
        it == DEFAULT_OPTION_VALUE || (it != null && it.matches(fullPackageNameRegex))
    }

    val packageSegmentSuffix by stringOption(
        key = "packageSegmentSuffix",
        default = "B",
        values = emptyMap<String, String>(),
        title = "Package suffix",
        description = "Suffix appended to the app's main package segment when Package name is left on Default.",
        required = true,
    ) {
        it != null && it.matches(packageSuffixRegex)
    }

    val packagePrefix by stringOption(
        key = "packagePrefix",
        default = "",
        values = emptyMap<String, String>(),
        title = "Package prefix",
        description = "Optional prefix to prepend to the generated package name. Ignored when a full Package name is set.",
        required = true,
    ) {
        it != null && (it.isBlank() || it.matches(packagePrefixRegex))
    }

    finalize {
        val logger = Logger.getLogger(this::class.java.name)

        fun resolveLabelValue(
            rawLabel: String,
            originalPackageName: String,
        ): String {
            if (rawLabel.isBlank()) {
                return deriveFallbackDisplayName(originalPackageName)
            }

            if (!rawLabel.startsWith("@string/")) {
                return rawLabel
            }

            val resourceName = rawLabel.substringAfter('/')
            val resDir = get("res")

            if (resDir.exists()) {
                val resourceFiles = resDir.walkTopDown()
                    .filter { it.isFile && it.extension == "xml" && it.parentFile?.name?.startsWith("values") == true }
                    .sortedBy { if (it.parentFile.name == "values") 0 else 1 }

                for (file in resourceFiles) {
                    val value = runCatching {
                        document(file.inputStream()).use { document ->
                            document.getElementsByTagName("string")
                                .asSequence()
                                .filterIsInstance<Element>()
                                .firstOrNull { it.getAttribute("name") == resourceName }
                                ?.textContent
                                ?.trim()
                        }
                    }.getOrNull()

                    if (!value.isNullOrBlank()) {
                        return value
                    }
                }
            }

            logger.warning("Could not resolve app label resource '$rawLabel'. Falling back to a derived display name.")
            return deriveFallbackDisplayName(originalPackageName)
        }

        fun absolutizeClassName(
            originalPackageName: String,
            rawName: String,
        ): String {
            if (rawName.isBlank()) return rawName

            return when {
                rawName.startsWith('.') -> "$originalPackageName$rawName"
                '.' !in rawName -> "$originalPackageName.$rawName"
                else -> rawName
            }
        }

        fun Element.isLauncherComponent(): Boolean {
            val intentFilters = childElementsSequence().filter { it.tagName == "intent-filter" }

            for (intentFilter in intentFilters) {
                var hasMainAction = false
                var hasLauncherCategory = false

                for (child in intentFilter.childElementsSequence()) {
                    when (child.tagName) {
                        "action" -> if (child.getAttribute("android:name") == "android.intent.action.MAIN") {
                            hasMainAction = true
                        }

                        "category" -> if (child.getAttribute("android:name") == "android.intent.category.LAUNCHER") {
                            hasLauncherCategory = true
                        }
                    }
                }

                if (hasMainAction && hasLauncherCategory) {
                    return true
                }
            }

            return false
        }

        document("AndroidManifest.xml").use { document ->
            val manifest = document.getNode("manifest") as Element
            val application = document.getNode("application") as Element
            val originalPackageName = manifest.getAttribute("package")

            if (originalPackageName.isBlank()) {
                logger.warning("Could not determine the original package name. No clone changes applied.")
                return@use
            }

            val customPackageName = packageName ?: DEFAULT_OPTION_VALUE
            val generatedPackageName = originalPackageName
                .toClonedPackageSuffix(packageSegmentSuffix ?: "B")
                .prependPackagePrefix(packagePrefix ?: "")

            val newPackageName = if (customPackageName == DEFAULT_OPTION_VALUE) {
                generatedPackageName
            } else {
                customPackageName
            }

            val customAppName = appName ?: DEFAULT_OPTION_VALUE
            val newAppName = if (customAppName == DEFAULT_OPTION_VALUE) {
                resolveLabelValue(application.getAttribute("android:label"), originalPackageName) + (appNameSuffix ?: " B")
            } else {
                customAppName
            }

            val componentClassAttributes = mapOf(
                "application" to listOf("android:name", "android:backupAgent", "android:appComponentFactory"),
                "activity" to listOf("android:name", "android:parentActivityName"),
                "activity-alias" to listOf("android:name", "android:targetActivity"),
                "service" to listOf("android:name"),
                "receiver" to listOf("android:name"),
                "provider" to listOf("android:name"),
            )

            for ((tagName, attributes) in componentClassAttributes) {
                val elements = document.getElementsByTagName(tagName)
                    .asSequence()
                    .filterIsInstance<Element>()

                for (element in elements) {
                    for (attribute in attributes) {
                        if (!element.hasAttribute(attribute)) continue

                        val updatedValue = absolutizeClassName(
                            originalPackageName,
                            element.getAttribute(attribute),
                        )
                        element.setAttribute(attribute, updatedValue)
                    }
                }
            }

            val packageScopedNameTags = setOf(
                "permission",
                "permission-group",
                "permission-tree",
                "uses-permission",
                "uses-permission-sdk-23",
                "uses-permission-sdk-m",
                "protected-broadcast",
                "queries",
                "package",
            )

            val packageScopedAttributes = listOf(
                "android:authorities",
                "android:permission",
                "android:readPermission",
                "android:writePermission",
                "android:sharedUserId",
                "android:taskAffinity",
                "android:process",
            )

            val allElements = document.getElementsByTagName("*")
                .asSequence()
                .filterIsInstance<Element>()

            for (element in allElements) {
                if (packageScopedNameTags.contains(element.tagName) && element.hasAttribute("android:name")) {
                    val currentName = element.getAttribute("android:name")
                    val updatedName = when {
                        currentName == originalPackageName -> newPackageName
                        currentName.startsWith("$originalPackageName.") -> currentName.replace(originalPackageName, newPackageName)
                        else -> currentName
                    }

                    if (updatedName != currentName) {
                        element.setAttribute("android:name", updatedName)
                    }
                }

                for (attribute in packageScopedAttributes) {
                    if (!element.hasAttribute(attribute)) continue

                    val currentValue = element.getAttribute(attribute)
                    val updatedValue = when (attribute) {
                        "android:authorities" -> if (currentValue.contains(originalPackageName)) {
                            currentValue.replace(originalPackageName, newPackageName)
                        } else {
                            currentValue
                        }

                        else -> when {
                            currentValue == originalPackageName -> newPackageName
                            currentValue.startsWith("$originalPackageName.") -> currentValue.replace(originalPackageName, newPackageName)
                            else -> currentValue
                        }
                    }

                    if (updatedValue != currentValue) {
                        element.setAttribute(attribute, updatedValue)
                    }
                }
            }

            manifest.setAttribute("package", newPackageName)
            application.setAttribute("android:label", newAppName)

            document.getElementsByTagName("activity")
                .asSequence()
                .filterIsInstance<Element>()
                .filter { it.isLauncherComponent() }
                .forEach { it.setAttribute("android:label", newAppName) }

            document.getElementsByTagName("activity-alias")
                .asSequence()
                .filterIsInstance<Element>()
                .filter { it.isLauncherComponent() }
                .forEach { it.setAttribute("android:label", newAppName) }
        }
    }
}
