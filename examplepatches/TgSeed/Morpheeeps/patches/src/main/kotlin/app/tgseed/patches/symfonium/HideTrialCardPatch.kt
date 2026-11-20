package app.tgseed.patches.symfonium

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.tgseed.patches.shared.Constants.COMPATIBILITY_SYMFONIUM
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Removes the free-trial card from the licence/settings screen.
 *
 * Why this shape:
 *
 * A licensed app built with ForceLicensedStatePatch still showed "Your free trial will expire on:
 * <date>" with a purchase button underneath, because that card is not driven by the purchase or
 * entitlement state at all - it is driven by a *third* signal: the trial end date the server
 * returns from the trial-status endpoint, held in its own compose state. The screen only renders
 * the card when that date is a non-empty string:
 *
 *     iget-object   v0, controller, L<C>;-><expiry>:L<State>;   // trial end date (String)
 *     invoke-virtual {v0}, L<State>;->getValue()
 *     check-cast    v0, Ljava/lang/String;
 *     if-eqz        v0, :skip            // no date  -> skip the whole card
 *     invoke-virtual {v0}, Ljava/lang/String;->length()I
 *     if-nez        v0, :skip            // empty    -> skip the whole card
 *     ... boolean flag check ...
 *     <trial text + purchase button>
 *
 * So the fix is at the writer, not in the UI: never store the date. Every consumer either treats
 * a missing date as "nothing to show" (this gate) or as "unknown", and the whole card - text and
 * purchase button - stops being composed. Editing the card's text or branching over it instead
 * would leave a purchase button under a "you own it" label, and branching inside Compose group
 * bookkeeping risks unbalancing the composer.
 *
 * Discovery is structural - no obfuscated class, field or method names appear below:
 *  1. the trial row's format call is located by the `settings.trial.expire` string resource id it
 *     formats (the same row this replaces), and from there the state field it reads is recovered;
 *  2. the single writer of that state is found by looking for the same field read followed by a
 *     `setValue(Object)` on it, then the `check-cast ... String` feeding that call is turned into
 *     a null constant.
 *
 * Resource ids are version-specific, hence the COMPATIBILITY pin; the patch fails loudly if the
 * shape does not match exactly.
 */
private const val TRIAL_EXPIRE_STRING_ID = 0x7f0f0824 // string/settings.trial.expire

private data class StateField(val owner: String, val name: String, val type: String)

private fun Instruction.fieldRef(): FieldReference? =
    (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.methodRef(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.registers(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (0 until registerCount).map { startRegister + it }
    is FiveRegisterInstruction ->
        listOf(registerC, registerD, registerE, registerF, registerG).filter { it >= 0 }
    is TwoRegisterInstruction -> listOf(registerA, registerB)
    is OneRegisterInstruction -> listOf(registerA)
    else -> emptyList()
}

/**
 * Recovers the trial-end-date state field from the method that formats the trial expiry row:
 * the `iget-object` immediately followed by `getValue()` whose result is cast to String.
 */
private fun findExpiryStateField(def: ClassDef, methodIndex: Int): StateField? {
    val method = def.methods.elementAt(methodIndex)
    val instructions = method.implementation?.instructions?.toList() ?: return null
    instructions.forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.IGET_OBJECT) return@forEachIndexed
        val field = instruction.fieldRef() ?: return@forEachIndexed
        val next = instructions.getOrNull(index + 1) ?: return@forEachIndexed
        val nextRef = next.methodRef() ?: return@forEachIndexed
        if (nextRef.name != "getValue") return@forEachIndexed
        val holder = instruction.registers().firstOrNull() ?: return@forEachIndexed
        if (!next.registers().contains(holder)) return@forEachIndexed
        // The value must be used as a String (the date is formatted into the row).
        var cursor = index + 2
        var castToString = false
        while (cursor < instructions.size && cursor < index + 6) {
            val candidate = instructions[cursor]
            if (candidate.opcode == Opcode.CHECK_CAST &&
                (candidate as? ReferenceInstruction)?.reference?.toString() == "Ljava/lang/String;"
            ) {
                castToString = true
                break
            }
            cursor++
        }
        if (!castToString) return@forEachIndexed
        return StateField(field.definingClass, field.name, field.type)
    }
    return null
}

