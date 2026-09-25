package com.feurstagram.patches.update

import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.asSequence
import com.feurstagram.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import org.w3c.dom.Element

private const val PERMISSION = "android.permission.REQUEST_INSTALL_PACKAGES"

// Lets the in-app updater hand a downloaded APK to the system package installer
// (UpdateChecker uses PackageInstaller) without bouncing through a browser.
@Suppress("unused")
val installPermissionPatch = resourcePatch(
    name = "Install-packages permission",
    description = "Declares REQUEST_INSTALL_PACKAGES so the update dialog can download " +
        "and install a new release directly instead of opening the browser.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement

            val alreadyDeclared = manifest.getElementsByTagName("uses-permission")
                .asSequence()
                .map { it as Element }
                .any { it.getAttribute("android:name") == PERMISSION }
            if (alreadyDeclared) return@use

            val element = document.createElement("uses-permission")
            element.setAttribute("android:name", PERMISSION)
            manifest.appendChild(element)
        }
    }
}
