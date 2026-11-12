package app.template.patches.shohay

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_SHOHAY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val MICROG_ACTION = "app.revanced.android.gms.auth.GOOGLE_SIGN_IN"
private const val MICROG_PACKAGE = "app.revanced.android.gms"
private const val GMS_ACTION = "com.google.android.gms.auth.GOOGLE_SIGN_IN"
private const val GMS_PACKAGE = "com.google.android.gms"

/**
 * Finds the first const-string instruction whose string equals [value]
 * and returns its (index, register). Returns null when not found.
 */
private fun findConstString(
    instructions: List<Instruction>,
    value: String,
): Pair<Int, Int>? {
    val index = instructions.indexOfFirst { instr ->
        instr.opcode == Opcode.CONST_STRING &&
            instr is ReferenceInstruction &&
            (instr.reference as? StringReference)?.string == value
    }
    if (index < 0) return null
    val register = (instructions[index] as OneRegisterInstruction).registerA
    return index to register
}

@Suppress("unused")
val shohayMicrogLoginPatch = patch(
    name = "MicroG RE Google Sign-In",
    description = "Redirects Google Sign-In to MicroG RE (app.revanced.android.gms): forces normal sign-in mode, rewrites the sign-in action/package, and drops the unused ID-token request. Pair with the 'MicroG signature spoof' manifest patch or login fails with error 8. Verified on Shohay 2.1.1.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SHOHAY)

    execute {
        // 1) GoogleSignInClient.<clinit>: force mode 4 (normal GOOGLE_SIGN_IN).
        // Replace the `const/4 v0, 0x1` before `sput v0, ->zba:I` with 0x4.
        // v0 is only the mode constant here, so starting it at 4 makes zba()
        // take the normal sign-in path without probing Play Services.
        GoogleSignInClientClinitFingerprint.let {
            val instructions = it.method.implementation?.instructions
                ?: error("GoogleSignInClient.<clinit>: no implementation")
            val constIndex = instructions.indexOfFirst { instr ->
                instr.opcode == Opcode.CONST_4 &&
                    instr is OneRegisterInstruction && instr.registerA == 0 &&
                    instr is NarrowLiteralInstruction && instr.narrowLiteral == 1
            }
            require(constIndex >= 0) {
                "GoogleSignInClient.<clinit>: const/4 v0, 0x1 not found"
            }
            it.method.replaceInstruction(constIndex, "const/4 v0, 0x4")
        }

        // 2) zbm.zba: redirect the sign-in Intent action to MicroG RE.
        ZbmZbaFingerprint.let {
            val instructions = it.method.implementation?.instructions
                ?: error("zbm.zba: no implementation")
            val (constIndex, register) = findConstString(instructions, GMS_ACTION)
                ?: error("zbm.zba: GOOGLE_SIGN_IN const-string not found")
            it.method.replaceInstruction(
                constIndex,
                "const-string v$register, \"$MICROG_ACTION\""
            )
        }

        // 3) SignInHubActivity.zbc: redirect both the action comparison and
        // the target package to MicroG RE.
        SignInHubActivityZbcFingerprint.let {
            val instructions = it.method.implementation?.instructions
                ?: error("SignInHubActivity.zbc: no implementation")
            val (actionIndex, actionRegister) = findConstString(instructions, GMS_ACTION)
                ?: error("SignInHubActivity.zbc: GOOGLE_SIGN_IN const-string not found")
            it.method.replaceInstruction(
                actionIndex,
                "const-string v$actionRegister, \"$MICROG_ACTION\""
            )
            // Re-fetch after the first replacement so the index is current.
            val instructions2 = it.method.implementation?.instructions
                ?: error("SignInHubActivity.zbc: no implementation")
            val (packageIndex, packageRegister) = findConstString(instructions2, GMS_PACKAGE)
                ?: error("SignInHubActivity.zbc: com.google.android.gms const-string not found")
            // The package string is loaded into a parameter register (p1 in
            // source). registerA is the raw register number, so vN refers to
            // the same register the assembler will resolve p1 to.
            it.method.replaceInstruction(
                packageIndex,
                "const-string v$packageRegister, \"$MICROG_PACKAGE\""
            )
        }

        // 4) SignInHubActivity.onCreate: redirect the action dispatch to
        // MicroG RE so the activity routes the MicroG RE Intent to zbc.
        SignInHubActivityOnCreateFingerprint.let {
            val instructions = it.method.implementation?.instructions
                ?: error("SignInHubActivity.onCreate: no implementation")
            val (constIndex, register) = findConstString(instructions, GMS_ACTION)
                ?: error("SignInHubActivity.onCreate: GOOGLE_SIGN_IN const-string not found")
            it.method.replaceInstruction(
                constIndex,
                "const-string v$register, \"$MICROG_ACTION\""
            )
        }

        // 5) GoogleSignInContract.createIntent: drop the ID-token request.
        // The app never calls getIdToken() and never sends a token to its
        // server, so the request is dead weight. Replace the 3-code-unit
        // `invoke-virtual {p0, p2}, Builder->requestIdToken(String)Builder`
        // with the same-size `invoke-virtual {p0}, Builder->requestEmail()Builder`
        // (requestEmail is already called just below and is idempotent).
        // The const-string holding the client ID and the move-result-object
        // are left in place; the string is simply never used now.
        GoogleSignInContractCreateIntentFingerprint.let {
            val instructions = it.method.implementation?.instructions
                ?: error("GoogleSignInContract.createIntent: no implementation")
            val invokeIndex = instructions.indexOfFirst { instr ->
                instr.opcode == Opcode.INVOKE_VIRTUAL &&
                    instr is ReferenceInstruction &&
                    (instr.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference)?.name == "requestIdToken"
            }
            require(invokeIndex >= 0) {
                "GoogleSignInContract.createIntent: requestIdToken invoke not found"
            }
            it.method.replaceInstruction(
                invokeIndex,
                "invoke-virtual {p0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions\$Builder;->requestEmail()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions\$Builder;"
            )
        }
    }
}
