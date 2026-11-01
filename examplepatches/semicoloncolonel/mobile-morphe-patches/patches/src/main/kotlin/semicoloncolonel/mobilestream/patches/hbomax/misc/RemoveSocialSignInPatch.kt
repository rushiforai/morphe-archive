package semicoloncolonel.mobilestream.patches.hbomax.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.hbomax.shared.Constants

// HBO Max's sign-in SDK (com.discovery.gi) can show "Sign in with Google".
// In 7.14.0.530 it stays off because the app sets no Google client ID, so
// this patch is a safeguard: it pins the screen's Google switch off in case a
// later build or server config turns it on. Email and phone sign-in, and the
// sign-in a subscription needs, are unchanged.
internal object EnableSignInWithGoogleFingerprint : Fingerprint(
    definingClass = "Lcom/discovery/gi/domain/unifiedauthentication/model/UnifiedAuthenticationScreenConfiguration;",
    name = "getEnableSignInWithGoogle",
    returnType = "Z",
)

@Suppress("unused")
val removeSocialSignInPatch = bytecodePatch(
    name = "Remove social sign-in",
    description = "Keeps Sign in with Google off in the HBO Max phone app. Email and phone " +
        "sign-in still work.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        EnableSignInWithGoogleFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
