/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package app.noam.patches.chesscom.misc.clone

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.noam.patches.chesscom.shared.Constants
import org.w3c.dom.Element

private const val DEFAULT_SUFFIX = "quwi"

private val SUFFIX_PATTERN = Regex("[A-Za-z][A-Za-z0-9_]*")

/**
 * Accepts "quwi", ".quwi" or the full "com.chess.quwi" and returns the last package segment.
 * An empty value falls back to the default suffix.
 */
private fun normalizeSuffix(raw: String?): String {
    var value = raw?.trim().orEmpty()
    if (value.startsWith("com.chess.", ignoreCase = true)) {
        value = value.substring("com.chess.".length)
    }
    value = value.trim('.')
    return value.ifEmpty { DEFAULT_SUFFIX }
}

@Suppress("unused")
val clonePatch = resourcePatch(
    name = "Clone Chess.com",
    description = "Renames the app package so it installs next to the real Chess.com app " +
        "instead of over it. The default package is com.chess.$DEFAULT_SUFFIX; the last part " +
        "can be changed in the patch options. Leave it off to keep updating your current install.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    val suffixOption = stringOption(
        key = "cloneSuffix",
        default = DEFAULT_SUFFIX,
        title = "Package name suffix",
        description = "The last part of the package name, after com.chess. Default: $DEFAULT_SUFFIX.",
        validator = { value -> normalizeSuffix(value).matches(SUFFIX_PATTERN) },
    )

    finalize {
        val suffix = normalizeSuffix(suffixOption.value)
        val packageName = packageMetadata.packageName
        val newPackageName = "$packageName.$suffix"
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
