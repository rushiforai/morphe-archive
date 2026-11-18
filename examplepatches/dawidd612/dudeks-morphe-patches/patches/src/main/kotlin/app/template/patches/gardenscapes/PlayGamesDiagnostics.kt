package app.template.patches.gardenscapes

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val CENTER = "Lcom/playrix/gplay/GoogleGameCenter;"
private const val HOOK = "Lpl/dudek/extension/gardenscapes/PlayGamesDiagnostics;"

private object SignInFingerprint : Fingerprint(
    definingClass = CENTER,
    name = "signIn",
    returnType = "V",
    parameters = listOf("J", "Z"),
    strings = listOf("signIn "),
)

// Match the callback by its signature and log marker, not the compiler's $5 suffix.
private object SignInCompletedFingerprint : Fingerprint(
    name = "onComplete",
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/tasks/Task;"),
    strings = listOf("signIn complete "),
)

internal val playGamesDiagnostics = bytecodePatch {
    extendWith("extensions/gardenscapes.mpe")
    execute {
        val signIn = SignInFingerprint.method
        val complete = SignInCompletedFingerprint.method
        val callback = SignInCompletedFingerprint.classDef
        val silent = callback.fields.single { it.type == "Z" }
        callback.fields.single { it.type == CENTER }
        val activity = SignInFingerprint.classDef.fields.single { it.type == "Landroid/app/Activity;" }
        // This exact build has two/four unused locals at method entry. Never
        // overwrite requestId, silentMode, the Task or the callback instance.
        if (signIn.implementation!!.registerCount != 6 || complete.implementation!!.registerCount != 6 ||
            signIn.instructions.none {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                    ref.definingClass == callback.type && ref.name == "<init>" &&
                        ref.parameterTypes == listOf(CENTER, "J", "Z")
                } == true
            } ||
            complete.instructions.none {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                    ref.definingClass == "Lcom/google/android/gms/tasks/Task;" && ref.name == "isSuccessful"
                } == true
            }) throw PatchException("Gardenscapes Play Games sign-in layout changed")

        signIn.addInstructionsWithLabels(0, """
            if-nez p3, :dudeks_original_sign_in
            iget-object v0, p0, $activity
            const-string v1, "connecting..."
            invoke-static {v0, v1}, $HOOK->show(Landroid/content/Context;Ljava/lang/String;)V
        """.trimIndent(), ExternalLabel("dudeks_original_sign_in", signIn.getInstruction(0)))

        complete.addInstructionsWithLabels(0, """
            iget-boolean v0, p0, $silent
            if-nez v0, :dudeks_original_result
            invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z
            move-result v0
            if-nez v0, :dudeks_check_authentication
            invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;
            move-result-object v0
            if-eqz v0, :dudeks_no_exception
            instance-of v1, v0, Lcom/google/android/gms/common/api/ApiException;
            if-eqz v1, :dudeks_exception_type
            check-cast v0, Lcom/google/android/gms/common/api/ApiException;
            invoke-virtual {v0}, Lcom/google/android/gms/common/api/ApiException;->getStatusCode()I
            move-result v0
            invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
            move-result-object v0
            const-string v1, "status "
            invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v1
            goto :dudeks_report
            :dudeks_exception_type
            invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
            move-result-object v0
            invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
            move-result-object v1
            goto :dudeks_report
            :dudeks_no_exception
            const-string v1, "cancelled / no exception"
            goto :dudeks_report
            :dudeks_check_authentication
            invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Lcom/google/android/gms/games/AuthenticationResult;
            if-eqz v0, :dudeks_not_authenticated
            invoke-virtual {v0}, Lcom/google/android/gms/games/AuthenticationResult;->isAuthenticated()Z
            move-result v0
            if-eqz v0, :dudeks_not_authenticated
            const-string v1, "authenticated"
            goto :dudeks_report
            :dudeks_not_authenticated
            const-string v1, "not authenticated"
            :dudeks_report
            invoke-static {}, Lcom/playrix/engine/Engine;->getContext()Landroid/content/Context;
            move-result-object v0
            invoke-static {v0, v1}, $HOOK->show(Landroid/content/Context;Ljava/lang/String;)V
        """.trimIndent(), ExternalLabel("dudeks_original_result", complete.getInstruction(0)))
    }
}
