package santodan.patches

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val MEO_PACKAGE = "com.alticelabs.meo.androidtv"
private const val MEO_CLONE_PACKAGE = "com.alticelabs.meo.androidtv.santodan"
private const val MEO_CLONE_LABEL = "MEO Patched"

/** Gives the patched APKM an Android identity independent of the official MEO app. */
@Suppress("unused")
val meoSideBySideInstallationPatch = resourcePatch(
    name = "MEO - Side-by-side installation",
    description = "Installs a separately named MEO clone using a configurable package name and app name.",
    default = true,
) {
    compatibleWith(MeoCompatibility.create())

    val packageName = stringOption(
        key = "packageName",
        default = MEO_CLONE_PACKAGE,
        title = "Package name",
        description = "Unique Android package name for this installation.",
        required = true,
    ) { value -> value != null && isValidMeoClonePackage(value) }
    val appName = stringOption(
        key = "appName",
        default = MEO_CLONE_LABEL,
        title = "App name",
        description = "Name displayed by Android launchers for this installation.",
        required = true,
    ) { value -> value != null && value == value.trim() && value.isNotEmpty() && value.length <= 80 }

    finalize {
        document("AndroidManifest.xml").use {
            transformMeoManifest(it, requireNotNull(packageName.value), requireNotNull(appName.value))
        }
    }
}

internal fun transformMeoManifest(document: Document, clonedPackage: String, clonedLabel: String) {
    require(isValidMeoClonePackage(clonedPackage)) { "Invalid clone package name: $clonedPackage" }
    require(clonedLabel == clonedLabel.trim() && clonedLabel.isNotEmpty() && clonedLabel.length <= 80)

    val manifest = document.documentElement
    check(manifest.tagName == "manifest" && manifest.getAttribute("package") == MEO_PACKAGE) {
        "Expected manifest package $MEO_PACKAGE"
    }
    val applications = document.getElementsByTagName("application")
    check(applications.length == 1) { "Expected exactly one application element" }

    val renamedPermissions = mutableMapOf<String, String>()
    val declarations = document.getElementsByTagName("permission")
    for (index in 0 until declarations.length) {
        val element = declarations.item(index) as Element
        val name = element.getAttribute("android:name")
        if (name.startsWith("$MEO_PACKAGE.")) {
            val replacement = clonedPackage + name.removePrefix(MEO_PACKAGE)
            renamedPermissions[name] = replacement
            element.setAttribute("android:name", replacement)
        }
    }
    val usesPermissions = document.getElementsByTagName("uses-permission")
    for (index in 0 until usesPermissions.length) {
        val element = usesPermissions.item(index) as Element
        renamedPermissions[element.getAttribute("android:name")]?.let {
            element.setAttribute("android:name", it)
        }
    }

    val providers = document.getElementsByTagName("provider")
    val originalAuthorities = (0 until providers.length).flatMap { index ->
        (providers.item(index) as Element).getAttribute("android:authorities")
            .split(';').map(String::trim).filter(String::isNotBlank)
    }.toSet()
    for (index in 0 until providers.length) {
        val provider = providers.item(index) as Element
        val authorities = provider.getAttribute("android:authorities")
        if (authorities.isNotBlank()) {
            provider.setAttribute("android:authorities", authorities.split(';').joinToString(";") { authority ->
                val value = authority.trim()
                if (value == MEO_PACKAGE || value.startsWith("$MEO_PACKAGE.")) {
                    clonedPackage + value.removePrefix(MEO_PACKAGE)
                } else {
                    value
                }
            })
        }
    }

    for (index in 0 until providers.length) {
        val authorities = (providers.item(index) as Element).getAttribute("android:authorities")
        check(authorities.split(';').map(String::trim).none(originalAuthorities::contains)) {
            "Provider authority still collides with the official MEO app: $authorities"
        }
    }

    val application = applications.item(0) as Element
    if (application.getAttribute("android:taskAffinity") == MEO_PACKAGE) {
        application.setAttribute("android:taskAffinity", clonedPackage)
    }
    application.setAttribute("android:label", clonedLabel)
    manifest.setAttribute("package", clonedPackage)

    val activities = document.getElementsByTagName("activity")
    for (index in 0 until activities.length) {
        val activity = activities.item(index) as Element
        val categories = activity.getElementsByTagName("category")
        val launcher = (0 until categories.length).any { categoryIndex ->
            (categories.item(categoryIndex) as Element).getAttribute("android:name") in setOf(
                "android.intent.category.LAUNCHER", "android.intent.category.LEANBACK_LAUNCHER"
            )
        }
        if (launcher) activity.setAttribute("android:label", clonedLabel)
    }
}

private fun isValidMeoClonePackage(value: String): Boolean =
    value != MEO_PACKAGE && value.length <= 255 &&
        Regex("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+").matches(value)
