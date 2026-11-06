package app.pablobaro.patches.spotify.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.util.asSequence
import app.pablobaro.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import org.w3c.dom.Element

private const val DEFAULT_PACKAGE_NAME = "com.spotify.music.morphe"
private const val DEFAULT_APP_NAME = "Spotify Morphe"

private val PACKAGE_NAME_REGEX = Regex("^[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+$")

@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Changes the package name and app name so the patched app can be installed " +
        "alongside the original Spotify app.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    val packageNameOption by stringOption(
        key = "packageName",
        default = DEFAULT_PACKAGE_NAME,
        values = mapOf("Default" to DEFAULT_PACKAGE_NAME),
        title = "Package name",
        description = "The package name of the patched app. It must differ from the original one.",
        required = true,
    ) { it != null && PACKAGE_NAME_REGEX.matches(it) }

    val appNameOption by stringOption(
        key = "appName",
        default = DEFAULT_APP_NAME,
        values = mapOf("Default" to DEFAULT_APP_NAME),
        title = "App name",
        description = "The name shown in the launcher.",
        required = true,
    ) { !it.isNullOrBlank() }

    // Finalize so other patches still see the original package name.
    finalize {
        val newPackageName = packageNameOption!!
        val appName = appNameOption!!

        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0) as Element
            val oldPackageName = manifest.getAttribute("package")

            if (newPackageName == oldPackageName) {
                throw PatchException("The new package name must differ from \"$oldPackageName\"")
            }

            fun renamed(value: String) =
                if (value.startsWith("$oldPackageName.")) newPackageName + value.removePrefix(oldPackageName) else value

            // Authorities not based on the package name (e.g. com.spotify.mobile.android.mediaapi)
            // still collide with the original app, so they get the new package name as prefix.
            fun renamedAuthority(value: String) =
                if (value.startsWith("$oldPackageName.")) renamed(value) else "$newPackageName.$value"

            manifest.setAttribute("package", newPackageName)

            // Custom permissions are unique per device: keeping them causes INSTALL_FAILED_DUPLICATE_PERMISSION.
            val declaredPermissions = document.getElementsByTagName("permission").asSequence()
                .map { (it as Element).getAttribute("android:name") }
                .filter { it.startsWith("$oldPackageName.") }
                .toSet()

            // Provider authorities are unique per device: keeping them causes INSTALL_FAILED_CONFLICTING_PROVIDER.
            // Only the app's own providers, not the <queries> ones that point to other apps.
            val application = document.getElementsByTagName("application").item(0) as Element
            val authorityStrings = mutableSetOf<String>()
            application.getElementsByTagName("provider").asSequence().forEach { node ->
                val provider = node as Element
                val authorities = provider.getAttribute("android:authorities")
                when {
                    authorities.isEmpty() -> Unit
                    // The app reads these through R.string too, so the string itself is renamed.
                    authorities.startsWith("@string/") -> authorityStrings += authorities.removePrefix("@string/")
                    else -> provider.setAttribute(
                        "android:authorities",
                        authorities.split(';').joinToString(";") { renamedAuthority(it) },
                    )
                }
            }

            if (authorityStrings.isNotEmpty()) {
                document("res/values/strings.xml").use { strings ->
                    val found = mutableSetOf<String>()
                    strings.getElementsByTagName("string").asSequence().forEach { node ->
                        val string = node as Element
                        val name = string.getAttribute("name")
                        if (name in authorityStrings) {
                            string.textContent = string.textContent.split(';')
                                .joinToString(";") { renamedAuthority(it) }
                            found += name
                        }
                    }
                    val missing = authorityStrings - found
                    if (missing.isNotEmpty()) throw PatchException("Provider authority strings not found: $missing")
                }
            }

            val permissionAttributes = listOf(
                "android:name",
                "android:permission",
                "android:readPermission",
                "android:writePermission",
            )
            document.getElementsByTagName("*").asSequence().forEach { node ->
                val element = node as Element
                permissionAttributes.forEach { attribute ->
                    val value = element.getAttribute(attribute)
                    if (value in declaredPermissions) element.setAttribute(attribute, renamed(value))
                }
            }

            // Launcher name: the application and every component that inherits its label.
            val appLabel = application.getAttribute("android:label")
            application.setAttribute("android:label", appName)
            if (appLabel.isNotEmpty()) {
                listOf("activity", "activity-alias").forEach { tag ->
                    application.getElementsByTagName(tag).asSequence().forEach { node ->
                        val component = node as Element
                        if (component.getAttribute("android:label") == appLabel) {
                            component.setAttribute("android:label", appName)
                        }
                    }
                }
            }
        }
    }
}
