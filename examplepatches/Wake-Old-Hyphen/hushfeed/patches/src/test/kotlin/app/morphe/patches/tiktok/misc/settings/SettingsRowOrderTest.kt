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
import org.junit.Assert.assertTrue
import org.junit.Test

class SettingsRowOrderTest {
    @Test
    fun `an existing Open Debug row is removed before the extension puts it back first`() {
        val calls = rowsMethod().implementation!!.instructions.mapNotNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.toString()
        }

        assertEquals(
            listOf(
                "Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V",
                "Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z",
                "Lapp/morphe/extension/tiktok/settings/TikTokActivityHook;->" +
                    "addSettingsRowFirst(Ljava/util/List;Ljava/lang/Object;)V",
            ),
            calls,
        )
    }

    @Test
    fun `the insert has no branch, since one crashed ART's JIT with the row hidden`() {
        val instructions = rowsMethod().implementation!!.instructions.toList()

        assertTrue(instructions.none { it is OffsetInstruction })
        val swap = instructions.last() as TwoRegisterInstruction
        assertEquals(Opcode.MOVE_OBJECT, instructions.last().opcode)
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
                listRegister = 3,
                openDebugField = ImmutableFieldReference("LX/Rows;", "OPEN_DEBUG", "LX/Rows;"),
            ),
        )
    }
}
