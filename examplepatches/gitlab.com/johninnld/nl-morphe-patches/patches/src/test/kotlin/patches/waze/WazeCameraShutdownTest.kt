package patches.waze

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File
import java.security.MessageDigest

class WazeCameraShutdownTest {
    private fun original(): MutableMethod {
        val path=System.getenv("WAZE_TILE_ORIGINAL_APK");assumeNotNull(path)
        val file=File(path!!)
        val hash=MessageDigest.getInstance("SHA-256").digest(file.readBytes()).joinToString("") { "%02x".format(it.toInt() and 255) }
        assertEquals("Use the supplied 5.27.0.1 base", "0a66289f3db3ad575ef76ea2bac88724ed49ec8afa6f2147955d93e992750397", hash)
        val dex=DexFileFactory.loadDexContainer(file,Opcodes.forApi(29))
        return MutableMethod(dex.dexEntryNames.asSequence().flatMap { dex.getEntry(it)!!.dexFile.classes.asSequence() }
            .single { it.type=="Lcom/waze/NativeManager;" }.methods.single { it.name=="onNativeLayerShutDown" })
    }
    @Test fun clearsAfterNativeShutdownFlagWhilePreservingEveryOriginalInstruction() {
        val method=original();val before=method.implementation!!.instructions.toList()
        bindWazeCameraShutdown(method)
        val after=method.implementation!!.instructions.toList()
        val hook=after.indexOfFirst { (it as? ReferenceInstruction)?.reference.toString()=="Lorg/ungoogled/waze/NativeWarnings;->engineStopped()V" }
        assertTrue(hook>0);assertEquals(Opcode.IPUT_BOOLEAN,after[hook-1].opcode)
        assertEquals(before,after.filterIndexed { index,_ -> index!=hook })
        assertThrows(IllegalStateException::class.java) { bindWazeCameraShutdown(method) }
    }
    @Test fun changedShutdownFlagIsRejectedWithoutEditingTheCallback() {
        val method=original()
        val index=method.implementation!!.instructions.indexOfFirst { it.opcode==Opcode.IPUT_BOOLEAN &&
            (it as? ReferenceInstruction)?.reference.toString()=="Lcom/waze/NativeManager;->isNativeLayerShutdown:Z" }
        assertTrue(index>0)
        val register=(method.implementation!!.instructions.elementAt(index-1) as OneRegisterInstruction).registerA
        method.replaceInstruction(index-1,"const/4 v$register, 0x0")
        val before=method.implementation!!.instructions.toList()
        assertThrows(IllegalStateException::class.java) { bindWazeCameraShutdown(method) }
        assertEquals(before,method.implementation!!.instructions.toList())
    }
}
