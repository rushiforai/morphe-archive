package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import patches.shared.gateProviderBatch
import java.io.File

class NavigationAudio15Test {
    private fun batch(variable: String, owner: String): MutableMethod {
        val path = System.getenv(variable)
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val method = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            .single { it.type == owner }.methods.single { it.name == "i" }
        return MutableMethod(method)
    }

    private fun body(method: MutableMethod) = method.instructions.map {
        Triple(it.opcode, (it as? ReferenceInstruction)?.reference?.toString(),
            (it as? OffsetInstruction)?.codeOffset)
    }

    @Test fun publisher15BatchKeepsNativeCallbacksAndAllThreeLoopContinuations() {
        val method = batch("FLITSMEISTER15_STARTUP_APK", "Ls50;")
        validateFlitsmeister15AudioBatch(method)
        val original = body(method)
        gateProviderBatch(method)
        assertEquals(original, body(method).drop(5))
        assertEquals("Lnl/johninnl/navigation/startup/ProviderAudio;->skipItems(Ljava/lang/Object;)Z",
            (method.instructions.first() as ReferenceInstruction).reference.toString())
    }

    @Test fun changedNativeCallbackFailsBeforeMutation() {
        val method = batch("FLITSMEISTER15_STARTUP_APK", "Ls50;")
        method.replaceInstruction(43, "nop")
        val changed = body(method)
        try {
            validateFlitsmeister15AudioBatch(method)
            fail("Changed publisher callback must fail closed")
        } catch (_: IllegalStateException) {
            assertEquals(changed, body(method))
        }
    }

    @Test fun publisher14KeepsItsExistingBatchContractAndIsRejectedBy15Profile() {
        val method = batch("FLITSMEISTER_STARTUP_APK", "Lt50;")
        val original = body(method)
        try {
            validateFlitsmeister15AudioBatch(method)
            fail("14 must never use the 15 ABI profile")
        } catch (_: IllegalStateException) {
            assertEquals(original, body(method))
        }
        gateProviderBatch(method)
        assertEquals(original, body(method).drop(5))
    }
}
