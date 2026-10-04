package app.morphe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertSame
import org.junit.Test

class PatchContextsCompatibilityTest {
    @Test
    fun `one fingerprint resolves fresh owners through three successive contexts`() {
        val fingerprint = Fingerprint(name = "probe")
        repeat(3) {
            val method = ImmutableMethod(
                "Lfixture/ContextProbe;", "probe", emptyList(), "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                ImmutableMethodImplementation(0, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null),
            )
            val owner = ImmutableClassDef(
                method.definingClass, AccessFlags.PUBLIC.value, "Ljava/lang/Object;",
                emptyList(), null, emptyList(), emptyList(), listOf(method),
            )
            with(PatchContexts.of(listOf(owner))) {
                assertSame(owner, fingerprint.originalClassDef)
                assertSame(method, fingerprint.originalMethod)
            }
        }
    }

    @Test
    fun `external label copy identifies the exact instruction instead of its opcode`() {
        val original = BuilderInstruction10x(Opcode.RETURN_VOID)
        val identicalOpcode = BuilderInstruction10x(Opcode.RETURN_VOID)
        val label = ExternalLabel("hush_target", original)
        assertEquals(label, label.copy(instruction = original))
        assertNotEquals(label, label.copy(instruction = identicalOpcode))
    }
}
