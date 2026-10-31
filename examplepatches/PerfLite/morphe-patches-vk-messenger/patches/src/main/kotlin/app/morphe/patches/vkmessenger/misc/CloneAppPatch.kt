package app.morphe.patches.vkmessenger.misc

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.vkmessenger.shared.Constants.COMPATIBILITY_VK_MESSENGER
import app.morphe.util.asSequence
import org.w3c.dom.Element

private lateinit var packageNameOption: Option<String>

private const val CLONE_APP_NAME = "VK Messenger"

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
    description = "Changes the package name to com.vk.im.morphe so VK Messenger can be installed side-by-side with the official app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK_MESSENGER)

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

            // Strip split APK enforcement attributes so a standalone installation doesn't fail with INSTALL_FAILED_MISSING_SPLIT
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

            // Update the application label so the clone is easy to tell apart from the official app
            val applications = document.getElementsByTagName("application")
            for (i in 0 until applications.length) {
                val app = applications.item(i) as? Element ?: continue
                app.removeAttribute("android:isSplitRequired")
                app.setAttribute("android:label", CLONE_APP_NAME)
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

            val usesPermissions = document.getElementsByTagName("uses-permission").asSequence().map { it as Element }.toList()
            val existingUsesPermissions = mutableSetOf<String>()
            for (up in usesPermissions) {
                val oldName = up.getAttribute("android:name")
                val newName = permissionMap[oldName] ?: when {
                    oldName.startsWith("$packageName.") -> oldName.replaceFirst(packageName, newPackageName)
                    else -> oldName
                }
                up.setAttribute("android:name", newName)
                existingUsesPermissions.add(newName)
            }

            // Ensure the cloned app holds its own declared custom permissions
            for (newPerm in permissionMap.values) {
                if (newPerm !in existingUsesPermissions) {
                    val newElement = document.createElement("uses-permission")
                    newElement.setAttribute("android:name", newPerm)
                    document.documentElement.appendChild(newElement)
                    existingUsesPermissions.add(newPerm)
                }
            }

            // Update permission attributes and taskAffinity on all components
            val allElements = document.getElementsByTagName("*")
            for (i in 0 until allElements.length) {
                val el = allElements.item(i) as? Element ?: continue
                for (attrName in listOf("android:permission", "android:readPermission", "android:writePermission")) {
                    if (el.hasAttribute(attrName)) {
                        val v = el.getAttribute(attrName)
                        val mapped = permissionMap[v] ?: if (v.startsWith("$packageName.")) v.replaceFirst(packageName, newPackageName) else null
                        if (mapped != null) {
                            el.setAttribute(attrName, mapped)
                        }
                    }
                }
                if (el.hasAttribute("android:taskAffinity")) {
                    val ta = el.getAttribute("android:taskAffinity")
                    if (ta.startsWith(packageName)) {
                        el.setAttribute("android:taskAffinity", ta.replaceFirst(packageName, newPackageName))
                    }
                }
            }

            // Activities without their own affinity inherit the package name, so the app's built-in
            // hijacking detector (compares every installed activity's taskAffinity with its own
            // package name and reports apps not signed with VK certificates) flags the clone itself.
            // An application-wide affinity keeps task grouping intact without matching that check.
            for (i in 0 until applications.length) {
                val app = applications.item(i) as? Element ?: continue
                if (!app.hasAttribute("android:taskAffinity")) {
                    app.setAttribute("android:taskAffinity", "$newPackageName.task")
                }
            }

            // Update content provider authorities to avoid installation collisions
            val providers = document.getElementsByTagName("provider").asSequence().map { it as Element }.toList()
            for (provider in providers) {
                val authorities = provider.getAttribute("android:authorities").split(';')
                val newAuthorities = authorities.map {
                    when {
                        it.startsWith("$packageName.") -> it.replaceFirst(packageName, newPackageName)
                        it.startsWith("@") -> {
                            providerStringResources.add(it.removePrefix("@string/"))
                            it
                        }
                        else -> "${newPackageName}_$it"
                    }
                }
                provider.setAttribute("android:authorities", newAuthorities.joinToString(";"))
            }

            // Internalize internal providers so they never reject intra-app requests with SecurityException
            val internalProviders = setOf(
                "com.vk.usersstore.contentprovider.UsersContentProvider",
                "com.vk.companion.provider.AccountInfoContentProvider",
                "com.vk.core.deviceid.contentprovider.DeviceIdContentProvider"
            )
            for (provider in providers) {
                val name = provider.getAttribute("android:name")
                if (name in internalProviders) {
                    provider.setAttribute("android:exported", "false")
                    provider.removeAttribute("android:permission")
                    provider.removeAttribute("android:readPermission")
                    provider.removeAttribute("android:writePermission")
                }
            }

            val receivers = document.getElementsByTagName("receiver").asSequence().map { it as Element }.toList()
            for (rec in receivers) {
                if (rec.getAttribute("android:name") == "com.vk.companion.receiver.AccountInfoBroadcastReceiver") {
                    rec.setAttribute("android:exported", "false")
                    rec.removeAttribute("android:permission")
                }
            }

            // Disable system AccountManager to avoid signature/UID collision with the official app
            val metaDataNodes = document.getElementsByTagName("meta-data").asSequence().map { it as Element }.toList()
            for (meta in metaDataNodes) {
                if (meta.getAttribute("android:name") == "com.vk.accountmanager.enabled") {
                    meta.setAttribute("android:value", "false")
                }
            }

            val services = document.getElementsByTagName("service").asSequence().map { it as Element }.toList()
            for (srv in services) {
                if (srv.getAttribute("android:name") == "com.vk.accountmanager.domain.interactor.VkAccountAuthenticatorService") {
                    srv.setAttribute("android:enabled", "false")
                    srv.setAttribute("android:exported", "false")
                    val intentFilters = srv.getElementsByTagName("intent-filter").asSequence().map { it as Element }.toList()
                    for (intentFilter in intentFilters) {
                        intentFilter.parentNode?.removeChild(intentFilter)
                    }
                }
            }
        }

        // An authority declared as a string resource is resolved from the resource table at install
        // time, so renaming it in the manifest alone leaves the clone colliding with the original app
        // (INSTALL_FAILED_CONFLICTING_PROVIDER).
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
                    val name = string.getAttribute("name")

                    if (name in providerStringResources) {
                        val authority = string.textContent.trim()
                        val newAuthority = if (authority.startsWith("$packageName.")) {
                            authority.replaceFirst(packageName, newPackageName)
                        } else {
                            "${newPackageName}_$authority"
                        }
                        string.textContent = newAuthority
                        println("CloneAppPatch: $path/$name: $authority -> $newAuthority")
                    } else if (name == "app_name" || name == "im_app_name") {
                        string.textContent = CLONE_APP_NAME
                    }
                }
            }
        }
    }
}
