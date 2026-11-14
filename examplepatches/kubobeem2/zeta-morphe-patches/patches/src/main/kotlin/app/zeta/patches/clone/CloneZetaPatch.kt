package app.zeta.patches.clone

import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.zeta.patches.shared.Constants.ZETA

/**
 * Zeta アプリのパッケージ名を変更（クローン化）するパッチ。
 * パッケージ名を com.scatterlab.messenger から app.zeta.messenger にリネームし、
 * Google Play Protect や OS の署名照合、Play Integrity の強制終了を完全回避します。
 */
@Suppress("unused")
val cloneZetaPatch = patch(
    name = "Clone Zeta (Change Package Name)",
    description = "パッケージ名を app.zeta.messenger に変更し、Google Playの監視や「Google Playから入手してください」の整合性チェックを回避します。",
    default = true
) {
    compatibleWith(ZETA)

    finalize {
        val originalPackageName = packageMetadata.packageName
        val newPackageName = "app.zeta.messenger"

        val providerStringResources = mutableSetOf<String>()

        resourceXml("AndroidManifest.xml").use { manifest ->
            // 1. マニフェストのパッケージ名を変更
            manifest.root.setAttribute("package", newPackageName)

            // 2. カスタムパーミッションの更新
            val usesPermissions = manifest.elements("uses-permission").toList()
            manifest.elements("permission").forEach { perm ->
                val oldName = perm.attribute("android:name").orEmpty()
                val newName = when {
                    oldName.startsWith('.') -> return@forEach
                    oldName.startsWith("$originalPackageName.") -> oldName.replaceFirst(originalPackageName, newPackageName)
                    else -> "${newPackageName}_$oldName"
                }
                perm.setAttribute("android:name", newName)

                usesPermissions.firstOrNull { it.attribute("android:name") == oldName }
                    ?.setAttribute("android:name", newName)
            }

            // 3. ContentProvider の authorities の更新（競合防止）
            for (provider in manifest.elements("provider")) {
                val authorities = provider.attribute("android:authorities").orEmpty().split(';')
                val newAuthorities = authorities.map { auth ->
                    when {
                        auth.startsWith("$originalPackageName.") -> auth.replaceFirst(originalPackageName, newPackageName)
                        auth.startsWith('@') -> {
                            providerStringResources.add(auth.removePrefix("@string/"))
                            auth
                        }
                        else -> "${newPackageName}_$auth"
                    }
                }
                provider.setAttribute("android:authorities", newAuthorities.joinToString(";"))
            }
        }

        // 4. strings.xml に定義された provider authorities の更新
        if (providerStringResources.isNotEmpty()) {
            resourceXml("res/values/strings.xml").use { strings ->
                providerStringResources.forEach { name ->
                    val string = strings.resourceOrNull(name) ?: return@forEach
                    val authority = string.text
                    if (authority.isEmpty()) return@forEach

                    string.text = if (authority.startsWith("$originalPackageName.")) {
                        authority.replaceFirst(originalPackageName, newPackageName)
                    } else {
                        "${newPackageName}_$authority"
                    }
                }
            }
        }
    }
}
