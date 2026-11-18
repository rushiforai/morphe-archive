package patches.flitsmeister

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assume.assumeNotNull
import org.junit.Test

class FlitsmeisterSystemVoiceTest {
    private fun method(type: String, name: String, parameters: List<String>, result: String): MutableMethod {
        val path = System.getenv("FLITSMEISTER15_ORIGINAL_APK")
            ?: System.getenv("FLITSMEISTER15_STARTUP_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val original = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            .single { it.type == type }.methods.single {
                it.name == name && it.returnType == result &&
                    it.parameterTypes.map(CharSequence::toString) == parameters
            }
        return MutableMethod(original)
    }

    private fun refs(method: MutableMethod) = method.implementation!!.instructions
        .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }

    @Test fun dynamicTtsFactoryUsesTheDefaultEngineAndStopsBeforeSamsung() {
        val factory = method("Lwd0;", "a", emptyList(), "V")
        replaceFlitsmeisterTtsFactory(factory)
        val references = refs(factory)
        assertEquals(1, references.count {
            it == "Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech\$OnInitListener;Ljava/lang/String;)V"
        })
        assertEquals(2, references.count {
            it == "Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech\$OnInitListener;)V"
        })
    }
}
