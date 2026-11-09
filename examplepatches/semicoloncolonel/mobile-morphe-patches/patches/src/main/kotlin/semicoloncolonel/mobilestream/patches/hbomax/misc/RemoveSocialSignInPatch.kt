package semicoloncolonel.mobilestream.patches.hbomax.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.hbomax.shared.Constants

// HBO Max's sign-in SDK (com.discovery.gi) can show "Sign in with Google".
// In 7.14.0.530 it stayed off because the app set no Google client ID, so
// this patch is a safeguard: it pins the screen's Google switch off in case a
// later build or server config turns it on. Email and phone sign-in, and the
// sign-in a subscription needs, are unchanged. The Android TV build does not
// have this sign-in screen, so the patch is listed for the phone build only
// and does nothing on the TV build.
internal object EnableSignInWithGoogleFingerprint : Fingerprint(
    definingClass = "Lcom/discovery/gi/domain/unifiedauthentication/model/UnifiedAuthenticationScreenConfiguration;",
    name = "getEnableSignInWithGoogle",
    returnType = "Z",
)

@Suppress("unused")
val removeSocialSignInPatch = bytecodePatch(
    name = "Remove social sign-in (phone)",
    description = "Keeps Sign in with Google turned off. The Android TV app has no such option, so this does nothing there.",
) {
    compatibleWith(Constants.PHONE_COMPATIBILITY, Constants.STREAM_PHONE_COMPATIBILITY)

    execute {
        // Morphe Manager offers this patch for every HBO Max build, including
        // the Android TV build, which has no such screen. There it does nothing.
        EnableSignInWithGoogleFingerprint.methodOrNull?.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
