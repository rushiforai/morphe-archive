package dev.hyzor.patches.projectivy.install

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import dev.hyzor.patches.projectivy.shared.Constants.PROJECTIVY
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

/**
 * Makes the repackaged APK install on 16 KB page-size devices.
 *
 * Projectivy ships its native libraries in the APK's `lib/` directory with
 * `android:extractNativeLibs="false"`, and Morphe's merge/repack keeps that flag while writing
 * a fresh zip. On a 16 KB page device the package manager then rejects the result with
 * `INSTALL_FAILED_NO_MATCHING_ABIS` / "Failed to extract native libraries, res=-113", because
 * the libraries are no longer at the offsets the loader expects.
 *
 * Forcing `extractNativeLibs="true"` makes the installer extract the libraries to the app's
 * native library directory at install time, which does not depend on zip alignment. It is
 * harmless on 4 KB devices (the libraries are simply extracted) and is applied by every
 * Projectivy patch, since the failure is in the repackaged file itself rather than in a
 * feature. This is an internal helper and does not appear in the patch list.
 */
internal val extractNativeLibsPatch = resourcePatch(
    description = "Sets android:extractNativeLibs=true so the patched APK installs on " +
        "16 KB page-size devices.",
) {
    compatibleWith(PROJECTIVY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException(
                    "Projectivy: AndroidManifest.xml has no <application> element.",
                )

            if (application.getAttributeNS(ANDROID_NAMESPACE, "extractNativeLibs") != "true") {
                application.setAttributeNS(
                    ANDROID_NAMESPACE,
                    "android:extractNativeLibs",
                    "true",
                )
            }
        }
    }
}
