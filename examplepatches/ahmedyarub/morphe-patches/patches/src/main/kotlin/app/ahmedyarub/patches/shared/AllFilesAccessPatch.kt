package app.ahmedyarub.patches.shared

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val MANAGE_EXTERNAL_STORAGE = "android.permission.MANAGE_EXTERNAL_STORAGE"

/**
 * Declares "All files access", so a file the app wrote to shared storage can be read again after
 * the app is reinstalled: without it, a reinstalled app no longer owns, and cannot read, what it
 * wrote before. Granted in Settings, or with `adb shell appops set <package> MANAGE_EXTERNAL_STORAGE allow`.
 */
val allFilesAccessPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val permissions = document.getElementsByTagName("uses-permission")
            for (index in 0 until permissions.length) {
                if ((permissions.item(index) as Element).getAttribute("android:name") == MANAGE_EXTERNAL_STORAGE) return@use
            }
            val manifest = document.documentElement
            manifest.insertBefore(
                document.createElement("uses-permission").apply { setAttribute("android:name", MANAGE_EXTERNAL_STORAGE) },
                document.getElementsByTagName("application").item(0),
            )
        }
    }
}
