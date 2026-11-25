/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.timeline

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.misc.extension.localRegisterCount
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/**
 * The question put to the extension where a timeline fragment gets its loaded page, in each declared
 * build: right after Tumblr's own `items.isEmpty()`, with the fragment, the load type, the page's
 * next link and that answer. What each answer does is read back instruction by instruction, and so
 * is everything of Tumblr's around it, which has to be what it was.
 */
@Category(FixtureTests::class)
class TimelinePagingFixtureTest {
    @Test
    fun `each declared build asks about a page after its own empty check and goes on to the next when told`() {
        for (build in Fixtures.declaredBuilds()) {
            val stock = FixtureDex.classes(build, setOf(TIMELINE_FRAGMENT)).getValue(TIMELINE_FRAGMENT)
            val original = stock.methods.single { it.deliversAPage() }
            val mode = original.parameterTypes[0].toString()
            val before = original.instructionList()
            val self = original.localRegisterCount()
            val type = original.parameterRegisterNumber(0)
            val items = original.parameterRegisterNumber(1)
            val links = original.parameterRegisterNumber(2)
            val asked = before.indexOfFirst { it.opcode == Opcode.INVOKE_INTERFACE && it.methodRef()?.name == "isEmpty" && it.registers() == listOf(items) }
            val at = asked + 2
            val empty = (before[asked + 1] as OneRegisterInstruction).registerA
            val scratch = (before[at] as OneRegisterInstruction).registerA

            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, setOf(TIMELINE_FRAGMENT, mode)).values)
            timelinePagingPatch.execute(context)
            val body = context.mutableClassDefBy(TIMELINE_FRAGMENT).methods.single { it.deliversAPage() }.instructionList()
            val hook = body.subList(at, at + TIMELINE_PAGING_SIZE)
            val name = build.name

            assertEquals("$name: the hook's instructions are all that's added", before.size + TIMELINE_PAGING_SIZE, body.size)
            assertEquals("$name: Tumblr's code before the hook", before.take(at).map { it.text() }, body.take(at).map { it.text() })
            assertEquals("$name: Tumblr's code after the hook", before.drop(at).map { it.text() },
                body.drop(at + TIMELINE_PAGING_SIZE).map { it.text() })
            // Every branch of Tumblr's own lands on the instruction it landed on before.
            val moved = { index: Int -> if (index < at) index else index + TIMELINE_PAGING_SIZE }
            for (index in before.indices.filter { before[it] is OffsetInstruction && !before[it].opcode.name.contains("switch") }) {
                assertEquals("$name: the branch at $index", moved(before.landing(index)), body.landing(moved(index)))
            }

            assertEquals(
                "$name: the hook's instructions",
                listOf(
                    Opcode.CONST_4, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
                    Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                    Opcode.CONST_4, Opcode.IF_EQ,
                    Opcode.IPUT_BOOLEAN, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID,
                    Opcode.IPUT_OBJECT, Opcode.SGET_OBJECT, Opcode.IF_EQ, Opcode.INVOKE_VIRTUAL,
                    Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID,
                ),
                hook.map { it.opcode },
            )

            // The next link, or null for a page with no links.
            assertEquals("$name: null to start with", listOf(scratch, 0), hook[0].literal())
            assertEquals("$name: the links are asked only when there are some", links, (hook[1] as OneRegisterInstruction).registerA)
            assertEquals("$name: no links goes straight to the question", at + 4, body.landing(at + 1))
            assertEquals("$name: the next link's getter", "$LINKS->c()$LINK", hook[2].methodRef()?.descriptor())
            assertEquals("$name: on the links", listOf(links), hook[2].registers())
            assertEquals("$name: the next link is kept", scratch, (hook[3] as OneRegisterInstruction).registerA)

