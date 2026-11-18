package patches.shared

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"
private const val QUERY_ALL_PACKAGES = "android.permission.QUERY_ALL_PACKAGES"

/**
 * Android 11 hides other packages from [android.content.pm.PackageManager] unless the app declares
 * them in `<queries>`. The high-risk permission is the only way to look up an arbitrary car host by
 * package name, which is how these apps verify the caller of their media-browser service.
 */
internal val androidAutoHostVisibility = resourcePatch(
    description = "Lets the app identify any installed Android Auto host on Android 11 and newer.",
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement
            val permissions = document.getElementsByTagName("uses-permission")
            val declared = (0 until permissions.length).any { index ->
                (permissions.item(index) as Element).getAttributeNS(ANDROID, "name") == QUERY_ALL_PACKAGES
            }
            if (!declared) {
                root.appendChild(document.createElement("uses-permission").apply {
                    setAttributeNS(ANDROID, "android:name", QUERY_ALL_PACKAGES)
                })
            }
        }
    }
}
