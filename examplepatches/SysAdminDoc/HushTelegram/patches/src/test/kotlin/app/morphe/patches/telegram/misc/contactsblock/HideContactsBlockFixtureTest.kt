/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.contactsblock

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.AfterClass
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.lang.ref.SoftReference

/** The chat-list adapter, every reader of its contacts fields, and the runtime are the whole context. */
class HideContactsBlockFixtureTest {
    @Test fun `only the block's presentation tests read through the hooks and every stock path stays`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val methods = context.resolveContactsBlock()
            assertEquals("$name: block decision, empty picture, empty cell and list height", 4, methods.count { m -> m.reads.any { it.rows } })
            assertEquals("$name: loading rows decision, heading and empty cell", 3, methods.sumOf { m -> m.reads.count { !it.rows } })
            val originals = methods.associate { key(it.method) to ImmutableMethod.of(it.method) }
            val untouched = hostState(build, context, methods.map { key(it.method) }.toSet())
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideContactsBlockPatch.execute(context) })

            for (patched in methods) {
                val case = "$name ${patched.method.name}"
                val old = originals.getValue(key(patched.method))
                val before = old.controlBody()
                val after = patched.method.controlBody()
                val reads = patched.reads.map { it.index }.sorted()
                assertEquals("$case: register count", old.implementation!!.registerCount, patched.method.implementation!!.registerCount)
                assertEquals("$case: two instructions per hook", before.size + 2 * reads.size, after.size)
                fun moved(index: Int) = index + 2 * reads.count { it < index }
                for (read in patched.reads) {
                    val at = moved(read.index)
                    val register = before[read.index].namedRegisters().first()
                    assertEquals("$case: hook reads the stock field value", before[read.index].operand(), after[at].operand())
                    assertEquals(Opcode.INVOKE_STATIC_RANGE, after[at + 1].opcode)
                    assertEquals(listOf(register), after[at + 1].namedRegisters())
                    assertEquals(if (read.rows) "$CONTACTS_BLOCK->rows(Ljava/util/ArrayList;)Ljava/util/ArrayList;" else "$CONTACTS_BLOCK->placeholder(Z)Z",
                        after[at + 1].controlRef())
                    assertEquals(if (read.rows) Opcode.MOVE_RESULT_OBJECT else Opcode.MOVE_RESULT, after[at + 2].opcode)
                    assertEquals(listOf(register), after[at + 2].namedRegisters())
                    assertEquals("$case: the stock test follows the hook", Opcode.IF_EQZ, after[at + 3].opcode)
                    assertEquals(listOf(register), after[at + 3].namedRegisters())
                }
                val a = ControlFlow.of(old)
                val b = ControlFlow.of(patched.method)
                for (i in before.indices) {
                    assertEquals("$case: stock operand $i", before[i].operand(), after[moved(i)].operand())
                    val next = if (i in reads) listOf(moved(i) + 1) else a.normal[i].map(::moved)
                    assertEquals("$case: stock normal path $i", next, b.normal[moved(i)])
                    assertEquals("$case: stock exceptional path $i", a.exceptional[i].map(::moved), b.exceptional[moved(i)])
                }
            }
            assertEquals("$name: the copy, its sort, the sync gate and every other host method", untouched,
                hostState(build, context, methods.map { key(it.method) }.toSet()))
            val flag = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideContactsBlock" }.controlBody()
            assertEquals(1L, (flag.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `the gate, copy and sort stay unhooked so the stored rows return unchanged`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val methods = context.resolveContactsBlock()
            val builder = methods.single { m -> m.method.controlBody().any { it.controlRef() == TELEGRAM_CONTACTS } }
            val body = builder.method.controlBody()
            val store = body.indices.single { it > 0 && body[it].opcode == Opcode.IPUT_OBJECT && body[it - 1].controlRef() == "Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V" }
            val rows = body[store].controlField()!!.toString()
            val count = body.indexOfFirst { it.controlRef() == FOLDERS_DIALOG_COUNT }
            assertTrue("${build.name}: the sync gate isn't hooked", builder.reads.none { it.index == count - 2 })
            assertEquals("${build.name}: one block decision in the builder", 1, builder.reads.count { it.rows })
            assertTrue("${build.name}: the hooked builder read is the copy's null test after it was built",
                builder.reads.single { it.rows }.index > store && body[builder.reads.single { it.rows }.index].controlRef() == rows)
        }
    }

    @Test fun `changed contacts geometry refuses before any method changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, List<ContactsBlockMethod>) -> Unit>> = listOf(
                "copy no longer stored" to { _, m -> val b = builder(m); val body = b.controlBody()
                    b.replaceInstruction(body.indices.single { it > 0 && body[it].opcode == Opcode.IPUT_OBJECT && body[it - 1].controlRef() == "Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V" }, "nop") },
                "sync gate inverted" to { _, m -> val b = builder(m); val at = b.controlBody().indexOfFirst { it.controlRef() == FOLDERS_DIALOG_COUNT } - 1
                    b.replaceInstruction(at, "nop") },
                "sort removed" to { c, m -> val sorter = sorter(c, m); sorter.replaceInstruction(sorter.controlBody().indexOfFirst { it.controlRef()?.startsWith("Ljava/util/Collections;->sort") == true }, "nop") },
                "extra presentation reader" to { c, m -> val reader = m.first { it.method != builder(m) && it.reads.any { r -> r.rows } }.method
                    c.mutableClassDefBy(reader.definingClass).methods.add(ImmutableMethod(reader.definingClass, reader.name + "Copy", reader.parameters, reader.returnType,
                        reader.accessFlags, reader.annotations, reader.hiddenApiRestrictions, reader.implementation).toMutable()) },
                "loading rows reader removed" to { _, m -> val reader = m.first { it.method != builder(m) && it.reads.any { r -> !r.rows } }
                    reader.method.replaceInstruction(reader.reads.first { !it.rows }.index, "nop") },
                "reader skips its null test" to { _, m -> val reader = m.first { it.method != builder(m) && it.reads.any { r -> r.rows } }
                    reader.method.replaceInstruction(reader.reads.first { it.rows }.index + 1, "nop") },
                "reader reads the rows where the block is absent" to { _, m -> val reader = m.first { it.method != builder(m) && it.reads.any { r -> r.rows } }
                    // The test's null branch now lands on a raw read of the copy, which the hook never answers.
                    val method = reader.method; val read = reader.reads.first { it.rows }.index; val body = method.controlBody()
                    val (value, holder) = body[read].namedRegisters(); val field = body[read].controlRef()
                    val absent = ControlFlow.of(method).normal[read + 1].single { it != read + 2 }
                    method.addInstructions(absent, "iget-object v$value, v$holder, $field")
                    val leak = method.getInstruction(absent)
                    val test = if (absent <= read + 1) read + 2 else read + 1
                    method.removeInstruction(test)
                    method.addInstructionsWithLabels(test, "if-eqz v$value, :hush_leak", ExternalLabel("hush_leak", leak)) },
                "second builder" to { c, m -> val b = builder(m)
                    c.mutableClassDefBy(b.definingClass).methods.add(ImmutableMethod(b.definingClass, b.name + "Copy", b.parameters, b.returnType,
                        b.accessFlags, b.annotations, b.hiddenApiRestrictions, b.implementation).toMutable()) },
                "missing build flag" to { c, _ -> c.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "hideContactsBlock" } },
                "private rows hook" to { c, _ -> val h = c.mutableClassDefBy(CONTACTS_BLOCK).methods.single { it.name == "rows" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing placeholder hook" to { c, _ -> c.mutableClassDefBy(CONTACTS_BLOCK).methods.removeAll { it.name == "placeholder" } },
                "empty rows hook" to { c, _ -> val owner = c.mutableClassDefBy(CONTACTS_BLOCK); val h = owner.methods.single { it.name == "rows" }
                    owner.methods.remove(h)
                    owner.methods.add(ImmutableMethod(h.definingClass, h.name, h.parameters, h.returnType, h.accessFlags, h.annotations,
                        h.hiddenApiRestrictions, ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList())).toMutable()) },
            )
            for ((case, change) in mutations) {
                val c = context(build)
                change(c, c.resolveContactsBlock())
                val before = completeState(build, c)
                assertThrows("${build.name}: $case", PatchException::class.java) { hideContactsBlockPatch.execute(c) }
                assertEquals("${build.name}: $case preserves every method, path and build fact", before, completeState(build, c))
            }
        }
    }

    private fun builder(methods: List<ContactsBlockMethod>) =
        methods.single { m -> m.method.controlBody().any { it.controlRef() == TELEGRAM_CONTACTS } }.method
    private fun sorter(c: BytecodePatchContext, methods: List<ContactsBlockMethod>): app.morphe.patcher.util.proxy.mutableTypes.MutableMethod {
        val body = builder(methods).controlBody()
        val rows = body[body.indices.single { it > 0 && body[it].opcode == Opcode.IPUT_OBJECT &&
            body[it - 1].controlRef() == "Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V" }].controlRef()
        return c.mutableClassDefBy(builder(methods).definingClass).methods.single { m -> m.controlBody().let { b ->
            b.any { it.controlRef() == "Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V" } && b.any { it.controlRef() == rows } } }
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + hosts(build))
    private fun completeState(build: File, c: BytecodePatchContext) = (hosts(build).map { it.type } + listOf(CONTACTS_BLOCK, SETTINGS_STATUS))
        .filter { c.classDefByOrNull(it) != null }.associateWith { type -> c.mutableClassDefBy(type).let { cls ->
            listOf(cls.accessFlags, cls.methods.map { key(it) to it.state() }) } }
    private fun hostState(build: File, c: BytecodePatchContext, except: Set<String>) = hosts(build)
        .flatMap { c.mutableClassDefBy(it.type).methods }.filter { key(it) !in except }.associate { key(it) to it.state() }

    private fun hosts(build: File): List<ClassDef> {
        val identity = FixtureDex.inputIdentity(build)
        return HOSTS[identity]?.get() ?: loadHosts(build).also {
            if (HOSTS.size >= 2) HOSTS.clear()
            HOSTS[identity] = SoftReference(it)
        }
    }

    /** Every class with a method that could be the builder, then every class reading the two fields it names. */
    private fun loadHosts(build: File): List<ClassDef> {
        val builders = FixtureDex.classesWhere(build, { true }) { method ->
            method.controlBody().any { it.controlRef() == FOLDERS_DIALOG_COUNT || it.controlRef() == TELEGRAM_CONTACTS }
        }
        val method = builders.flatMap { it.methods }.single { m -> m.controlBody().let { body ->
            body.any { it.controlRef() == FOLDERS_DIALOG_COUNT } && body.any { it.controlRef()?.startsWith("Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)") == true } &&
                body.any { it.controlRef() == TELEGRAM_CONTACTS } } }
        val body = method.controlBody()
        val fields = body.filter { it.opcode == Opcode.IPUT_OBJECT || it.opcode == Opcode.IGET_BOOLEAN }
            .mapNotNull { it.controlField() }.filter { it.definingClass == method.definingClass }.map { it.toString() }.toSet()
        val readers = FixtureDex.classesWhere(build, { true }) { m -> m.controlBody().any { it.controlRef() in fields } }
        return (builders + readers).associateBy { it.type }.values.map(ImmutableClassDef::of)
    }

    private fun Method.state(): List<Any?> {
        val body = controlBody(); val flow = if (body.isEmpty()) null else ControlFlow.of(this)
        return listOf(accessFlags, implementation?.registerCount, body.map { it.operand() }, body.map { listOf(it.codeUnits, (it as? OffsetInstruction)?.codeOffset) },
            flow?.normal?.toList(), flow?.exceptional?.toList())
    }
    private fun Instruction.operand() = listOf(opcode, namedRegisters(), (this as? ReferenceInstruction)?.reference?.toString(),
        (this as? WideLiteralInstruction)?.wideLiteral)
    private fun key(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    companion object {
        private val HOSTS = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        @AfterClass @JvmStatic fun releaseFixtures() { HOSTS.clear() }
    }
}