            // The question: the fragment, the load type, the next link and Tumblr's own answer.
            assertEquals("$name: the question", TIMELINE_PAGING_HOOK, hook[4].methodRef()?.descriptor())
            assertEquals("$name: what it's asked with", listOf(self, type, scratch, empty), hook[4].registers())
            assertEquals("$name: the answer", scratch, (hook[5] as OneRegisterInstruction).registerA)
            assertEquals("$name: 0 is tested", scratch, (hook[6] as OneRegisterInstruction).registerA)
            assertEquals("$name: 0 runs Tumblr's own next instruction", at + TIMELINE_PAGING_SIZE, body.landing(at + 6))
            assertEquals("$name: which is still the one that was there", before[at].text(), body[at + TIMELINE_PAGING_SIZE].text())

            assertEquals("$name: 1 is made", listOf(empty, 1), hook[7].literal())
            assertEquals("$name: 1 is compared with the answer", setOf(scratch, empty), hook[8].pair())
            assertEquals("$name: 1 goes on to the next page", at + 12, body.landing(at + 8))

            // 2 is Tumblr's own branch for an empty first page, copied: no more pages, the empty view.
            val first = before.landing(at + 3)
            assertEquals("$name: the last-page flag Tumblr sets", before[first].fieldRef()?.descriptor(), hook[9].fieldRef()?.descriptor())
            assertEquals("$name: set to true on the fragment", listOf(empty, self), hook[9].ordered())
            assertEquals("$name: the empty view Tumblr shows", before[first + 1].methodRef()?.descriptor(), hook[10].methodRef()?.descriptor())
            assertEquals("$name: on the fragment", listOf(self), hook[10].registers())

            // 1 takes the page's links, settles a refresh and loads the next page.
            val store = before.single { it.opcode == Opcode.IPUT_OBJECT && it.fieldRef()?.type == "Landroid/os/Parcelable;" }
            assertEquals("$name: the links field Tumblr stores a page's links in", store.fieldRef()?.descriptor(), hook[12].fieldRef()?.descriptor())
            assertEquals("$name: the page's links, on the fragment", listOf(links, self), hook[12].ordered())
            assertEquals("$name: the next-page load type", "$mode->PAGINATION:$mode", hook[13].fieldRef()?.descriptor())
            assertEquals("$name: kept in the scratch local", scratch, (hook[13] as OneRegisterInstruction).registerA)
            assertEquals("$name: a next page keeps its loading row", setOf(type, scratch), hook[14].pair())
            assertEquals("$name: so it skips the settle", at + 16, body.landing(at + 14))
            val dropped = before.indexOfFirst { it.opcode == Opcode.IPUT_OBJECT && it.fieldRef()?.type == "Lretrofit2/Call;" }
            assertEquals("$name: the settle Tumblr runs after a page", before[dropped + 1].methodRef()?.descriptor(), hook[15].methodRef()?.descriptor())
            assertEquals("$name: with the page's own load type", listOf(self, type), hook[15].registers())

