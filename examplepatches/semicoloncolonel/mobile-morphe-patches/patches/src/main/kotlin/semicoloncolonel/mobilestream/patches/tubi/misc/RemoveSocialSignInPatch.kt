package semicoloncolonel.mobilestream.patches.tubi.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.tubi.shared.Constants

// Tubi 10.43.1's only social sign-in is "Continue with Google" (classic
// GoogleSignIn). One composable draws the button and owns its launcher, and
// all seven sign-in and sign-up screens call it, so returning before it
// composes removes it everywhere. The Facebook and Amazon SDKs in the app are
// not used for sign-in. R8 renames the composable (p39.a in 10.43.1); its
// test tag literal and parameter shape are stable.
internal object GoogleSignInButtonFingerprint : Fingerprint(
    parameters = listOf(
        "Landroidx/compose/ui/Modifier;",
        "Lkotlin/jvm/functions/Function1;",
        "Z",
        "Lkotlin/jvm/functions/Function0;",
        "Landroidx/compose/runtime/Composer;",
        "I",
        "I",
    ),
    returnType = "V",
    strings = listOf("google_sign_in_button"),
)

@Suppress("unused")
val removeSocialSignInPatch = bytecodePatch(
    name = "Remove social sign-in",
    description = "Removes the Continue with Google option from the Tubi phone app. Email " +
        "sign-in still works.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        GoogleSignInButtonFingerprint.method.addInstructions(0, "return-void")
    }
}
