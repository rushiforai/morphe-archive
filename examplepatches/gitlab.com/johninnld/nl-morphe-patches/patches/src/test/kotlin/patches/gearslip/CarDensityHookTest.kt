package patches.gearslip

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File

class CarDensityHookTest {
    private fun original(): List<ClassDef> {
        val path = System.getenv("GEARSLIP_ORIGINAL_APK")
        assumeNotNull(path)
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(31))
        return container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }
    }

    @Test fun allThreeRealApkBoundariesChangeOnlyTheirDensityParameter() {
        val hooks = densityHookMethods(original()).map(::MutableMethod)
        val before = hooks.map { it.implementation!!.instructions.toList() }
        applyDensityHooks(hooks)
        hooks.forEachIndexed { index, method ->
            val code = method.implementation!!.instructions.toList()
            assertEquals(before[index].size + 2, code.size)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, code[0].opcode)
            assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
            val call = code[0] as RegisterRangeInstruction
            assertEquals(if (index == 0) 2 else 1, call.registerCount)
            assertEquals(call.startRegister, (code[1] as OneRegisterInstruction).registerA)
            assertTrue((code[0] as ReferenceInstruction).reference.toString().contains("Lpatches/gearslip/CarDensity;"))
            assertEquals(before[index].map { it.opcode }, code.drop(2).map { it.opcode })
        }
    }

    @Test fun missingOrAmbiguousBoundariesFailClosed() {
        val classes = original()
        val hooks = densityHookMethods(classes)
        assertEquals(3, hooks.size)
        for (hook in hooks) {
            assertThrows(PatchException::class.java) { densityHookMethods(classes.filter { it.type != hook.definingClass }) }
            assertThrows(PatchException::class.java) { densityHookMethods(classes + classes.single { it.type == hook.definingClass }) }
        }
    }
}
