package app.morphe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * [takes] judges a fingerprint's strings the way Morphe patcher 2.0 does, the stricter of the two
 * runtimes users have: each wanted string is a whole string the method loads, and each load
 * answers one wanted string at most. #169 shipped a fingerprint with two pieces of one log
 * literal, the old per-string check passed it on the fixture, and the real apply failed.
 */
class FingerprintStringsRuleTest {
    private val type = "LFixture;"

    private fun method(vararg loads: String): Method = ImmutableMethod(type, "run", emptyList(), "V",
        AccessFlags.PUBLIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(1,
            loads.map { ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(it)) } +
                ImmutableInstruction10x(Opcode.RETURN_VOID),
            emptyList(), emptyList()))

    private fun owner(method: Method) = ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;",
        emptyList(), null, emptySet(), emptyList(), listOf(method))

    private fun takes(strings: List<String>, method: Method): Boolean =
        object : Fingerprint(strings = strings) {}.takes(method, owner(method))

    @Test
    fun `a piece of a literal doesn't match it`() {
        val log = method("CommentLongPressFragment@922.loadLongPressItems$2")
        assertFalse(takes(listOf(".loadLongPressItems"), log))
        assertFalse(takes(listOf("CommentLongPressFragment@", ".loadLongPressItems"), log))
        assertTrue(takes(listOf("CommentLongPressFragment@922.loadLongPressItems$2"), log))
    }

    @Test
    fun `two contains string filters can't share one literal`() {
        val log = method("CommentLongPressFragment@922.loadLongPressItems$2")
        assertFalse(
            object : Fingerprint(
                strings = listOf(
                    string("CommentLongPressFragment@", StringComparisonType.CONTAINS),
                    string(".loadLongPressItems", StringComparisonType.CONTAINS),
                ),
            ) {}.takes(log, owner(log)),
        )
        assertTrue(
            object : Fingerprint(
                strings = listOf(string(".loadLongPressItems", StringComparisonType.CONTAINS)),
            ) {}.takes(log, owner(log)),
        )
    }

    @Test
    fun `a contains filter takes a piece of a literal`() {
        val log = method("CommentLongPressFragment@922.loadLongPressItems$2")
        val piece = object : Fingerprint(filters = listOf(string(".loadLongPressItems", StringComparisonType.CONTAINS))) {}
        assertTrue(piece.takes(log, owner(log)))
        assertFalse(piece.takes(method("loadLongPressItems"), owner(method("loadLongPressItems"))))
    }

    @Test
    fun `one load answers one wanted string`() {
        assertFalse(takes(listOf("report", "report"), method("report")))
        assertTrue(takes(listOf("report", "report"), method("report", "report")))
    }

    @Test
    fun `two loads answer two wanted strings in any order`() {
        val both = method("loadLongPressItems", "CommentLongPressFragment@922")
        assertTrue(takes(listOf("CommentLongPressFragment@922", "loadLongPressItems"), both))
        assertFalse(takes(listOf("CommentLongPressFragment@", "loadLongPressItems"), both))
        assertFalse(takes(listOf("CommentLongPressFragment@922", "loadLongPressItems", "report"), both))
    }
}
