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
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Makes the app permanently report a valid (purchased) licence.
 *
 * Documented because the obvious target does not work: forcing the `dga` purchase-state object
 * to its success value (see ForcePurchasedStatePatch) only changes what the purchase screen
 * renders. The entitlement the rest of the app actually consults is an int in the preference
 * store:
 *
 *   1. One persisted int, written through a preference flow (`->h(continuation, value)`) after
 *      being boxed into an `Integer`. Observed values: 0x2e = purchased, 0x3e = trial,
 *      0x43 = locked/invalid.
 *   2. A tiny pure predicate `(int state, boolean a, boolean b) -> boolean` that turns that int
 *      into the verdict:
 *          state == 0x2e              -> true
 *          state == 0x3e && (a || b)  -> true   (a/b: special trial-type lookups)
 *          otherwise                  -> false
 *      Its only two call sites are the licence manager's own "is licensed" helpers, which the
 *      whole app uses for feature gating.
 *
 * So this patch does two things:
 *
 *   A. Forces that predicate to `return true`, so every licence query answers "licensed"
 *      whatever is stored - this is the real feature gate.
 *   B. Rewrites stored 0x3e (trial) and 0x43 (locked) values to 0x2e (purchased), so the app's
 *      own state - and anything that reads it directly, such as the licence screen - agrees and
 *      keeps agreeing after each licence refresh. The grant/refresh paths already write 0x2e,
 *      so nothing ever downgrades again.
 *
 * Discovery is structural; no obfuscated class or method names appear below:
 *   - the predicate is the only static `(I, Z, Z)Z` method whose body mentions both 0x2e and 0x3e;
 *   - a stored entitlement value is a literal 0x3e/0x43 that is boxed into an `Integer` and then
 *     handed to a two-argument flow write returning `Object`. Comparison sites and coroutine
 *     resume indices are never boxed that way, so they are left alone.
 *
 * Both steps fail loudly if the structure does not match: shipping a half-patched licence is
 * worse than shipping none.
 *
 * Note for future edits: this dexlib2 fork returns the smali mnemonic from `Opcode.name`
 * ("const/16", "sget-object"), not the enum constant name, so opcode tests must compare
 * `Opcode` values or rely on instruction interfaces - string prefixes do not work.
 */
private const val STATE_PURCHASED = 0x2e
private const val STATE_TRIAL = 0x3e
private const val STATE_LOCKED = 0x43

private fun registersOf(instruction: Instruction): List<Int> {
    val range = instruction as? RegisterRangeInstruction
    if (range != null) {
        return (0 until range.registerCount).map { range.startRegister + it }
    }
    val five = instruction as? FiveRegisterInstruction
    if (five != null) {
        return listOf(five.registerC, five.registerD, five.registerE, five.registerF, five.registerG)
            .filter { it >= 0 }
    }
    val three = instruction as? ThreeRegisterInstruction
    if (three != null) return listOf(three.registerA, three.registerB, three.registerC)
    return emptyList()
}

/**
 * The invocation's real argument registers. dexlib2 pads unused five-register slots with 0
 * instead of -1, so the raw list can be longer than the call actually has; the signature decides.
 */
private fun argumentsOf(instruction: Instruction, ref: MethodReference, includeReceiver: Boolean): List<Int> {
    val count = ref.parameterTypes.size + if (includeReceiver) 1 else 0
    val raw = registersOf(instruction)
    return if (raw.size >= count) raw.take(count) else raw
}

/**
 * Given a narrow literal in [register], returns the register holding the boxed `Integer` built
 * from it. Kotlin emits both `Integer.valueOf(int)` and `new Integer(int)`; R8 uses either.
 */
private fun findBoxRegister(
    instructions: List<Instruction>,
    literalIndex: Int,
    register: Int
): Int? {
    var index = literalIndex + 1
    var guard = 0
    while (index < instructions.size && guard < 8) {
        val instruction = instructions[index]

        if (instruction.opcode == Opcode.INVOKE_STATIC ||
            instruction.opcode == Opcode.INVOKE_STATIC_RANGE
        ) {
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            // Either `Integer.valueOf(int)` or a helper that does the same (`R8` leaves the
            // licence manager calling a one-argument static that returns an Integer).
            if (ref != null && ref.returnType == "Ljava/lang/Integer;" &&
                ref.parameterTypes.map { it.toString() } == listOf("I")
            ) {
                val args = argumentsOf(instruction, ref, includeReceiver = false)
                if (args.size == 1 && args[0] == register) {
                    val result = instructions.getOrNull(index + 1) ?: return null
                    if (result.opcode == Opcode.MOVE_RESULT_OBJECT) {
                        return (result as OneRegisterInstruction).registerA
                    }
                }
                return null
            }
        }

        if (instruction.opcode == Opcode.INVOKE_DIRECT ||
            instruction.opcode == Opcode.INVOKE_DIRECT_RANGE
        ) {
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (ref != null && ref.definingClass == "Ljava/lang/Integer;" && ref.name == "<init>" &&
                ref.parameterTypes.map { it.toString() } == listOf("I")
            ) {
                val args = argumentsOf(instruction, ref, includeReceiver = true)
                if (args.size == 2 && args[1] == register) return args[0]
                return null
            }
        }

        index++
        guard++
    }
    return null
}

