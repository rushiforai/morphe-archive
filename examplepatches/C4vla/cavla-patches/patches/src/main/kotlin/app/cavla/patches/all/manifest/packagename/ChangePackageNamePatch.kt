/**
 * Universal "Change package name" patch.
 *
 * Renames the app's package so a patched build installs side-by-side with the original
 * (no uninstall, keeps the user's original login/data). Adapted from MorpheApp/morphe-patches
 * and hoo-dles/morphe-patches, rewritten to use the raw org.w3c.dom API exposed by
 * app.morphe.patcher.util.Document (morphe-patcher 1.15.1 has no app.morphe.util DOM helpers).
 *
 * Universal: no compatibleWith(), so it is offered for every app.
 */

package app.cavla.patches.all.manifest.packagename

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.OptionException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element
import org.w3c.dom.NodeList
import java.util.logging.Logger

lateinit var packageNameOption: Option<String>

private fun NodeList.elements(): List<Element> =
    (0 until length).mapNotNull { item(it) as? Element }

/**
 * Set the package name to use.
 * If this is called multiple times, the first call will set the package name.
 *
 * @param fallbackPackageName The package name to use if the user has not already specified a package name.
 * @return The package name that was set.
 * @throws OptionException.ValueValidationException If the package name is invalid.
 */
fun setOrGetFallbackPackageName(fallbackPackageName: String): String {
    val packageName = packageNameOption.value!!

    return if (packageName == packageNameOption.default) {
        fallbackPackageName.also { packageNameOption.value = it }
    } else {
        packageName
    }
}

@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Appends \".morphe\" to the package name by default so the patched app installs " +
            "alongside the original. Changing the package name of the app can lead to unexpected issues.",
    default = false,
) {
    packageNameOption = stringOption(
        key = "packageName",
        default = "Default",
        values = mapOf("Default" to "Default"),
        title = "Package name",
        description = "The name of the package to rename the app to.",
        required = true,
    ) {
        it == "Default" || it!!.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+\$"))
    }

    val updatePermissions by booleanOption(
        key = "updatePermissions",
        default = false,
        title = "Update permissions",
        description = "Update compatibility receiver permissions. " +
                "Enabling this can fix installation errors, but this can also break features in certain apps.",
    )

    val updateProviders by booleanOption(
        key = "updateProviders",
        default = false,
        title = "Update providers",
        description = "Update provider names declared by the app. " +
                "Enabling this can fix installation errors, but this can also break features in certain apps.",
    )

    finalize {
        val incompatibleAppPackages = setOf(
            "com.reddit.frontpage",
            "com.duolingo",
            "com.twitter.android",
            "tv.twitch.android.app",
        )

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val packageName = manifest.getAttribute("package")

            if (incompatibleAppPackages.contains(packageName)) {
                return@finalize Logger.getLogger(this::class.java.name).severe(
                    "'$packageName' does not work correctly with \"Change package name\"",
                )
            }

            val replacementPackageName = packageNameOption.value
            val newPackageName = if (replacementPackageName != packageNameOption.default) {
                replacementPackageName!!
            } else {
                "$packageName.morphe"
            }

            manifest.setAttribute("package", newPackageName)

            if (updatePermissions == true) {
                val receiverNotExported = "DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"
                (document.getElementsByTagName("permission").elements() +
                    document.getElementsByTagName("uses-permission").elements())
                    .filter { it.getAttribute("android:name") == "$packageName.$receiverNotExported" }
                    .forEach { it.setAttribute("android:name", "$newPackageName.$receiverNotExported") }
            }

            if (updateProviders == true) {
                document.getElementsByTagName("provider").elements().forEach { provider ->
                    val authorities = provider.getAttribute("android:authorities")
                    if (authorities.startsWith("$packageName.")) {
                        provider.setAttribute(
                            "android:authorities",
                            authorities.replace(packageName, newPackageName),
                        )
                    }
                }
            }
        }
    }
}
