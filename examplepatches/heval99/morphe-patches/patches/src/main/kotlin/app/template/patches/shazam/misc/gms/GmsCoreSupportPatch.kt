package app.template.patches.shazam.misc.gms

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_SHAZAM
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.misc.gms.gmsCoreSupportPatch
import app.template.patches.shazam.misc.signature.spoofSignaturePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Shazam's Google sign-in (FirebaseUI Auth: androidx.credentials' Play services provider with a
// Sign in with Google option, default_web_client_id, into Firebase Auth) goes through Google Play
// services, which sees the re-signed app's real certificate; with this patch it goes to MicroG RE,
// which answers as the original app. Push (FCM, FirebaseMessagingService) goes through MicroG RE
// too. Off by default: Shazam works without an account, and the extension asks the user to install
// MicroG RE on every launch until it is installed. Pulls in "Spoof signature", because Firebase
// checks the app's certificate too. Also skips Shazam's silent Google sign-in attempts (see
// skipSilentSignIn).
@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    fromPackageName = "com.shazam.android",
    // SHA-1 of the original signing certificate (CN=Tony Miller, O=Shazam Entertainment Ltd.), read
    // from the APKMirror 16.63.0-261008 bundle's base APK (the merged APK's block no longer verifies).
    spoofedPackageSignature = "b804e188301813b5d8d47d0bb2280607c16fd8b6",
    mainActivityOnCreateFingerprint = SplashActivityOnCreateFingerprint,
    compatibility = COMPATIBILITY_SHAZAM,
    default = false,
    dependencies = setOf(spoofSignaturePatch),
    // No clone: the dex hard-codes the original package name in behaviour checks - the
    // launcher's onStart branches on "com.shazam.android", and Apple's AMS kit pairs
    // "com.shazam.android" with its signing-certificate allowlist - so a clone takes
    // broken paths (the provider authorities themselves are all under com.shazam.android
    // and would rename fine).
    allowClone = false,
    // The automatic sign-in attempts are skipped (MicroG RE shows them as an account chooser).
    extraDescription = "Sign in with the Sign in with Google button.",
    executeBlock = { skipSilentSignIn() },
)

private const val CONTEXT = "Landroid/content/Context;"
private const val STRING = "Ljava/lang/String;"
private const val SHARED_PREFERENCES = "Landroid/content/SharedPreferences;"

/**
 * When signed out, opening the Library tab and opening the login screen each call the sign-in use
 * case with silent = true: a Google ID request with filterByAuthorizedAccounts = true, which on
 * stock Play services fails with NoCredentialException unless an account already signed in to
 * Shazam. MicroG RE ignores that filter and shows its account chooser uninvited. This makes the
 * entry return false (not signed in, the stock result for "no credential") at once when silent is
 * true. The Sign in with Google button calls it with silent = false
 * (GetSignInWithGoogleOption), which is not touched, and so does the coroutine's resume.
 */
private fun BytecodePatchContext.skipSilentSignIn() {
    val method = SilentSignInFingerprint.method
    val where = "${method.definingClass}->${method.name}"
    val implementation = method.implementation ?: throw PatchException("$where has no code")
    if (AccessFlags.STATIC.isSet(method.accessFlags)) throw PatchException("$where is static")
    val instructions = implementation.instructions.toList()

    // p0 = this, p1 = Context, p2 = String, p3 = silent, p4 = continuation (all single-width).
    val silent = implementation.registerCount - (method.parameters.size + 1) + 3

    // Step 1: the shape this relies on. The pref is read only after a branch on the silent flag...
    val prefRead = instructions.indexOfFirst { instruction ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_INTERFACE && call?.definingClass == SHARED_PREFERENCES &&
            call.name == "getBoolean"
    }
    if (prefRead < 0) throw PatchException("$where no longer reads the silent sign-in pref")
    val silentBranch = instructions.subList(0, prefRead).any {
        (it.opcode == Opcode.IF_EQZ || it.opcode == Opcode.IF_NEZ) && (it as OneRegisterInstruction).registerA == silent
    }
    if (!silentBranch) throw PatchException("$where does not branch on its silent flag (p3) before reading the pref")

    // ...and the flag is handed on to the credential request (filterByAuthorizedAccounts).
    val forwardsSilent = instructions.any { instruction ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@any false
        val params = call.parameterTypes.map(CharSequence::toString)
        val registers = when (instruction) {
            is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
            is FiveRegisterInstruction -> listOf(
                instruction.registerC, instruction.registerD, instruction.registerE,
                instruction.registerF, instruction.registerG,
            ).take(instruction.registerCount)
            else -> return@any false
        }
        instruction.opcode == Opcode.INVOKE_VIRTUAL && params.size == 4 && params[0] == CONTEXT &&
            params[1] == STRING && params[2] == "Z" && registers.getOrNull(3) == silent
    }
    if (!forwardsSilent) throw PatchException("$where no longer passes its silent flag to the sign-in request")

    // Step 2: return Boolean.FALSE when silent is true. At index 0 no local holds a value yet, so
    // v0 is free as long as it is a local and not p0.
    if (implementation.registerCount <= method.parameters.size + 1) throw PatchException("$where has no local register")
    method.addInstructionsWithLabelsChecked(
        0,
        """
            if-eqz p3, :stock
            sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            return-object v0
        """,
        ExternalLabel("stock", method.getInstruction(0)),
    )
}
