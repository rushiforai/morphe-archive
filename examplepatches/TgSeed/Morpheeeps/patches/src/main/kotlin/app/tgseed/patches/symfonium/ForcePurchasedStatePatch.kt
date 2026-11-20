package app.tgseed.patches.symfonium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.tgseed.patches.shared.Constants.COMPATIBILITY_SYMFONIUM
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Forces the purchase screen state to its "purchased" value wherever the app materialises a
 * purchase state.
 *
 * Why this shape (documented because the naive edit does not work):
 *
 * The app keeps the licence verdict as a sealed state object (fields `purchaseState` /
 * `restoreState` on the screen-state class) instead of a boolean, and it is compared by
 * identity / `instance-of` in the UI and in feature gates. The screen state is initialised to
 * the "not started" singleton in the manager's constructor, then updated by collecting two
 * MutableStateFlows. Multiple writers emit error/initial singletons into the purchase flow
 * (billing errors, billing-initialising, purchase-error, starting, trial-cancel reset), so
 * patching only the constructor value is overwritten by the flow collectors within a frame.
 *
 * The robust intervention is at construction/use sites only: every `sget-object` of a
 * purchase-state singleton that is funnelled into a state-flow update, into the screen-state
 * constructor, into the screen-state copy helper, or into the state-flow factory is replaced
 * by constructing the "purchased" state (the constructable, non-singleton subclass - the same
 * value the billing-success branch emits). Comparison sites (`areEqual` checks against error
 * singletons in the UI) are deliberately not touched: they must keep rejecting the values the
 * app previously stored, otherwise "cancelled/error" banners would trigger on the forced
 * state.
 *
 * Nothing here names an obfuscated class: the screen-state class is found via its `toString`
 * literal, the state base class via its field, and the purchased subclass as the
 * constructable subclass of that base. If the structure is not found exactly as described,
 * the patch fails loudly rather than producing a mis-patched app.
 */
private const val STATE_TOSTRING_ANCHOR = "PurchaseScreenState(trialState="

private fun registersOf(instruction: Instruction): List<Int> {
    val range = instruction as? RegisterRangeInstruction
    if (range != null) {
        val start = range.startRegister
        return (0 until range.registerCount).map { start + it }
    }
    val five = instruction as? FiveRegisterInstruction
    if (five != null) {
        return listOf(five.registerC, five.registerD, five.registerE, five.registerF, five.registerG)
            .filter { it >= 0 }
    }
    val three = instruction as? ThreeRegisterInstruction
    if (three != null) {
        return listOf(three.registerA, three.registerB, three.registerC).filter { it >= 0 }
    }
    val two = instruction as? TwoRegisterInstruction
    if (two != null) {
        return listOf(two.registerA, two.registerB).filter { it >= 0 }
    }
    return emptyList()
}

private fun writesRegister(instruction: Instruction, reg: Int): Boolean {
    return when (instruction) {
        is TwoRegisterInstruction -> instruction.registerA == reg
        is OneRegisterInstruction -> instruction.registerA == reg &&
            !instruction.opcode.name.startsWith("IF_")
        else -> false
    }
}

private fun MethodReference.matches(
    ofClass: String,
    name: String,
    params: List<String>,
    returnType: String
): Boolean =
    definingClass == ofClass && this.name == name &&
        parameterTypes.map { it.toString() } == params && returnType == this.returnType

private fun Method.stringLiterals(): List<String> =
    implementation?.instructions
        ?.mapNotNull { (it as? ReferenceInstruction)?.reference as? StringReference }
        ?.map { it.string }
        ?: emptyList()

private fun ClassDef.containsLiteral(literal: String): Boolean =
    methods.any { it.stringLiterals().contains(literal) }

