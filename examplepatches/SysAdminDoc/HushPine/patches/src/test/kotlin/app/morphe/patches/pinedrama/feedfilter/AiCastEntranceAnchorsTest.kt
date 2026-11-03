package app.morphe.patches.pinedrama.feedfilter

import app.morphe.Fixtures
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import java.io.File
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Hide the AI Cast button, held to every declared build: the camera's AI Theater gate is one
 * static method, its frame has the local the guard writes, and the recorder branches on its
 * answer, so a no leaves the AI Cast toolbar component unregistered rather than half built.
 */
class AiCastEntranceAnchorsTest {

    @Test
    fun `Feed filter answers the gate through the AI Cast filter`() {
        val root = File("src/main/kotlin").takeIf { it.isDirectory } ?: File("patches/src/main/kotlin")
        val source = File(root, "app/morphe/patches/pinedrama/feedfilter/FeedFilterPatch.kt").readText()
        assertTrue("the gate is not guarded", source.contains("AiTheaterRecordEntranceFingerprint.method"))
        assertTrue("the answer is not the AI Cast filter's", source.contains("shouldHideRecordEntrance()Z"))
        assertTrue("the row's flag is not set", source.contains("SettingsStatus;->enableAiCastEntrance()V"))
    }

    private class Build(apk: File) {
        val byType = HashMap<String, ClassDef>()

        init {
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) byType.putIfAbsent(classDef.type, classDef)
            }
        }

        val methods: Sequence<Pair<ClassDef, Method>>
            get() = byType.values.asSequence().flatMap { classDef -> classDef.methods.asSequence().map { classDef to it } }
    }
}
