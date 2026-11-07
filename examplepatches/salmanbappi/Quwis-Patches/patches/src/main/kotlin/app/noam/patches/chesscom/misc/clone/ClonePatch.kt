/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package app.noam.patches.chesscom.misc.clone

import app.morphe.patcher.patch.resourcePatch
import app.noam.patches.chesscom.shared.Constants
import org.w3c.dom.Element

private const val SUFFIX = "noam"

@Suppress("unused")
val clonePatch = resourcePatch(
    name = "Clone Chess.com",
    description = "Renames the app to com.chess.$SUFFIX so it installs next to the real Chess.com app " +
        "instead of over it. Leave it off to keep updating your current install.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    finalize {
        val packageName = packageMetadata.packageName
        val newPackageName = "$packageName.$SUFFIX"
        val providerStrings = mutableSetOf<String>()

        document("AndroidManifest.xml").use { document ->
            document.documentElement.setAttribute("package", newPackageName)

            // Permissions the app defines would clash with the real app's, so they are renamed too.
            val permissions = document.getElementsByTagName("permission")
            val usesPermissions = document.getElementsByTagName("uses-permission")
            for (i in 0 until permissions.length) {
                val permission = permissions.item(i) as? Element ?: continue
                val oldName = permission.getAttribute("android:name")
                val newName = when {
                    oldName.startsWith('.') -> continue
                    oldName.startsWith("$packageName.") -> oldName.replaceFirst(packageName, newPackageName)
                    else -> "${newPackageName}_$oldName"
                }
                permission.setAttribute("android:name", newName)
                for (j in 0 until usesPermissions.length) {
                    val uses = usesPermissions.item(j) as? Element ?: continue
                    if (uses.getAttribute("android:name") == oldName) {
                        uses.setAttribute("android:name", newName)
                        break
                    }
                }
            }

            // Content provider authorities are unique per device.
            val providers = document.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val provider = providers.item(i) as? Element ?: continue
                val authorities = provider.getAttribute("android:authorities").split(';').map {
                    when {
                        it.startsWith("$packageName.") -> it.replaceFirst(packageName, newPackageName)
                        it.startsWith('@') -> {
                            providerStrings += it.removePrefix("@string/")
                            it
                        }
                        else -> "${newPackageName}_$it"
                    }
                }
                provider.setAttribute("android:authorities", authorities.joinToString(";"))
            }
        }

        if (providerStrings.isNotEmpty()) {
            document("res/values/strings.xml").use { document ->
                val children = document.documentElement.childNodes
                for (i in 0 until children.length) {
                    val node = children.item(i) as? Element ?: continue
                    if (node.getAttribute("name") !in providerStrings) continue
                    val authority = node.textContent
                    node.textContent = if (authority.startsWith("$packageName.")) {
                        authority.replaceFirst(packageName, newPackageName)
                    } else {
                        "${newPackageName}_$authority"
                    }
                }
            }
        }
    }
}