@Suppress("unused")
val forcePurchasedStatePatch = bytecodePatch(
    name = "Force purchased state",
    description = "Reports a purchased licence by forcing the purchase state to its success " +
        "value wherever the app sets an error or not-started state.",
    default = false
) {
    compatibleWith(COMPATIBILITY_SYMFONIUM)

    execute {
        // ---- Pass 1: discover the state hierarchy from the toString anchor. ----
        val defs = ArrayList<ClassDef>()
        classDefForEach { def -> defs.add(def) }

        val screenStateType = defs.firstOrNull { it.containsLiteral(STATE_TOSTRING_ANCHOR) }?.type
            ?: throw PatchException("Screen-state toString anchor not found - target version changed?")
        val screenDef = defs.firstOrNull { it.type == screenStateType }
            ?: throw PatchException("Screen-state class missing: $screenStateType")
        val fields = screenDef.fields.toList()
        if (fields.size != 6) {
            throw PatchException("Screen-state class $screenStateType has ${fields.size} fields, expected 6 - structure changed?")
        }
        // (trialState, isPurchasing, trialId, haveLogs, purchaseState, restoreState)
        val stateBase = fields[4].type

        // Screen-state copy helper: static, returns the screen state, 8 params
        // (L, I, Z, String, Z, L, L, I) where the L slots are object types.
        val copyCandidates = screenDef.methods.filter { m ->
            val p = m.parameterTypes.map { it.toString() }
            (m.accessFlags and AccessFlags.STATIC.value) != 0 && m.returnType == screenStateType &&
                p.size == 8 && p[1] == "I" && p[2] == "Z" && p[3] == "Ljava/lang/String;" &&
                p[4] == "Z" && p[7] == "I" &&
                p[0].startsWith("L") && p[5].startsWith("L") && p[6].startsWith("L")
        }
        if (copyCandidates.size != 1) {
            throw PatchException("Screen-state copy helper candidates: ${copyCandidates.size}, expected 1 - structure changed?")
        }
        val copyMethod = copyCandidates.single()
        val copyParamTypes = copyMethod.parameterTypes.map { it.toString() }
        // The copy helper's purchaseState parameter must be the base type, the
        // restoreState parameter some other object type.
        if (copyParamTypes[5] != stateBase) {
            throw PatchException("Copy helper purchaseState param is ${copyParamTypes[5]}, expected $stateBase")
        }

        val initMethod = screenDef.methods.firstOrNull { it.name == "<init>" }
            ?: throw PatchException("Screen-state constructor not found in $screenStateType")
        val initParams = initMethod.parameterTypes.map { it.toString() }
        if (initParams.size != 6 || initParams[4] != stateBase) {
            throw PatchException("Screen-state constructor shape changed: $initParams")
        }

        // Singletons (static `a` field of own type) vs constructable subclasses
        // (no-arg <init>, no static fields) of the state base.
        val singletons = HashSet<String>()
        val constructable = ArrayList<String>()
        for (def in defs) {
            if (def.superclass != stateBase) continue
            val hasSelfSingleton = def.fields.any { f ->
                (f.accessFlags and AccessFlags.STATIC.value) != 0 && f.type == def.type
            }
            if (hasSelfSingleton) {
                singletons.add(def.type)
            } else {
                val hasNoArgInit = def.methods.any { it.name == "<init>" && it.parameterTypes.isEmpty() }
                val hasStatic = def.fields.any { (it.accessFlags and AccessFlags.STATIC.value) != 0 }
                if (hasNoArgInit && !hasStatic) constructable.add(def.type)
            }
        }
        if (singletons.isEmpty()) throw PatchException("No purchase-state singletons found - structure changed?")
        if (constructable.isEmpty()) throw PatchException("No constructable purchase state found - structure changed?")
        // Both constructable states are success values in this build (fresh purchase and
        // already-owned); the alphabetical first is the fresh-purchase one and is the one
        // the feature gates test.
        val purchased = constructable.sorted().first()

        // ---- Pass 2: rewrite funnelled value sites only. ----
        // Two-phase per class: scan the immutable def for value sites first, and only
        // convert the class to mutable if it actually has one, so comparison-only
        // classes (UI/gates) keep their original encoding.
        var rewritten = 0
        for (def in defs) {
            // method index -> (instruction index -> register)
            val pending = ArrayList<Triple<Int, Int, Int>>()
            def.methods.forEachIndexed { methodIndex, m ->
                val impl = m.implementation ?: return@forEachIndexed
                val instructions = impl.instructions.toList()
                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.SGET_OBJECT) return@forEachIndexed
                    val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                        ?: return@forEachIndexed
                    if (ref.definingClass !in singletons) return@forEachIndexed
                    val reg = (instruction as OneRegisterInstruction).registerA

                    // Scan forward: decide value-site vs comparison-site by the first
                    // consuming invoke that mentions the register.
                    var cursor = index + 1
                    var isValueSite = false
                    while (cursor < instructions.size && cursor < index + 60) {
                        val next = instructions[cursor]
                        val mref = (next as? ReferenceInstruction)?.reference as? MethodReference
                        if (mref != null) {
                            val regs = registersOf(next)
                            if (reg in regs) {
                                // dexlib2 pads unused FiveRegister slots with 0, so the arg
                                // list can be longer than the actual parameter count. Use the
                                // signature's parameter count to size the invocation instead.
                                val isInstanceInvoke = next.opcode == Opcode.INVOKE_VIRTUAL ||
                                    next.opcode == Opcode.INVOKE_VIRTUAL_RANGE
                                val argCount = mref.parameterTypes.size + if (isInstanceInvoke) 1 else 0
                                val regsByParam = regs.take(argCount)
                                val isFlowCas = (next.opcode == Opcode.INVOKE_VIRTUAL ||
                                    next.opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
                                    mref.name == "n" && regsByParam.size == 3 && regsByParam[2] == reg
                                val isScreenInit = mref.matches(
                                    screenStateType, "<init>", initParams, "V"
                                )
                                val isScreenCopy = mref.matches(
                                    screenStateType, copyMethod.name, copyParamTypes,
                                    screenStateType
                                )
                                val isFlowFactoryInInit = m.name == "<init>" &&
                                    next.opcode == Opcode.INVOKE_STATIC && regsByParam == listOf(reg)
                                if (isFlowCas || isScreenInit || isScreenCopy || isFlowFactoryInInit) {
                                    isValueSite = true
                                }
                                break
                            }
                        }
                        if (writesRegister(next, reg)) break
                        cursor++
                    }
                    if (isValueSite) pending.add(Triple(methodIndex, index, reg))
                }
            }
            if (pending.isEmpty()) continue
            val mutable = mutableClassDefBy(def)
            val mutableMethods = mutable.methods.toList()
            // Highest instruction index first so insertions do not shift pending sites.
            for ((methodIndex, index, reg) in pending.sortedByDescending { it.second }) {
                val method = mutableMethods[methodIndex]
                // The register number is the virtual register, so vN is the same physical
                // register the original sget-object wrote (pN aliases too).
                val smaliText = "new-instance v" + reg + ", " + purchased + "\n" +
                    "invoke-direct {v" + reg + "}, " + purchased + "-><init>()V"
                method.replaceInstruction(index, "nop")
                method.addInstructions(index, smaliText)
                rewritten++
            }
        }
        if (rewritten == 0) {
            throw PatchException("No purchase-state value sites found - target version changed?")
        }
        println("Force purchased state: rewrote " + rewritten + " value sites")
    }
}
