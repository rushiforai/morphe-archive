// SPDX-License-Identifier: GPL-3.0-or-later
package app.morphe.patches.immich.test

import app.morphe.patcher.patch.*
import org.w3c.dom.Element

val immichTestIdentityPatch = resourcePatch(name = "Immich isolated test identity", default = false) {
    compatibleWith(Compatibility(name = "Immich", packageName = "app.alextran.immich"))
    execute {
        document("AndroidManifest.xml").use { xml ->
            val original = "app.alextran.immich"
            val isolated = "$original.catppuccin.test"
            xml.documentElement.setAttribute("package", isolated)
            val nodes = xml.getElementsByTagName("*")
            for (i in 0 until nodes.length) {
                val node = nodes.item(i) as Element
                for (name in listOf("android:authorities", "android:permission", "android:readPermission", "android:writePermission")) {
                    if (node.hasAttribute(name)) node.setAttribute(name, node.getAttribute(name).replace(original, isolated))
                }
                if (node.tagName in listOf("permission", "uses-permission") && node.getAttribute("android:name").startsWith(original))
                    node.setAttribute("android:name", node.getAttribute("android:name").replace(original, isolated))
                if (node.tagName == "application") node.setAttribute("android:label", "Immich Theme Test")
                require(!node.hasAttribute("android:accountType")) { "Isolate the authenticator before testing." }
            }
        }
    }
}
