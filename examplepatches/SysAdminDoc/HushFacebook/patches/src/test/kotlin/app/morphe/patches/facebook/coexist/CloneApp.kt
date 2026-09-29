/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.coexist

import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * What Morphe Patches 1.44.0's Clone app does to a manifest in its finalize block, which Morphe runs
 * after this bundle's own patches have executed (patches/all/misc/clone/CloneAppPatch.kt): the
 * package renamed, and with each option on, the permission declarations or the provider authorities
 * renamed after it. A name under the old package moves under the new one, any other name gets the
 * new package and an underscore in front. Only the first <uses-permission> of a renamed declaration
 * follows it, and nothing that requires one does.
 */
internal fun Document.cloneApp(renamedTo: String, updatePermissions: Boolean, updateProviders: Boolean) {
    val original = documentElement.getAttribute("package")
    fun moved(name: String) =
        if (name.startsWith("$original.")) name.replaceFirst(original, renamedTo) else "${renamedTo}_$name"
    fun elements(tag: String): List<Element> {
        val nodes = getElementsByTagName(tag)
        return (0 until nodes.length).map { nodes.item(it) as Element }
    }

    documentElement.setAttribute("package", renamedTo)
    if (updatePermissions) {
        val requests = elements("uses-permission")
        for (declaration in elements("permission")) {
            val old = declaration.getAttribute("android:name")
            if (old.startsWith('.')) continue
            val new = moved(old)
            declaration.setAttribute("android:name", new)
            requests.firstOrNull { it.getAttribute("android:name") == old }?.setAttribute("android:name", new)
        }
    }
    if (updateProviders) {
        for (provider in elements("provider")) {
            val authorities = provider.getAttribute("android:authorities").split(';')
            provider.setAttribute("android:authorities", authorities.joinToString(";") {
                if (it.startsWith('@')) it else moved(it)
            })
        }
    }
}
