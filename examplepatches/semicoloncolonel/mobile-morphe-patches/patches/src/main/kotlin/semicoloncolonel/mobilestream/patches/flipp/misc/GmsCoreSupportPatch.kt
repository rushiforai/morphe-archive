package semicoloncolonel.mobilestream.patches.flipp.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.flipp.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.gms.gmsCoreSupportPatch

// Flipp 116.0.0 signs in with Google in two steps: Credential Manager picks the
// account, then the Identity authorization client asks for an offline access
// code. A re-signed copy cannot sign in with Google directly: Google answers
// only the app signed with its Play signing key. GmsCore presents the original
// package name and key instead. Email and Facebook sign-in do not use it, so
// this is off by default. See GmsCoreSupportBuilder for the details.
//
// GmsCore answers the second step with a consent screen. Flipp registers the
// launcher for that screen only when it needs it, after the activity has
// resumed, and AndroidX refuses that, so sign-in ended with "An unexpected
// error occurred". The launcher is registered through the activity's
// ActivityResultRegistry instead, which allows it at any time.
//
// Clone app does not work with Google sign-in: GmsCore's consent screen checks
// the calling package against the original package name and answers "package
// name mismatch". docs/known-issues.md says to leave Clone app off.

private const val GOOGLE_CONSENT = "Lsemicoloncolonel/mobilestream/extension/flipp/GoogleConsent;"
private const val LAUNCHER = "Landroidx/activity/result/ActivityResultLauncher;"

internal object AuthorizationResultFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("Unexpected error. No pending intent defined."),
)

private val googleConsentPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        AuthorizationResultFingerprint.method.apply {
            val index = instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).name == "registerForActivityResult"
            }
            if (index < 0) throw IllegalStateException("Flipp's consent launcher registration was not found")
            val call = getInstruction<FiveRegisterInstruction>(index)
            replaceInstruction(
                index,
                "invoke-static { v${call.registerC}, v${call.registerD}, v${call.registerE} }, " +
                    "$GOOGLE_CONSENT->register(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            )
            val result = getInstruction<OneRegisterInstruction>(index + 1).registerA
            addInstruction(index + 2, "check-cast v$result, $LAUNCHER")
        }
    }
}

@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    compatibility = Constants.COMPATIBILITY,
    appName = "Flipp",
    packageName = "com.wishabi.flipp",
    clonePackageName = "app.mobilestream.flipp",
    // SHA-1 of the Play app signing certificate.
    signature = "80ed647e2a2c668aaf1a69bc507eb9a9e3a42d5f",
    launcherActivity = "Lcom/wishabi/flipp/ui/launcher/DefaultLauncherActivity;",
    extraPatches = setOf(googleConsentPatch),
)
