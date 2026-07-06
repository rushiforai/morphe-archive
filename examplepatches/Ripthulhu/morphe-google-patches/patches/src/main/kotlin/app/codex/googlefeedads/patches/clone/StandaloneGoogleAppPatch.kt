package app.codex.googlefeedads.patches.clone

import app.codex.googlefeedads.patches.shared.Constants.COMPATIBILITY_GOOGLE_APP
import app.codex.googlefeedads.patches.shared.Constants.ORIGINAL_PACKAGE_NAME
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element
import org.w3c.dom.NodeList

private const val DEFAULT_CLONE_PACKAGE_NAME = "app.ripthulhu.googlequicksearchbox"
private const val DEFAULT_CLONE_APP_NAME = "Google Morphe"
private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

@Suppress("unused")
val standaloneGoogleAppPatch = resourcePatch(
    name = "Install as standalone app",
    description = "Changes the Google app package identity so the patched APK can be installed beside the system Google app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GOOGLE_APP)

    val packageNameOption = stringOption(
        key = "packageName",
        default = DEFAULT_CLONE_PACKAGE_NAME,
        values = mapOf("Default" to DEFAULT_CLONE_PACKAGE_NAME),
        title = "Package name",
        description = "The package name to use for the standalone patched app.",
        required = true,
    ) {
        it != null && it.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")) && it != ORIGINAL_PACKAGE_NAME
    }

    val appNameOption = stringOption(
        key = "appName",
        default = DEFAULT_CLONE_APP_NAME,
        values = mapOf("Default" to DEFAULT_CLONE_APP_NAME),
        title = "App name",
        description = "The launcher name to use for the standalone patched app.",
        required = true,
    ) {
        !it.isNullOrBlank()
    }

    execute {
        val clonePackageName = packageNameOption.value!!
        val cloneAppName = appNameOption.value!!

        document("AndroidManifest.xml").use { document ->
            val permissionRenames = mutableMapOf<String, String>()

            val manifest = document.getElementsByTagName("manifest").item(0) as Element
            manifest.setAttribute("package", clonePackageName)

            val application = document.getElementsByTagName("application").item(0) as Element
            application.setAndroidAttribute("label", cloneAppName)

            document.forEachElement("permission") { element ->
                val permissionName = element.getAndroidAttribute("name")
                if (permissionName.isNotBlank()) {
                    val renamedPermission = clonePermissionName(clonePackageName, permissionName)
                    permissionRenames[permissionName] = renamedPermission
                    element.setAndroidAttribute("name", renamedPermission)
                }
            }

            application.replaceAndroidAttribute("permission", permissionRenames)
            application.replaceAndroidAttributePrefix("permission", ORIGINAL_PACKAGE_NAME, clonePackageName)

            document.forEachElement(
                "uses-permission",
                "uses-permission-sdk-23",
                "uses-permission-sdk-m",
            ) { element ->
                element.replaceAndroidAttribute("name", permissionRenames)
            }

            document.forEachElement("service", "receiver", "activity", "activity-alias") { element ->
                element.replaceAndroidAttribute("permission", permissionRenames)
                element.replaceAndroidAttributePrefix("permission", ORIGINAL_PACKAGE_NAME, clonePackageName)
                element.replaceAndroidAttributePrefix("taskAffinity", ORIGINAL_PACKAGE_NAME, clonePackageName)
                if (element.hasLauncherIntentFilter()) {
                    element.setAndroidAttribute("label", cloneAppName)
                }
            }

            document.forEachElement("provider") { element ->
                element.namespaceProviderAuthorities(clonePackageName)
                element.replaceAndroidAttribute("permission", permissionRenames)
                element.replaceAndroidAttribute("readPermission", permissionRenames)
                element.replaceAndroidAttribute("writePermission", permissionRenames)
                element.replaceAndroidAttributePrefix("permission", ORIGINAL_PACKAGE_NAME, clonePackageName)
                element.replaceAndroidAttributePrefix("readPermission", ORIGINAL_PACKAGE_NAME, clonePackageName)
                element.replaceAndroidAttributePrefix("writePermission", ORIGINAL_PACKAGE_NAME, clonePackageName)
            }

            document.forEachElement("path-permission") { element ->
                element.replaceAndroidAttribute("permission", permissionRenames)
                element.replaceAndroidAttribute("readPermission", permissionRenames)
                element.replaceAndroidAttribute("writePermission", permissionRenames)
            }
        }

        document("res/values/strings.xml").use { document ->
            val launcherNames = setOf(
                "agsa_app_name",
                "googleapp_agsa_app_name",
                "search_activity_name",
            )

            document.getElementsByTagName("string").forEachElement { element ->
                if (element.getAttribute("name") in launcherNames) {
                    element.textContent = cloneAppName
                }
            }
        }
    }
}

private fun Element.getAndroidAttribute(name: String) =
    getAttributeNS(ANDROID_NAMESPACE, name).ifBlank { getAttribute("android:$name") }

private fun Element.setAndroidAttribute(name: String, value: String) =
    setAttribute("android:$name", value)

private fun Element.replaceAndroidAttribute(name: String, replacements: Map<String, String>) {
    val value = getAndroidAttribute(name)
    replacements[value]?.let { setAndroidAttribute(name, it) }
}

private fun Element.replaceAndroidAttributePrefix(name: String, oldPrefix: String, newPrefix: String) {
    val value = getAndroidAttribute(name)
    if (value.startsWith(oldPrefix)) {
        setAndroidAttribute(name, value.replaceFirst(oldPrefix, newPrefix))
    }
}

private fun Element.namespaceProviderAuthorities(clonePackageName: String) {
    val authorities = getAndroidAttribute("authorities")
    if (authorities.isBlank() || authorities.startsWith("@")) return

    setAndroidAttribute(
        "authorities",
        authorities
            .split(';')
            .joinToString(";") { authority -> cloneAuthorityName(clonePackageName, authority) },
    )
}

private fun org.w3c.dom.Document.forEachElement(vararg tagNames: String, block: (Element) -> Unit) {
    tagNames.forEach { tagName ->
        getElementsByTagName(tagName).forEachElement(block)
    }
}

private fun NodeList.forEachElement(block: (Element) -> Unit) {
    for (i in 0 until length) {
        (item(i) as? Element)?.let(block)
    }
}

private fun Element.hasLauncherIntentFilter(): Boolean {
    var found = false

    getElementsByTagName("intent-filter").forEachElement { intentFilter ->
        if (found) return@forEachElement

        var hasMainAction = false
        var hasLauncherCategory = false

        intentFilter.childNodes.forEachElement { child ->
            when (child.nodeName) {
                "action" -> if (child.getAndroidAttribute("name") == "android.intent.action.MAIN") {
                    hasMainAction = true
                }

                "category" -> if (child.getAndroidAttribute("name") == "android.intent.category.LAUNCHER") {
                    hasLauncherCategory = true
                }
            }
        }

        if (hasMainAction && hasLauncherCategory) {
            found = true
        }
    }

    return found
}

private fun clonePermissionName(clonePackageName: String, originalPermissionName: String): String {
    val suffix = originalPermissionName.replace(Regex("[^A-Za-z0-9_]"), "_")
    return "$clonePackageName.permission.$suffix"
}

private fun cloneAuthorityName(clonePackageName: String, originalAuthorityName: String): String {
    val suffix = originalAuthorityName.replace(Regex("[^A-Za-z0-9_]"), "_")
    return "$clonePackageName.provider.$suffix"
}
