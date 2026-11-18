package patches.waze

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assume.assumeNotNull
import org.junit.Test

class WazeSystemVoiceTest {
    private fun method(name: String, parameters: List<String>, result: String): MutableMethod {
        val path = System.getenv("WAZE_ORIGINAL_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val original = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            .single { it.type == "Lcom/waze/sound/dh;" }.methods.single {
                it.name == name && it.returnType == result &&
                    it.parameterTypes.map(CharSequence::toString) == parameters
            }
        return MutableMethod(original)
    }

    private fun refs(method: MutableMethod) = method.implementation!!.instructions
        .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }

    @Test fun chunkTextIsSpokenBeforeTheRecordedAsset() {
        val chunk = method("I", listOf("Lcom/waze/sound/v;", "Lg/h/a/a;"), "V")
        bindWazeSystemVoice(chunk)
        val references = refs(chunk)
        assertEquals("Lcom/waze/sound/v;->b()Ljava/lang/String;", references[0])
        assertTrue(references.contains("Lnl/johninnl/navigation/startup/ProviderSpeech;->speak(Ljava/lang/String;Ljava/lang/Object;)Z"))
        assertEquals("Lcom/waze/sound/e/l;->m(Lcom/waze/sound/d/c;Ljava/lang/String;Ljava/lang/String;Lg/h/a/a;I)V", references.last())
    }

    @Test fun clearingTheRouteStopsQueuedSpeech() {
        val clear = method("G", listOf("Z"), "V")
        bindWazeClearSpeech(clear)
        val references = refs(clear)
        assertTrue(references.contains("Lnl/johninnl/navigation/startup/ProviderSpeech;->stop()V"))
    }
}
