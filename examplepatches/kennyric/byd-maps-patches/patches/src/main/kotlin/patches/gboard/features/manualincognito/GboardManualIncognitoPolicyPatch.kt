package patches.gboard.features.manualincognito

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import patches.gboard.shared.findMutableMethodOrThrow
import patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import patches.gboard.shared.isInvoke
import patches.gboard.shared.isMethodReference
import patches.gboard.shared.isOpcode
import patches.gboard.shared.isRegisterOperation
import patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import patches.gboard.shared.runtimeabi.RuntimeCallId
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardManualIncognitoPolicyPatch = bytecodePatch(
    description = "Add a scoped value delegate to the clipboard and voice incognito gates.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(GboardManualIncognitoTargets.clipboardListener)
            .applyManualIncognitoAfterBooleanCall(
                owner = "Lpdl;",
                name = "f",
                call = RuntimeCallId.MANUAL_INCOGNITO_RUNTIME_APPLY_CLIPBOARD_POLICY,
            )
        findMutableMethodOrThrow(GboardManualIncognitoTargets.voiceEligibility)
            .applyManualIncognitoBooleanParameterDelegate(
                RuntimeCallId.MANUAL_INCOGNITO_RUNTIME_APPLY_VOICE_POLICY,
                parameterRegister = "p2",
            )
        findMutableMethodOrThrow(GboardManualIncognitoTargets.dictationEligibility)
            .applyManualIncognitoAfterBooleanFieldRead(
                fieldReference = "Leqh;->v:Z",
                call = RuntimeCallId.MANUAL_INCOGNITO_RUNTIME_APPLY_DICTATION_FLAG,
            )
    }
}

internal fun MutableMethod.applyManualIncognitoAfterBooleanCall(
    owner: String,
    name: String,
    call: RuntimeCallId,
) {
    val abi = RuntimeAbiCatalog.abi(call)
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1) { "Duplicate manual incognito clipboard delegates" }
        return
    }
    val invokeIndex = instructions.indices.singleOrNull { index ->
        val reference = (instructions[index] as? ReferenceInstruction)
            ?.reference as? MethodReference
        reference?.definingClass == owner &&
            reference.name == name &&
            reference.parameterTypes.isEmpty() &&
            reference.returnType == "Z"
    } ?: error("Could not find exact $owner->$name()Z call in $definingClass->${this.name}")
    val moveResultIndex = invokeIndex + 1
    val register = (instructions.getOrNull(moveResultIndex) as? OneRegisterInstruction)
        ?.registerA
        ?: error("Expected result register after $owner->$name()Z")
    check(instructions[moveResultIndex].isRegisterOperation("MOVE_RESULT", register)) {
        "Expected MOVE_RESULT after $owner->$name()Z in $definingClass->${this.name}"
    }
    addInstructions(
        moveResultIndex + 1,
        """
            ${RuntimeCallEmitter.invoke(call, "v$register")}

            move-result v$register
        """.trimIndent(),
    )
}

internal fun MutableMethod.applyManualIncognitoBooleanParameterDelegate(
    call: RuntimeCallId,
    parameterRegister: String,
) {
    val abi = RuntimeAbiCatalog.abi(call)
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1 && instructions[0].isMethodReference(abi.reference)) {
            "Malformed manual incognito parameter delegate in $definingClass->$name"
        }
        return
    }
    addInstructions(
        0,
        """
            ${RuntimeCallEmitter.invoke(call, parameterRegister)}

            move-result $parameterRegister
        """.trimIndent(),
    )
}

internal fun MutableMethod.applyManualIncognitoAfterBooleanFieldRead(
    fieldReference: String,
    call: RuntimeCallId,
) {
    val abi = RuntimeAbiCatalog.abi(call)
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1) { "Duplicate manual incognito dictation delegates" }
        return
    }
    val fieldIndex = instructions.indices.singleOrNull { index ->
        val field = (instructions[index] as? ReferenceInstruction)?.reference as? FieldReference
        field?.toString() == fieldReference &&
            instructions[index].isOpcode("IGET_BOOLEAN")
    } ?: error("Could not find exact $fieldReference read in $definingClass->$name")
    val register = (instructions[fieldIndex] as OneRegisterInstruction).registerA
    addInstructions(
        fieldIndex + 1,
        """
            ${RuntimeCallEmitter.invoke(call, "v$register")}

            move-result v$register
        """.trimIndent(),
    )
}
