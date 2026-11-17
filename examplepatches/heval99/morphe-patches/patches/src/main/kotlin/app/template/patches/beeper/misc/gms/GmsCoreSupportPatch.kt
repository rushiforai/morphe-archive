package app.template.patches.beeper.misc.gms

import app.template.patches.shared.Constants.COMPATIBILITY_BEEPER
import app.template.patches.shared.misc.gms.gmsCoreSupportPatch

// Beeper receives push through Firebase Cloud Messaging (BooperFirebaseMessagingService), and a
// re-signed build cannot register with Google's FCM because the API key is bound to the original
// certificate. Off by default: the app itself works without it, and the extension asks the user to
// install MicroG RE on every launch until it is installed.
@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    fromPackageName = "com.beeper.android",
    spoofedPackageSignature = BEEPER_SIGNATURE_SHA1,
    mainActivityOnCreateFingerprint = MainActivityOnCreateFingerprint,
    compatibility = COMPATIBILITY_BEEPER,
    default = false,
    extraDescription = "Needed for push notifications through MicroG RE.",
)
