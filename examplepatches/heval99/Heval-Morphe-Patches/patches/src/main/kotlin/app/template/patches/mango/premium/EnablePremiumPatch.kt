package app.template.patches.mango.premium

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MANGO
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

/**
 * Mango sells Pro as a Play subscription ("mango_pro_yearly") plus a lifetime in-app product
 * ("mango_pro_lifetime"). The billing client keeps the state in a Play-Billing-backed enum
 * (REAL / FREE / EXPIRED / YEARLY / YEARLY_CANCELED / LIFETIME) and seeds a StateFlow with
 * "state is YEARLY, YEARLY_CANCELED or LIFETIME" in its constructor; every Pro gate reads that
 * flow. The patch does two things to it:
 *
 * 1. It loads 1 into that seed, so the app starts Pro.
 * 2. It forces the value of every later write of the form `flow.setValue(Boolean.valueOf(x))` to
 *    true. After Play Billing connects, the purchase query writes `Boolean.valueOf(hasPurchase)`
 *    into the flow; for a user who never bought Pro that is false, so the seed alone is undone
 *    seconds after start and Pro is locked again (issue #145, 2026-11-09, reported against the
 *    2.2.0 build, which only had step 1). The other writers already store `Boolean.TRUE` or an
 *    already-cached true, so they are left alone.
 *
 * Play Billing, the purchase screen and the cached "billing_cached_is_pro" preference are
 * untouched.
 *
 * Verified 2026-10-27 against 1.64 (versionCode 64): see COMPATIBILITY_MANGO. Step 2 was added
 * 2026-11-09 and is verified by bytecode only (smoke test, CLI run, disassembly).
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Mango Pro.",
) {
    compatibleWith(COMPATIBILITY_MANGO)

    execute {
        val client = MangoBillingClientFingerprint.classDef
        val constructor = client.methods.singleOrNull {
            it.name == "<init>" && it.parameterTypes.size == 2 && it.implementation != null
        } ?: throw PatchException("${client.type} has no two-argument constructor")
        val insns = constructor.implementation!!.instructions.toList()

        val contains = insns.withIndex().filter { (_, instruction) ->
            val call = instruction.methodRef()
            instruction.opcode == Opcode.INVOKE_INTERFACE && call?.name == "contains" &&
                call.returnType == "Z"
        }
        val (index, _) = contains.singleOrNull()
            ?: throw PatchException("${client.type}.<init> has ${contains.size} Set.contains calls")

        val move = insns.getOrNull(index + 1)
        if (move?.opcode != Opcode.MOVE_RESULT) {
            throw PatchException("expected move-result after Set.contains, got ${move?.opcode}")
        }

        // The Pro flow: the first field the constructor stores after the contains result is the
        // StateFlow seeded with it (Boolean.valueOf(zContains) -> flow factory -> iput-object).
        val flowStore = insns.drop(index + 2).take(8).firstOrNull { it.opcode == Opcode.IPUT_OBJECT }
        val flowField = flowStore?.fieldRef()
            ?: throw PatchException("${client.type}.<init>: no field store after the Pro seed")
        if (flowField.definingClass != client.type) {
            throw PatchException("${client.type}.<init>: the Pro flow field is on ${flowField.definingClass}")
        }

        // Find the later writers before the first edit.
        val writers = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            val readsFlow = classDef.methods.any { method ->
                method.implementation?.instructions?.any { it.opcode == Opcode.IGET_OBJECT && it.fieldRef() == flowField } == true
            }
            if (!readsFlow) return@classDefForEach
            for (method in classDef.methods) {
                val code = method.implementation?.instructions?.toList() ?: continue
                if (code.indices.any { forcedValueSite(code, it, flowField) != null }) {
                    writers += classDef.type to method.signature()
                }
            }
        }
        if (writers.isEmpty()) {
            throw PatchException("no write of Boolean.valueOf(...) into the Pro flow was found; it would be undone by the purchase query")
        }

        constructor.addInstructionsChecked(
            index + 2,
            "const/4 v${(move as OneRegisterInstruction).registerA}, 0x1",
        )

        for ((type, signature) in writers) {
            val method = mutableClassDefBy(type).methods.single { it.signature() == signature }
            val code = method.implementation!!.instructions.toList()
            // Last site first, so the earlier indexes stay valid.
            val sites = code.indices.mapNotNull { at -> forcedValueSite(code, at, flowField) }.asReversed()
            for (site in sites) {
                method.requireNoBranchTargetAt(site.insertAt, "Pro flow value")
                method.addInstructionsChecked(
                    site.insertAt,
                    "sget-object v${site.register}, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;",
                )
            }
        }
    }
}

private fun com.android.tools.smali.dexlib2.iface.Method.signature() = "$name(${parameterTypes.joinToString("")})$returnType"

/** Where to put `Boolean.TRUE` so a write of the flow stores true: right after the value's move-result. */
private class ForcedValue(val register: Int, val insertAt: Int)

/**
 * If the instruction at [at] reads [flow] and the next few instructions compute a
 * `Boolean.valueOf(Z)` into a register that is then handed to the flow type's
 * `setValue`-shaped method (Object, Object) -> boolean as its new value, returns where that
 * register can be overwritten with `Boolean.TRUE`.
 */
private fun forcedValueSite(code: List<Instruction>, at: Int, flow: FieldReference): ForcedValue? {
    if (code[at].opcode != Opcode.IGET_OBJECT || code[at].fieldRef() != flow) return null
    val valueOf = (at + 1..minOf(code.lastIndex, at + 8)).firstOrNull {
        val call = code[it].methodRef()
        code[it].opcode == Opcode.INVOKE_STATIC && call?.definingClass == "Ljava/lang/Boolean;" && call.name == "valueOf" &&
            call.parameterTypes.map(CharSequence::toString) == listOf("Z")
    } ?: return null
    val move = code.getOrNull(valueOf + 1)
    if (move?.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val register = (move as OneRegisterInstruction).registerA
    // The flow's compare-and-set: (expected, new) with the new value in the third register.
    (valueOf + 2..minOf(code.lastIndex, valueOf + 6)).firstOrNull {
        val call = code[it].methodRef()
        code[it].opcode == Opcode.INVOKE_VIRTUAL && call?.definingClass == flow.type &&
            call.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;", "Ljava/lang/Object;") &&
            call.returnType == "Z" && (code[it] as FiveRegisterInstruction).registerE == register
    } ?: return null
    return ForcedValue(register, valueOf + 2)
}