@Suppress("unused")
val hideTrialCardPatch = bytecodePatch(
    name = "Hide trial card",
    description = "Stops the licence screen from showing the free-trial expiry card and its " +
        "purchase button by never storing the trial end date the server reports.",
    default = false
) {
    compatibleWith(COMPATIBILITY_SYMFONIUM)

    execute {
        val defs = ArrayList<ClassDef>()
        classDefForEach { def -> defs.add(def) }

        // ---- 1. Locate the trial row and recover the state field it reads. ----
        var expiryField: StateField? = null
        var rowSites = 0
        for (def in defs) {
            def.methods.forEachIndexed { methodIndex, method ->
                val instructions = method.implementation?.instructions?.toList()
                    ?: return@forEachIndexed
                val formatsExpiry = instructions.any { instruction ->
                    instruction is NarrowLiteralInstruction &&
                        instruction.wideLiteral.toInt() == TRIAL_EXPIRE_STRING_ID
                }
                if (!formatsExpiry) return@forEachIndexed
                rowSites++
                expiryField = findExpiryStateField(def, methodIndex) ?: expiryField
            }
        }
        if (rowSites != 1) {
            throw PatchException(
                "Trial expiry row sites: $rowSites, expected 1 - structure changed?"
            )
        }
        val field = expiryField
            ?: throw PatchException("Trial expiry state field not found - structure changed?")

        // ---- 2. Neutralise the single writer of that state. ----
        data class Write(val methodIndex: Int, val castIndex: Int, val register: Int)

        val writes = ArrayList<Pair<ClassDef, Write>>()
        for (def in defs) {
            def.methods.forEachIndexed { methodIndex, method ->
                val instructions = method.implementation?.instructions?.toList()
                    ?: return@forEachIndexed
                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.IGET_OBJECT) return@forEachIndexed
                    val read = instruction.fieldRef() ?: return@forEachIndexed
                    if (read.definingClass != field.owner || read.name != field.name) {
                        return@forEachIndexed
                    }
                    val holder = instruction.registers().firstOrNull() ?: return@forEachIndexed
                    // Find the setValue on that state and the register it stores.
                    var cursor = index + 1
                    var storeRegister: Int? = null
                    while (cursor < instructions.size && cursor < index + 12) {
                        val candidate = instructions[cursor]
                        val ref = candidate.methodRef()
                        if (ref != null && ref.name == "setValue" &&
                            candidate.opcode == Opcode.INVOKE_VIRTUAL
                        ) {
                            // dexlib2 pads unused five-register slots with 0 instead of -1, so
                            // size the argument list from the signature (receiver + 1 param).
                            val args = candidate.registers().take(ref.parameterTypes.size + 1)
                            if (args.size == 2 && args[0] == holder) {
                                storeRegister = args[1]
                                break
                            }
                        }
                        cursor++
                    }
                    val target = storeRegister ?: return@forEachIndexed
                    // The stored value is produced by a cast from the fetch result; replace that
                    // cast with a null constant so the state simply stays unset.
                    var back = index - 1
                    var guard = 0
                    while (back >= 0 && guard < 8) {
                        val candidate = instructions[back]
                        if (candidate.opcode == Opcode.CHECK_CAST &&
                            (candidate as? ReferenceInstruction)?.reference?.toString() ==
                            "Ljava/lang/String;" &&
                            (candidate as? OneRegisterInstruction)?.registerA == target
                        ) {
                            writes.add(
                                def to Write(methodIndex, back, target)
                            )
                            return@forEachIndexed
                        }
                        back--
                        guard++
                    }
                }
            }
        }

        if (writes.size != 1) {
            throw PatchException(
                "Trial expiry writers: ${writes.size}, expected 1 - structure changed?"
            )
        }
        val (writeDef, write) = writes.single()
        val targetMethod = mutableClassDefBy(writeDef).methods.toList()[write.methodIndex]
        targetMethod.replaceInstruction(write.castIndex, "const/4 v" + write.register + ", 0x0")
        println(
            "Hide trial card: trial end date is never stored (" +
                field.owner + "->" + field.name + ")"
        )
    }
}
