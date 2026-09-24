package app.morphe.patches.tiktok.misc.commenttools

import app.morphe.Fixtures
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * What Hide comment popup ads rests on, held to TikTok 47.0.3.
 *
 * The patch hands CommentSurpriseStruct's constructor null for a surprise that words in a comment
 * set off. That takes the animation away from every path only if the constructor is the one
 * place the struct's surprise is written, and it is safe only if no read of it uses it before
 * checking for null. On 47.0.3 there are 17 reads in 8 methods: the publish view model and the
 * list helper that start the animation, the observer that plays it, and the analytics around
 * them. Each read is followed straight away by an if-eqz that branches away on null, or by the
 * call into the analytics method named by comment_easter_egg_trigger (a second read of a field
 * the method already checked), whose own first use of the surprise is that same check. A new
 * reader that does neither would crash on the null the patch puts there, so it fails here first.
 * An if-nez is not taken as a check: it is also how a Kotlin `!!` starts.
 *
 * The same struct carries TikTok's own first-comment celebration, which the switch keeps. The
 * extension knows it as surprise type 1: the publish path sends first_comment_surprise_trigger
 * only behind a test of the surprise's type against 1, and that is pinned here too.
 *
 * The analytics method is what the patch hooked through 0.58.0. It is pinned as what it is: it
 * fills an event with the surprise's ids and sends it, and starts nothing.
 */
class CommentSurpriseAnchorsTest {
    private val struct = "Lcom/ss/android/ugc/aweme/comment/model/CommentSurpriseStruct;"

    private class Read(val where: String, val index: Int, val register: Int, val next: Instruction?)

    @Test
    fun `47_0_3 writes the comment surprise in one constructor and null-checks every read`() {
        val apk = Fixtures.apks().single { it.name.contains("47.0.3") }
        val writers = mutableListOf<String>()
        val reads = mutableListOf<Read>()
        val eggLoggers = mutableListOf<Method>()
        val firstCommentLoggers = mutableListOf<Method>()
        val typeReaders = mutableListOf<Pair<String, List<Instruction>>>()
        val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
        container.dexEntryNames.asSequence()
            .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
            .flatMap { it.methods.asSequence() }
            .forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val where = "${method.definingClass}->${method.name}"
                var readsType = false
                instructions.forEachIndexed { index, instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                    if (reference is StringReference) {
                        if (reference.string == "comment_easter_egg_trigger") eggLoggers += method
                        if (reference.string == "first_comment_surprise_trigger") firstCommentLoggers += method
                    }
                    if (reference is FieldReference && reference.definingClass == SURPRISE && reference.name == "surpriseType") {
                        readsType = true
                    }
                    if (reference !is FieldReference || reference.definingClass != struct ||
                        reference.name != "commentSurprise"
                    ) return@forEachIndexed
                    if (instruction.opcode == Opcode.IGET_OBJECT) {
                        val target = (instruction as TwoRegisterInstruction).registerA
                        reads += Read(where, index, target, instructions.getOrNull(index + 1))
                    } else {
                        writers += "$where ${instruction.opcode.name}"
                    }
                }
                if (readsType) typeReaders += where to instructions
            }

        assertEquals("the only write is the constructor's", listOf("$struct-><init> iput-object"), writers)

        assertEquals("methods naming comment_easter_egg_trigger", 1, eggLoggers.size)
        val logger = eggLoggers.single()
        val calls = logger.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        // A constructor, two puts into the event's map and the send: nothing that starts an animation.
        assertEquals("what the analytics method calls: $calls", 4, calls.size)
        assertEquals(
            "one call sends the event (String, Map): $calls",
            1, calls.count { it.parameterTypes == listOf("Ljava/lang/String;", "Ljava/util/Map;") },
        )
        assertEquals("the analytics method takes the surprise", listOf(SURPRISE), logger.parameterTypes.map { it.toString() })
        val parameter = logger.implementation!!.registerCount - 1
        val firstUse = logger.implementation!!.instructions.first { parameter in registersOf(it) }
        assertEquals(
            "the analytics method checks the surprise for null before using it",
            Opcode.IF_EQZ, firstUse.opcode,
        )

