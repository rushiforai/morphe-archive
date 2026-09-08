package com.morphe.friendsturner.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.morphe.friendsturner.patches.Constants.COMPATIBILITY_FRIENDSTURNER

private const val BOOLEAN_TRUE = "Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;"
private const val SET_VALUE = "->setValue(Ljava/lang/Object;)V"

/**
 * Set the ad-free ("sponsor") flag to true.
 *
 * Sets the boolean that every ad placement tests, so each one takes the ad-free path,
 * including any placement a future app version adds behind the same flag.
 *
 * This replaced the earlier per-placement patches (one for the interstitial, two for the
 * banner), which are kept in `archive/patches/` for reference.
 *
 * There is no `isSponsor()` method to redirect. The flag is a static Compose state field
 * that each consumer reads inline, so "set the flag" means two things:
 *
 *  1. The holder's `<clinit>` initialises it to `Boolean.FALSE`. A `setValue(TRUE)` is
 *     appended to the initialiser, so it starts out true.
 *  2. It is written again at runtime, most importantly by the billing reconciliation that
 *     runs on every launch and would otherwise put the real (false) result back. Every
 *     write is rewritten to store `Boolean.TRUE`.
 *
 * The flag is located from the interstitial gate rather than by name, so no obfuscated
 * identifier is hard coded.
 *
 * Note this makes the button read "Continue Sponsoring", because that label is chosen by
 * the same flag. The patch changes only the in-memory value; no purchase is recorded and
 * nothing is sent to Google Play.
 */
@Suppress("unused")
val forceSponsorStatePatch = bytecodePatch(
    name = "Force sponsor state",
    description = "Sets the ad-free flag to true so every check that reads it takes the ad-free path. " +
        "Covers the interstitial and the banner together, and any placement a future version adds. " +
        "Makes the sponsor button read \"Continue Sponsoring\".",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FRIENDSTURNER)

    execute {
        // 1. Identify the flag: the last static object read before the interstitial gate
        //    tests it with Boolean.booleanValue().
        val gate = MainActivityFAdGateFingerprint.method
        val booleanValueIndex = MainActivityFAdGateFingerprint.instructionMatches[0].index
        val flag = (booleanValueIndex - 1 downTo 0).firstNotNullOfOrNull { index ->
            val instruction = gate.getInstruction(index)
            if (instruction.opcode == Opcode.SGET_OBJECT) {
                (instruction as ReferenceInstruction).reference as FieldReference
            } else {
                null
            }
        } ?: throw PatchException("Could not find the ad-free flag read in ${gate.name}")

        val flagDescriptor = "${flag.definingClass}->${flag.name}:${flag.type}"

        // 2. Rewrite every write of the flag to store Boolean.TRUE.
        //    Writes are found by register provenance, not by the declaring type of
        //    setValue, so a call through a supertype is still caught.
        data class Write(val classType: String, val methodName: String, val valueLoadIndex: Int, val valueRegister: Int)

        val writes = mutableListOf<Write>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.SGET_OBJECT) return@forEachIndexed
                    val reference = (instruction as ReferenceInstruction).reference
                    if (reference !is FieldReference) return@forEachIndexed
                    if ("${reference.definingClass}->${reference.name}:${reference.type}" != flagDescriptor) {
                        return@forEachIndexed
                    }

                    val stateRegister = (instruction as OneRegisterInstruction).registerA
                    for (next in index + 1..minOf(index + 6, instructions.lastIndex)) {
                        val candidate = instructions[next]
                        val callee = (candidate as? ReferenceInstruction)?.reference?.toString() ?: continue
                        if (!callee.endsWith(SET_VALUE)) continue
                        if ((candidate as FiveRegisterInstruction).registerC != stateRegister) continue

                        // The value is produced by the instruction immediately before the call.
                        val valueRegister = candidate.registerD
                        writes += Write(classDef.type, method.name, next - 1, valueRegister)
                        break
                    }
                }
            }
        }

        if (writes.isEmpty()) throw PatchException("Found no writes of $flagDescriptor")

        writes.forEach { write ->
            val method = mutableClassDefBy(write.classType).methods.first { it.name == write.methodName }
            val producer = method.getInstruction(write.valueLoadIndex)
            val destination = (producer as? OneRegisterInstruction)?.registerA
            if (destination != write.valueRegister) {
                throw PatchException(
                    "In ${write.classType}->${write.methodName} the value passed to setValue is not " +
                        "produced by the preceding instruction (${producer.opcode}), so it cannot be forced",
                )
            }
            method.replaceInstruction(write.valueLoadIndex, "sget-object v${write.valueRegister}, $BOOLEAN_TRUE")
        }

        // 3. Start out true. Appended at the end of the initialiser, where every register
        //    is dead, rather than touching the shared register that seeds the other states.
        val holder = mutableClassDefBy(flag.definingClass)
        val initialiser = holder.methods.firstOrNull {
            it.name == "<clinit>" && AccessFlags.STATIC.isSet(it.accessFlags)
        } ?: throw PatchException("${flag.definingClass} has no static initialiser")

        val returnIndex = initialiser.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        if (returnIndex < 0) throw PatchException("The static initialiser does not end in return-void")
        if (initialiser.implementation!!.registerCount < 2) {
            throw PatchException("The static initialiser has too few registers to set the flag")
        }

        initialiser.addInstructions(
            returnIndex,
            """
                sget-object v0, $flagDescriptor
                sget-object v1, $BOOLEAN_TRUE
                invoke-virtual { v0, v1 }, ${flag.type}$SET_VALUE
            """,
        )
    }
}
