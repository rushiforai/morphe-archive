package dev.alastorkaneki.morphe.patches.suno

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.folderOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import dev.alastorkaneki.morphe.patches.suno.Constants.SUNO
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.io.File
import java.util.Locale

private const val ORIGINAL_PACKAGE = "com.suno.android"
private const val DEFAULT_CLONE_PACKAGE = "com.suno.android.morphe"

private val MORPHE_ICON_DENSITIES = listOf(
    "mipmap-mdpi",
    "mipmap-hdpi",
    "mipmap-xhdpi",
    "mipmap-xxhdpi",
    "mipmap-xxxhdpi"
)

private const val MORPHE_BACKGROUND_FILE = "morphe_adaptive_background_custom.png"
private const val MORPHE_FOREGROUND_FILE = "morphe_adaptive_foreground_custom.png"
private const val EASY_ICON_FILE = "icon.png"

private const val CUSTOM_LAUNCHER = "morphe_suno_launcher"
private const val CUSTOM_BACKGROUND = "morphe_suno_adaptive_background"
private const val CUSTOM_FOREGROUND = "morphe_suno_adaptive_foreground"

private val componentTags = setOf(
    "application",
    "activity",
    "activity-alias",
    "service",
    "receiver",
    "provider",
    "instrumentation"
)

private val packageScopedAttributes = listOf(
    "android:permission",
    "android:readPermission",
    "android:writePermission",
    "android:process",
    "android:taskAffinity",
    "android:targetPackage"
)

private val extraComponentAttributes = listOf(
    "android:backupAgent",
    "android:appComponentFactory",
    "android:manageSpaceActivity",
    "android:parentActivityName",
    "android:targetActivity",
    "android:zygotePreloadName"
)

private fun Element.directChildren(tag: String): List<Element> =
    (0 until childNodes.length)
        .map { childNodes.item(it) }
        .filter { it.nodeType == Node.ELEMENT_NODE && it.nodeName == tag }
        .map { it as Element }

private fun Element.hasLauncherIntent(): Boolean =
    directChildren("intent-filter").any { filter ->
        val actions = filter.directChildren("action")
            .map { it.getAttribute("android:name") }
        val categories = filter.directChildren("category")
            .map { it.getAttribute("android:name") }

        "android.intent.action.MAIN" in actions &&
            (
                "android.intent.category.LAUNCHER" in categories ||
                    "android.intent.category.LEANBACK_LAUNCHER" in categories
                )
    }

private fun isResourceReference(value: String): Boolean =
    value.startsWith('@') || value.startsWith('?')

private fun qualifyComponentName(name: String): String = when {
    name.isBlank() || isResourceReference(name) -> name
    name.startsWith('.') -> ORIGINAL_PACKAGE + name
    '.' !in name -> "$ORIGINAL_PACKAGE.$name"
    else -> name
}

private fun rewritePackageScopedValue(value: String, replacementPackage: String): String = when {
    value == ORIGINAL_PACKAGE -> replacementPackage
    value.startsWith("$ORIGINAL_PACKAGE.") ->
        replacementPackage + value.removePrefix(ORIGINAL_PACKAGE)
    value.startsWith("$ORIGINAL_PACKAGE:") ->
        replacementPackage + value.removePrefix(ORIGINAL_PACKAGE)
    value == "\${applicationId}" -> replacementPackage
    value.startsWith("\${applicationId}.") || value.startsWith("\${applicationId}:") ->
        replacementPackage + value.removePrefix("\${applicationId}")
    else -> value
}

private fun rewriteAuthority(value: String, replacementPackage: String): String {
    val authority = value.trim()
    if (authority.isEmpty() || isResourceReference(authority)) return authority
    return when {
        authority == ORIGINAL_PACKAGE || authority.startsWith("$ORIGINAL_PACKAGE.") ->
            replacementPackage + authority.removePrefix(ORIGINAL_PACKAGE)
        authority.contains("\${applicationId}") ->
            authority.replace("\${applicationId}", replacementPackage)
        authority == replacementPackage || authority.startsWith("$replacementPackage.") ->
            authority
        else -> "$replacementPackage.$authority"
    }
}

/**
 * Static Suno cloning/branding patch.
 *
 * This patch is independent from the timestamped-lyrics exporter. When selected it always
 * gives the patched build a package ID different from stock Suno, and can also rename the
 * launcher label and replace the launcher icon.
 */
