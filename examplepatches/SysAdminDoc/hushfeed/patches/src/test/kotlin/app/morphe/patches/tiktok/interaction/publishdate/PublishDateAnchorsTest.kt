package app.morphe.patches.tiktok.interaction.publishdate

import app.morphe.Fixtures
import app.morphe.takes
import app.morphe.util.getReference
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Where Show the time to the second rewrites the creator's row, held to every declared build.
 *
 * <p>VideoAuthorInfoVM.paramSync2StateAccept turns the item's createTime into milliseconds and
 * hands it to one of three date formatters, and the three meet at one empty check. The hook goes
 * past that check's `if-nez` with the text in v1 and the Aweme in the register its createTime was
 * asked of: v12 on 47.0.3, v10 on both 47.1 builds. 47.1.x passes the text to a small static
 * helper next, 47.0.3 appends it to the row text inline, so either way the text is read right
 * after the hook.
 */
class PublishDateAnchorsTest {
    @Test
    fun `the author row post time site resolves on every declared build`() {
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val taken = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                .filter { it.type == "Lcom/ss/android/ugc/aweme/feed/assem/videoauthorinfo/VideoAuthorInfoVM;" }
                .flatMap { cls -> cls.methods.asSequence().filter { VideoAuthorInfoStateFingerprint.takes(it, cls) } }
                .toList()
            assertEquals("$version: paramSync2StateAccept", 1, taken.size)
            val method = taken.single()

            val site = runCatching { method.postTimeSite() }.getOrElse { throw AssertionError("$version: ${it.message}", it) }
            assertEquals("$version: date formatters", 3, site.formatters)
            val item = if (version == "47.0.3") 12 else 10
            assertEquals("$version: text and item registers", 1 to item, site.textRegister to site.itemRegister)

            val instructions = method.implementation!!.instructions.toList()
            assertEquals("$version: the hook follows the empty check", Opcode.IF_NEZ, instructions[site.insertAt - 1].opcode)
            val read = instructions.indexOfLast { instruction ->
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    instruction.getReference<MethodReference>()?.name == "getCreateTime" &&
                    (instruction as FiveRegisterInstruction).registerC == site.itemRegister
            }
            assertTrue("$version: the item's createTime isn't read before the hook", read in 0 until site.insertAt)
            val next = (site.insertAt until minOf(site.insertAt + 5, instructions.size)).firstOrNull { index ->
                instructions[index].opcode.name.startsWith("invoke") &&
                    site.textRegister in instructions[index].namedRegisters()
            }
            assertNotNull("$version: nothing puts the post time text on the row after the hook", next)
        }
    }
}
