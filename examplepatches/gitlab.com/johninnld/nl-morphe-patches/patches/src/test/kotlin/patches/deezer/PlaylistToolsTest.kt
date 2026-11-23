package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test

/** Exercise the 26 UI mutation on actual 27 input without adding fixtures. */
class PlaylistToolsTest {
    private fun original(owner: String, name: String): Method {
        val path = System.getenv("DEEZER_QUEUE_27_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        return dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            .single { it.type == owner }.methods.single { it.name == name }
    }

    @Test
    fun enabledByDefaultWithoutPolicyDependencies() {
        assertEquals("Search and sort playlists", deezerPlaylistTools.name)
        assertTrue(deezerPlaylistTools.default)
        assertEquals(setOf(deezerBase), deezerPlaylistTools.dependencies.toSet())
    }

    @Test
    fun exposesNative27ToolsWhilePreservingOtherDecisionsAndCallbacks() {
        for ((owner, name) in listOf(
            "LIIlIllIlIlllIll;" to "invokeSuspend",
            "LIIIIIllllIllllI;" to "IIlIlIlIlIllllll",
        )) {
            val input = original(owner, name)
            validateNativePlaylistTool(input, sort = name != "invokeSuspend")
            // MutableMethod retains instruction identity, so mutation assertions are meaningful.
            // DexBackedMethod creates fresh instruction wrappers on every read.
            val method = MutableMethod(input)
            val code = method.instructions.toList()
            exposePlaylistTool2703(method, sort = name != "invokeSuspend")
            val after = method.instructions.toList()
            assertEquals(code.size, after.size)
            val index = code.indices.single { i ->
                code[i].opcode == Opcode.SGET_OBJECT &&
                    (code[i] as? ReferenceInstruction)?.reference?.toString() ==
                        "LIllIllIllIll;->IlIllIIIlIIIllIl:LIllIllIllIll;" &&
                    (code.getOrNull(i + 1) as? ReferenceInstruction)?.reference?.toString() ==
                        "LIllIlllIIlllI;->IllIlIlIIlIllIll(LIllIllIllIll;Ljava/lang/String;)Z"
            }
            code.indices.filter { it != index + 2 }.forEach { assertSame(code[it], after[it]) }
            assertEquals(Opcode.CONST_4, after[index + 2].opcode)
            assertEquals(1, (after[index + 2] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals((code[index + 2] as OneRegisterInstruction).registerA,
                (after[index + 2] as OneRegisterInstruction).registerA)
            // An input that already forces the native decision must fail closed, without mutation.
            val altered = MutableMethod(original(owner, name))
            val register = (code[index + 2] as OneRegisterInstruction).registerA
            altered.replaceInstruction(index + 2, "const/4 v$register, 0x1")
            val drift = altered.instructions.toList()
            assertThrows(IllegalStateException::class.java) {
                exposePlaylistTool2703(altered, sort = name != "invokeSuspend")
            }
            assertEquals(drift, altered.instructions.toList())
            assertEquals(Opcode.INVOKE_INTERFACE, code[index + 1].opcode)
            val call = code[index + 1] as FiveRegisterInstruction
            assertEquals((code[index] as OneRegisterInstruction).registerA, call.registerD)
            assertEquals(Opcode.MOVE_RESULT, code[index + 2].opcode)
            assertEquals(Opcode.IF_EQZ, code[index + 3].opcode)
            assertEquals((code[index + 2] as OneRegisterInstruction).registerA,
                (code[index + 3] as OneRegisterInstruction).registerA)
            if (name != "invokeSuspend") {
                assertTrue("Sort also excludes charts", (code[index + 4] as ReferenceInstruction)
                    .reference.toString().endsWith("->IllIlIIIlllIIIll:Ljava/lang/Boolean;"))
                val labels = code.mapNotNull {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
                }
                assertTrue(labels.containsAll(listOf("SORT_PLAYLIST", "SEARCH")))
                assertTrue("Native callbacks remain available", code.any {
                    (it as? ReferenceInstruction)?.reference?.toString() ==
                        "LIllllIllllIIIl;->lIIIIIIIlIllIlII:LIIlllIIllIIlllII;"
                })
            } else {
                assertTrue("Native header search renderer already exists", code.any {
                    it.opcode == Opcode.NEW_INSTANCE &&
                        (it as? ReferenceInstruction)?.reference?.toString() == "LlIIIlIIIlllllll;"
                })
            }
        }
    }
}
