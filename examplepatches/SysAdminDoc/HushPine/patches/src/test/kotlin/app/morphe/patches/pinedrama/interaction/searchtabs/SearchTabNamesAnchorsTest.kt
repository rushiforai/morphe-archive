package app.morphe.patches.pinedrama.interaction.searchtabs

import app.morphe.Fixtures
import app.morphe.patcher.Fingerprint
import app.morphe.takes
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Fix search tab names rewrites every return of the tab title method, using the Context parameter
 * and a spare local, and builds the Home screen's Drama tab object to ask it for its label.
 */
class SearchTabNamesAnchorsTest {
    private fun matches(apk: File, fingerprint: Fingerprint): List<Pair<ClassDef, Method>> {
        val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
        val taken = mutableListOf<Pair<ClassDef, Method>>()
        for (entry in container.dexEntryNames) {
            for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                for (method in classDef.methods) {
                    if (method.implementation != null && fingerprint.takes(method, classDef)) {
                        taken += classDef to method
                    }
                }
            }
        }
        return taken
    }

    @Test
    fun `each declared build has one patchable search tab title method`() {
        Fixtures.forEachDeclared { apk ->
            val taken = matches(apk, SearchTabTitleFingerprint)
            assertEquals("${apk.name}: ${taken.map { it.first.type }}", 1, taken.size)
            val method = taken.single().second
            val code = method.implementation!!
            assertTrue("${apk.name}: p0 must be the tab index", AccessFlags.STATIC.isSet(method.accessFlags))
            val firstParameter = code.registerCount - 2
            assertTrue("${apk.name}: the rewrite needs two locals", firstParameter >= 2)
            assertTrue("${apk.name}: the added calls can't sit inside a try block", code.tryBlocks.isEmpty())
            val context = firstParameter + 1
            val returns = code.instructions.filter { it.opcode == Opcode.RETURN_OBJECT }.toList()
            assertTrue("${apk.name}: no returns to check", returns.isNotEmpty())
            for (instruction in returns) {
                val title = (instruction as OneRegisterInstruction).registerA
                assertTrue("${apk.name}: title in v$title isn't a local", title < firstParameter)
            }
            val contextWritten = code.instructions.any { instruction ->
                instruction.opcode.setsRegister() && when (instruction) {
                    is TwoRegisterInstruction -> instruction.registerA == context
                    is OneRegisterInstruction -> instruction.registerA == context
                    else -> false
                }
            }
            assertFalse("${apk.name}: the Context parameter is overwritten", contextWritten)
        }
    }

    @Test
    fun `each declared build has one Drama tab label on a class the patch can build`() {
        Fixtures.forEachDeclared { apk ->
            val taken = matches(apk, DramaTabLabelFingerprint)
            assertEquals("${apk.name}: ${taken.map { it.second.name }}", 1, taken.size)
            val (classDef, method) = taken.single()
            assertTrue("${apk.name}: the label must be public", AccessFlags.PUBLIC.isSet(method.accessFlags))
            assertFalse("${apk.name}: the label must be an instance method", AccessFlags.STATIC.isSet(method.accessFlags))
            assertFalse("${apk.name}: the class must be concrete", AccessFlags.ABSTRACT.isSet(classDef.accessFlags))
            val constructor = classDef.methods.singleOrNull { it.name == "<init>" && it.parameterTypes.isEmpty() }
            assertTrue(
                "${apk.name}: needs a public no-argument constructor",
                constructor != null && AccessFlags.PUBLIC.isSet(constructor.accessFlags),
            )
        }
    }
}
