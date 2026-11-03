package app.morphe.patches.pinedrama.feedfilter

import app.morphe.Fixtures
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import java.io.File
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Issue #162 (the "more" that led nowhere), held to every declared build: the helper that tells
 * the caption builder a video's caption is a smart search one, and so always draws "more".
 *
 * <p>The patch answers the helper's third argument in its own register at the first instruction,
 * so the method has to be one the fingerprint finds exactly once, its sibling with the same
 * parameters must stay unmatched, nothing may jump onto the first instruction, and the caption
 * class Comment tools hands to the comments has to be one of its callers.
 */
class SmartSearchCaptionAnchorsTest {
    @Test
    fun `Feed filter answers the helper's flag through the Tako filter at its entry`() {
        val root = File("src/main/kotlin").takeIf { it.isDirectory } ?: File("patches/src/main/kotlin")
        val source = File(root, "app/morphe/patches/pinedrama/feedfilter/FeedFilterPatch.kt").readText()
        val start = source.indexOf("SmartSearchCaptionFingerprint.method.addInstructions(")
        assertTrue("the helper is not hooked", start >= 0)
        val hook = source.substring(start, source.indexOf("\n        )", start))
        assertTrue("not at the entry: $hook", hook.contains("(\n            0,"))
        assertTrue("the answer is not the Tako filter's", hook.contains("allowSmartSearchCaption(Z)Z"))
        assertTrue("the answer does not go back in the same register", hook.contains("move-result p2"))
    }

    /** Every instruction index a branch, a switch case or a catch handler lands on. */
    private fun com.android.tools.smali.dexlib2.iface.MethodImplementation.targetIndexes(): Set<Int> {
        val instructions = instructions.toList()
        val addresses = instructions.codeAddresses()
        fun indexAt(address: Int) = addresses.indexOfFirst { it == address }.takeIf { it in instructions.indices }
        val targets = mutableSetOf<Int>()
        instructions.forEachIndexed { index, instruction ->
            if (instruction !is OffsetInstruction) return@forEachIndexed
            val target = addresses[index] + instruction.codeOffset
            if (instruction.opcode == Opcode.PACKED_SWITCH || instruction.opcode == Opcode.SPARSE_SWITCH) {
                val payload = indexAt(target)?.let { instructions[it] } as? SwitchPayload ?: return@forEachIndexed
                payload.switchElements.forEach { element -> indexAt(addresses[index] + element.offset)?.let(targets::add) }
            } else {
                indexAt(target)?.let(targets::add)
            }
        }
        tryBlocks.forEach { block -> block.exceptionHandlers.forEach { handler -> indexAt(handler.handlerCodeAddress)?.let(targets::add) } }
        return targets
    }

    /** One fixture's classes by type; methods are walked on each ask, never held (the dex has millions). */
    private class Build(apk: File) {
        val byType = HashMap<String, ClassDef>()

        init {
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) byType.putIfAbsent(classDef.type, classDef)
            }
        }

        val methods: Sequence<Pair<ClassDef, Method>>
            get() = byType.values.asSequence().flatMap { classDef -> classDef.methods.asSequence().map { classDef to it } }
    }
}
