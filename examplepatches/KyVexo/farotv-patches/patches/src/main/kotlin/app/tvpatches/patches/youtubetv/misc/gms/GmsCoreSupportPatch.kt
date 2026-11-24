package app.tvpatches.patches.youtubetv.misc.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.string
import app.tvpatches.patches.shared.gms.gmsCoreSupportPatch
import app.tvpatches.patches.shared.gms.gmsCoreSupportResourcePatch
import app.tvpatches.patches.shared.gms.playServicesBypassPatch
import app.tvpatches.patches.youtubetv.shared.Constants.COBALT_ACTIVITY
import app.tvpatches.patches.youtubetv.shared.Constants.COMPATIBILITY_YOUTUBE_TV
import app.tvpatches.patches.youtubetv.shared.Constants.PATCHED_YOUTUBE_TV_PACKAGE_NAME
import app.tvpatches.patches.youtubetv.shared.Constants.YOUTUBE_TV_PACKAGE_NAME
import app.tvpatches.patches.youtubetv.shared.Constants.YOUTUBE_TV_SIGNATURE_SHA1

/**
 * Method with the allow-list of Google package names
 * (in 7.32.300: defpackage/ekg.a()). Same anchor strings as on mobile.
 */
internal object PrimeMethodFingerprint : Fingerprint(
    filters = listOf(
        string("com.android.vending"),
        string("com.google.android.GoogleCamera")
    )
)

/**
 * MainActivity and StandalonePlayerActivity both extend CobaltActivity.
 * ShellActivity is only a trampoline that starts MainActivity.
 */
internal object CobaltActivityOnCreateFingerprint : Fingerprint(
    definingClass = COBALT_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

/**
 * Adds the Java extension (extensions/extension) to the patched app.
 */
internal val youtubeTvExtensionPatch = patch {
    extendWith("extensions/extension.mpe")
}

/**
 * Base patch: new package name + ignore Play Services refusals. No MicroG needed.
 */
@Suppress("unused")
val runWithoutPlayServicesPatch = playServicesBypassPatch(
    fromPackageName = YOUTUBE_TV_PACKAGE_NAME,
    toPackageNameDefault = PATCHED_YOUTUBE_TV_PACKAGE_NAME,
    primeMethodFingerprint = PrimeMethodFingerprint,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_TV)
}

/**
 * Lets the "MicroG-RE no está instalado" dialog download and install MicroG-RE
 * (PackageInstaller needs REQUEST_INSTALL_PACKAGES).
 */
private val installPackagesPermissionPatch = resourcePatch {
    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            val permission = "android.permission.REQUEST_INSTALL_PACKAGES"
            val exists = manifest.root.children("uses-permission").any { it.attribute("android:name") == permission }
            if (!exists) {
                manifest.root.appendChild("uses-permission") { setAttribute("android:name", permission) }
            }
        }
    }
}

/**
 * Optional: redirect Play Services calls to MicroG-RE.
 */
@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    fromPackageName = YOUTUBE_TV_PACKAGE_NAME,
    toPackageNameDefault = PATCHED_YOUTUBE_TV_PACKAGE_NAME,
    playServicesBypassPatch = runWithoutPlayServicesPatch,
    mainActivityOnCreateFingerprint = CobaltActivityOnCreateFingerprint,
    extensionPatch = youtubeTvExtensionPatch,
    gmsCoreSupportResourcePatchFactory = {
        gmsCoreSupportResourcePatch(
            fromPackageName = YOUTUBE_TV_PACKAGE_NAME,
            toPackageNameDefault = PATCHED_YOUTUBE_TV_PACKAGE_NAME,
            spoofedPackageSignature = YOUTUBE_TV_SIGNATURE_SHA1,
        )
    },
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_TV)
    dependsOn(installPackagesPermissionPatch)
}
