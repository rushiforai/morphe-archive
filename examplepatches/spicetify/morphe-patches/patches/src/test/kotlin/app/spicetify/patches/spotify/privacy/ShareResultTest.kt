package app.spicetify.patches.spotify.privacy

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertThrows
import org.junit.jupiter.api.Test

class ShareResultTest {
    private val string = "Ljava/lang/String;"
    private val model = "Lfixture/Result;"
    private val fields = listOf("shareableUrl_", "shareId_", "spotifyUri_", "fullUrl_")

    @Test
    fun `resolves renamed getters and model through their actual field dataflow`() {
        assertEquals(model, findShareResultConstructor(fixture()).definingClass)
    }

    @Test
    fun `refuses a missing server response instead of accepting only the local hook`() {
        assertThrows(PatchException::class.java) { findShareResultConstructor(fixture().drop(1)) }
    }

    @Test
    fun `refuses swapped URL and share ID arguments`() {
        assertThrows(PatchException::class.java) {
            findShareResultConstructor(fixture(arguments = listOf(1, 0, 2, 3)))
        }
    }

    @Test
    fun `refuses a getter whose named field no longer matches`() {
        assertThrows(PatchException::class.java) {
            findShareResultConstructor(fixture(getterFields = fields.dropLast(1) + "unknown_"))
        }
    }

    @Test
    fun `refuses multiple matching construction sites`() {
        val classes = fixture()
        val duplicate = clazz("Lfixture/OtherGenerator;", classes.last().methods.toList())
        assertThrows(PatchException::class.java) { findShareResultConstructor(classes + duplicate) }
    }

    @Test
    fun `refuses a constructor that overwrites the share ID`() {
        assertThrows(PatchException::class.java) {
            findShareResultConstructor(fixture(storedArguments = listOf(1, 1, 3, 4)))
        }
    }

    @Test
    fun `refuses a constructor that aliases two fields`() {
        assertThrows(PatchException::class.java) {
            findShareResultConstructor(fixture(storedFields = listOf("a", "b", "c", "a")))
        }
    }

    private fun fixture(
        arguments: List<Int> = listOf(0, 1, 2, 3),
        getterFields: List<String> = fields,
        storedArguments: List<Int> = listOf(1, 2, 3, 4),
        storedFields: List<String> = listOf("a", "b", "c", "d"),
    ): List<ClassDef> {
        val getters = getterFields.mapIndexed { index, field ->
            method(GENERATE_URL_RESPONSE, "get$index", emptyList(), string, 1, 2, listOf(
                ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 1,
                    ImmutableFieldReference(GENERATE_URL_RESPONSE, field, string)),
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
            ))
        }
        val constructorCode = mutableListOf<Instruction>(
            ImmutableInstruction35c(Opcode.INVOKE_DIRECT, 1, 0, 0, 0, 0, 0,
                ImmutableMethodReference("Ljava/lang/Object;", "<init>", emptyList(), "V")),
        )
        storedArguments.forEachIndexed { index, argument ->
            constructorCode += ImmutableInstruction22c(Opcode.IPUT_OBJECT, argument, 0,
                ImmutableFieldReference(model, storedFields[index], string))
        }
        constructorCode += ImmutableInstruction10x(Opcode.RETURN_VOID)
        val constructor = method(model, "<init>", List(4) { string }, "V", 65537, 5, constructorCode)
        val pipeline = mutableListOf<Instruction>()
        getters.forEachIndexed { index, getter ->
            pipeline += ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 4, 0, 0, 0, 0, getter)
            pipeline += ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, index)
        }
        pipeline += ImmutableInstruction35c(Opcode.INVOKE_DIRECT, 5, 5,
            arguments[0], arguments[1], arguments[2], arguments[3], constructor)
        pipeline += ImmutableInstruction11x(Opcode.RETURN_OBJECT, 5)
        return listOf(
            clazz(GENERATE_URL_RESPONSE, getters),
            clazz(model, listOf(constructor)),
            clazz("Lfixture/Generator;", listOf(method("Lfixture/Generator;", "generate",
                emptyList(), model, 9, 6, pipeline))),
        )
    }

    private fun method(owner: String, name: String, parameters: List<String>, result: String,
                       flags: Int, registers: Int, code: List<Instruction>): Method = ImmutableMethod(
        owner, name, parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
        flags, emptySet(), emptySet(), ImmutableMethodImplementation(registers, code, emptyList(), emptyList()),
    )

    private fun clazz(name: String, methods: List<Method>): ClassDef = ImmutableClassDef(
        name, 17, "Ljava/lang/Object;", emptyList(), null, emptySet(), emptyList(), methods,
    )
}
