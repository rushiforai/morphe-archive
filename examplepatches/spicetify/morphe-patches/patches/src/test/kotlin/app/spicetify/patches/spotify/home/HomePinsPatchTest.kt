package app.spicetify.patches.spotify.home

import app.spicetify.patches.spotify.settings.settingsPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test

private const val ARRAY_LIST = "Ljava/util/ArrayList;"

class HomePinsPatchTest {
    @Test
    fun `accepts the store of the section's rows that the hook goes in before`() {
        assertTrue(isRowsStore(storeRows(2, 0)))
    }

    @Test
    fun `refuses any other instruction where the hook goes`() {
        assertFalse(isRowsStore(null))
        assertFalse(isRowsStore(storeRows(1, 0)))
        assertFalse(isRowsStore(storeRows(2, 1)))
        assertFalse(isRowsStore(field(Opcode.IPUT_OBJECT, 2, 0, "Lp/joz0;", "b", "Ljava/lang/String;")))
        assertFalse(isRowsStore(field(Opcode.IPUT_OBJECT, 2, 0, "Lp/koz0;", "a", ARRAY_LIST)))
        assertFalse(isRowsStore(field(Opcode.IGET_OBJECT, 2, 0, "Lp/joz0;", "a", ARRAY_LIST)))
        assertFalse(isRowsStore(ImmutableInstruction10x(Opcode.RETURN_VOID)))
    }

    @Test
    fun `the tile bridge comes with the settings patch, which merges settings dex`() {
        assertTrue(settingsPatch in homePinsPatch.dependencies)
    }

    /** `iput-object v[value], v[instance], Lp/joz0;->a`, the section model's constructor storing its rows. */
    private fun storeRows(value: Int, instance: Int) =
        field(Opcode.IPUT_OBJECT, value, instance, "Lp/joz0;", "a", ARRAY_LIST)

    private fun field(opcode: Opcode, value: Int, instance: Int, owner: String, name: String, type: String) =
        ImmutableInstruction22c(opcode, value, instance, ImmutableFieldReference(owner, name, type))
}
