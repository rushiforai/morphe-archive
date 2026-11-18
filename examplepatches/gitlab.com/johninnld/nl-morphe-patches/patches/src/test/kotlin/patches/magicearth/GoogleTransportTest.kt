package patches.magicearth

import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File

class GoogleTransportTest {
    @Test fun dropsSchedulingAndQueuedUploadsWhileKeepingCompletionContracts() {
        val path = System.getenv("MAGIC_EARTH_ORIGINAL_BASE_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
        for (type in listOf(TRANSPORT_RUNTIME, CCT_BACKEND)) {
            val original = classes.single { it.type == type }.methods.single {
                it.name == "send" && it.parameterTypes.size == if (type == TRANSPORT_RUNTIME) 2 else 1
            }
            val replacement = withoutGoogleTransport(original)
            val code = replacement.implementation!!.instructions.toList()
            assertEquals(if (type == TRANSPORT_RUNTIME)
                listOf(Opcode.CONST_4, Opcode.INVOKE_INTERFACE, Opcode.RETURN_VOID)
            else listOf(Opcode.CONST_WIDE_16, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT),
                code.map { it.opcode })
            val calls = code.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
            assertEquals(1, calls.size)
            assertTrue(if (type == TRANSPORT_RUNTIME) calls.single().endsWith("->onSchedule(Ljava/lang/Exception;)V")
                else calls.single().contains("BackendResponse;->ok(J)"))
            assertThrows(IllegalStateException::class.java) { withoutGoogleTransport(replacement) }
            assertTrue(original.implementation!!.instructions.count() > code.size)
        }
    }
}
