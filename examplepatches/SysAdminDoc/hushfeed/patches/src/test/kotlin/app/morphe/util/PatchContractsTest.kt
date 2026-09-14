package app.morphe.util

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class PatchContractsTest {
    @Test
    fun `a unique selector match is returned`() {
        assertEquals("only", listOf("only").singleOrPatchException("Test patch: selector"))
    }

    @Test
    fun `empty and ambiguous selectors name their contract and count`() {
        val empty = assertThrows(PatchException::class.java) {
            emptyList<String>().singleOrPatchException("Test patch: settings row")
        }
        assertTrue(empty.message.orEmpty().contains("Test patch: settings row"))
        assertTrue(empty.message.orEmpty().contains("found 0"))

        val ambiguous = assertThrows(PatchException::class.java) {
            listOf("first", "second").singleOrPatchException("Test patch: settings row")
        }
        assertTrue(ambiguous.message.orEmpty().contains("Test patch: settings row"))
        assertTrue(ambiguous.message.orEmpty().contains("found 2"))
    }

    @Test
    fun `a missing body names the patch and full method descriptor`() {
        val method = ImmutableMethod(
            "Lcom/example/Host;",
            "read",
            listOf("I", "Ljava/lang/String;").map { ImmutableMethodParameter(it, null, null) },
            "Z",
            AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value,
            null,
            null,
            null,
        )

        val error = assertThrows(PatchException::class.java) {
            method.implementationOrPatchException("Test patch")
        }
        assertTrue(error.message.orEmpty().contains("Test patch"))
        assertTrue(error.message.orEmpty().contains("Lcom/example/Host;->read(ILjava/lang/String;)Z"))
    }
}
