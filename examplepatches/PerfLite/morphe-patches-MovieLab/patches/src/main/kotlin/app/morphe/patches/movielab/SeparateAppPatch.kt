package app.morphe.patches.movielab

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

/**
 * Everything the app derives from its own package name at runtime: permissions,
 * provider authorities, and intent-filter categories.
 */
private fun renameScopedName(original: String, replacement: String, name: String): String? = when {
    name.startsWith("$original.") -> name.replaceFirst(original, replacement)
    name == original -> replacement
    else -> null
}

@Suppress("unused")
val separateAppPatch = resourcePatch(
    name = "Установка отдельным приложением (клон)",
    description = "Устанавливает пропатченное приложение рядом с оригиналом под своим именем пакета и названием.",
    default = false,
) {
    compatibleWith(MOVIELAB_COMPATIBILITY)

    val packageNameOption = stringOption(
        key = "packageName",
        default = "com.movielab.mobile.morphe",
        title = "Имя пакета",
        description = "Имя пакета для клона. Должно быть уникальным среди установленных копий.",
        required = true,
    ) { it == null || it.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")) }

    val appNameOption = stringOption(
        key = "appName",
        default = "MovieLab Morphe",
        title = "Название приложения",
        description = "Название для клона приложения, чтобы отличать его от оригинала.",
        required = true,
    )

    finalize {
        val originalPackageName = packageMetadata.packageName
        val packageName = packageNameOption.value!!

        document("AndroidManifest.xml").use { document ->
            document.documentElement.setAttribute("package", packageName)

            val usesPermissions = document.getElementsByTagName("uses-permission")
            val permissions = document.getElementsByTagName("permission")

            for (i in 0 until permissions.length) {
                val permission = permissions.item(i) as Element
                val oldName = permission.getAttribute("android:name")
                val newName = renameScopedName(originalPackageName, packageName, oldName) ?: continue

                permission.setAttribute("android:name", newName)

                for (j in 0 until usesPermissions.length) {
                    val usesPermission = usesPermissions.item(j) as Element
                    if (usesPermission.getAttribute("android:name") == oldName) {
                        usesPermission.setAttribute("android:name", newName)
                    }
                }
            }

            for (j in 0 until usesPermissions.length) {
                val usesPermission = usesPermissions.item(j) as Element
                val oldName = usesPermission.getAttribute("android:name")
                renameScopedName(originalPackageName, packageName, oldName)?.let {
                    usesPermission.setAttribute("android:name", it)
                }
            }

            val providers = document.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val provider = providers.item(i) as Element
                val authorities = provider.getAttribute("android:authorities").split(';')
                val renamed = authorities.map {
                    renameScopedName(originalPackageName, packageName, it) ?: "${packageName}_$it"
                }
                provider.setAttribute("android:authorities", renamed.joinToString(";"))
            }

            val categories = document.getElementsByTagName("category")
            for (i in 0 until categories.length) {
                val category = categories.item(i) as Element
                val oldName = category.getAttribute("android:name")
                renameScopedName(originalPackageName, packageName, oldName)?.let {
                    category.setAttribute("android:name", it)
                }
            }

            val appName = appNameOption.value!!
            val applications = document.getElementsByTagName("application")
            for (i in 0 until applications.length) {
                (applications.item(i) as Element).setAttribute("android:label", appName)
            }
        }
    }
}
