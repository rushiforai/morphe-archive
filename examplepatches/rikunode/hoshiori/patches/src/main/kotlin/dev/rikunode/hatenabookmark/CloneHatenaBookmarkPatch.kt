package dev.rikunode.hatenabookmark

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Side-by-side *test* install on unrooted Android.
 *
 * Changing the manifest package alone is insufficient: Android also enforces
 * unique content provider authorities and declared custom permission names.
 * This does NOT bypass Play licensing / Pairip / developer authentication.
 */
private const val ORIGINAL = "com.hatena.android.bookmark"
private const val CLONE = "com.hatena.android.bookmark.morphe"

@Suppress("unused")
val cloneHatenaBookmarkPatch = resourcePatch(
    name = "Clone Hatena Bookmark for safe side-by-side testing",
    description = "Use a separate package name and provider authorities. Keeps the original installed app untouched; Play license checks may still prevent launch.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Hatena Bookmark",
            packageName = ORIGINAL,
            apkFileType = ApkFileType.APK,
            appIconColor = 0x2A9BD6,
            targets = listOf(AppTarget(version = "5.80", versionCode = 58000)),
        )
    )

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            require(manifest.tagName == "manifest")
            require(manifest.getAttribute("package") == ORIGINAL) {
                "Not the original Hatena Bookmark APK: refusing to clone"
            }
            val permissions = document.getElementsByTagName("permission")
            val customPermissions = (0 until permissions.length)
                .mapNotNull { permissions.item(it) as? Element }
            val originalPermission = "$ORIGINAL.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"
            val clonePermission = "$CLONE.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"
            require(customPermissions.size == 1 && customPermissions.single()
                .getAttribute("android:name") == originalPermission) {
                "Unexpected Hatena 5.80 custom permissions"
            }
            customPermissions.single().setAttribute("android:name", clonePermission)

            val usesPermissions = document.getElementsByTagName("uses-permission")
            var rewrittenUsesPermissions = 0
            for (i in 0 until usesPermissions.length) {
                val permission = usesPermissions.item(i) as? Element ?: continue
                if (permission.getAttribute("android:name") == originalPermission) {
                    permission.setAttribute("android:name", clonePermission)
                    rewrittenUsesPermissions += 1
                }
            }
            require(rewrittenUsesPermissions == 1) {
                "Expected one reference to custom Hatena 5.80 permission"
            }

            val providers = document.getElementsByTagName("provider")
            val mappedAuthorities = mutableListOf<String>()
            for (i in 0 until providers.length) {
                val provider = providers.item(i) as? Element ?: continue
                val oldAuthority = provider.getAttribute("android:authorities")
                require(oldAuthority.isNotBlank()) { "Provider without an authority" }
                val parts = oldAuthority.split(';')
                require(parts.all { it.startsWith("$ORIGINAL.") }) {
                    "Unknown provider authority; refusing to risk collision: $oldAuthority"
                }
                val newAuthority = parts.joinToString(";") {
                    it.replaceFirst(ORIGINAL, CLONE)
                }
                provider.setAttribute("android:authorities", newAuthority)
                mappedAuthorities.add(newAuthority)
            }
            require(mappedAuthorities.size == 3) {
                "Expected exactly 3 Hatena 5.80 providers, got ${mappedAuthorities.size}"
            }
            require(mappedAuthorities.toSet().size == 3) {
                "Duplicate provider authority after cloning"
            }

            // Modify package last: all other preconditions were verified.
            manifest.setAttribute("package", CLONE)
        }
    }
}
