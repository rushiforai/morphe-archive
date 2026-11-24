package fr.josselinonduty.snapchat.core

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import fr.josselinonduty.snapchat.SNAPCHAT

// Native Argos reads PackageInfo through JNI, so call-site patches are not enough.
// The extension replaces PackageInfo.CREATOR before any provider/native init and
// delegates to the app's original factory (asserted below: fail at patch time on drift).
private const val ORIGINAL_FACTORY = "com.snap.ms.notification.slimprocess.SlimPushAppComponentFactory"

val spoofSignaturePatch = patch(
    name = "Spoof Snapchat signature",
    description = "Required for login: reports Snapchat's original public certificate to in-process readers.",
) {
    compatibleWith(SNAPCHAT)
    extendWith("extensions/snapchat.mpe")

    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            val app = manifest.elements("application").first()
            val current = app.attribute("android:appComponentFactory")
            check(current == ORIGINAL_FACTORY) { "Unexpected appComponentFactory: '$current'" }
            app.setAttribute("android:appComponentFactory", "fr.josselinonduty.snapchat.SnapAppComponentFactory")
        }
    }
}
