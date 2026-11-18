package patches.zoom

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File

class CarHostPatchTest {
    private fun original(): MutableMethod {
        val path = System.getenv("ZOOM_ORIGINAL_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val service = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            .single { it.type == CAR_SERVICE }
        return MutableMethod(service.methods.single { it.name == "createHostValidator" })
    }

    @Test fun nativeValidatorHasNoHostSpecificBranchAfterPatching() {
        val original = original()
        val before = original.implementation!!.instructions.toList()
        val replacement = unrestrictedCarValidator(original)
        val code = replacement.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT), code.map { it.opcode })
        assertEquals("$HOST_VALIDATOR->ALLOW_ALL_HOSTS_VALIDATOR:$HOST_VALIDATOR",
            (code[0] as ReferenceInstruction).reference.toString())
        assertEquals((code[0] as OneRegisterInstruction).registerA,
            (code[1] as OneRegisterInstruction).registerA)
        assertEquals(original.annotations, replacement.annotations)
        assertEquals(before, original.implementation!!.instructions.toList())
        assertThrows(IllegalStateException::class.java) { unrestrictedCarValidator(replacement) }
    }

    @Test fun changedNativePolicyIsRejectedWithoutEditingIt() {
        val original = original()
        val build = original.implementation!!.instructions.indexOfFirst {
            (it as? ReferenceInstruction)?.reference.toString() == "$HOST_VALIDATOR_BUILDER->build()$HOST_VALIDATOR"
        }
        assertTrue(build >= 0)
        original.replaceInstruction(build, "invoke-virtual {v0}, $HOST_VALIDATOR_BUILDER->changed()$HOST_VALIDATOR")
        val before = original.implementation!!.instructions.toList()
        assertThrows(IllegalStateException::class.java) { unrestrictedCarValidator(original) }
        assertEquals(before, original.implementation!!.instructions.toList())
    }
}
