package patches.gboard

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assume.assumeNotNull
import org.junit.Test
import patches.gboard.shared.GboardSoftKeyFamilyFeature
import patches.gboard.shared.applySelectedSoftKeyFamily
import patches.gboard.shared.generated.GboardVersionBindings
import java.io.File

class SpacebarLogoBindTest {
    @Test
    fun unchangedDefinitionRunsTheAfterHookBeforeReturning() {
        val path = System.getenv("GBOARD_ORIGINAL_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(26))
        val target = GboardVersionBindings.softKeyBind
        val original = dex.dexEntryNames.asSequence()
            .flatMap { dex.getEntry(it)!!.dexFile.classes.asSequence() }
            .single { it.type == target.ownerDescriptor }.methods.single(target::matches)
        val patched = MutableMethod(original)
        val implementation = patched.implementation!!
        val stockReturn = implementation.instructions.single { it.opcode == Opcode.RETURN }
        val originalRegister = (stockReturn as OneRegisterInstruction).registerA
        val jumps = implementation.instructions.filterIsInstance<BuilderOffsetInstruction>()
            .filter { it.target.location.instruction === stockReturn }
        assertTrue("The stock unchanged-definition path jumps straight to the return", jumps.isNotEmpty())

        patched.applySelectedSoftKeyFamily(setOf(GboardSoftKeyFamilyFeature.SPACEBAR_LOGO))

        val hook = implementation.instructions.single { instruction ->
            (instruction as? ReferenceInstruction)?.reference?.toString()?.contains(
                "GboardSpacebarLogoAdapter;->afterSoftKeyBound",
            ) == true
        }
        for (jump in jumps) assertEquals(hook, jump.target.location.instruction)
        val result = implementation.instructions[implementation.instructions.indexOf(hook) + 1]
        assertEquals(Opcode.RETURN, result.opcode)
        assertEquals(originalRegister, (result as OneRegisterInstruction).registerA)
    }
}
