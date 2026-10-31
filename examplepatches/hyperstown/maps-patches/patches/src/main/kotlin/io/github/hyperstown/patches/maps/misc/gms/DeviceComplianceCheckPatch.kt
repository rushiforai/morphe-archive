/*
 * Adapted from gmaps-patches by fangkampanat, https://github.com/fangkampanat/gmaps-patches
 * See the included NOTICE file for the GPLv3 section 7 terms that apply to this code.
 */

package io.github.hyperstown.patches.maps.misc.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.hyperstown.patches.util.branchTarget
import io.github.hyperstown.patches.util.parameterTypeNames
import io.github.hyperstown.patches.util.signatureEquals
import io.github.hyperstown.patches.util.stringOrNull
import io.github.hyperstown.patches.util.uniqueMethod
import java.util.logging.Logger

private const val UNCERTIFIED_DEVICE_ACTIVITY =
    "Lcom/google/android/gms/gmscompliance/ui/UncertifiedDeviceActivity;"
private val VERDICT_NAMES = listOf("ENFORCE", "DO_NOT_ENFORCE", "NOT_SET", "UNKNOWN")

/**
 * Maps asks GmsCore whether the device is certified by Google. An ENFORCE verdict opens
 * UncertifiedDeviceActivity ("Your device isn't Play Protect certified") and closes Maps.
 * The verdict predicate is made to always report "not enforced". The request itself is unchanged.
 */
internal val deviceComplianceCheckPatch = bytecodePatch {
    execute {
        val logger = Logger.getLogger("io.github.hyperstown.patches.maps.misc.gms")

        if (classDefByOrNull(UNCERTIFIED_DEVICE_ACTIVITY) == null) {
            logger.info("No $UNCERTIFIED_DEVICE_ACTIVITY, no device compliance check to skip")
            return@execute
        }

        val listener = uniqueMethod(VerdictListenerFingerprint, "device compliance verdict listener")
        val code = listener.implementation!!.instructions.toList()
        fun fail(reason: String): Nothing =
            throw PatchException("Unrecognized device compliance check: $reason in $listener")

        // The verdict class is the one whose toString names all verdicts.
        val predicateIndex = code.indices.singleOrNull { index ->
            code[index].opcode == Opcode.INVOKE_VIRTUAL &&
                code[index].getReference<MethodReference>()?.let { call ->
                    call.returnType == "Z" && call.parameterTypes.isEmpty() &&
                        classDefByOrNull(call.definingClass)?.methods
                            ?.singleOrNull { it.name == "toString" && it.parameterTypes.isEmpty() }
                            ?.implementation?.instructions?.mapNotNull { it.stringOrNull }
                            ?.containsAll(VERDICT_NAMES) == true
                } == true
        } ?: fail("no unique verdict predicate call")

        val predicateCall = code[predicateIndex].getReference<MethodReference>()!!
        val verdictClass = classDefBy(predicateCall.definingClass)
        val stateField = verdictClass.fields.singleOrNull {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "I"
        } ?: fail("verdict class needs exactly one int field")

        // The predicate must be `return state == ENFORCE`.
        val predicate = verdictClass.methods.single {
            it.name == predicateCall.name && it.returnType == "Z" && it.parameterTypes.isEmpty()
        }
        val body = predicate.implementation?.instructions?.toList() ?: fail("abstract verdict predicate")
        val opcodes = body.map { it.opcode }
        // R8 may merge both returns into one, then the branch skips overwriting true with false.
        val mergedReturn = opcodes == listOf(Opcode.IGET, Opcode.CONST_4, Opcode.IF_EQ, Opcode.CONST_4, Opcode.RETURN)
        val separateReturns = opcodes ==
            listOf(Opcode.IGET, Opcode.CONST_4, Opcode.IF_NE, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN)
        if (!mergedReturn && !separateReturns) fail("verdict predicate is not state == 1: $opcodes")

        val stateRegister = (body[0] as TwoRegisterInstruction).registerA
        val trueRegister = (body[1] as OneRegisterInstruction).registerA
        val falseIndex = if (mergedReturn) 3 else 4
        if (!AccessFlags.PUBLIC.isSet(predicate.accessFlags) || AccessFlags.STATIC.isSet(predicate.accessFlags) ||
            body[0].getReference<FieldReference>()?.let {
                it.definingClass == verdictClass.type && it.name == stateField.name
            } != true ||
            (body[1] as NarrowLiteralInstruction).narrowLiteral != 1 ||
            (body[falseIndex] as NarrowLiteralInstruction).narrowLiteral != 0 ||
            (body[2] as TwoRegisterInstruction).let { it.registerA != stateRegister || it.registerB != trueRegister } ||
            body.branchTarget(2) != 4 ||
            (body[3] as OneRegisterInstruction).registerA != trueRegister ||
            mergedReturn && (body[4] as OneRegisterInstruction).registerA != trueRegister
        ) {
            fail("verdict predicate is not state == 1")
        }

        // The predicate alone gates the listener: false returns before any activity is started.
        val receiver = (code[predicateIndex] as FiveRegisterInstruction).registerC
        val result = code.getOrNull(predicateIndex + 1)
        val gate = code.getOrNull(predicateIndex + 2)
        if (result?.opcode != Opcode.MOVE_RESULT || gate?.opcode != Opcode.IF_EQZ ||
            (gate as OneRegisterInstruction).registerA != (result as OneRegisterInstruction).registerA ||
            code[code.branchTarget(predicateIndex + 2)].opcode != Opcode.RETURN_VOID ||
            code.take(predicateIndex).none {
                it.opcode == Opcode.CHECK_CAST && (it as OneRegisterInstruction).registerA == receiver &&
                    it.getReference<TypeReference>()?.type == verdictClass.type
            }
        ) {
            fail("verdict predicate does not gate the listener")
        }

        // Every UncertifiedDeviceActivity intent is built after the gate.
        val launches = code.indices.filter { index ->
            code[index].opcode == Opcode.INVOKE_STATIC && code[index].getReference<MethodReference>()?.let { call ->
                call.returnType == "Landroid/content/Intent;" &&
                    call.parameterTypeNames() ==
                    listOf("Landroid/content/Context;", "Ljava/lang/String;", "Landroid/content/Intent;") &&
                    classDefByOrNull(call.definingClass)?.methods
                        ?.singleOrNull { it.name == call.name && it.parameterTypes == call.parameterTypes }
                        ?.implementation?.instructions?.any {
                            it.opcode == Opcode.CONST_CLASS &&
                                it.getReference<TypeReference>()?.type == UNCERTIFIED_DEVICE_ACTIVITY
                        } == true
            } == true
        }
        if (launches.isEmpty() || launches.any { it <= predicateIndex + 2 }) {
            fail("UncertifiedDeviceActivity is not started behind the verdict gate: $launches")
        }

        // The predicate already writes this register, so it is free to hold the result.
        mutableClassDefBy(verdictClass.type).methods.single { it.signatureEquals(predicate) }.addInstructions(
            0,
            """
                const/4 v$trueRegister, 0x0
                return v$trueRegister
            """,
        )

        logger.info("Device compliance: ${verdictClass.type}->${predicate.name}()Z now returns false")
    }
}

private object VerdictListenerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("DO_NOT_ENFORCE", "ENFORCE", "NOT_SET", "UNKNOWN", "https://www.google.com/maps", "com.android.chrome"),
    custom = { method, _ -> !AccessFlags.STATIC.isSet(method.accessFlags) },
)
