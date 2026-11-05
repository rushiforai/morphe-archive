package app.template.patches.gpsmapcamera.misc.gms

import app.template.patches.gpsmapcamera.misc.signature.spoofSignaturePatch
import app.template.patches.shared.Constants.COMPATIBILITY_GPSMAPCAMERA
import app.template.patches.shared.misc.gms.gmsCoreSupportPatch

// The map view is drawn by Google Play services' Maps module, which checks the app's Maps key
// against the real installed certificate, so a re-signed build shows a blank map ("Authorization
// failure"); "Spoof signature" cannot reach that check. With this patch the app loads the Maps
// module from MicroG RE, which draws its own map without Google's key check. Off by default: the
// rest of the app works without it, and the extension asks the user to install MicroG RE on every
// launch until it is installed. Pulls in "Spoof signature", which place search and Firebase need.
@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    fromPackageName = "com.gkfriend.gpsmapcameraeditor",
    // SHA-1 of the Play app-signing certificate (see GPSMAPCAMERA_CERTIFICATE).
    spoofedPackageSignature = "9195b65a6300de633b99a1fd84a9c191ab8a4fa4",
    mainActivityOnCreateFingerprint = SplashActivityOnCreateFingerprint,
    compatibility = COMPATIBILITY_GPSMAPCAMERA,
    default = false,
    dependencies = setOf(spoofSignaturePatch),
    // No clone: the Places key is tied to the original package name, and the Places SDK sends the
    // real one (Context.getPackageName), so a clone would lose place search.
    allowClone = false,
    extraDescription = "Needed to show the map.",
)
