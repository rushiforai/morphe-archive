/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.hostsOf
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap

/** The folder tabs moved above the bottom bar: where the chat list places, pads and blurs around them. */
class BottomTabsFixtureTest {
    private fun contextFor(build: File) =
        PatchContexts.of((ExtensionDex.classes() + launchFolderHosts(build) + bottomTabsHosts(build)).distinctBy { it.type })

    private fun wholePatch(build: File, withListView: Boolean): BytecodePatchContext {
        val listView = bottomTabsHosts(build)
        val others = folderCounterHosts(build) + menuHosts(build) + accountListHosts(build) +
            chatListAvatarHosts(build)
        // Another patch's slice can carry the view too, so leaving it out means taking it out.
        val hosts = if (withListView) others + listView else others.filterNot { host -> listView.any { it.type == host.type } }
        return PatchContexts.of((ExtensionDex.classes() + hosts).distinctBy { it.type })
    }

    @Test fun `each hook goes where the chat list answers for its tabs`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = contextFor(build)
            context.requireLaunchFolderRuntime()
            context.requireBottomTabsRuntime()
            val launch = context.resolveLaunchFolder().refs!!
            val plan = context.resolveBottomTabs(launch)
            assertEquals("$name: ${plan.missing}", bottomTabsGap(build), plan.missing)
            if (plan.missing != null) {
                // Plus Messenger has its own tabs at the bottom, so ours stay out of its way whole.
                assertTrue(name, plan.edits.isEmpty())
                assertNull(name, plan.refs)
                continue
            }
            val refs = plan.refs!!
            assertEquals(name, launch.strip, refs.strip)
            val edited = plan.edits.map { it.method }.distinct()
            assertEquals("$name: place, list view, padding, compose button and blur", 5, edited.size)
            val stock = edited.associateWith { method -> method.code().map(::shape) }
            context.writeBottomTabsStubs(refs)
            plan.apply()

            fun site(hook: String): Pair<List<Instruction>, Int> {
                val body = edited.map { it.code() }.single { code -> code.any { it.controlRef() == hook } }
                assertEquals("$name: $hook goes in once", 1, body.count { it.controlRef() == hook })
                return body to body.indexOfFirst { it.controlRef() == hook }
            }

            // The strip's translation goes through the extension, with the chat list that holds it.
            val (place, placed) = site(BOTTOM_PLACE)
            val (self, strip, value) = place[placed].namedRegisters()
            assertEquals(name, refs.strip, place[placed - 3].raw())
            assertEquals(name, listOf(strip, self), place[placed - 3].namedRegisters())
            assertEquals(name, Opcode.IF_EQZ, place[placed - 2].opcode)
            assertEquals(name, value, place[placed - 1].namedRegisters().first())

            // What the views below it make of its fade is answered right after it's read.
            val header = site(BOTTOM_HEADER).second
            assertTrue(name, header > placed)
            val fade = place[header].namedRegisters()[1]
            assertEquals(name, listOf(self, fade), place[header].namedRegisters())
            assertEquals(name, "Landroid/view/View;->getAlpha()F", place[header - 2].controlRef())
            assertResult(name, place, header - 1, fade)
            assertResult(name, place, header + 1, fade)

            // The list view's top padding: the strip's factor, read off the chat list it's asked of.
            val (measure, top) = site(BOTTOM_TOP)
            val (list, share) = measure[top].namedRegisters()
            val factor = measure[top - 2].call()!!
            assertEquals(name, refs.list, factor.definingClass)
            assertEquals(name, "F", factor.returnType)
            assertEquals(name, list, measure[top - 2].namedRegisters().first())
            assertResult(name, measure, top - 1, share)
            assertResult(name, measure, top + 1, share)

            // The bottom padding: the last answer, the navigation bar plus the bar's room, on its way out.
            val (padding, padded) = site(BOTTOM_PADDING)
            val (paddingSelf, sum) = padding[padded].namedRegisters()
            assertEquals(name, padding.lastIndex, padded + 2)
            assertEquals(name, Opcode.RETURN, padding[padded + 2].opcode)
            assertEquals(name, listOf(sum), padding[padded + 2].namedRegisters())
            assertResult(name, padding, padded + 1, sum)
            assertEquals(name, Opcode.ADD_INT_2ADDR, padding[padded - 1].opcode)
            assertEquals(name, refs.nav, padding[padded - 3].raw())
            assertEquals(name, refs.barRoom, padding[padded - 2].raw())
            assertEquals(name, paddingSelf, padding[padded - 3].namedRegisters()[1])

