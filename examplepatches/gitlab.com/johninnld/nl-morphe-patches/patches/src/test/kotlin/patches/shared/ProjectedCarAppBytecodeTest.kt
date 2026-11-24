package patches.shared

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File

class ProjectedCarAppBytecodeTest {
    private fun method(app: String, owner: String, name: String): MutableMethod {
        val path = System.getenv("${app}_ORIGINAL_APK")
        assumeNotNull(path)
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val type = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }
            .single { it.type == owner }
        return MutableMethod(type.methods.single { it.name == name })
    }

    @Test fun phoneLauncherRunsAfterSuperclassAndLeavesNativeInstructionsAsTheFallback() {
        for (app in listOf("HOMEASSISTANT", "PLUGSHARE")) {
            val original = method(app, CAR_ACTIVITY, "onCreate")
            val before = original.implementation!!.instructions.toList()
            adaptCarLauncher(original)
            val code = original.implementation!!.instructions.toList()
            assertSame(before[0], code[0])
            assertSame(before[1], code[5])
            assertEquals(Opcode.INVOKE_SUPER, code[0].opcode)
            assertEquals(Opcode.RETURN_VOID, code[4].opcode)
            assertEquals(5, (code[3] as BuilderOffsetInstruction).target.location.index)
            assertEquals(before.drop(1), code.drop(5))
            assertTrue((code[1] as ReferenceInstruction).reference.toString().contains("redirectIfProjected(Landroid/app/Activity;)Z"))
            val after = code.toList()
            assertThrows(IllegalStateException::class.java) { adaptCarLauncher(original) }
            assertEquals(after, original.implementation!!.instructions.toList())
        }
    }

    @Test fun projectedResultsReturnTheRightObjectAndNativeFactoryRemainsReachable() {
        for (app in listOf("HOMEASSISTANT", "PLUGSHARE")) {
            val original = method(app, RESULT_MANAGER, "create")
            val before = original.implementation!!.instructions.toList()
            adaptCarResults(original)
            val code = original.implementation!!.instructions.toList()
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ,
                Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT), code.take(6).map { it.opcode })
            assertEquals(6, (code[2] as BuilderOffsetInstruction).target.location.index)
            assertSame(before.first(), code[6])
            assertEquals(before, code.drop(6))
            val after = code.toList()
            assertThrows(IllegalStateException::class.java) { adaptCarResults(original) }
            assertEquals(after, original.implementation!!.instructions.toList())
        }
    }
}
