package app.morphe.patches.vkvideo.misc

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.vkvideo.shared.Constants.COMPATIBILITY_VK_VIDEO
import app.morphe.util.asSequence
import org.w3c.dom.Element

private lateinit var packageNameOption: Option<String>

/**
 * Package the clone ends up with. [tracerManifestPatch] has to hardcode the same value into the
 * bytecode, so the rule lives here once instead of being duplicated.
 */
internal fun clonedPackageName(originalPackageName: String): String {
    val replacement = if (::packageNameOption.isInitialized) packageNameOption.value else null
    return if (replacement != null && replacement != "Default") replacement else "$originalPackageName.morphe"
}

@Suppress("unused")
val cloneAppPatch = resourcePatch(
    name = "Clone app",
    description = "Changes the package name to com.vk.vkvideo.morphe so VK Video can be installed side-by-side with official VK Video.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK_VIDEO)

    dependsOn(tracerManifestPatch)

    packageNameOption = stringOption(
        key = "packageName",
        default = "Default",
        values = mapOf("Default" to "Default"),
        title = "Package name",
        description = "Package name to use for the cloned app.",
        required = true,
    ) {
        it == "Default" || it!!.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$"))
    }

    finalize {
        val packageName = packageMetadata.packageName
        val newPackageName = clonedPackageName(packageName)
        val providerStringResources = mutableSetOf<String>()

        document("AndroidManifest.xml").use { document ->
            document.documentElement.setAttribute("package", newPackageName)

            // Strip split APK enforcement attributes
            document.documentElement.removeAttribute("android:requiredSplitTypes")
            document.documentElement.removeAttribute("android:splitTypes")
            document.documentElement.removeAttribute("android:isSplitRequired")

            // Remove split-related metadata
            val metaDataList = document.getElementsByTagName("meta-data")
            val splitMetaToRemove = mutableListOf<Element>()
            for (i in 0 until metaDataList.length) {
                val meta = metaDataList.item(i) as? Element ?: continue
                val name = meta.getAttribute("android:name")
                if (name == "com.android.vending.splits.required" || name == "com.android.vending.splits") {
                    splitMetaToRemove.add(meta)
                }
            }
            for (meta in splitMetaToRemove) {
                meta.parentNode?.removeChild(meta)
            }

            // Update application label
            val applications = document.getElementsByTagName("application")
            for (i in 0 until applications.length) {
                val app = applications.item(i) as? Element ?: continue
                app.removeAttribute("android:isSplitRequired")
                app.setAttribute("android:label", "VK Video Morphe")
            }

            // Update custom permissions
            val permissions = document.getElementsByTagName("permission").asSequence().map { it as Element }.toList()
            val permissionMap = mutableMapOf<String, String>()
            for (p in permissions) {
                val oldName = p.getAttribute("android:name")
                val newName = when {
                    oldName.startsWith('.') -> continue
                    oldName.startsWith("$packageName.") -> oldName.replaceFirst(packageName, newPackageName)
                    else -> "${newPackageName}_$oldName"
                }
                p.setAttribute("android:name", newName)
                permissionMap[oldName] = newName
            }

            // Update uses-permission
            val usesPermissions = document.getElementsByTagName("uses-permission").asSequence().map { it as Element }.toList()
            for (up in usesPermissions) {
                val oldName = up.getAttribute("android:name")
                permissionMap[oldName]?.let { up.setAttribute("android:name", it) }
            }

            // Update content providers and authorities
            val providers = document.getElementsByTagName("provider").asSequence().map { it as Element }.toList()
            for (provider in providers) {
                val oldAuth = provider.getAttribute("android:authorities")
                if (oldAuth.isNotEmpty()) {
                    if (oldAuth.startsWith("@string/")) {
                        providerStringResources.add(oldAuth.removePrefix("@string/"))
                    } else {
                        val newAuth = oldAuth.split(";").joinToString(";") { auth ->
                            if (auth.startsWith("$packageName.")) {
                                auth.replaceFirst(packageName, newPackageName)
                            } else {
                                "${newPackageName}_$auth"
                            }
                        }
                        provider.setAttribute("android:authorities", newAuth)
                    }
                }
            }
        }

        // An authority declared as a string resource is resolved from the resource table at install
        // time, so renaming it in the manifest alone leaves the clone colliding with the original app
        // (INSTALL_FAILED_CONFLICTING_PROVIDER).
        if (providerStringResources.isNotEmpty()) {
            val valuesDirectories = get("res").listFiles { file ->
                file.isDirectory && file.name.startsWith("values")
            } ?: emptyArray()

            for (valuesDirectory in valuesDirectories) {
                val path = "res/${valuesDirectory.name}/strings.xml"
                if (!get(path).exists()) continue

                document(path).use { document ->
                    val strings = document.getElementsByTagName("string")
                    for (i in 0 until strings.length) {
                        val string = strings.item(i) as? Element ?: continue
                        if (string.getAttribute("name") !in providerStringResources) continue

                        val authority = string.textContent.trim()
                        val newAuthority = if (authority.startsWith("$packageName.")) {
                            authority.replaceFirst(packageName, newPackageName)
                        } else {
                            "${newPackageName}_$authority"
                        }
                        string.textContent = newAuthority
                        println("CloneAppPatch: $path/${string.getAttribute("name")}: $authority -> $newAuthority")
                    }
                }
            }
        }
    }
}
