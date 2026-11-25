package patches.reolink

import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File

class PushNotificationsTest {
    @Test fun correctsOnlyTwoIdentityResultsInTheSuppliedOriginal() {
        val path = System.getenv("REOLINK_ORIGINAL_BASE_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
        val original = classes.single { it.type == FIREBASE_INSTALLATION_CLIENT }.methods.single {
            it.name == "openHttpURLConnection"
        }
        val before = original.implementation!!.instructions.toList()
        val replacement = withReolinkFirebaseHeaders(original)
        val after = replacement.implementation!!.instructions.toList()
        assertEquals(before.size, after.size)
        assertEquals(original.implementation!!.registerCount, replacement.implementation!!.registerCount)
        val changed = before.indices.filter { index ->
            before[index].opcode != after[index].opcode ||
                (before[index] as? ReferenceInstruction)?.reference?.toString() !=
                (after[index] as? ReferenceInstruction)?.reference?.toString()
        }
        assertEquals(2, changed.size)
        assertEquals(setOf(REOLINK_PACKAGE, REOLINK_FIREBASE_CERTIFICATE), changed.map {
            (after[it] as ReferenceInstruction).reference.toString()
        }.toSet())
        for (index in changed) {
            assertEquals(Opcode.MOVE_RESULT_OBJECT, before[index].opcode)
            assertEquals(Opcode.CONST_STRING, after[index].opcode)
            assertEquals((before[index] as OneRegisterInstruction).registerA,
                (after[index] as OneRegisterInstruction).registerA)
        }
        // Retry/TLS/error paths and every call are retained; only their two header values change.
        assertEquals(before.filter { (it as? ReferenceInstruction)?.reference is MethodReference }.map {
            (it as ReferenceInstruction).reference.toString()
        }, after.filter { (it as? ReferenceInstruction)?.reference is MethodReference }.map {
            (it as ReferenceInstruction).reference.toString()
        })
        assertThrows(IllegalStateException::class.java) { withReolinkFirebaseHeaders(replacement) }
        val unrelated = classes.single { it.type == FIREBASE_INSTALLATION_CLIENT }.methods.first { it.name == "<init>" }
        assertThrows(IllegalStateException::class.java) { withReolinkFirebaseHeaders(unrelated) }
    }
}
