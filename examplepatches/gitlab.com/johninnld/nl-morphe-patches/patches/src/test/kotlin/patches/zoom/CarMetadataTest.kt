package patches.zoom

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File

class CarMetadataTest {
    private fun original(name: String): MutableMethod {
        val path = System.getenv("ZOOM_ORIGINAL_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val owner = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            .single { it.type == CAR_TRACKING }
        return MutableMethod(owner.methods.single { it.name == name })
    }

    @Test fun absentCarDetailsUseOriginalUnknownLabelsAndPresentDetailsKeepTheirStore() {
        for ((name, fallback) in listOf("e" to "Android_Auto_make", "f" to "Android_Auto_model")) {
            val method = original(name)
            val before = method.implementation!!.instructions.toList()
            val parameter = method.implementation!!.registerCount - 1
            tolerateMissingCarMetadata(method)
            val code = method.implementation!!.instructions.toList()
            assertEquals(listOf(Opcode.IF_NEZ, Opcode.CONST_STRING, Opcode.SPUT_OBJECT, Opcode.RETURN_VOID),
                code.map { it.opcode })
            assertEquals(parameter, (code[0] as OneRegisterInstruction).registerA)
            assertEquals(2, (code[0] as BuilderOffsetInstruction).target.location.index)
            assertEquals(parameter, (code[1] as OneRegisterInstruction).registerA)
            assertEquals(fallback, (code[1] as ReferenceInstruction).reference.toString())
            assertEquals(before, code.drop(2))
            assertThrows(IllegalStateException::class.java) { tolerateMissingCarMetadata(method) }
        }
    }

    @Test fun unexpectedMetadataStoreIsRejectedBeforeMutation() {
        val method = original("e")
        method.replaceInstruction(0, "sput-object p0, $CAR_TRACKING->c:Ljava/lang/String;")
        val before = method.implementation!!.instructions.toList()
        assertThrows(IllegalStateException::class.java) { tolerateMissingCarMetadata(method) }
        assertEquals(before, method.implementation!!.instructions.toList())
    }
}
