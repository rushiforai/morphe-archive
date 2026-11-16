package me.toidicakhia.patches.devolutions

import me.toidicakhia.patches.shared.Constants.RDM_COMPATIBILITY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Skip Age Verification"

/**
 * The managed splash screen calls Google Play Age Signals on every launch and blocks
 * on the answer for up to two minutes. When Play Services cannot answer, which is the
 * case for a sideloaded build and for devices without the Play Store, the splash screen
 * stays up until that timeout expires. Answering the request locally with status 0
 * ("not available") makes the managed code continue immediately without starting the
 * follow-up age-signal query.
 */
private val rdmAgeSignalsBypassBytecodePatch = bytecodePatch(
    description = "Returns an immediate, empty age-signals result."
) {
    compatibleWith(RDM_COMPATIBILITY)

    execute {
        AgeSignalsAccessRequestFingerprint.match().method.apply {
            replaceMethodBody(
                this,
                registers = 4,
                smali = """
                    const/4 v0, 0x0
                    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                    move-result-object v0
                    invoke-static {}, Lcom/google/android/play/agesignals/AgeSignalsAccessResult;->builder()Lcom/google/android/play/agesignals/AgeSignalsAccessResult${'$'}Builder;
                    move-result-object v1
                    invoke-virtual {v1, v0}, Lcom/google/android/play/agesignals/AgeSignalsAccessResult${'$'}Builder;->setAgeSignalsStatus(Ljava/lang/Integer;)Lcom/google/android/play/agesignals/AgeSignalsAccessResult${'$'}Builder;
                    invoke-virtual {v1}, Lcom/google/android/play/agesignals/AgeSignalsAccessResult${'$'}Builder;->build()Lcom/google/android/play/agesignals/AgeSignalsAccessResult;
                    move-result-object v0
                    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
                    move-result-object v0
                    return-object v0
                """.trimIndent(),
            )
        }
    }
}

@Suppress("unused")
val rdmSkipAgeVerificationPatch = bytecodePatch(
    name = PATCH,
    description = "Answers the Google Play age-signals request locally instead of waiting for the Play " +
        "Store. The managed startup code blocks on that answer for up to two minutes, and the call " +
        "never completes on sideloaded builds or devices without Play Services. Also skips the " +
        "follow-up age-range query. Not selected by default: it disables the regional age gate.",
    default = false
) {
    compatibleWith(RDM_COMPATIBILITY)
    dependsOn(rdmAgeSignalsBypassBytecodePatch)
}

private fun BytecodePatchContext.replaceMethodBody(method: MutableMethod, registers: Int, smali: String) {
    val replacement = ImmutableMethod(
        method.definingClass,
        method.name,
        method.parameters,
        method.returnType,
        method.accessFlags,
        method.annotations,
        method.hiddenApiRestrictions,
        MutableMethodImplementation(registers),
    ).toMutable().apply { addInstructions(0, smali) }

    mutableClassDefBy(method.definingClass).methods.remove(method)
    mutableClassDefBy(method.definingClass).methods.add(replacement)
}
