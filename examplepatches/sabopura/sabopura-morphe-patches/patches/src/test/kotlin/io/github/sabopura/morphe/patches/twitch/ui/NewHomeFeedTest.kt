package io.github.sabopura.morphe.patches.twitch.ui

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

class NewHomeFeedTest {
    private val blobModule = "Lcom/facebook/react/modules/blob/BlobModule;"
    private val map = "Lcom/facebook/react/bridge/WritableMap;"

    private fun field(name: String, type: String): Field =
        ImmutableField(blobModule, name, type, AccessFlags.PRIVATE.value or AccessFlags.FINAL.value, null, emptySet(), emptySet())

    private fun type(name: String, fields: List<Field> = emptyList(), methods: List<Method> = emptyList()): ClassDef =
        ImmutableClassDef(name, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", emptyList(), null, emptySet(), fields, methods)

    private fun method(owner: String, name: String, returnType: String, parameters: List<String>, body: Boolean = true): Method =
        ImmutableMethod(owner, name, parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, returnType,
            AccessFlags.PUBLIC.value, emptySet(), emptySet(),
            if (body) ImmutableMethodImplementation(3, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), emptyList(), emptyList()) else null)

    private fun failsWithContract(block: () -> Unit) {
        try {
            block()
            fail("expected a contract failure")
        } catch (expected: PatchException) {
            assertTrue(expected.message!!, "New home feed" in expected.message!!)
        }
    }

    /** BlobModule as Twitch 31.9.0 has it: four handlers, their types renamed, their field names kept. */
    private val handlers = listOf(
        field("networkingRequestBodyHandler", "Lo43;"), field("networkingResponseHandler", "Lp43;"),
        field("networkingUriHandler", "Lolr;"), field("webSocketContentHandler", "Lr43;"))

    @Test fun theResponseHandlerIsFoundByItsFieldName() {
        assertEquals("Lp43;", blobResponseHandlerType(type(blobModule, handlers)))
        assertEquals("Lg43;", blobResponseHandlerType(type(blobModule, listOf(field("networkingResponseHandler", "Lg43;")))))
    }

    @Test fun aBlobModuleWithoutTheFieldFailsTheHook() {
        failsWithContract { blobResponseHandlerType(type(blobModule, handlers.filter { it.name != "networkingResponseHandler" })) }
    }

    @Test fun theMethodThatTakesTheBodyIsFound() {
        val handler = type("Lp43;", methods = listOf(
            method("Lp43;", "<init>", "V", listOf(blobModule)),
            method("Lp43;", "b", "Z", listOf("Ljava/lang/String;")),
            method("Lp43;", "a", map, listOf("[B"))))
        assertEquals("a", blobResponseMethod(handler).name)
    }

    @Test fun aHandlerWithTwoSuchMethodsOrNoneFailsTheHook() {
        val two = type("Lp43;", methods = listOf(method("Lp43;", "a", map, listOf("[B")), method("Lp43;", "c", map, listOf("[B"))))
        failsWithContract { blobResponseMethod(two) }
        val otherShapes = type("Lp43;", methods = listOf(
            method("Lp43;", "a", map, listOf("[B", "Ljava/lang/String;")),
            method("Lp43;", "c", "Ljava/lang/String;", listOf("[B")),
            method("Lp43;", "d", map, listOf("[B"), body = false)))
        failsWithContract { blobResponseMethod(otherShapes) }
    }
}
