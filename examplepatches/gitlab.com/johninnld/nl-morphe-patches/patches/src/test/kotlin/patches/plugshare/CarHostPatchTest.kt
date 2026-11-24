package patches.plugshare

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File

class CarHostPatchTest {
    @Test fun releaseHostPolicyIsReplacedWithoutChangingTheOriginalMethod() {
        val path = System.getenv("PLUGSHARE_ORIGINAL_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val owner = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.single { it.type == CAR_SERVICE }
        val original = MutableMethod(owner.methods.single { it.name == "createHostValidator" })
        val before = original.implementation!!.instructions.toList()
        val result = unrestrictedCarValidator(original)
        val code = result.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT), code.map { it.opcode })
        assertEquals("$HOST_VALIDATOR->ALLOW_ALL_HOSTS_VALIDATOR:$HOST_VALIDATOR", (code[0] as ReferenceInstruction).reference.toString())
        assertEquals(before, original.implementation!!.instructions.toList())
        assertThrows(IllegalStateException::class.java) { unrestrictedCarValidator(result) }
    }
}
