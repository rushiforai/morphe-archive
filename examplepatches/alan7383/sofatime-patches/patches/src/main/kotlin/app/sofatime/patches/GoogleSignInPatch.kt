package app.sofatime.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.sofatime.shared.Constants.SOFATIME_COMPATIBILITY

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val googleSignInPatch = bytecodePatch(
    name = "Bypass Google Sign-In",
    description = "Bypasses SHA-1 check by using embedded WebView OAuth for Google Sign-In.",
) {
    compatibleWith(SOFATIME_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        val targetMethod = googleSignInMethodFingerprint.originalMethod
        val coroutineSuspendedRef = targetMethod.implementation?.instructions
            ?.firstOrNull { it.opcode == Opcode.SGET_OBJECT }
            ?.let { insn ->
                (insn as? ReferenceInstruction)?.reference?.toString()
            } ?: "Ler0;->a:Ler0;"

        googleSignInMethodFingerprint.method.addInstructions(0, """
            invoke-static {p0, p1}, Lapp/sofatime/GoogleSignInHelper;->startGoogleSignIn(Landroid/content/Context;Ljava/lang/Object;)V
            sget-object v0, $coroutineSuspendedRef
            return-object v0
        """)
    }
}

