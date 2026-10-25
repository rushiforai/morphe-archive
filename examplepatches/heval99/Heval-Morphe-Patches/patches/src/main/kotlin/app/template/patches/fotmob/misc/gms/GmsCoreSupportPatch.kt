package app.template.patches.fotmob.misc.gms

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.template.patches.fotmob.misc.signature.spoofSignaturePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.misc.gms.gmsCoreSupportPatch
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// FotMob's "Sign in with Google" goes through androidx.credentials' Play services provider
// (google_server_client_id) into Firebase Auth, which Google Play services rejects for the
// re-signed app, so it needs MicroG RE (issue #64). Facebook and Apple sign-in do not use Play
// services. Push (FCM) works on a re-signed build without this patch; with it, FCM goes through
// MicroG RE. Off by default: FotMob works without an account, and the extension asks the user to
// install MicroG RE on every launch until it is installed. Pulls in "Spoof signature", because
// Firebase checks the app's certificate too. Also skips the automatic sign-in attempt at first
// start (see skipOnboardingAutoSignIn).
@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    fromPackageName = "com.mobilefootie.wc2010",
    // SHA-1 of the original signing certificate (CN=Christer Nordvik), read from the APKMirror
    // 238.17794.20261012 bundle's base APK (the merged APK's block no longer verifies).
    spoofedPackageSignature = "5546e6c4b0c1f31b9e5a953a89a8bb6f25a2ad6f",
    mainActivityOnCreateFingerprint = MainActivityOnCreateFingerprint,
    compatibility = COMPATIBILITY_FOTMOB,
    default = false,
    dependencies = setOf(spoofSignaturePatch),
    // No clone: the widget providers' authorities (com.fotmob.widget.logos / .images) are not
    // under the package name, so the rename keeps them and the clone cannot be installed next
    // to the stock app; the dex also hard-codes content://com.fotmob.widget.* URIs.
    allowClone = false,
    // The automatic sign-in at first start is skipped (MicroG RE shows it as an account chooser).
    extraDescription = "Sign in with the Sign in with Google button.",
    executeBlock = { skipOnboardingAutoSignIn() },
)

private const val CONTEXT = "Landroid/content/Context;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"

// Writes that read no register, so the register they set held nothing the code after needs.
private val PLAIN_WRITES = setOf(
    Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_OBJECT, Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST,
    Opcode.CONST_HIGH16, Opcode.CONST_STRING, Opcode.NEW_INSTANCE,
)

/**
 * At first start OnboardingStartActivity tries a silent Google sign-in: a GetGoogleIdOption with
 * filterByAuthorizedAccounts = true, which on stock Play services fails with
 * NoCredentialException unless an account already signed in to FotMob before. MicroG RE ignores
 * that filter and shows its account chooser uninvited. This throws NoCredentialException right
 * after the request reads google_server_client_id, before the request is built, inside the same
 * try block, so the stock handler runs: it logs "Did not find any existing Google accounts...",
 * sets the activity's flag that SignInActivity gets as the "noAuthorizedGoogleAccountFound" extra
 * and the ViewModel's tried flag, exactly as when
 * Play services finds no account. The Sign in with Google button (GetSignInWithGoogleOption, in
 * other methods) is not touched.
 */
