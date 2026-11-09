package app.morphe.util

import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * A stub body ART would refuse fails the whole extension class the first time anything calls into
 * it. The side menu's name stub did that on the S22: the user and the name shared one register, so
 * the return read Object where a String was declared. Each refusal has a twin that must pass, so a
 * check that refuses everything fails here too.
 */
class StubVerifierTest {
    @Test
    fun `a register that holds the user on one path and the name on the other can't be returned as a String`() {
        val shared = """
            invoke-static {p0}, $USERS->self(Ljava/lang/Object;)$USER
            move-result-object v0
            if-eqz v0, :none
            invoke-static {v0}, $NAMES->of($USER)Ljava/lang/String;
            move-result-object v0
            :none
            return-object v0
        """
        assertEquals(listOf("instruction 5 hands v0, a reference whose class differs between paths, where Ljava/lang/String; is read"),
            refusals(method(STRING, 2, shared)))
        val separate = """
            invoke-static {p0}, $USERS->self(Ljava/lang/Object;)$USER
            move-result-object v1
            if-eqz v1, :none
            invoke-static {v1}, $NAMES->of($USER)Ljava/lang/String;
            move-result-object v0
            return-object v0
            :none
            const/4 v0, 0x0
            return-object v0
        """
        assertEquals(emptyList<String>(), refusals(method(STRING, 3, separate)))
    }

    @Test
    fun `a null on one path keeps the class of the other`() {
        val code = """
            const/4 v0, 0x0
            if-eqz p0, :none
            invoke-static {p0}, $NAMES->any(Ljava/lang/Object;)Ljava/lang/String;
            move-result-object v0
            :none
            return-object v0
        """
        assertEquals(emptyList<String>(), refusals(method(STRING, 2, code)))
    }

    @Test
    fun `a class that is not the one read is refused, and a subclass of it passes`() {
        val user = "invoke-static {p0}, $USERS->self(Ljava/lang/Object;)$USER\nmove-result-object v0\nreturn-object v0"
        assertEquals(listOf("instruction 2 hands v0, a $USER, where Ljava/lang/String; is read"), refusals(method(STRING, 2, user)))
        assertEquals(emptyList<String>(), refusals(method(TL_OBJECT, 2, user)))
        assertEquals(listOf("instruction 2 hands v0, a $USER, where $CHAT is read"), refusals(method(CHAT, 2, user)))
    }

    @Test
    fun `a call's arguments and receiver are held to the classes it names`() {
        val wrongArgument = "const-string v0, \"x\"\ninvoke-static {v0}, $NAMES->of($USER)Ljava/lang/String;\nreturn-void"
        assertEquals(listOf("instruction 1 hands v0, a Ljava/lang/String;, where $USER is read"), refusals(method("V", 2, wrongArgument)))
        val wrongReceiver = "check-cast p0, $CHAT\ninvoke-virtual {p0}, $USER->getName()Ljava/lang/String;\nreturn-void"
        assertEquals(listOf("instruction 1 hands v1, a $CHAT, where $USER is read"), refusals(method("V", 2, wrongReceiver)))
        val right = "check-cast p0, $USER\ninvoke-virtual {p0}, $USER->getName()Ljava/lang/String;\nreturn-void"
        assertEquals(emptyList<String>(), refusals(method("V", 2, right)))
    }

    @Test
    fun `an interface, Object and a class not known here are taken on trust`() {
        val merged = """
            if-eqz p0, :chat
            invoke-static {p0}, $USERS->self(Ljava/lang/Object;)$USER
            move-result-object v0
            goto :done
            :chat
            new-instance v0, $CHAT
            invoke-direct {v0}, $CHAT-><init>()V
            :done
            return-object v0
        """
        assertEquals(emptyList<String>(), refusals(method(PEER, 2, merged)))
        assertEquals(emptyList<String>(), refusals(method("Ljava/lang/Object;", 2, merged)))
        val unknown = "invoke-static {p0}, $USERS->self(Ljava/lang/Object;)Landroid/view/View;\nmove-result-object v0\nreturn-object v0"
        assertEquals(emptyList<String>(), refusals(method("Landroid/widget/TextView;", 2, unknown)))
    }

    @Test
    fun `a read of a register nothing wrote is refused`() {
        assertEquals(listOf("instruction 0 reads v0 as ref holding nothing usable"), refusals(method(STRING, 2, "return-object v0")))
    }

    private fun refusals(method: MutableMethod) = refusedByVerifier(method, SUPERS::get) {
        when (it) {
            in INTERFACES -> true
            in SUPERS -> false
            else -> null
        }
    }

    private fun method(returnType: String, registers: Int, code: String) = MutableMethod(
        ImmutableMethod(
            "Lcom/example/Stubs;", "run", listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)), returnType,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, code.trimIndent()) }

    private companion object {
        const val STRING = "Ljava/lang/String;"
        const val TL_OBJECT = "Lcom/example/TLObject;"
        const val USER = "Lcom/example/User;"
        const val CHAT = "Lcom/example/Chat;"
        const val PEER = "Lcom/example/Peer;"
        const val USERS = "Lcom/example/Users;"
        const val NAMES = "Lcom/example/Names;"
        val SUPERS = mapOf(USER to TL_OBJECT, CHAT to TL_OBJECT, TL_OBJECT to "Ljava/lang/Object;")
        val INTERFACES = setOf(PEER)
    }
}
