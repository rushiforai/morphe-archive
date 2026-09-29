package io.github.bakwudo.uyu.patches.twitch.separateapp

import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.resourcePatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.TWITCH_PACKAGE_NAME
import org.w3c.dom.Element
import org.w3c.dom.NodeList

/** Package name of the patched app. */
internal const val UYU_PACKAGE_NAME = "io.github.bakwudo.uyu"

/** Name shown on the launcher and in recent apps. */
private const val UYU_APP_NAME = "uyu"

@Suppress("unused")
val separateAppPatch = resourcePatch(
    name = "Install as a separate app",
    description = "Installs the patched app as \"$UYU_APP_NAME\" next to the official Twitch app " +
        "instead of replacing it. The package name becomes $UYU_PACKAGE_NAME.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    // A root mount install replaces the installed Twitch, which needs Twitch's package name.
    availability { installer, _ ->
        if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.ENABLED
    }

    // After every other patch, so none of them sees the new package name in the manifest.
    finalize {
        document("AndroidManifest.xml").use { document ->
            document.documentElement.setAttribute("package", UYU_PACKAGE_NAME)

            // A second app may not declare the same permission or content provider authority
            // as the installed Twitch. Twitch and its libraries build these names from the
            // package name at run time, so the new names must follow the same pattern.
            val permissions = document.getElementsByTagName("permission").elements() +
                document.getElementsByTagName("uses-permission").elements()
            permissions.forEach { it.replacePackageName("android:name") }

            document.getElementsByTagName("provider").elements().forEach { provider ->
                val authorities = provider.getAttribute("android:authorities").split(';')
                provider.setAttribute(
                    "android:authorities",
                    authorities.joinToString(";") { it.withPackageNameReplaced() },
                )
            }

            // Login with Amazon redirects to amzn://<package name>.
            document.getElementsByTagName("data").elements()
                .filter { it.getAttribute("android:scheme") == "amzn" }
                .forEach { it.replacePackageName("android:host") }

            // The launcher and recent apps show these labels. Twitch's own text that says
            // "Twitch" is unchanged.
            listOf("application", "activity", "service").forEach { tag ->
                document.getElementsByTagName(tag).elements()
                    .filter { it.getAttribute("android:label") == "@string/app_name" }
                    .forEach { it.setAttribute("android:label", UYU_APP_NAME) }
            }
        }
    }
}

private fun NodeList.elements(): List<Element> = (0 until length).map { item(it) as Element }

private val TWITCH_PACKAGE_NAME_PART = Regex("(?<=^|\\.)${Regex.escape(TWITCH_PACKAGE_NAME)}(?=\\.|$)")

/**
 * Replaces Twitch's package name where it is a whole dot-separated part of the name, for
 * example `tv.twitch.android.app.provider` or `…MapInfoProvider.tv.twitch.android.app`.
 */
private fun String.withPackageNameReplaced(): String =
    TWITCH_PACKAGE_NAME_PART.replace(this, UYU_PACKAGE_NAME)

private fun Element.replacePackageName(attribute: String) {
    if (hasAttribute(attribute)) setAttribute(attribute, getAttribute(attribute).withPackageNameReplaced())
}
