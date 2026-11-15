package app.hushmessenger.patches.controls

import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.Reference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.nio.ByteBuffer
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class CodeMatchTest {
    private val target = "Lfixture/Target;"

    /** A string that reads like the type, a field and a method that share a name, and a same-named field on another class. */
    private fun caller(extra: String = "") = fixtureClass("Lfixture/Caller;", listOf(fixtureMethod("Lfixture/Caller;->run()V", """
        $extra
        const-string v0, "text="
        const-string v0, "$target"
        new-instance v0, $target
        invoke-direct {v0}, $target-><init>()V
        iget-object v1, v0, $target->name:Ljava/lang/String;
        invoke-virtual {v0, v1}, $target->name(Ljava/lang/String;)V
        sget-object v1, Lfixture/Other;->name:Ljava/lang/String;
        return-void
    """.trimIndent(), registers = 3)))

    /** The same classes written out to a dex file and read back, as the patcher reads Messenger's. */
    private fun dex(vararg classes: ClassDef): List<ClassDef> {
        val pool = DexPool(Opcodes.getDefault())
        classes.forEach { pool.internClass(it) }
        val store = MemoryDataStore()
        pool.writeTo(store)
        return DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(store.data)).classes.toList()
    }

    private fun refs(classes: List<ClassDef>): List<Reference> = classes.flatMap { it.methods }.flatMap { m ->
        m.implementation?.instructions?.toList().orEmpty().mapNotNull { (it as? ReferenceInstruction)?.reference }
    }

    private val strings = listOf("text=", target, "name", "text", "missing")
    private val types = listOf(target, "Lfixture/Other;", "Lfixture/Missing;", "text=")
    private val members = listOf(
        "$target-><init>()V", "$target->name:Ljava/lang/String;", "$target->name(Ljava/lang/String;)V",
        "Lfixture/Other;->name:Ljava/lang/String;", "$target->name:I", "$target->name()V", "Lfixture/Missing;->name:Ljava/lang/String;",
        "$target->other:Ljava/lang/String;",
    )

    /** Each matcher answers exactly what the string comparison it replaces answers, for every reference. */
    private fun assertSameAnswers(refs: List<Reference>, what: String) {
        for (value in strings) {
            val match = StringMatch(value)
            refs.forEach { assertEquals((it as? StringReference)?.string == value, match.matches(it), "$what string $value at $it") }
        }
        for (value in types) {
            val match = TypeMatch(value)
            refs.forEach { assertEquals((it as? TypeReference)?.type == value, match.matches(it), "$what type $value at $it") }
        }
        for (id in members) {
            val match = MemberMatch(id)
            refs.forEach { assertEquals((it is MethodReference || it is FieldReference) && it.toString() == id, match.matches(it), "$what member $id at $it") }
        }
        val table = MemberTable(members.withIndex().associate { (index, id) -> id to index })
        refs.forEach { ref ->
            val expected = if (ref is MethodReference || ref is FieldReference) members.indexOf(ref.toString()).takeIf { it >= 0 } else null
            assertEquals(expected, table[ref], "$what table at $ref")
        }
        // One id per table, so the other members come back null both ways: a name the table doesn't hold, and a name it
        // holds on another member (Target's `name` field and method against Other's).
        for (id in members) {
            val single = MemberTable(mapOf(id to 0))
            refs.forEach { ref ->
                val expected = if ((ref is MethodReference || ref is FieldReference) && ref.toString() == id) 0 else null
                assertEquals(expected, single[ref], "$what table of $id at $ref")
            }
        }
    }

    @Test fun matchersAnswerLikeTheComparisonsTheyReplace() {
        val plain = refs(listOf(caller()))
        val read = refs(dex(caller()))
        assertSameAnswers(plain, "rebuilt")
        assertSameAnswers(read, "dex")
        // Not vacuous: the dex holds a hit for each kind, and nothing for what it doesn't reference.
        assertEquals(1, read.count { StringMatch("text=").matches(it) })
        assertEquals(1, read.count { TypeMatch(target).matches(it) })
        assertEquals(1, read.count { MemberMatch("$target->name:Ljava/lang/String;").matches(it) })
        assertEquals(1, read.count { MemberMatch("$target->name(Ljava/lang/String;)V").matches(it) })
        assertEquals(0, read.count { MemberMatch("Lfixture/Missing;->name:Ljava/lang/String;").matches(it) })
        // The table finds both members named `name` on Target and the constructor, and nothing for a string that reads like an id.
        val table = MemberTable(members.associateWith { it })
        assertEquals(setOf("$target-><init>()V", "$target->name:Ljava/lang/String;", "$target->name(Ljava/lang/String;)V",
            "Lfixture/Other;->name:Ljava/lang/String;"), read.mapNotNull { table[it] }.toSet())
        assertEquals(null, MemberTable(mapOf("$target" to 1))[read.first { it is StringReference && it.string == target }])
    }

    @Test fun oneMatcherFollowsEachDexFilesOwnIndexes() {
        // Strings that sort first move every index in the second file, so a matcher that kept the first file's index would miss.
        val first = refs(dex(caller()))
        val second = refs(dex(caller("const-string v2, \"AAA\"\nconst-string v2, \"Lfixture/AAA;\"\nnew-instance v2, Lfixture/AAA;")))
        val text = StringMatch("text=")
        val type = TypeMatch(target)
        val field = MemberMatch("$target->name:Ljava/lang/String;")
        for ((what, refs) in listOf("first" to first, "second" to second, "first again" to first)) {
            assertEquals(1, refs.count { text.matches(it) }, what)
            assertEquals(1, refs.count { type.matches(it) }, what)
            assertEquals(1, refs.count { field.matches(it) }, what)
        }
        assertTrue(second.any { (it as? StringReference)?.string == "AAA" })
    }
}
