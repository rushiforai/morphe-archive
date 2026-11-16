package app.danielthemaniel.patches.campfire

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Niantic permissions Campfire declares but that every Niantic app (Pokémon GO, ...) also
 * declares with protectionLevel="signature". Once Campfire is re-signed, Android refuses to
 * install it next to any of those apps:
 *
 *   INSTALL_FAILED_DUPLICATE_PERMISSION: ... already owned by com.nianticlabs.pokemongo
 *
 * Campfire guards none of its own components with LOGIN_PROVIDER. It only <uses-permission>s it
 * to read login tokens from other Niantic apps' providers (SharedLoginPlugin), which a
 * differently-signed build can't do anyway. So the declaration can be dropped; the
 * <uses-permission> stays and is simply never granted.
 */
private val SHARED_NIANTIC_PERMISSIONS = setOf(
    "com.nianticlabs.platform.permission.LOGIN_PROVIDER",
)

/** Required by every Campfire patch; add it with dependsOn(). */
internal val sharedPermissionFixPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_CAMPFIRE)

    execute {
        document("AndroidManifest.xml").use { document ->
            val permissions = document.getElementsByTagName("permission")
            (0 until permissions.length)
                .mapNotNull { permissions.item(it) as? Element }
                .filter { it.getAttribute("android:name") in SHARED_NIANTIC_PERMISSIONS }
                .forEach { it.parentNode.removeChild(it) }
        }
    }
}
