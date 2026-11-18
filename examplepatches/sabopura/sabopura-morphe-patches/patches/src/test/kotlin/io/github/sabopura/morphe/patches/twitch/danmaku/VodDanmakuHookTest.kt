package io.github.sabopura.morphe.patches.twitch.danmaku

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import java.lang.reflect.Proxy
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class VodDanmakuHookTest {
    private val comment = "Lo67;"
    private val activity = "Landroidx/fragment/app/r;"
    private val text = "Landroid/text/SpannedString;"

    private fun method(name: String, vararg params: String) =
        Proxy.newProxyInstance(Method::class.java.classLoader, arrayOf(Method::class.java)) { _, called, _ ->
            when (called.name) {
                "getName" -> name
                "getParameterTypes" -> params.toList()
                else -> error("Unexpected ${called.name}")
            }
        } as Method

    @Test fun findsTheRowWhateverItsListenerIsCalled() {
        assertTrue(isVodRowConstructor(method("<init>", activity, comment, text, "Lcp4;"), comment))  // 31.9.0
        assertTrue(isVodRowConstructor(method("<init>", "Landroidx/fragment/app/o;", "Lno6;", text, "Ll25;"), "Lno6;"))  // 30.7.2
    }

    @Test fun ignoresOtherUsesOfTheComment() {
        // The report dialog, the overflow menu and share sheets take the comment without its rendered text.
        assertFalse(isVodRowConstructor(method("<init>", comment), comment))
        assertFalse(isVodRowConstructor(method("<init>", "Lf77;", "Lb77;", comment, "Lrir;"), comment))
        assertFalse(isVodRowConstructor(method("<init>", activity, "Lother;", text, "Lcp4;"), comment))
        assertFalse(isVodRowConstructor(method("bind", activity, comment, text, "Lcp4;"), comment))
    }

    @Test fun countsWideParametersWhenFindingTheCommentRegister() {
        assertEquals(2, parameterRegister(method("<init>", activity, comment, text), 1))
        assertEquals(4, parameterRegister(method("<init>", "J", "I", comment), 2))
        assertEquals(1, parameterRegister(method("<init>", comment), 0))
    }

    @Test fun bridgesIntAndObjectFieldsAndRefusesOthers() {
        val offset = vodBridge(ImmutableFieldReference(comment, "e", "I"))
        assertTrue(offset, offset.contains("iget p0, p0, Lo67;->e:I") && offset.contains("return p0"))
        val id = vodBridge(ImmutableFieldReference(comment, "a", "Ljava/lang/String;"))
        assertTrue(id, id.contains("iget-object p0, p0, Lo67;->a:Ljava/lang/String;") && id.contains("return-object p0"))
        val failure = runCatching { vodBridge(ImmutableFieldReference(comment, "z", "Z")) }.exceptionOrNull()
        assertTrue(failure is PatchException)
    }
}
