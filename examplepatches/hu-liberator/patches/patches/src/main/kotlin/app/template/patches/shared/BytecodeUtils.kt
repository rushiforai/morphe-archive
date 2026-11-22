package app.template.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11x
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * dexlib2 opcodes for the inline data-table pseudo-instructions. These are not
 * executable code; a `packed-switch`/`sparse-switch` references its payload by
 * offset, and `fill-array-data` references an array payload. They are always
 * emitted after a control-flow terminator (return/throw/goto) so that they are
 * never reachable by fall-through -- if they were, the verifier rejects the
 * class with "encountered data table in instruction stream".
 */
private val DATA_TABLE_PAYLOAD_OPCODES = setOf(
    Opcode.PACKED_SWITCH_PAYLOAD,
    Opcode.SPARSE_SWITCH_PAYLOAD,
    Opcode.ARRAY_PAYLOAD,
)

/**
 * Neutralizes every `throw` instruction in [method] whose thrown value was
 * constructed via `new-instance ..., [exceptionType]` (identified by the
 * nearest preceding new-instance targeting the same register), leaving
 * everything else in the method -- including throws of other exception types
 * and any unrelated code sharing the method -- untouched.
 *
 * Each matching `throw` is neutralized **in place** with a single-code-unit
 * replacement, never deleted. `throw` (format 11x), `nop` (10x), `return-void`
 * (10x) and `return-object`/`return`/`return-wide` (11x) are all exactly one
 * code unit, so no instruction address ever shifts -- a deliberate precaution
 * for the control-flow-flattened methods this is used on, where a packed-switch
 * dispatch can jump directly at a specific instruction's address (deleting or
 * inserting instructions here corrupted Qa.u0.m()'s packed-switch and caused a
 * VerifyError -- see git history).
 *
 * The replacement depends on the method's return type, because a `throw` is a
 * basic-block terminator and whether its replacement also terminates the block
 * decides what the verifier sees:
 *
 *  - **Non-void methods** (the Play Integrity verdict validator, which returns
 *    Object): the throw is replaced with a `return` terminator
 *    (`return-object v<throwReg>`), never `nop`. This keeps the control-flow
 *    graph identical to the original -- no new fall-through edge -- so no
 *    register-type merge is introduced. `nop` is actively unsafe here: it lets
 *    the just-constructed exception object fall through, still live in throwReg,
 *    into the instruction after the throw, which in R8's control-flow-flattened
 *    dispatch is a jump target that reuses throwReg as an unrelated, narrower
 *    type. The verifier merges them and rejects the whole class. Both VerifyErrors
 *    seen on this app came from `nop`-ing one of these throws: 2.6.13-prod fell
 *    through into a packed-switch data table ("encountered data table in
 *    instruction stream"), and 2.7.6-prod fell through into the verdict method's
 *    success block, whose first act is `iget-object v0, v0, La8/E;->v` -- reading
 *    `this` back out of the very register the throw block had overwritten with a
 *    SecurityException -- giving "cannot access instance field a8.E.v from object
 *    of type Reference java.lang.Object". Returning the exception object is
 *    behaviourally irrelevant: that branch is made unreachable at runtime by
 *    DisablePlayIntegrityRequestPatch, and the only requirement is that the class
 *    verify.
 *
 *  - **Void methods** (the Q2.c/O2.c onReceive broadcast gate): the throw is
 *    replaced with `nop`, so execution falls through past the removed throw into
 *    the legitimate post-check dispatch -- the intended "pretend the check passed
 *    and carry on" behavior. This is verifiably safe there because every such
 *    site's fall-through target reassigns throwReg before reading it. The sole
 *    exception is a throw that `nop` would drop into an inline data-table payload
 *    or off the end of the method; that is replaced with `return-void` (also a
 *    one-code-unit terminator) so the payload stays unreachable by fall-through.
 */
fun neutralizeExceptionThrows(method: MutableMethod, exceptionType: String) {
    val instructions = method.instructions

    // Collect targets (index + register + whether a nop here would be illegal)
    // up front, before mutating anything -- every replacement is one code unit,
    // so indices stay valid, but snapshotting keeps the fall-through check based
    // on the original instruction stream.
    val targets = instructions.indices.mapNotNull { i ->
        val insn = instructions[i]
        if (insn.opcode != Opcode.THROW) return@mapNotNull null
        val throwReg = (insn as Instruction11x).registerA

        val nearestNewInstance = (i - 1 downTo maxOf(0, i - 15))
            .map { j -> instructions[j] }
            .firstOrNull { it.opcode == Opcode.NEW_INSTANCE && (it as Instruction21c).registerA == throwReg }
            as Instruction21c?

        if (nearestNewInstance == null ||
            (nearestNewInstance.reference as TypeReference).type != exceptionType
        ) {
            return@mapNotNull null
        }

        val next = instructions.getOrNull(i + 1)
        val nopWouldFallThroughIntoData = next == null || next.opcode in DATA_TABLE_PAYLOAD_OPCODES
        Triple(i, throwReg, nopWouldFallThroughIntoData)
    }

    val returnType = method.returnType

    targets.forEach { (index, throwReg, nopWouldFallThroughIntoData) ->
        val replacement = when {
            // Non-void methods: ALWAYS replace the throw with a return terminator,
            // never nop. A `throw` is already a basic-block terminator, so swapping
            // it for a `return` preserves the method's control-flow graph exactly --
            // no new fall-through edge, so no register-type merge can be introduced
            // or widened. nop is unsafe here: it lets the just-constructed exception
            // object fall through (still live in throwReg) into the instruction after
            // the throw, which in R8's control-flow-flattened switch dispatch is a
            // jump target that reuses throwReg as an unrelated, narrower type. The
            // verifier merges the two and rejects the first use. Observed on
            // hu.mav.emmapp 2.7.6-prod: in the Play Integrity verdict validator
            // La8/E;->v(Object)Object the throw block does `new-instance v0,
            // SecurityException`, and the very next (success) block does
            // `iget-object v0, v0, La8/E;->v` -- i.e. reads `this` back out of v0 --
            // so nop made v0 merge to java.lang.Object and the field read failed hard
            // verification ("cannot access instance field a8.E.v from object of type
            // Reference java.lang.Object", rejecting the whole class). This also
            // subsumes the earlier data-table case (a throw sitting right before a
            // packed-switch payload). Returning the exception object is harmless: the
            // only non-void method this runs on is the verdict validator, whose
            // SecurityException branch is made unreachable at runtime by
            // DisablePlayIntegrityRequestPatch, so only verification matters here.
            returnType.startsWith("L") || returnType.startsWith("[") -> "return-object v$throwReg"

            // Void methods (the broadcast onReceive gate): nop so execution falls
            // through past the removed throw into the legitimate post-check dispatch
            // -- the intended "pretend the check passed and carry on" behavior, and
            // verifiably safe there because every such site's fall-through target
            // reassigns throwReg (new-instance/sget-object) before any read. The one
            // exception is a throw that nop would drop into an inline data-table
            // payload or off the end of the method, which the verifier also rejects;
            // return-void instead (still a one-code-unit terminator, no address shift).
            returnType == "V" -> if (nopWouldFallThroughIntoData) "return-void" else "nop"

            else -> error(
                "neutralizeExceptionThrows: $exceptionType throw in " +
                    "${method.definingClass}->${method.name} is in a method returning the primitive " +
                    "type '$returnType'; throwReg holds an object, so neither return-object nor a safe " +
                    "nop applies. This case hasn't occurred in practice; handle it explicitly if it does.",
            )
        }
        method.replaceInstruction(index, replacement)
    }
}
