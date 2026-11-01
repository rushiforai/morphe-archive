package semicoloncolonel.mobilestream.patches.mgm.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.mgm.shared.Constants

private const val CREDENTIAL_MANAGER = "Landroidx/credentials/CredentialManager;"

// MGM+ 240.0 offers "Sign in with Google" and "Sign in with Apple" next to
// email sign-in, plus "Sign up with Google" on the register screen. Each
// button is its own composable; one that returns before composing anything
// draws nothing at every call site. Login with Amazon stays, since it is how
// Amazon-billed subscribers sign in.
internal object GoogleSignInButtonFingerprint : Fingerprint(
    custom = { method, _ -> method.name.startsWith("GoogleSignInButton") },
    returnType = "V",
)

internal object AppleSignInButtonFingerprint : Fingerprint(
    definingClass = "Lcom/epix/presentation/login/signInWithApple/SignInWithAppleButtonKt;",
    custom = { method, _ -> method.name.startsWith("SignInWithAppleButton") },
    returnType = "V",
)

// The splash screen also opens Google's sign-in sheet on its own. Its
// coroutine wraps CredentialManager.getCredential in a try whose catch
// reports "no purchase found" and continues startup, so throwing just before
// that call takes the same path as a dismissed sheet.
internal object SplashGoogleSignInFingerprint : Fingerprint(
    name = "invokeSuspend",
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/epix/presentation/splash/components/SplashScreenKt") &&
            method.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                    ref.definingClass == CREDENTIAL_MANAGER && ref.name.startsWith("getCredential")
                } == true
            } == true
    },
)

@Suppress("unused")
val removeSocialSignInPatch = bytecodePatch(
    name = "Remove social sign-in",
    description = "Removes the Sign in with Google and Sign in with Apple buttons from the MGM+ " +
        "phone app, and stops the app from opening Google's sign-in sheet on its own at " +
        "startup. Email sign-in and Login with Amazon still work.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        listOf(GoogleSignInButtonFingerprint, AppleSignInButtonFingerprint).forEach {
            it.method.addInstructions(0, "return-void")
        }

        SplashGoogleSignInFingerprint.method.apply {
            val index = implementation!!.instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_STATIC &&
                    ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.definingClass == CREDENTIAL_MANAGER && ref.name.startsWith("getCredential")
                    }
            }
            if (index < 0) throw PatchException("Splash Google sign-in call not found")
            // Any register is free here: the next instruction throws, and the
            // catch only reads the exception.
            addInstructions(
                index,
                """
                    new-instance v0, Ljava/lang/IllegalStateException;
                    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V
                    throw v0
                """,
            )
        }
    }
}
