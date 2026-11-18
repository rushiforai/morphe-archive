package org.ungoogled.patches.maps.misc

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assume.assumeNotNull
import org.junit.Test

class MapsSystemVoiceTest {
    private fun method(type: String, name: String, parameters: List<String>, result: String): MutableMethod {
        val path = System.getenv("MAPS_ORIGINAL_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(29))
        val original = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            .single { it.type == type }.methods.single {
                it.name == name && it.returnType == result &&
                    it.parameterTypes.map(CharSequence::toString) == parameters
            }
        return MutableMethod(original)
    }

    private fun refs(method: MutableMethod) = method.implementation!!.instructions
        .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }

    @Test fun navigationAndComponentFactoriesUseTheDefaultEngine() {
        val navigation = method("Lbmdk;", "run", emptyList(), "V")
        replaceMapsTtsConstructor(navigation)
        assertEquals(1, refs(navigation).count {
            it == "Lnl/johninnl/navigation/startup/ProviderSpeech;->create(Landroid/content/Context;Landroid/speech/tts/TextToSpeech\$OnInitListener;)Landroid/speech/tts/TextToSpeech;"
        })
        assertEquals(0, refs(navigation).count {
            it == "Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech\$OnInitListener;Ljava/lang/String;)V"
        })

        val component = method("Lnkd;", "e", emptyList(), "Ljava/lang/Object;")
        replaceMapsTtsConstructor(component)
        assertEquals(1, refs(component).count {
            it == "Lnl/johninnl/navigation/startup/ProviderSpeech;->create(Landroid/content/Context;Landroid/speech/tts/TextToSpeech\$OnInitListener;)Landroid/speech/tts/TextToSpeech;"
        })
    }

    @Test fun engineCheckAcceptsTheSelectedSystemEngine() {
        val check = method("Laqom;", "run", emptyList(), "V")
        acceptMapsSystemEngine(check)
        assertTrue(refs(check).any {
            it == "Lnl/johninnl/navigation/startup/ProviderSpeech;->acceptedEngine(Ljava/lang/String;)Z"
        })
    }
}