            // The compose button: the extra lift, right after it's read and right before it's taken off.
            val (compose, lifted) = site(BOTTOM_COMPOSE)
            assertEquals(name, 6, lifted)
            assertEquals(name, refs.nav, compose[0].raw())
            assertEquals(name, "F", compose[lifted - 1].controlField()!!.type)
            val (composeLift, composeSelf) = compose[lifted - 1].namedRegisters()
            assertEquals(name, listOf(composeSelf, composeLift), compose[lifted].namedRegisters())
            assertResult(name, compose, lifted + 1, composeLift)
            assertEquals(name, Opcode.SUB_FLOAT_2ADDR, compose[lifted + 2].opcode)

            // The blur: the bar's top, once it's worked out.
            val (capture, captured) = site(BOTTOM_CAPTURE)
            assertEquals(name, Opcode.SUB_INT, capture[captured - 1].opcode)
            val barTop = capture[captured - 1].namedRegisters().first()
            assertEquals(name, barTop, capture[captured].namedRegisters()[1])
            assertResult(name, capture, captured + 1, barTop)

            for (method in edited) {
                assertEquals("$name: Telegram's own code is unchanged around it", stock.getValue(method), withoutHooks(method.code()))
            }

            // The stubs read and call the chat list's own members.
            val stubs = context.tgMutableClassDefBy(BOTTOM_TABS).methods.associateBy { it.origName }
            fun stub(name: String, opcode: Opcode) = stubs.getValue(name).code().single { it.opcode == opcode }.raw()
            assertEquals(name, refs.strip, stub("tabStrip", Opcode.IGET_OBJECT))
            assertEquals(name, refs.nav, stub("navHeightOf", Opcode.IGET))
            assertEquals(name, refs.barRoom, stub("barRoomOf", Opcode.IGET))
            assertEquals(name, refs.place, stub("placeAgain", Opcode.INVOKE_VIRTUAL))
            assertEquals(name, refs.compose, stub("composeAgain", Opcode.INVOKE_VIRTUAL))
        }
    }

    @Test fun `the rehearsal leaves Telegram as it was`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            context.requireLaunchFolderRuntime()
            val launch = context.resolveLaunchFolder().refs!!
            val methods = context.tgMutableClassDefBy(launch.list).methods.toList()
            val before = methods.map { method -> method.code().map(::shape) }
            val plan = context.resolveBottomTabs(launch)
            assertEquals(build.name, before, methods.map { method -> method.code().map(::shape) })
            for (edit in plan.edits) {
                assertTrue(build.name, edit.method.code().none { it.controlRef().orEmpty().startsWith(BOTTOM_TABS) })
            }
        }
    }

    @Test fun `a jump onto the padding's return still gets the room`() {
        for (build in Fixtures.declaredBuilds()) {
            if (bottomTabsGap(build) != null) continue
            val context = contextFor(build)
            context.requireLaunchFolderRuntime()
            val launch = context.resolveLaunchFolder().refs!!
            val padding = context.resolveBottomTabs(launch).edits.single { BOTTOM_PADDING in it.code }.method
            val implementation = padding.implementation!!
            padding.addInstructionsWithLabels(0, "if-eqz v${implementation.registerCount - 1}, :hush_return",
                ExternalLabel("hush_return", padding.getInstruction(implementation.instructions.size - 1)))
            val plan = context.resolveBottomTabs(launch)
            assertNull(build.name, plan.missing)
            plan.apply()
            val code = implementation.instructions.toList()
            assertEquals(build.name, code.indexOfFirst { it.controlRef() == BOTTOM_PADDING },
                (code.first() as BuilderOffsetInstruction).target.location.index)
        }
    }

    @Test fun `the whole patch moves the tabs and Plus keeps its own`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = wholePatch(build, withListView = true)
            val list = context.resolveLaunchFolder().refs!!.list
            assertEquals(name, stockWarnings(build), PatchLogCapture.warnings { hideFolderCountersPatch.execute(context) })
            val moved = bottomTabsGap(build) == null
            assertEquals(name, if (moved) 1L else 0L, statusOf(context, "bottomTabs"))
            assertEquals(name, moved, context.hooked(list))
            assertEquals("$name: the stubs go in with the hooks", moved,
                context.tgMutableClassDefBy(BOTTOM_TABS).methods.single { it.origName == "barRoomOf" }.code().any { it.opcode == Opcode.IGET })
        }
    }

    @Test fun `without the list view only the move is left out`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = wholePatch(build, withListView = false)
            val list = context.resolveLaunchFolder().refs!!.list
            val warnings = beyondStock(build, PatchLogCapture.warnings { hideFolderCountersPatch.execute(context) })
            if (bottomTabsGap(build) == null) {
                assertEquals("$name: $warnings", 1, warnings.size)
                assertTrue(warnings.single(), "the chat list's view isn't measured from the folder tabs" in warnings.single() &&
                    "without moving the folder tabs" in warnings.single())
            } else {
                assertEquals("$name: $warnings", emptyList<String>(), warnings)
            }
            assertEquals(name, 0L, statusOf(context, "bottomTabs"))
            assertEquals(name, 1L, statusOf(context, "fitTabs"))
            assertEquals(name, false, context.hooked(list))
        }
    }

    private fun BytecodePatchContext.hooked(list: String) =
        tgMutableClassDefBy(list).methods.any { method -> method.code().any { it.controlRef().orEmpty().startsWith(BOTTOM_TABS) } }

    private fun assertResult(name: String, body: List<Instruction>, at: Int, register: Int) {
        assertEquals(name, Opcode.MOVE_RESULT, body[at].opcode)
        assertEquals(name, listOf(register), body[at].namedRegisters())
    }

    private fun statusOf(context: BytecodePatchContext, flag: String) =
        (context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.code()[0] as WideLiteralInstruction).wideLiteral

    /** The body without the extension's calls and what they put back, with the strip's own call where its hook is. */
    private fun withoutHooks(body: List<Instruction>): List<List<Any?>> {
        val answers = listOf(BOTTOM_HEADER, BOTTOM_TOP, BOTTOM_PADDING, BOTTOM_COMPOSE, BOTTOM_CAPTURE)
        val skip = mutableSetOf<Int>()
        body.forEachIndexed { at, instruction ->
            if (instruction.controlRef() in answers) {
                skip += at
                skip += at + 1
            }
        }
        return body.filterIndexed { at, _ -> at !in skip }.map { instruction ->
            if (instruction.controlRef() == BOTTOM_PLACE) listOf(Opcode.INVOKE_VIRTUAL, instruction.namedRegisters().drop(1), STRIP_TRANSLATION)
            else shape(instruction)
        }
    }

    /** An instruction by what it does: an insert can push a branch past a short goto's reach. */
    private fun shape(instruction: Instruction): List<Any?> {
        val opcode = if (instruction.opcode == Opcode.GOTO_16 || instruction.opcode == Opcode.GOTO_32) Opcode.GOTO else instruction.opcode
        return listOf(opcode, instruction.namedRegisters(), instruction.controlRef())
    }
}