            val load = hook[16].methodRef()!!
            assertEquals("$name: the load is the fragment's", TIMELINE_FRAGMENT, load.definingClass)
            assertEquals("$name: and takes a load type and a flag", listOf(mode, "Z"), load.parameterTypes.map { it.toString() })
            assertEquals("$name: asked for a next page, with true", listOf(self, scratch, empty), hook[16].registers())
            // Tumblr's own next-page call is the same one: the constant, true, the load.
            assertTrue("$name: Tumblr loads its next page the same way", stock.methods.any { method ->
                val own = method.instructionList()
                (2 until own.size).any { index ->
                    own[index].opcode == Opcode.INVOKE_VIRTUAL && own[index].methodRef()?.descriptor() == load.descriptor() &&
                        own[index - 2].fieldRef()?.name == "PAGINATION" && own[index - 1].literal().getOrNull(1) == 1
                }
            })
        }
    }

    /**
     * The extension tells a next page from a first page or a refresh by the load type's name(), which
     * is the string an enum's <clinit> hands the constructor. So the constant has to be an enum's, and
     * named what the extension compares with.
     */
    @Test
    fun `each declared build names its next page load the way the extension reads it`() {
        val wanted = ExtensionDex.stringConstant(TIMELINE_PAGING, "PAGINATION")
        assertEquals("PAGINATION", wanted)
        for (build in Fixtures.declaredBuilds()) {
            val fragment = FixtureDex.classes(build, setOf(TIMELINE_FRAGMENT)).getValue(TIMELINE_FRAGMENT)
            val mode = fragment.methods.single { it.deliversAPage() }.parameterTypes[0].toString()
            val loadType = FixtureDex.classes(build, setOf(mode))[mode]
            assertTrue("${build.name}: $mode is an enum", loadType != null && AccessFlags.ENUM.isSet(loadType.accessFlags))
            assertTrue("${build.name}: $mode has $wanted", loadType!!.fields.any {
                it.name == wanted && it.type == mode && AccessFlags.STATIC.isSet(it.accessFlags)
            })
            val named = loadType.methods.single { it.name == "<clinit>" }.instructionList()
            val at = named.indexOfFirst { it.stringRef() == wanted }
            assertTrue("${build.name}: $mode names $wanted", at >= 0)
            assertEquals("${build.name}: and that name is the constant's", "$mode->$wanted:$mode",
                named.drop(at + 1).first { it.opcode == Opcode.SPUT_OBJECT }.fieldRef()?.descriptor())
        }
    }

    /** The one method of the fragment shaped like a page delivery: a type, the items, the links, extras, a flag. */
    private fun Method.deliversAPage(): Boolean = !isStatic() && returnType == "V" && parameterTypes.size == 5 &&
        parameterTypes.drop(1).map { it.toString() } == listOf("Ljava/util/List;", LINKS, "Ljava/util/Map;", "Z")

    /** The registers an invoke passes, in order. */
    private fun Instruction.registers(): List<Int> = (this as FiveRegisterInstruction).let {
        listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG).take(it.registerCount)
    }

    /** A const's register and value, or nothing for any other instruction. */
    private fun Instruction.literal(): List<Int> =
        if (this is NarrowLiteralInstruction && this is OneRegisterInstruction) listOf(registerA, narrowLiteral) else emptyList()

    private fun Instruction.ordered(): List<Int> = (this as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) }

    private fun Instruction.pair(): Set<Int> = ordered().toSet()

    /** The index of the instruction the branch at [index] lands on. */
    private fun List<Instruction>.landing(index: Int): Int {
        val addresses = runningFold(0) { address, instruction -> address + instruction.codeUnits }
        return addresses.indexOf(addresses[index] + (this[index] as OffsetInstruction).codeOffset)
    }

    /** An instruction as text, for comparing one body with another: its opcode, registers and reference. */
    private fun Instruction.text(): String = buildString {
        append(opcode.name)
        (this@text as? FiveRegisterInstruction)?.let { append(' ').append(registers()) }
        (this@text as? OneRegisterInstruction)?.let { append(" v").append(it.registerA) }
        (this@text as? TwoRegisterInstruction)?.let { append(" v").append(it.registerB) }
        (this@text as? NarrowLiteralInstruction)?.let { append(" #").append(it.narrowLiteral) }
        methodRef()?.let { append(' ').append(it.descriptor()) }
        fieldRef()?.let { append(' ').append(it.descriptor()) }
        stringRef()?.let { append(" \"").append(it).append('"') }
    }

    private fun com.android.tools.smali.dexlib2.iface.reference.MethodReference.descriptor() =
        "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun com.android.tools.smali.dexlib2.iface.reference.FieldReference.descriptor() = "$definingClass->$name:$type"
}

private const val LINKS = "Lcom/tumblr/timeline/model/link/TimelinePaginationLink;"
private const val LINK = "Lcom/tumblr/timeline/model/link/Link;"
