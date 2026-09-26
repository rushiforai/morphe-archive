package app.ckzombies.patches.compat

import app.ckzombies.patches.nativelib.textRelocationPatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * 25 is the lowest target Android 14 (floor 23) and 15 (floor 24) install normally, and the
 * highest that stays clear of non-SDK interface restrictions (28) and scoped storage (29).
 */
internal const val TARGET_SDK = 25

private const val APACHE_HTTP_LEGACY = "org.apache.http.legacy"

/**
 * The manifest declares no targetSdkVersion, so it falls back to minSdkVersion, 7. Raising it
 * needs the text relocation gone first, or the library fails to load.
 */
internal val targetSdkPatch = resourcePatch {
    dependsOn(textRelocationPatch)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val usesSdk = document.getElementsByTagName("uses-sdk").item(0) as Element?
                ?: document.createElement("uses-sdk").also { manifest.insertBefore(it, manifest.firstChild) }
            usesSdk.setAttribute("android:targetSdkVersion", TARGET_SDK.toString())

            // Apache HTTP was removed from the SDK in API 23 and many classes here still use it.
            val application = document.getElementsByTagName("application").item(0) as Element
            val libraries = document.getElementsByTagName("uses-library")
            val declared = (0 until libraries.length).any {
                (libraries.item(it) as Element).getAttribute("android:name") == APACHE_HTTP_LEGACY
            }
            if (!declared) {
                val library = document.createElement("uses-library")
                library.setAttribute("android:name", APACHE_HTTP_LEGACY)
                library.setAttribute("android:required", "false")
                application.insertBefore(library, application.firstChild)
            }
        }
    }
}