private val BOTTOM_TABS_HOSTS = ConcurrentHashMap<String, List<ClassDef>>()

/** The chat list's view: the class whose onMeasure reads a yes-or-no float and its own bottom padding. */
internal fun bottomTabsHosts(build: File): List<ClassDef> = BOTTOM_TABS_HOSTS.hostsOf(build.path) {
    FixtureDex.classesWhere(build, { true }) { method ->
        method.name == "onMeasure" && method.parameterTypes.map(CharSequence::toString) == listOf("I", "I") && method.code().let { body ->
            body.any { it.controlRef() == LIST_PADDING_BOTTOM } && body.any { instruction ->
                instruction.opcode == Opcode.INVOKE_VIRTUAL && instruction.call()?.let {
                    it.returnType == "F" && it.parameterTypes.map(CharSequence::toString) == listOf("Z")
                } == true
            }
        }
    }
}

/** Why [build] keeps its folder tabs where they are: Plus Messenger has a bottom option of its own. Null where they move. */
internal fun bottomTabsGap(build: File): String? =
    if (build.name.startsWith("plus-")) "the chat list places its folder tabs its own way" else null

/** What a whole run of the patch warns on [build] about the move, if anything. */
internal fun bottomTabsWarning(build: File): String? =
    bottomTabsGap(build)?.let { "Hide folder tab counters: $it. The patch goes on without moving the folder tabs." }

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty().filter { it.opcode != Opcode.NOP }
private fun Instruction.raw() = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference
