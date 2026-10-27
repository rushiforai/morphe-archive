package app.morphe.patches.tiktok.misc.settings

import app.morphe.util.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import org.junit.Assert.assertEquals
import org.junit.Test

class SettingsRowOrderTest {
    @Test
    fun `an existing Open Debug row is removed before it is inserted at index zero`() {
        val method = MutableMethod(
            ImmutableMethod(
                "LX/Test;",
                "rows",
                emptyList(),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                ImmutableMethodImplementation(4, emptyList(), null, null),
            ),
        ).apply {
            addInstructions(
                0,
                settingsRowMoveToFrontInstructions(
                    copyRegister = 0,
                    valueRegister = 1,
                    indexRegister = 2,
                    listRegister = 3,
                    openDebugField = ImmutableFieldReference("LX/Rows;", "OPEN_DEBUG", "LX/Rows;"),
                ),
            )
        }

        val calls = method.implementation!!.instructions.mapNotNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.toString()
        }

        assertEquals(
            listOf(
                "Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V",
                "Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z",
                "Lapp/morphe/extension/tiktok/settings/TikTokActivityHook;->showSettingsRow()Z",
                "Ljava/util/ArrayList;->add(ILjava/lang/Object;)V",
            ),
            calls,
        )
    }

    @Test
    fun `a hidden Hushfeed row skips the insert but still swaps in the copy without it`() {
        val instructions = rowsMethod().implementation!!.instructions.toList()
        val add = instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "add"
        }
        val branch = instructions.single { it.opcode == Opcode.IF_EQZ } as OffsetInstruction
        val branchIndex = instructions.indexOfFirst { it.opcode == Opcode.IF_EQZ }
        val offsets = instructions.runningFold(0) { at, instruction -> at + instruction.codeUnits }
        val target = offsets.indexOf(offsets[branchIndex] + branch.codeOffset)

        assertEquals(add + 1, target)
        val swap = instructions[target] as TwoRegisterInstruction
        assertEquals(Opcode.MOVE_OBJECT, instructions[target].opcode)
        assertEquals(3, swap.registerA)
        assertEquals(0, swap.registerB)
    }

    private fun rowsMethod() = MutableMethod(
        ImmutableMethod(
            "LX/Test;",
            "rows",
            emptyList(),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            ImmutableMethodImplementation(4, emptyList(), null, null),
        ),
    ).apply {
        addInstructions(
            0,
            settingsRowMoveToFrontInstructions(
                copyRegister = 0,
                valueRegister = 1,
                indexRegister = 2,
                listRegister = 3,
                openDebugField = ImmutableFieldReference("LX/Rows;", "OPEN_DEBUG", "LX/Rows;"),
            ),
        )
    }
}
