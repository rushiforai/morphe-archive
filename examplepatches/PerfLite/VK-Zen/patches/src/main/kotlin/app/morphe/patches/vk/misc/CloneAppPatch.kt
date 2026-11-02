package app.morphe.patches.vk.misc

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.vk.shared.Constants.COMPATIBILITY_VK
import app.morphe.util.asSequence
import app.morphe.util.findElementByAttributeValue
import org.w3c.dom.Element

private lateinit var packageNameOption: Option<String>

@Suppress("unused")
val cloneAppPatch = resourcePatch(
    name = "Clone app",
    description = "Changes the package name to com.vkontakte.morphe so VK can be installed side-by-side with official VK.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK)
    dependsOn(nativePatch)

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
        val replacement = packageNameOption.value
        val newPackageName = if (replacement != packageNameOption.default) {
            replacement!!
        } else {
            "$packageName.morphe"
        }
        val providerStringResources = mutableSetOf<String>()

        document("AndroidManifest.xml").use { document ->
            document.documentElement.setAttribute("package", newPackageName)

            // Strip split APK enforcement attributes so standalone installation doesn't fail with INSTALL_FAILED_MISSING_SPLIT
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

            // Update application and activity labels so clone is easily distinguished from official VK
            val applications = document.getElementsByTagName("application")
            for (i in 0 until applications.length) {
                val app = applications.item(i) as? Element ?: continue
                app.removeAttribute("android:isSplitRequired")
                app.setAttribute("android:label", "VK Zen")

                // Register VkZenSettingsActivity
                val act = document.createElement("activity")
                act.setAttribute("android:name", "app.morphe.extension.vk.settings.VkZenSettingsActivity")
                act.setAttribute("android:label", "Настройки VK Zen")
                act.setAttribute("android:exported", "false")
                act.setAttribute("android:configChanges", "keyboard|keyboardHidden|orientation|screenLayout|screenSize|smallestScreenSize")
                app.appendChild(act)
            }
            val activities = document.getElementsByTagName("activity")
            for (i in 0 until activities.length) {
                val act = activities.item(i) as? Element ?: continue
                if (act.hasAttribute("android:label")) {
                    val lbl = act.getAttribute("android:label")
                    if (lbl == "@string/app_name" || lbl == "ВКонтакте" || lbl == "VK" || lbl == "VK Morphe") {
                        act.setAttribute("android:label", "VK Zen")
                    }
                }
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

            // Ensure cloned app holds its own declared custom permissions
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

            // Update content provider authorities to avoid installation collisions
            val providers = document.getElementsByTagName("provider").asSequence().map { it as Element }.toList()
            for (provider in providers) {
                val authorities = provider.getAttribute("android:authorities").split(';')
                val newAuthorities = authorities.map {
                    when {
                        it.startsWith("$packageName.") -> it.replaceFirst(packageName, newPackageName)
                        it.startsWith('@') -> {
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

            // Disable system AccountManager to avoid signature/UID collision with official VK app
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
                    val intentFilters = srv.getElementsByTagName("intent-filter")
                    for (k in 0 until intentFilters.length) {
                        srv.removeChild(intentFilters.item(k))
                    }
                }
            }
        }

        val valuesFiles = listOf(
            "res/values/strings.xml",
            "res/values-ru/strings.xml",
            "res/values-ru-rRU/strings.xml"
        )
        for (vPath in valuesFiles) {
            try {
                document(vPath).use { document ->
                    val children = document.documentElement.childNodes
                    for (i in 0 until children.length) {
                        val node = children.item(i) as? Element ?: continue
                        val nodeName = node.getAttribute("name")
                        if (nodeName in providerStringResources) {
                            val authority = node.textContent
                            node.textContent = if (authority.startsWith("$packageName.")) {
                                authority.replaceFirst(packageName, newPackageName)
                            } else {
                                "${newPackageName}_$authority"
                            }
                        } else if (nodeName == "vk_account_manager_id") {
                            node.textContent = "com.vkontakte.account.morphe"
                        } else if (nodeName == "app_name") {
                            node.textContent = "VK Zen"
                        } else if (nodeName == "sett_tabbar" || nodeName == "tabbar_settings_title" || nodeName == "tabbar_settings_accessibility_info_panel") {
                            node.textContent = "Настройки VK Zen"
                        }
                    }
                }
            } catch (ignored: Throwable) {
            }
        }

        // Inject custom Zen launcher icons into the cloned APK
        try {
            val cl = Thread.currentThread().contextClassLoader ?: object {}.javaClass.classLoader
            val densities = listOf("mdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi")
            val iconNames = listOf("ic_launcher_background.png", "ic_launcher_foreground.png", "ic_launcher_round.png", "mp_launcher.png")
            for (d in densities) {
                for (name in iconNames) {
                    val relPath = "res/mipmap-$d-v4/$name"
                    val resStream = cl?.getResourceAsStream("zen_icons/$relPath")
                        ?: cl?.getResourceAsStream("/zen_icons/$relPath")
                    if (resStream != null) {
                        // Leave a layer the icon color patch already wrote alone.
                        if (get(relPath, copy = false).exists()) continue
                        val target = this[relPath]
                        target.parentFile?.mkdirs()
                        target.writeBytes(resStream.use { it.readBytes() })
                    }
                }
            }
        } catch (ignored: Throwable) {
        }
    }
}
