package io.github.liongalahad.nuviotv.patches.shared.updates

import org.w3c.dom.Document
import org.w3c.dom.Element

internal object PatchedAppUpdateManifest {
    const val INSTALL_PACKAGES_PERMISSION = "android.permission.REQUEST_INSTALL_PACKAGES"

    fun removeInstallPermission(document: Document) {
        val permissions = document.getElementsByTagName("uses-permission")
        val matches = (0 until permissions.length).mapNotNull { index ->
            (permissions.item(index) as? Element)
                ?.takeIf { it.getAttribute("android:name") == INSTALL_PACKAGES_PERMISSION }
        }
        check(matches.size == 1) {
            "Expected exactly one $INSTALL_PACKAGES_PERMISSION declaration"
        }
        matches.single().parentNode.removeChild(matches.single())
    }
}
