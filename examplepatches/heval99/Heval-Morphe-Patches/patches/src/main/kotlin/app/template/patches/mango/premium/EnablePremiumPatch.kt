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
 * Verified against 1.70 (versionCode 70) on 2026-11-22 (re-anchor, see COMPATIBILITY_MANGO): smoke
 * test, Morphe CLI run without -f and a 3-method whole-APK diff against the stock APK. Step 2 was
 * added 2026-11-09. Runtime was not run on a device.
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
        // 1.68 puts an unrelated boolean computation and its iput-boolean between the contains
        // result and the seed, so start at the Boolean.valueOf(Z) call that consumes the result
        // register rather than at a fixed distance from the contains call.
        val moveRegister = (move as OneRegisterInstruction).registerA
        val seedCall = (index + 2..minOf(insns.lastIndex, index + 30)).firstOrNull {
            val call = insns[it].methodRef()
            insns[it].opcode == Opcode.INVOKE_STATIC && call?.definingClass == "Ljava/lang/Boolean;" &&
                call.name == "valueOf" && call.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
                (insns[it] as FiveRegisterInstruction).registerC == moveRegister
        } ?: throw PatchException("${client.type}.<init>: no Boolean.valueOf of the Set.contains result")
        val flowStore = insns.drop(seedCall + 1).take(6).firstOrNull { it.opcode == Opcode.IPUT_OBJECT }
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
            // Dedupe the sites and apply them in descending insertAt order, so an insert never
            // shifts the index of one still to come, even when two sites share a method.
            val sites = code.indices.mapNotNull { at -> forcedValueSite(code, at, flowField) }
                .distinctBy { it.insertAt }
                .sortedByDescending { it.insertAt }
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
 * If the instruction at [at] reads [flow] and a `Boolean.valueOf(Z)` within a few instructions on
 * either side (1.68 read the field first, 1.70 computes the value first) is handed as the new value
 * to the flow type's `setValue`-shaped method (Object, Object) -> boolean, returns where that
 * register can be overwritten with `Boolean.TRUE`. The setter must come after the read, its receiver
 * must be the register the read loaded (a sibling flow of the same type is not enough), and neither
 * that register nor the value register may be rewritten before the setter.
 */
private fun forcedValueSite(code: List<Instruction>, at: Int, flow: FieldReference): ForcedValue? {
    if (code[at].opcode != Opcode.IGET_OBJECT || code[at].fieldRef() != flow) return null
    // 1.70 computes the Boolean.valueOf before it reads the flow field (1.68 read the field first),
    // so look a few instructions on both sides of the read.
    for (valueOf in maxOf(0, at - 8)..minOf(code.lastIndex, at + 8)) {
        val call = code[valueOf].methodRef()
        if (code[valueOf].opcode != Opcode.INVOKE_STATIC || call?.definingClass != "Ljava/lang/Boolean;" ||
            call.name != "valueOf" || call.parameterTypes.map(CharSequence::toString) != listOf("Z")
        ) continue
        val move = code.getOrNull(valueOf + 1)
        if (move?.opcode != Opcode.MOVE_RESULT_OBJECT) continue
        val register = (move as OneRegisterInstruction).registerA
        // The flow's compare-and-set: (expected, new) with the new value in the third register.
        val flowRegister = (code[at] as OneRegisterInstruction).registerA
        val setAt = (maxOf(valueOf + 2, at + 1)..minOf(code.lastIndex, maxOf(valueOf, at) + 6)).firstOrNull {
            val setCall = code[it].methodRef()
            val invoke = code[it] as? FiveRegisterInstruction
            invoke != null && code[it].opcode == Opcode.INVOKE_VIRTUAL && setCall?.definingClass == flow.type &&
                setCall.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;", "Ljava/lang/Object;") &&
                setCall.returnType == "Z" && invoke.registerC == flowRegister && invoke.registerE == register
        } ?: continue
        // Both the flow register and the value register must still hold their values at the setter.
        fun rewritten(reg: Int, from: Int) = (from until setAt).any {
            val instruction = code[it]
            instruction.opcode.setsRegister() && instruction is OneRegisterInstruction && instruction.registerA == reg
        }
        if (rewritten(flowRegister, at + 1) || rewritten(register, valueOf + 2)) continue
        return ForcedValue(register, valueOf + 2)
    }
    return null
}
