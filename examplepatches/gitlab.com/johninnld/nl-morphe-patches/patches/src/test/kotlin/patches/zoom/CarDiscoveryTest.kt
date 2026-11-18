package patches.zoom

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File

class CarDiscoveryTest {
    private fun original(): MutableMethod {
        val path = System.getenv("ZOOM_ORIGINAL_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val manager = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            .single { it.type == CAR_COMPONENT_MANAGER }
        return MutableMethod(manager.methods.single {
            it.name == "a" && it.parameterTypes.map(CharSequence::toString) == listOf("Z")
        })
    }

    @Test fun startupCannotDisableTheCarService() {
        val method = original()
        val before = method.implementation!!.instructions.toList()
        val handlers = method.implementation!!.tryBlocks.map { block ->
            block.exceptionHandlers.map { it.exceptionType }
        }
        keepCarServiceDiscoverable(method)
        val code = method.implementation!!.instructions.toList()
        assertEquals(Opcode.CONST_4, code.first().opcode)
        assertEquals(1, (code.first() as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(method.implementation!!.registerCount - 1,
            (code.first() as OneRegisterInstruction).registerA)
        assertEquals(before, code.drop(1))
        assertEquals(handlers, method.implementation!!.tryBlocks.map { block ->
            block.exceptionHandlers.map { it.exceptionType }
        })
        assertThrows(IllegalStateException::class.java) { keepCarServiceDiscoverable(method) }
    }

    @Test fun unknownComponentUpdatesAreRejectedWithoutModification() {
        val method = original()
        method.replaceInstruction(18,
            "invoke-virtual {v0, v1, p0, v2}, Landroid/content/pm/PackageManager;->changed(Landroid/content/ComponentName;II)V")
        val before = method.implementation!!.instructions.toList()
        assertThrows(IllegalStateException::class.java) { keepCarServiceDiscoverable(method) }
        assertEquals(before, method.implementation!!.instructions.toList())
    }
}
