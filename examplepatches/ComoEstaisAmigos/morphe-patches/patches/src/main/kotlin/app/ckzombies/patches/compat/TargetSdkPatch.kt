package app.ckzombies.patches.compat

import app.ckzombies.patches.nativelib.textRelocationPatch
import app.adebisi.patches.shared.setTargetSdk
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import org.w3c.dom.Element

private const val APACHE_HTTP_LEGACY = "org.apache.http.legacy"

/**
 * The manifest declares no targetSdkVersion, so it falls back to minSdkVersion, 7. Raising it
 * needs the text relocation gone first, or the library fails to load.
 */
internal val targetSdkPatch = patch {
    dependsOn(textRelocationPatch)

    execute {
        document("AndroidManifest.xml").use { document ->
            setTargetSdk(document)

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