private fun BytecodePatchContext.skipOnboardingAutoSignIn() {
    val noCredential = NoCredentialExceptionConstructorFingerprint.originalClassDef.type
    val method = OnboardingAutoSignInFingerprint.method
    val implementation = method.implementation
        ?: throw PatchException("Onboarding auto sign-in method has no code")
    val instructions = implementation.instructions

    // NoCredentialException and its superclasses: a handler for any of them catches the throw.
    // The walk stops at the first framework class (java.lang.Exception), so add the rest.
    val catchingTypes = generateSequence(noCredential) { classDefByOrNull(it)?.superclass }.toSet() +
        setOf("Ljava/lang/Throwable;", "Ljava/lang/Object;")

    // Code ranges of the try blocks whose first handler able to catch NoCredentialException is
    // the NoCredentialException handler (dex picks the first matching handler in order).
    val noCredentialRanges = implementation.tryBlocks.filter { tryBlock ->
        val catching = tryBlock.exceptionHandlers.firstOrNull { it.exceptionType == null || it.exceptionType in catchingTypes }
        catching?.exceptionType == noCredential
    }.map { it.startCodeAddress until it.startCodeAddress + it.codeUnitCount }
    fun inNoCredentialTry(index: Int) =
        noCredentialRanges.any { instructions[index].location.codeAddress in it }

    // Step 1: the request's Context.getString(google_server_client_id) call, the only
    // Context.getString(int) inside such a try block.
    val getStringCalls = instructions.indices.filter { index ->
        val instruction = instructions[index]
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_VIRTUAL && call?.definingClass == CONTEXT &&
            call.name == "getString" && call.parameterTypes.map(CharSequence::toString) == listOf("I") &&
            call.returnType == "Ljava/lang/String;" && inNoCredentialTry(index)
    }
    val getString = getStringCalls.singleOrNull() ?: throw PatchException(
        "Expected one Context.getString(I) inside a NoCredentialException ($noCredential) try block in " +
            "${method.definingClass}->${method.name}, found ${getStringCalls.size}",
    )
    val moveResult = instructions.getOrNull(getString + 1)
    if (moveResult?.opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("Context.getString(I) in ${method.definingClass}->${method.name} is not followed by move-result-object")
    }
    val clientId = (moveResult as OneRegisterInstruction).registerA

    // Step 2: insert in front of the next instruction, which must still be in the try block
    // and must not be a jump target (a jump there would skip the throw).
    val insertAt = getString + 2
    method.requireNoBranchTargetAt(insertAt, "NoCredentialException throw")
    if (!inNoCredentialTry(insertAt)) {
        throw PatchException("The instruction after the client id read is outside the NoCredentialException try block")
    }

    // Step 3: a scratch register the stock code overwrites before reading it (v6 in 238), found
    // in the straight-line code after the read. The handlers do not read it either (checked in
    // 238: the stock code holds an int there at other throwing points of the same try block).
    // Both registers go into a non-range invoke-direct, so both must be v0..v15.
    val scratch = scratchRegisterAt(instructions, insertAt, clientId)
    if (clientId > 15) throw PatchException("Client id register v$clientId does not fit a non-range invoke")

    method.addInstructionsChecked(
        insertAt,
        """
            new-instance v$scratch, $noCredential
            invoke-direct { v$scratch, v$clientId }, $noCredential-><init>($CHAR_SEQUENCE)V
            throw v$scratch
        """,
    )
}

/**
 * Returns the first register below v16, other than [exclude], that the straight-line code from
 * [start] writes before reading it. Only invokes (reads) and [PLAIN_WRITES] are followed; any
 * other instruction ends the search, and finding none throws.
 */
private fun scratchRegisterAt(instructions: List<Instruction>, start: Int, exclude: Int): Int {
    val read = mutableSetOf<Int>()
    for (index in start until minOf(instructions.size, start + 8)) {
        val instruction = instructions[index]
        when {
            instruction.opcode.name.startsWith("invoke-") && instruction is RegisterRangeInstruction ->
                read += instruction.startRegister until instruction.startRegister + instruction.registerCount
            instruction.opcode.name.startsWith("invoke-") && instruction is FiveRegisterInstruction ->
                read += listOf(
                    instruction.registerC, instruction.registerD, instruction.registerE,
                    instruction.registerF, instruction.registerG,
                ).take(instruction.registerCount)
            instruction.opcode in PLAIN_WRITES -> {
                val register = (instruction as OneRegisterInstruction).registerA
                if (register !in read && register != exclude && register < 16) return register
            }
            else -> break
        }
    }
    throw PatchException(
        "No free register below v16 after the client id read for the NoCredentialException throw; code there: " +
            instructions.drop(start).take(8).joinToString { it.opcode.name },
    )
}