@Suppress("unused")
val sunoBrandingPatch = resourcePatch(
    name = "Customize Suno branding",
    description =
        "Clones Suno to a different package name, with optional app-name and launcher-icon customization. " +
            "Accepts Morphe's adaptive custom-icon folder layout or a simple icon.png folder.",
    default = false
) {
    compatibleWith(SUNO)

    val customName by stringOption(
        key = "customName",
        title = "App name",
        description = "Optional replacement name shown by Android for the patched Suno app."
    )

    val customPackageName by stringOption(
        key = "customPackageName",
        default = DEFAULT_CLONE_PACKAGE,
        title = "Package name",
        description =
            "Android package ID for the patched Suno clone. It must differ from $ORIGINAL_PACKAGE.",
        required = true
    ) {
        !it.isNullOrBlank() &&
            it != ORIGINAL_PACKAGE &&
            it.matches(Regex("^[a-z][a-z0-9_]*(\\.[a-z][a-z0-9_]*)+$"))
    }

    val customIcon by folderOption(
        key = "customIcon",
        title = "Custom icon",
        description = """
            Optional folder containing the launcher icon.

            Easy layout:
            - icon.png

            Morphe adaptive layout:
            - mipmap-mdpi/$MORPHE_BACKGROUND_FILE
            - mipmap-mdpi/$MORPHE_FOREGROUND_FILE
            - mipmap-hdpi/$MORPHE_BACKGROUND_FILE
            - mipmap-hdpi/$MORPHE_FOREGROUND_FILE
            - mipmap-xhdpi/$MORPHE_BACKGROUND_FILE
            - mipmap-xhdpi/$MORPHE_FOREGROUND_FILE
            - mipmap-xxhdpi/$MORPHE_BACKGROUND_FILE
            - mipmap-xxhdpi/$MORPHE_FOREGROUND_FILE
            - mipmap-xxxhdpi/$MORPHE_BACKGROUND_FILE
            - mipmap-xxxhdpi/$MORPHE_FOREGROUND_FILE

            You may provide only the density folders you need, but each provided density
            must contain both the background and foreground image.
        """.trimIndent()
    )

    execute {
        val nameWasProvided = customName != null
        val resolvedName = customName?.trim()
        if (nameWasProvided && resolvedName.isNullOrEmpty()) {
            throw PatchException("Custom Suno app name cannot be blank.")
        }

        var iconReference: String? = null

        customIcon?.trim()?.takeIf { it.isNotEmpty() }?.let { rawPath ->
            val iconFolder = File(rawPath)
            if (!iconFolder.exists()) {
                throw PatchException(
                    "The custom Suno icon folder cannot be found: ${iconFolder.absolutePath}"
                )
            }
            if (!iconFolder.isDirectory) {
                throw PatchException(
                    "The custom Suno icon path must be a folder: ${iconFolder.absolutePath}"
                )
            }

            val easyIcon = iconFolder.resolve(EASY_ICON_FILE)
            if (easyIcon.isFile) {
                val output = get("res/mipmap-nodpi/$CUSTOM_LAUNCHER.png")
                output.parentFile.mkdirs()
                easyIcon.copyTo(output, overwrite = true)
                iconReference = "@mipmap/$CUSTOM_LAUNCHER"
            } else {
                var copiedAdaptivePair = false

                MORPHE_ICON_DENSITIES.forEach { density ->
                    val sourceDirectory = iconFolder.resolve(density)
                    if (!sourceDirectory.isDirectory) return@forEach

                    val background = sourceDirectory.resolve(MORPHE_BACKGROUND_FILE)
                    val foreground = sourceDirectory.resolve(MORPHE_FOREGROUND_FILE)
                    val hasBackground = background.isFile
                    val hasForeground = foreground.isFile

                    if (hasBackground != hasForeground) {
                        throw PatchException(
                            "$density must contain both $MORPHE_BACKGROUND_FILE and " +
                                "$MORPHE_FOREGROUND_FILE."
                        )
                    }
                    if (!hasBackground) return@forEach

                    val targetDirectory = get("res/$density")
                    targetDirectory.mkdirs()
                    background.copyTo(
                        targetDirectory.resolve("$CUSTOM_BACKGROUND.png"),
                        overwrite = true
                    )
                    foreground.copyTo(
                        targetDirectory.resolve("$CUSTOM_FOREGROUND.png"),
                        overwrite = true
                    )
                    copiedAdaptivePair = true
                }

                if (!copiedAdaptivePair) {
                    throw PatchException(
                        "Custom Suno icon folder must contain icon.png or at least one " +
                            "complete Morphe adaptive-icon density folder."
                    )
                }

                val legacyXml = get("res/mipmap-anydpi/$CUSTOM_LAUNCHER.xml")
                legacyXml.parentFile.mkdirs()
                legacyXml.writeText(
                    """<?xml version="1.0" encoding="utf-8"?>
                        |<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
                        |    <item android:drawable="@mipmap/$CUSTOM_BACKGROUND" />
                        |    <item android:drawable="@mipmap/$CUSTOM_FOREGROUND" />
                        |</layer-list>
                    """.trimMargin()
                )

                val adaptiveXml = get("res/mipmap-anydpi-v26/$CUSTOM_LAUNCHER.xml")
                adaptiveXml.parentFile.mkdirs()
                adaptiveXml.writeText(
                    """<?xml version="1.0" encoding="utf-8"?>
                        |<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
                        |    <background android:drawable="@mipmap/$CUSTOM_BACKGROUND" />
                        |    <foreground android:drawable="@mipmap/$CUSTOM_FOREGROUND" />
                        |</adaptive-icon>
                    """.trimMargin()
                )

                iconReference = "@mipmap/$CUSTOM_LAUNCHER"
            }
        }

        document("AndroidManifest.xml").use { document ->
            val application =
                document.getElementsByTagName("application").item(0) as? Element
                    ?: throw PatchException("Suno application manifest element was not found.")

            if (resolvedName != null) {
                application.setAttribute("android:label", resolvedName)
            }

            if (iconReference != null) {
                application.setAttribute("android:icon", iconReference!!)
                application.setAttribute("android:roundIcon", iconReference!!)
            }

            sequenceOf("activity", "activity-alias")
                .flatMap { tag -> application.directChildren(tag).asSequence() }
                .filter { it.hasLauncherIntent() }
                .forEach { launcher ->
                    if (resolvedName != null) {
                        launcher.setAttribute("android:label", resolvedName)
                    }
                    if (iconReference != null) {
                        launcher.setAttribute("android:icon", iconReference!!)
                    }
                }
        }
    }

    finalize {
        val replacementPackage = requireNotNull(customPackageName)
            .trim()
            .lowercase(Locale.US)
        val authorityStringResources = mutableSetOf<String>()

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val allElements = document.getElementsByTagName("*")

            // A clone signed with a different key cannot share the stock app's shared UID.
            listOf(
                "android:sharedUserId",
                "android:sharedUserLabel",
                "android:sharedUserMaxSdkVersion"
            ).forEach(manifest::removeAttribute)

            for (index in 0 until allElements.length) {
                val element = allElements.item(index) as Element

                // Relative Android component names are resolved against the manifest package.
                // Qualify them against stock Suno before changing that package ID.
                if (element.tagName in componentTags &&
                    element.hasAttribute("android:name")) {
                    val name = element.getAttribute("android:name")
                    if (name.isNotBlank()) {
                        element.setAttribute("android:name", qualifyComponentName(name))
                    }
                }

                extraComponentAttributes.forEach { attribute ->
                    if (!element.hasAttribute(attribute)) return@forEach
                    val name = element.getAttribute(attribute)
                    if (name.isNotBlank()) {
                        element.setAttribute(attribute, qualifyComponentName(name))
                    }
                }

                packageScopedAttributes.forEach { attribute ->
                    if (!element.hasAttribute(attribute)) return@forEach
                    element.setAttribute(
                        attribute,
                        rewritePackageScopedValue(
                            element.getAttribute(attribute),
                            replacementPackage
                        )
                    )
                }

                if (element.tagName in setOf(
                        "permission",
                        "permission-group",
                        "permission-tree",
                        "uses-permission",
                        "uses-permission-sdk-23"
                    ) && element.hasAttribute("android:name")) {
                    element.setAttribute(
                        "android:name",
                        rewritePackageScopedValue(
                            element.getAttribute("android:name"),
                            replacementPackage
                        )
                    )
                }

                if (element.hasAttribute("android:authorities")) {
                    val rewritten = element.getAttribute("android:authorities")
                        .split(';')
                        .map { authority ->
                            if (authority.startsWith("@string/")) {
                                authorityStringResources += authority.removePrefix("@string/")
                            }
                            rewriteAuthority(authority, replacementPackage)
                        }
                    element.setAttribute("android:authorities", rewritten.joinToString(";"))
                }
            }

            manifest.setAttribute("package", replacementPackage)
        }

        if (authorityStringResources.isNotEmpty()) {
            runCatching {
                document("res/values/strings.xml").use { document ->
                    val children = document.documentElement.childNodes
                    for (index in 0 until children.length) {
                        val element = children.item(index) as? Element ?: continue
                        if (element.getAttribute("name") !in authorityStringResources) continue
                        element.textContent = rewriteAuthority(
                            element.textContent,
                            replacementPackage
                        )
                    }
                }
            }
        }
    }
}
