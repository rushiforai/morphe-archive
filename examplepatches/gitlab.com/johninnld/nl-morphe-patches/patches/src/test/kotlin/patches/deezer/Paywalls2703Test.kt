package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import java.io.File
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test

class Paywalls2703Test {
    @Test fun noFreemiumVariantReturnsNullAndOtherRulesKeepOriginalEntry() {
        val path = System.getenv("DEEZER_UI_27_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val cls = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            .single { it.type == "LlllllIlIIllIl;" }
        val method = MutableMethod(cls.methods.single { it.name == "llIIIIIIlIIIIll" })
        val before = method.instructions.toList()
        suppressNoFreemiumStartup2703(method)
        val after = method.instructions.toList()
        assertEquals(8, (after[1] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.IF_NE, after[2].opcode)
        assertEquals(5, (after[2] as BuilderOffsetInstruction).target.location.index)
        assertEquals(0, (after[3] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN_OBJECT, after[4].opcode)
        before.indices.forEach { assertSame(before[it], after[it + 5]) }
    }

    @Test fun missing26ControlsArePublicDefaultsOn27() {
        for (patch in listOf(deezerRemovePaywalls, deezerEnableFullStreaming, deezerCustomAndroidAutoHosts)) {
            assertTrue(patch.default)
            assertTrue(deezerBase in patch.dependencies)
            assertTrue(deezerKeepSessionOnColdStart in patch.dependencies)
        }
    }
}
