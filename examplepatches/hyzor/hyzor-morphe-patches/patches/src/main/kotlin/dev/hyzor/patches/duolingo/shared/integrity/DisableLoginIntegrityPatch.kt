package dev.hyzor.patches.duolingo.shared.integrity

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.hyzor.patches.util.getReference
import dev.hyzor.patches.util.indexOfFirstInstruction

/**
 * Duolingo attaches a login integrity signal to the email login request. A re-signed sideload
 * cannot produce a valid attestation for it, and login fails.
 *
 * The app already ships an empty signal singleton — the instance the normal email login builder
 * passes. The patch loads that instance instead of whatever signal the caller supplied, inside
 * `LoginRequest$EmailLoginRequest.<init>`, so every construction site (email login builder, the
 * shared-login lambda and the serializer) sends the empty signal.
 *
 * Every other Duolingo patch depends on this one: without it a re-signed build cannot log in.
 */
@Suppress("unused")
val disableLoginIntegrityPatch = bytecodePatch {
    execute {
        val loginCtor = EmailLoginRequestCtorFingerprint.method
        if (loginCtor.parameterTypes.size != 4) {
            throw PatchException(
                "Expected four parameters on ${loginCtor.definingClass}-><init>",
            )
        }

        // The signal parameter's class is obfuscated, but it is the declared type of the field
        // that the constructor stores the signal into, and the empty singleton is the only
        // static field the builder loads whose class is that type or a subclass of it.
        val signalType = loginCtor.parameterTypes[3].toString()
        val signals = EmailLoginBuilderFingerprint.method.instructions
            .filter { it.opcode == Opcode.SGET_OBJECT }
            .mapNotNull { it.getReference<FieldReference>() }
            .filter { field ->
                field.type == signalType ||
                    runCatching { classDefBy(field.type).superclass == signalType }
                        .getOrDefault(false)
            }
            .distinct()

        val emptySignalRef = signals.singleOrNull()
            ?: throw PatchException(
                "Expected exactly one empty login signal of type $signalType, found ${signals.size}",
            )

        // The constructor stores the signal parameter into the request's signal field.
        val setSignalIndex = loginCtor.indexOfFirstInstruction {
            opcode == Opcode.IPUT_OBJECT &&
                getReference<FieldReference>()?.type == signalType
        }
        if (setSignalIndex < 0) {
            throw PatchException(
                "Could not find the login signal field write on ${loginCtor.definingClass}",
            )
        }

        val signalParamReg = loginCtor.getInstruction<Instruction22c>(setSignalIndex).registerA
        loginCtor.addInstruction(setSignalIndex, "sget-object v$signalParamReg, $emptySignalRef")
    }
}
