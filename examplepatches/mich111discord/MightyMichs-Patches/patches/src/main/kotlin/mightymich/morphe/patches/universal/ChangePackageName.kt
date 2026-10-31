package mightymich.morphe.patches.universal

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.util.asSequence
import app.morphe.util.getNode
import org.w3c.dom.Element
import java.util.logging.Logger

lateinit var packageNameOption: Option<String>

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
    description = "Appends \".mightymich\" to the package name by default. " +
        "Changing the package name of the app can lead to unexpected issues.",
    default = false
) {
    packageNameOption = stringOption(
        key = "packageName",
        default = "Default",
        values = mapOf("Default" to "Default"),
        title = "Package name",
        description = "The name of the package to rename the app to. " +
            "\"Default\" appends \".mightymich\" to the original package.",
        required = true,
    ) {
        it == "Default" || it!!.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$"))
    }

    val updatePermissions by booleanOption(
        key = "updatePermissions",
        default = true,
        title = "Update permissions",
        description = "Rewrite package-scoped custom permissions " +
            "(e.g. DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION). " +
            "Fixes some install errors; can break features in certain apps.",
    )

    val updateProviders by booleanOption(
        key = "updateProviders",
        default = true,
        title = "Update providers",
        description = "Rewrite provider android:authorities that start with the " +
            "old package name. Fixes some install errors; can break features.",
    )

    finalize {
        val incompatibleAppPackages = setOf(
            "com.reddit.frontpage",
            "com.duolingo",
            "com.twitter.android",
            "tv.twitch.android.app",
        )

        document("AndroidManifest.xml").use { document ->
            val manifest = document.getNode("manifest") as Element
            val packageName = manifest.getAttribute("package")

            if (packageName in incompatibleAppPackages) {
                return@finalize Logger.getLogger(this::class.java.name).severe(
                    "'$packageName' does not work correctly with \"Change package name\"",
                )
            }

            val replacementPackageName = packageNameOption.value
            val newPackageName = if (replacementPackageName != packageNameOption.default) {
                replacementPackageName!!
            } else {
                "$packageName.mightymich"
            }

            manifest.setAttribute("package", newPackageName)

            if (updatePermissions == true) {
                val permissions = manifest.getElementsByTagName("permission").asSequence()
                val usesPermissions = manifest.getElementsByTagName("uses-permission").asSequence()
                val receiverNotExported = "DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"

                (permissions + usesPermissions)
                    .map { it as Element }
                    .filter {
                        val name = it.getAttribute("android:name")
                        name == "$packageName.$receiverNotExported" ||
                            name.startsWith("$packageName.")
                    }
                    .forEach { el ->
                        val old = el.getAttribute("android:name")
                        el.setAttribute(
                            "android:name",
                            newPackageName + old.substring(packageName.length),
                        )
                    }

                val componentTags = listOf(
                    "activity", "activity-alias", "service", "receiver", "provider"
                )
                for (tag in componentTags) {
                    manifest.getElementsByTagName(tag).asSequence()
                        .map { it as Element }
                        .forEach { el ->
                            for (attr in listOf(
                                "android:permission",
                                "android:readPermission",
                                "android:writePermission",
                            )) {
                                if (!el.hasAttribute(attr)) continue
                                val raw = el.getAttribute(attr)
                                if (raw.startsWith("$packageName.")) {
                                    el.setAttribute(
                                        attr,
                                        newPackageName + raw.substring(packageName.length),
                                    )
                                }
                            }
                        }
                }
            }

            if (updateProviders == true) {
                val providers = manifest.getElementsByTagName("provider").asSequence()
                for (node in providers) {
                    val provider = node as Element
                    val authorities = provider.getAttribute("android:authorities")
                    if (authorities.isEmpty()) continue
                    val updated = authorities.split(';').joinToString(";") { part ->
                        val a = part.trim()
                        when {
                            a == packageName -> newPackageName
                            a.startsWith("$packageName.") ->
                                newPackageName + a.substring(packageName.length)
                            else -> a
                        }
                    }
                    if (updated != authorities) {
                        provider.setAttribute("android:authorities", updated)
                    }
                }
            }
        }
    }
}
