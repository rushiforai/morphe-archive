package app.jofslash.patches.quora.clone

import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.jofslash.patches.quora.shared.replaceStrings
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

internal const val QUORA_PACKAGE = "com.quora.android"
internal const val DEFAULT_CLONE_PACKAGE = "com.quora.android.clone"
private const val DEFAULT_CLONE_NAME = "Quora Clone"

private lateinit var packageNameOption: Option<String>
private lateinit var appNameOption: Option<String>

/** The package name the clone is installed under. */
internal fun clonePackageName(): String = packageNameOption.value ?: DEFAULT_CLONE_PACKAGE

/**
 * Renames the package, the app's own permissions and its content provider authorities,
 * so the patched app installs next to the official one.
 */
private val cloneAppResourcePatch = resourcePatch {
    execute {
        val newPackage = clonePackageName()

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            manifest.setAttribute("package", newPackage)

            // Name the launcher icon, so the two apps can be told apart. Only the manifest labels
            // change; the app still calls itself Quora inside.
            val appName = appNameOption.value?.takeIf { it.isNotBlank() } ?: DEFAULT_CLONE_NAME
            val labelled = document.getElementsByTagName("*")
            for (i in 0 until labelled.length) {
                val element = labelled.item(i) as Element
                if (element.getAttribute("android:label") == "@string/app_name") {
                    element.setAttribute("android:label", appName)
                }
            }

            fun renamed(value: String) =
                if (value.startsWith("$QUORA_PACKAGE.")) newPackage + value.removePrefix(QUORA_PACKAGE) else value

            // The app's own permissions (C2D_MESSAGE, DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION).
            // AndroidX builds the receiver permission from getPackageName() at runtime, so it
            // has to follow the new package name.
            for (tag in listOf("permission", "uses-permission")) {
                val nodes = document.getElementsByTagName(tag)
                for (i in 0 until nodes.length) {
                    val element = nodes.item(i) as Element
                    val name = element.getAttribute("android:name")
                    if (name.startsWith("$QUORA_PACKAGE.")) element.setAttribute("android:name", renamed(name))
                }
            }

            // Two installs can't declare the same authority.
            val providers = document.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val provider = providers.item(i) as Element
                val authorities = provider.getAttribute("android:authorities")
                if (authorities.isEmpty()) continue
                provider.setAttribute(
                    "android:authorities",
                    authorities.split(';').joinToString(";") {
                        if (it.startsWith("$QUORA_PACKAGE.")) renamed(it) else "${newPackage}_$it"
                    }
                )
            }
        }
    }
}

@Suppress("unused")
val cloneAppPatch = bytecodePatch(
    name = "Clone app",
    description = "Changes the package name, so the patched app installs next to the official Quora app " +
            "instead of replacing it. Both apps keep their own login and data. Sharing to Facebook " +
            "may not work in the clone.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_QUORA)

    packageNameOption = stringOption(
        key = "packageName",
        default = DEFAULT_CLONE_PACKAGE,
        values = mapOf("Default" to DEFAULT_CLONE_PACKAGE),
        title = "Package name",
        description = "Package name of the cloned app. Each install needs its own package name.",
        required = true,
    ) {
        it != null && it != QUORA_PACKAGE && it.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$"))
    }

    appNameOption = stringOption(
        key = "appName",
        default = DEFAULT_CLONE_NAME,
        values = mapOf("Default" to DEFAULT_CLONE_NAME, "Quora" to "Quora"),
        title = "App name",
        description = "Name shown under the clone's launcher icon.",
        required = true,
    ) { !it.isNullOrBlank() }

    dependsOn(cloneAppResourcePatch)

    execute {
        // The camera image picker hands its file out through the app's file provider.
        replaceStrings(mapOf("$QUORA_PACKAGE.fileprovider" to "${clonePackageName()}.fileprovider"))
    }
}
