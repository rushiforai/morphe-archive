package io.github.sabopura.morphe.patches.youtube.danmaku

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import java.lang.reflect.Proxy
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class VideoIdMapWriterTest {
    private inline fun <reified T> fixture(vararg properties: Pair<String, Any?>): T {
        val values = properties.toMap()
        return Proxy.newProxyInstance(T::class.java.classLoader, arrayOf(T::class.java)) { _, method, _ ->
            check(values.containsKey(method.name)) { "Unexpected fixture access: ${method.name}" }
            values[method.name]
        } as T
    }

    private fun writer(keyRegister: Int = 5, owner: String = "Lplayer;", operation: String = "put") =
        fixture<Method>(
            "getAccessFlags" to 17, "getReturnType" to "V", "getDefiningClass" to "Lplayer;",
            "getParameterTypes" to listOf("Ljava/lang/String;", "Lmetadata;"),
            "getImplementation" to fixture<MethodImplementation>(
                "getRegisterCount" to 7,
                "getInstructions" to listOf(
                    ImmutableInstruction22c(Opcode.IGET_OBJECT, 4, 4,
                        ImmutableFieldReference(owner, "map", "Ljava/util/Map;")),
                    ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 3, 4, keyRegister, 6, 0, 0,
                        ImmutableMethodReference("Ljava/util/Map;", operation,
                            listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;")),
                    ImmutableInstruction10x(Opcode.RETURN_VOID),
                ),
            ),
        )

    @Test fun acceptsTheIdArgumentAsMapKey() { assertTrue(isVideoIdMapWriter(writer())) }
    @Test fun rejectsAnotherStringAsMapKey() { assertFalse(isVideoIdMapWriter(writer(keyRegister = 0))) }
    @Test fun rejectsAnotherOwnersMap() { assertFalse(isVideoIdMapWriter(writer(owner = "Lother;"))) }
    @Test fun rejectsOtherMapOperations() { assertFalse(isVideoIdMapWriter(writer(operation = "replace"))) }

    private fun call(opcode: Opcode, owner: String, name: String, returnType: String,
                     parameters: List<String>, vararg registers: Int) =
        ImmutableInstruction35c(opcode, registers.size, registers.getOrElse(0) { 0 }, registers.getOrElse(1) { 0 },
            registers.getOrElse(2) { 0 }, 0, 0, ImmutableMethodReference(owner, name, parameters, returnType))

    private val getIdIndex = 3

    /** The visible-player event as YouTube 21.45 ships it: v0 = id, v2 = player, v3 = event. */
    private fun idEvent(
        otherHooks: Int = 0,
        mapPut: Boolean = false,
        idSource: Instruction = call(Opcode.INVOKE_INTERFACE, "Lvideo;", "id", "Ljava/lang/String;", listOf(), 0),
        beforeWrite: List<Instruction> = emptyList(),
    ): List<Instruction> = listOf(
        call(Opcode.INVOKE_INTERFACE, "Levent;", "video", "Lvideo;", listOf(), 3),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
        idSource,
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
    ) + List(otherHooks) {
        call(Opcode.INVOKE_STATIC, "Lhook$it;", "videoIdChanged", "V", listOf("Ljava/lang/String;"), 0)
    } + listOf(
        call(Opcode.INVOKE_INTERFACE, "Levent;", "metadata", "Lmetadata;", listOf(), 3),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 3),
    ) + beforeWrite + listOf(
        if (mapPut) call(Opcode.INVOKE_INTERFACE, "Ljava/util/Map;", "put", "Ljava/lang/Object;",
            listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), 2, 0, 3)
        else call(Opcode.INVOKE_VIRTUAL, "Lplayer;", "write", "V", listOf("Ljava/lang/String;", "Lmetadata;"), 2, 0, 3),
        ImmutableInstruction10x(Opcode.RETURN_VOID),
    )

    private fun resultIndex(instructions: List<Instruction>) =
        videoIdResultIndex(instructions, instructions.lastIndex - 1)

    @Test fun findsTheIdGetterResult() { assertEquals(getIdIndex, resultIndex(idEvent())) }
    @Test fun findsTheIdGetterResultForTheMapPutShape() { assertEquals(getIdIndex, resultIndex(idEvent(mapPut = true))) }
    @Test fun findsTheIdGetterResultBehindOtherPatchesHooks() {
        assertEquals(getIdIndex, resultIndex(idEvent(otherHooks = 12)))
    }
    @Test fun rejectsAnIdReplacedBeforeTheWrite() {
        assertNull(resultIndex(idEvent(beforeWrite = listOf(
            ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference("other"))))))
    }
    @Test fun rejectsAnIdThatDoesNotComeFromAStringGetter() {
        assertNull(resultIndex(idEvent(idSource = call(Opcode.INVOKE_INTERFACE, "Lvideo;", "title",
            "Ljava/lang/CharSequence;", listOf(), 0))))
    }
}
