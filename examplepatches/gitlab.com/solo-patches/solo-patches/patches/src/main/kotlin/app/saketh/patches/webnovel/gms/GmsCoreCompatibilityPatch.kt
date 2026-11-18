package app.saketh.patches.webnovel.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.methodCall
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.saketh.patches.shared.Constants.COMPATIBILITY_WEBNOVEL
import app.template.patches.shared.gms.gmsCorePatch
import app.template.patches.shared.signature.spoofSignatureVerificationPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private object GoogleServicesAvailabilityFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/common/GooglePlayServicesUtilLight;",
    name = "isGooglePlayServicesAvailable",
    isStatic = true,
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
)

/** Builds the classic Google Sign-In intent. Its log tag names the public API it implements. */
private object GoogleSignInIntentFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Landroid/content/Intent;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;",
    ),
    strings = listOf("getSignInIntent()"),
)

private const val SIGN_IN_HOOKS = "Lapp/saketh/extension/gms/GoogleSignInHooks;"
private const val SIGN_IN_ACTIVITY = "Lcom/qidian/Int/reader/activity/BaseSignInActivity;"

/** WebNovel's Google sign-in launcher. Returning false makes the caller reset its in-progress state. */
private object GoogleSignInStartFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/app/Activity;"),
    strings = listOf("signIn failed: mGoogleSignInClient is null"),
)

/** Handles the Google sign-in result. Its failure branch passes the status code to a private (I)Z check. */
private object GoogleSignInResultFingerprint : Fingerprint(
    definingClass = SIGN_IN_ACTIVITY,
    returnType = "V",
    parameters = listOf("Landroid/content/Intent;"),
    strings = listOf("google_result_data_null"),
    filters = listOf(methodCall(definingClass = SIGN_IN_ACTIVITY, parameters = listOf("I"), returnType = "Z")),
)

@Suppress("unused")
val gmsCoreCompatibilityPatch = patch(
    name = "WebNovel GmsCore compatibility",
    description = "Adapts WebNovel's Google SDK availability check and sign-in protocol for GmsCore. " +
        "Explains a missing GmsCore provider and failed Google sign-in instead of failing silently. " +
        "Includes the required signature and GmsCore patches. Requires installed app.revanced.android.gms.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WEBNOVEL)
    dependsOn(spoofSignatureVerificationPatch, gmsCorePatch)

    execute {
        GoogleSignInStartFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1 }, $SIGN_IN_HOOKS->providerReady(Landroid/app/Activity;)Z
                move-result v0
                if-nez v0, :start
                return v0
            """,
            ExternalLabel("start", GoogleSignInStartFingerprint.method.implementation!!.instructions[0]),
        )

        GoogleSignInResultFingerprint.let {
            val check = it.instructionMatches.single().index
            val status = it.method.getInstruction<FiveRegisterInstruction>(check).registerD
            it.method.addInstructions(
                check,
                "invoke-static { p0, v$status }, $SIGN_IN_HOOKS->signInFailed(Landroid/app/Activity;I)V",
            )
        }
    }

    finalize {
        GoogleSignInIntentFingerprint.method.apply {
            val index = implementation!!.instructions.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                    "app.revanced.android.gms.auth.GOOGLE_SIGN_IN"
            }
            check(index >= 0) { "Apply GmsCore support (MicroG) with vendor app.revanced.android.gms first." }
            val register = getInstruction<OneRegisterInstruction>(index).registerA
            // Native SignInHubActivity expects Google's original inbound protocol action.
            replaceInstruction(index, "const-string v$register, \"com.google.android.gms.auth.GOOGLE_SIGN_IN\"")
        }

        // This SDK lacks the universal patch's string anchors and rejects the intended GmsCore provider.
        // Authentication and the backend authorization-code exchange still run normally.
        GoogleServicesAvailabilityFingerprint.method.returnEarly(0)

        // Protected onCreate builds its Google-targeted intent in native code.
        // Route only that outbound sign-in intent at the virtual Activity boundary.
        val hub = mutableClassDefBy("Lcom/google/android/gms/auth/api/signin/internal/SignInHubActivity;")
        val parameters = listOf("Landroid/content/Intent;", "I", "Landroid/os/Bundle;")
        check(hub.methods.none { it.name == "startActivityForResult" && it.parameterTypes == parameters })
        val superclass = checkNotNull(hub.superclass)
        val forwardSignIn = MutableMethod(
            ImmutableMethod(
                hub.type,
                "startActivityForResult",
                parameters.map { ImmutableMethodParameter(it, emptySet(), null) },
                "V",
                AccessFlags.PUBLIC.value,
                emptySet(),
                emptySet(),
                MutableMethodImplementation(6),
            ),
        )
        forwardSignIn.addInstructions(
            0,
            """
                invoke-virtual { p1 }, Landroid/content/Intent;->getAction()Ljava/lang/String;
                move-result-object v0
                const-string v1, "com.google.android.gms.auth.GOOGLE_SIGN_IN"
                invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :forward
                invoke-virtual { p1 }, Landroid/content/Intent;->getPackage()Ljava/lang/String;
                move-result-object v0
                const-string v1, "com.google.android.gms"
                invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :forward
                const-string v0, "app.revanced.android.gms.auth.GOOGLE_SIGN_IN"
                invoke-virtual { p1, v0 }, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;
                const-string v0, "app.revanced.android.gms"
                invoke-virtual { p1, v0 }, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
                :forward
                invoke-super { p0, p1, p2, p3 }, $superclass->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V
                return-void
            """,
        )
        hub.methods.add(forwardSignIn)
    }
}
