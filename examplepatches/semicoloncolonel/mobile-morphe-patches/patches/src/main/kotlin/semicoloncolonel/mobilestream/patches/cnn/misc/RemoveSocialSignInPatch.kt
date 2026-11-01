package semicoloncolonel.mobilestream.patches.cnn.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cnn.shared.Constants

private const val GOOGLE_SIGN_IN_FLAG = "auth_android_google"

// CNN 26.21.0 offers "Continue with Google" (Credential Manager) next to
// email sign-in. One Optimizely flag, auth_android_google, controls every
// Google entry point: the sign-in and register screens (with their "or"
// divider), the no-account-found screen, and the sign-in command itself,
// which returns "Google auth is disabled" when it is off.
//
// OptimizelyWrapper's flag check (u(String) in 26.21.0, R8-renamed) is found
// by two literals it logs. Only that one flag is forced off.
internal object FeatureEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/cnn/mobile/android/phone/eight/optimizely/OptimizelyWrapper;",
    parameters = listOf("Ljava/lang/String;"),
    returnType = "Z",
    strings = listOf("tune_in", " is enabled"),
)

@Suppress("unused")
val removeSocialSignInPatch = bytecodePatch(
    name = "Remove social sign-in",
    description = "Removes the Continue with Google option from the CNN app. Email sign-in and " +
        "Prime Video account linking still work. An account created with Google needs a " +
        "password reset to sign in by email.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        FeatureEnabledFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "$GOOGLE_SIGN_IN_FLAG"
                invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :other_flag
                const/4 v0, 0x0
                return v0
                :other_flag
                nop
            """,
        )
    }
}