        val unchecked = reads.filterNot { read ->
            val next = read.next ?: return@filterNot false
            val nullCheck = next.opcode == Opcode.IF_EQZ && (next as OneRegisterInstruction).registerA == read.register
            val intoLogger = next.opcode == Opcode.INVOKE_STATIC && calls(next, logger) &&
                registersOf(next) == listOf(read.register)
            nullCheck || intoLogger
        }.map { "${it.where} at ${it.index}" }
        assertEquals("reads that use the surprise before checking it for null", emptyList<String>(), unchecked)
        assertEquals("reads of the surprise", 17, reads.size)
        assertEquals("methods reading it: ${reads.map { it.where }.toSet()}", 8, reads.map { it.where }.toSet().size)

        // Type 1 is the first-comment celebration: its report goes out only behind that test.
        assertEquals("methods naming first_comment_surprise_trigger", 1, firstCommentLoggers.size)
        val firstComment = firstCommentLoggers.single()
        val guardedCalls = typeReaders.flatMap { (where, instructions) ->
            instructions.indices.filter { k ->
                instructions[k].opcode == Opcode.INVOKE_STATIC && calls(instructions[k], firstComment) &&
                    guardedByTypeOne(instructions, k)
            }.map { "$where at $it" }
        }
        assertEquals("first-comment reports behind a surprise type test against 1: $guardedCalls", 1, guardedCalls.size)
    }

    private fun calls(instruction: Instruction, target: Method): Boolean {
        val reference = (instruction as ReferenceInstruction).reference as? MethodReference ?: return false
        return reference.definingClass == target.definingClass && reference.name == target.name &&
            reference.parameterTypes.map { it.toString() } == target.parameterTypes.map { it.toString() }
    }

    /**
     * An if-ne just before the call, between the surprise's type (read from the field and
     * unboxed with intValue) and a register the method last set to the literal 1.
     */
    private fun guardedByTypeOne(instructions: List<Instruction>, call: Int): Boolean {
        val test = (call - 1 downTo maxOf(0, call - 6)).firstOrNull { instructions[it].opcode == Opcode.IF_NE }
            ?: return false
        val operands = (instructions[test] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) }
        val unboxed = (test - 1 downTo maxOf(1, test - 6)).firstOrNull { i ->
            instructions[i].opcode == Opcode.MOVE_RESULT && (instructions[i] as OneRegisterInstruction).registerA in operands &&
                ((instructions[i - 1] as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                    it.definingClass == "Ljava/lang/Integer;" && it.name == "intValue"
                } == true
        } ?: return false
        val typeRead = (unboxed - 1 downTo maxOf(0, unboxed - 6)).any { i ->
            ((instructions[i] as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                it.definingClass == SURPRISE && it.name == "surpriseType"
            } == true
        }
        if (!typeRead) return false
        val literal = operands.single { it != (instructions[unboxed] as OneRegisterInstruction).registerA }
        val lastSet = (test - 1 downTo 0).firstOrNull { i ->
            val instruction = instructions[i]
            instruction.opcode.setsRegister() && instruction is OneRegisterInstruction && instruction.registerA == literal
        } ?: return false
        val set = instructions[lastSet]
        return set is NarrowLiteralInstruction && set.opcode.name.startsWith("const") && set.narrowLiteral == 1
    }

    private fun registersOf(instruction: Instruction): List<Int> = when (instruction) {
        is FiveRegisterInstruction -> listOf(
            instruction.registerC, instruction.registerD, instruction.registerE,
            instruction.registerF, instruction.registerG,
        ).take(instruction.registerCount)
        is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
        is ThreeRegisterInstruction -> listOf(instruction.registerA, instruction.registerB, instruction.registerC)
        is TwoRegisterInstruction -> listOf(instruction.registerA, instruction.registerB)
        is OneRegisterInstruction -> listOf(instruction.registerA)
        else -> emptyList()
    }

    private companion object {
        const val SURPRISE = "Lcom/ss/android/ugc/aweme/comment/model/CommentSurprise;"
    }
}
