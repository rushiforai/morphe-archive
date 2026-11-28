package app.template.patches.strava

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.Annotation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

class StravaTargetsTest {
    @Test
    fun `require exactly one accepts one match`() {
        val match = Any()

        assertSame(match, requireExactlyOne("target", listOf(match)))
    }

    @Test
    fun `require exactly one rejects zero matches`() {
        assertPatchFailure("target") {
            requireExactlyOne("target", emptyList())
        }
    }

    @Test
    fun `require exactly one rejects multiple matches`() {
        assertPatchFailure("target") {
            requireExactlyOne("target", listOf(Any(), Any()))
        }
    }

    @Test
    fun `method matching requires exact descriptor`() {
        val method = method(
            name = "target",
            returnType = "V",
            parameterTypes = listOf("Ljava/lang/Object;"),
        )
        val classDef = classDef(type = "Lexample/Target;", methods = listOf(method))

        val matches = findStravaMethodMatches(
            classDefs = listOf(classDef),
            specs = listOf(
                StravaMethodSpec(
                    classType = "Lexample/Target;",
                    name = "target",
                    returnType = "V",
                    parameterTypes = listOf("Ljava/lang/Object;"),
                ),
            ),
        )

        assertEquals(1, matches.size)
        assertSame(method, matches.single().second)
    }

    @Test
    fun `method matching rejects a different descriptor`() {
        val method = method(
            name = "target",
            returnType = "V",
            parameterTypes = listOf("Ljava/lang/Object;"),
        )
        val classDef = classDef(type = "Lexample/Target;", methods = listOf(method))

        val matches = findStravaMethodMatches(
            classDefs = listOf(classDef),
            specs = listOf(
                StravaMethodSpec(
                    classType = "Lexample/Target;",
                    name = "target",
                    returnType = "Z",
                    parameterTypes = listOf("Ljava/lang/Object;"),
                ),
            ),
        )

        assertTrue(matches.isEmpty())
    }

    @Test
    fun `static self field matching requires the literal and static self field`() {
        val type = "Lexample/Marker;"
        val classDef = classDef(
            type = type,
            methods = listOf(methodWithLiteral(type, "COROUTINE_SUSPENDED")),
            fields = listOf(staticSelfField(type)),
        )

        val matches = findStravaStaticSelfFieldMatches(
            classDefs = listOf(classDef),
            classTypes = setOf(type),
            literal = "COROUTINE_SUSPENDED",
        )

        assertEquals(1, matches.size)
        assertEquals("a", matches.single().second.name)
        assertEquals(type, matches.single().second.type)
    }

    @Test
    fun `static self field matching rejects a class without the required field`() {
        val type = "Lexample/Marker;"
        val classDef = classDef(
            type = type,
            methods = listOf(methodWithLiteral(type, "COROUTINE_SUSPENDED")),
            fields = listOf(instanceSelfField(type)),
        )

        val matches = findStravaStaticSelfFieldMatches(
            classDefs = listOf(classDef),
            classTypes = setOf(type),
            literal = "COROUTINE_SUSPENDED",
        )

        assertTrue(matches.isEmpty())
    }

    @Test
    fun `static self field matching rejects a class without the literal`() {
        val type = "Lexample/Marker;"
        val classDef = classDef(
            type = type,
            methods = listOf(methodWithLiteral(type, "OTHER")),
            fields = listOf(staticSelfField(type)),
        )

        val matches = findStravaStaticSelfFieldMatches(
            classDefs = listOf(classDef),
            classTypes = setOf(type),
            literal = "COROUTINE_SUSPENDED",
        )

        assertTrue(matches.isEmpty())
    }

    private fun assertPatchFailure(label: String, block: () -> Unit) {
        try {
            block()
            fail("Expected PatchException for $label")
        } catch (exception: PatchException) {
            assertTrue(exception.message.orEmpty().contains("expected exactly one"))
        }
    }

    private fun classDef(
        type: String,
        methods: List<Method> = emptyList(),
        fields: List<Field> = emptyList(),
    ): ClassDef = ImmutableClassDef(
        type,
        AccessFlags.PUBLIC.value,
        "Ljava/lang/Object;",
        emptyList<String>(),
        null,
        emptyList<Annotation>(),
        fields,
        methods,
    )

    private fun method(
        name: String,
        returnType: String,
        parameterTypes: List<String>,
        registerCount: Int = 1,
        instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction> = emptyList(),
    ): Method = ImmutableMethod(
        "Lexample/Target;",
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

    private fun methodWithLiteral(
        type: String,
        literal: String,
    ): Method = ImmutableMethod(
        type,
        "<clinit>",
        emptyList(),
        "V",
        AccessFlags.STATIC.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(
            1,
            listOf(
                BuilderInstruction21c(
                    Opcode.CONST_STRING,
                    0,
                    ImmutableStringReference(literal),
                ),
            ),
            emptyList(),
            emptyList(),
        ),
    )

    private fun staticSelfField(type: String): Field = ImmutableField(
        type,
        "a",
        type,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value,
        null,
        emptySet(),
        emptySet(),
    )

    private fun instanceSelfField(type: String): Field = ImmutableField(
        type,
        "a",
        type,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        null,
        emptySet(),
        emptySet(),
    )
}
