package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test

class PlayerQueueShortcutsTest {
    private fun original(): Method {
        val path = System.getenv("DEEZER_QUEUE_27_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        return dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            .single { it.type == PlayerQueue27.menu }.methods.single { it.name == "<clinit>" }
    }

    @Test
    fun targetsOnlyOriginal27BuildAndSigner() {
        assertEquals(listOf("9.0.27.3"), deezer.targets.map { it.version })
        assertEquals(setOf(9002703), deezer.targets.flatMap { it.versionCodes!!.values }.toSet())
        assertEquals(setOf("51a891a6c5d17b4e36a6f46bab675c1cae786a5af06f51d0105dab7ec6a94516"),
            deezer.signatures)
    }

    @Test
    fun enabledByDefaultAndDependsOnTheDeezerBase() {
        assertTrue(deezerPlayerQueueShortcuts.default)
        assertEquals(setOf(deezerBase), deezerPlayerQueueShortcuts.dependencies.toSet())
    }

    @Test
    fun original27KeepsEveryOtherContextAndAllOriginalInstructions() {
        run {
            val original = original()
            val method = MutableMethod(original)
            val before = method.instructions.toList()
            val menus = candidates(method)
            assertEquals(14, menus.getValue("PLAYER").size)
            assertFalse(menus.getValue("PLAYER").contains(PlayerQueue27.add.toString()))
            assertFalse(menus.getValue("PLAYER").contains(PlayerQueue27.next.toString()))
            assertTrue("These must be existing contextual actions", menus.getValue("ALBUM")
                .containsAll(listOf(PlayerQueue27.add.toString(), PlayerQueue27.next.toString())))

            exposePlayerQueueShortcuts(method, PlayerQueue27.add, PlayerQueue27.next)

            val after = method.instructions.toList()
            val updated = candidates(method)
            assertEquals(menus.keys, updated.keys)
            for ((context, actions) in menus) {
                val expected = if (context == "PLAYER") actions +
                    listOf(PlayerQueue27.add.toString(), PlayerQueue27.next.toString()) else actions
                assertEquals(context, expected, updated.getValue(context))
            }
            // Existing enum instructions survive verbatim, with no new methods or registers.
            val player = before.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "PLAYER"
            }
            assertEquals(before.size + 10, after.size)
            before.indices.forEach { i -> assertSame(before[i], after[i + if (i >= player) 10 else 0]) }
            assertEquals(original.implementation!!.registerCount, method.implementation!!.registerCount)
            assertTrue(method.implementation!!.tryBlocks.isEmpty())
            assertEquals(listOf("Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;"),
                after.subList(player, player + 10).mapNotNull {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString()
                })
        }
    }

    @Test
    fun refusesReapplicationAndDriftBeforeMutatingTheInitializer() {
        run {
            val method = MutableMethod(original())
            exposePlayerQueueShortcuts(method, PlayerQueue27.add, PlayerQueue27.next)
            val patched = method.instructions.toList()
            assertThrows(IllegalStateException::class.java) {
                exposePlayerQueueShortcuts(method, PlayerQueue27.add, PlayerQueue27.next)
            }
            assertEquals(patched, method.instructions.toList())

            val drifted = MutableMethod(original())
            val player = drifted.instructions.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "PLAYER"
            }
            val ordinal = (drifted.instructions[player + 1] as OneRegisterInstruction).registerA
            drifted.replaceInstruction(player + 1, "const/4 v$ordinal, 0x7")
            val drift = drifted.instructions.toList()
            assertThrows(IllegalStateException::class.java) {
                exposePlayerQueueShortcuts(drifted, PlayerQueue27.add, PlayerQueue27.next)
            }
            assertEquals(drift, drifted.instructions.toList())
        }
    }

    /** Evaluate only straight-line enum candidate data, not eligibility, UI or playback. */
    private fun candidates(method: MutableMethod): Map<String, List<String>> {
        val code = method.instructions.toList()
        val lastConstructor = code.indexOfLast {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == method.definingClass && ref.name == "<init>"
        }
        val registers = mutableMapOf<Int, Any?>()
        val menus = linkedMapOf<String, List<String>>()
        var result: Any? = null
        for (instruction in code.take(lastConstructor + 1)) {
            val one = instruction as? OneRegisterInstruction
            val pair = instruction as? TwoRegisterInstruction
            val ref = (instruction as? ReferenceInstruction)?.reference
            when (instruction.opcode) {
                Opcode.CONST_STRING -> registers[one!!.registerA] = (ref as StringReference).string
                Opcode.CONST_4, Opcode.CONST_16 -> registers[one!!.registerA] =
                    (instruction as NarrowLiteralInstruction).narrowLiteral
                Opcode.SGET_OBJECT -> registers[one!!.registerA] = ref.toString()
                Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16,
                Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 ->
                    registers[pair!!.registerA] = registers[pair.registerB]
                Opcode.FILLED_NEW_ARRAY_RANGE -> {
                    val range = instruction as RegisterRangeInstruction
                    result = MutableList(range.registerCount) { registers[range.startRegister + it] }
                }
                Opcode.MOVE_RESULT_OBJECT -> registers[one!!.registerA] = result
                Opcode.INVOKE_STATIC -> {
                    assertEquals("Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;", ref.toString())
                    val call = instruction as FiveRegisterInstruction
                    val source = registers[call.registerC] as List<*>
                    result = MutableList(registers[call.registerD] as Int) { source.getOrNull(it) }
                }
                Opcode.APUT_OBJECT -> {
                    val put = instruction as ThreeRegisterInstruction
                    @Suppress("UNCHECKED_CAST")
                    val array = registers[put.registerB] as MutableList<Any?>
                    array[registers[put.registerC] as Int] = registers[put.registerA]
                }
                Opcode.INVOKE_DIRECT -> {
                    val call = instruction as FiveRegisterInstruction
                    val constructor = ref as MethodReference
                    assertEquals(method.definingClass, constructor.definingClass)
                    assertEquals("<init>", constructor.name)
                    val name = registers[call.registerD] as String
                    menus[name] = (registers[call.registerF] as List<*>).map { it as String }
                }
                Opcode.NEW_INSTANCE, Opcode.SPUT_OBJECT, Opcode.CHECK_CAST -> Unit
                else -> error("Unexpected enum data instruction: ${instruction.opcode}")
            }
        }
        assertEquals(18, menus.size)
        return menus
    }
}
