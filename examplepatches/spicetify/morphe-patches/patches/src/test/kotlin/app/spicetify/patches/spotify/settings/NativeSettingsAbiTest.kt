package app.spicetify.patches.spotify.settings

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertNotEquals
import org.junit.jupiter.api.Test

class NativeSettingsAbiTest {
    private fun method(name: String, value: Int) = ImmutableMethod(
        "Lfixture/Settings;", name, emptyList(), "I", 9, emptySet(), emptySet(),
        ImmutableMethodImplementation(1, listOf(
            ImmutableInstruction11n(Opcode.CONST_4, 0, value),
            ImmutableInstruction11x(Opcode.RETURN, 0),
        ), emptyList(), emptyList()),
    )

    private fun definition(methods: List<ImmutableMethod>, flags: Int = 17) = ImmutableClassDef(
        "Lfixture/Settings;", flags, "Ljava/lang/Object;", emptyList(), null,
        emptySet(), emptyList(), methods,
    )

    @Test
    fun `snapshot ignores input method iteration order`() {
        val methods = listOf(method("first", 1), method("second", 2))
        assertEquals(NativeSettingsAbi.digest(definition(methods)),
            NativeSettingsAbi.digest(definition(methods.reversed())))
    }

    @Test
    fun `snapshot detects changed instructions access and method set`() {
        val original = NativeSettingsAbi.digest(definition(listOf(method("first", 1))))
        assertNotEquals(original, NativeSettingsAbi.digest(definition(listOf(method("first", 2)))))
        assertNotEquals(original, NativeSettingsAbi.digest(definition(listOf(method("first", 1)), 1)))
        assertNotEquals(original, NativeSettingsAbi.digest(definition(listOf(method("first", 1), method("added", 0)))))
    }
}
