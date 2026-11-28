package app.template.patches.strava

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test

class RaceBannerCloneTest {
    @Test
    fun `clone preserves original delegate register aliases`() {
        val original = method(
            name = "getSuggestedRaces",
            returnType = "Ljava/lang/Object;",
            parameterTypes = listOf("Ljava/util/Map;"),
            registerCount = 2,
            instructions = listOf(
                BuilderInstruction22c(
                    Opcode.IGET_OBJECT,
                    0,
                    0,
                    ImmutableFieldReference(
                        "Lexample/RaceBannerRepositoryImpl;",
                        "remoteDataSource",
                        "Lexample/RaceBannerRemoteDataSource;",
                    ),
                ),
            ),
        )

        val clone = original.cloneRaceBannerWithGate(
            markerClassType = "Lexample/Marker;",
            markerFieldName = "a",
            markerFieldType = "Lexample/Marker;",
        )
        val implementation = checkNotNull(clone.implementation)
        val instructions = implementation.instructions.toList()

        assertEquals(7, implementation.registerCount)
        assertEquals(Opcode.INVOKE_STATIC, instructions.first().opcode)

        val parameterCopies = instructions.filter { it.opcode == Opcode.MOVE_OBJECT_FROM16 }
        assertEquals(2, parameterCopies.size)
        assertEquals(0, (parameterCopies[0] as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerA)
        assertEquals(5, (parameterCopies[0] as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerB)
        assertEquals(1, (parameterCopies[1] as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerA)
        assertEquals(6, (parameterCopies[1] as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerB)

        val originalDelegate = instructions.first {
            it.opcode == Opcode.IGET_OBJECT
        } as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
        assertEquals(0, originalDelegate.registerA)
        assertEquals(0, originalDelegate.registerB)

        val showBranches = instructions.filter { it.opcode == Opcode.IF_EQZ }
        assertEquals(2, showBranches.size)

        val copyPrologue = parameterCopies.first()
        showBranches.forEach { branch ->
            val target = (branch as BuilderInstruction21t).target
            assertSame(copyPrologue, target.location.instruction)
        }

        val markerRead = instructions.first {
            it.opcode == Opcode.SGET_OBJECT
        } as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
        assertEquals(0, markerRead.registerA)

        assertTrue(
            instructions.any { it.opcode == Opcode.RETURN_OBJECT },
        )
    }

    private fun method(
        name: String,
        returnType: String,
        parameterTypes: List<String>,
        registerCount: Int,
        instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    ): Method = ImmutableMethod(
        "Lexample/RaceBannerRepositoryImpl;",
        name,
        parameterTypes.map { ImmutableMethodParameter(it, emptySet(), null) },
        returnType,
        AccessFlags.PUBLIC.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(
            registerCount,
            instructions,
            emptyList(),
            emptyList(),
        ),
    )
}