/**
 * Finds the preference-flow write that persists [boxRegister]: an instance call taking a
 * continuation and one value object, with the box as the value argument.
 */
private fun findFlowWrite(
    instructions: List<Instruction>,
    from: Int,
    boxRegister: Int
): Int? {
    var index = from + 1
    var guard = 0
    while (index < instructions.size && guard < 220) {
        val instruction = instructions[index]
        if (instruction.opcode == Opcode.INVOKE_VIRTUAL ||
            instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE
        ) {
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (ref != null && ref.returnType == "Ljava/lang/Object;" &&
                ref.parameterTypes.size == 2 &&
                ref.parameterTypes[1].toString() == "Ljava/lang/Object;" &&
                ref.parameterTypes[0].toString().startsWith("L")
            ) {
                val args = argumentsOf(instruction, ref, includeReceiver = true)
                if (args.size == 3 && args[2] == boxRegister) return index
            }
        }
        index++
        guard++
    }
    return null
}

@Suppress("unused")
val forceLicensedStatePatch = bytecodePatch(
    name = "Force licensed state",
    description = "Makes the licence verdict always positive and rewrites stored trial/locked " +
        "entitlement values to the purchased value, so premium features stay unlocked.",
    default = false
) {
    compatibleWith(COMPATIBILITY_SYMFONIUM)

    execute {
        val defs = ArrayList<ClassDef>()
        classDefForEach { def -> defs.add(def) }

        // ---- A. Find the licence predicate: the only static (I, Z, Z)Z method that mentions
        // both the purchased and the trial state constants. ----
        val candidates = ArrayList<Pair<ClassDef, Method>>()
        for (def in defs) {
            for (method in def.methods) {
                if ((method.accessFlags and AccessFlags.STATIC.value) == 0) continue
                if (method.returnType != "Z") continue
                if (method.parameterTypes.map { it.toString() } != listOf("I", "Z", "Z")) continue
                val instructions = method.implementation?.instructions?.toList() ?: continue
                if (instructions.size > 40) continue
                val literals = instructions
                    .mapNotNull { (it as? NarrowLiteralInstruction)?.wideLiteral?.toInt() }
                    .toSet()
                if (STATE_PURCHASED in literals && STATE_TRIAL in literals) {
                    candidates.add(def to method)
                }
            }
        }
        if (candidates.size != 1) {
            throw PatchException(
                "Licence predicate candidates: ${candidates.size}, expected 1 - structure changed?"
            )
        }
        val (verdictDef, verdictMethod) = candidates.single()
        val verdictTarget = mutableClassDefBy(verdictDef).methods.first {
            it.name == verdictMethod.name &&
                it.returnType == "Z" &&
                it.parameterTypes.map { p -> p.toString() } == listOf("I", "Z", "Z")
        }
        if ((verdictTarget.implementation?.registerCount ?: 0) < 1) {
            throw PatchException("Licence predicate has no local registers - structure changed?")
        }
        verdictTarget.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )

        // ---- B. Normalise stored entitlement values to the purchased one. ----
        // Scanning forward from each literal (rather than backwards from the flow write) keeps the
        // match independent of how the coroutine state machine reorders surrounding stores.
        var normalised = 0
        for (def in defs) {
            val edits = ArrayList<Triple<Int, Int, Int>>() // method index, instruction index, value
            def.methods.forEachIndexed { methodIndex, method ->
                val instructions = method.implementation?.instructions?.toList()
                    ?: return@forEachIndexed
                instructions.forEachIndexed { literalIndex, instruction ->
                    if (instruction !is NarrowLiteralInstruction ||
                        instruction !is OneRegisterInstruction
                    ) {
                        return@forEachIndexed
                    }
                    val literal = instruction.wideLiteral.toInt()
                    if (literal != STATE_TRIAL && literal != STATE_LOCKED) return@forEachIndexed
                    val boxRegister = findBoxRegister(instructions, literalIndex, instruction.registerA)
                    if (boxRegister == null) return@forEachIndexed
                    if (findFlowWrite(instructions, literalIndex, boxRegister) == null) {
                        return@forEachIndexed
                    }
                    edits.add(Triple(methodIndex, literalIndex, STATE_PURCHASED))
                }
            }
            if (edits.isEmpty()) continue
            val mutable = mutableClassDefBy(def)
            val methods = mutable.methods.toList()
            for ((methodIndex, literalIndex, value) in edits.sortedByDescending { it.second }) {
                val method = methods[methodIndex]
                val register =
                    (method.implementation!!.instructions.toList()[literalIndex] as OneRegisterInstruction)
                        .registerA
                method.replaceInstruction(
                    literalIndex,
                    "const/16 v" + register + ", 0x" + Integer.toHexString(value)
                )
            }
            normalised += edits.size
        }

        if (normalised < 3 || normalised > 8) {
            throw PatchException(
                "Rewrote $normalised stored entitlement sites, expected 3..8 - structure changed?"
            )
        }
        println("Force licensed state: forced verdict + rewrote $normalised entitlement writes")
    }
}
