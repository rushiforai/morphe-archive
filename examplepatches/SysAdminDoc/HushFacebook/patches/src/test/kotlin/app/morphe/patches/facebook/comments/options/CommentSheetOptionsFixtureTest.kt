/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.comments.options

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.comments.summaries.HOLDS
import app.morphe.patches.facebook.comments.summaries.POST_SOCKET
import app.morphe.patches.facebook.comments.summaries.POST_SUMMARY
import app.morphe.patches.facebook.comments.summaries.descriptor
import app.morphe.patches.facebook.comments.summaries.holdSummaries
import app.morphe.patches.facebook.comments.summaries.nameTable
import app.morphe.patches.facebook.comments.summaries.switchKeys
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.feed.methodsHolding
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Comment sheet options on every Facebook build the bundle declares. The comment box's button
 * socket is found by the name it gives itself, its name table by the GIF and sticker buttons, and
 * its check, in another class, by the numbers it shares with the table. The reaction picker is the
 * one method that builds the UFI dock and logs its name. Then each hook: the button's name from
 * the table with the check's own number as a range, the extension asked, a yes answering no; and
 * the picker asking first and returning on a yes. A no lands on Facebook's first instruction, and
 * nothing of Facebook's code moves. The socket under a post's comments is found by its own name and
 * the Related groups plugin, its check is another one than the button check, and it's hooked the
 * same way with its own extension method (#101). The comment section is found by its name, its reply flag
 * through the expandReplySection update, and the flag goes through the extension, as a range
 * call, just before the initial state returns. The section's draw method asks about its comment
 * first, read off its props, and returns no children on a yes (#118). An open reply thread's section
 * is found by its name, and the one paging flag of the comment list it builds goes through the
 * extension just before it's written (#140). The View more replies row is found by its render's
 * name, and the boolean that picks whether its words alone or the whole row take a tap goes
 * through the extension right after Facebook reads it (#219). So does the nameless pager under an
 * open reply thread, found as the one thing the thread's comment list makes that reads it. The video viewer's comment bar is found by the names
 * of its sticker and GIF buttons, and once both are built the extension is asked and a yes clears
 * them. The whole bar around them is the class naming its layout transition that builds that row,
 * and its render asks first and returns nothing on a yes (#213). Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class CommentSheetOptionsFixtureTest {
    private fun bundles(check: (File) -> Unit) {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                check(bundle)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()

    /**
     * An opcode with a goto at any width. Added instructions can push a goto past its reach, and the
     * patcher then widens it (584's reply list build has gotos either side of the flag's write).
     */
    private fun List<Instruction>.opcodes() =
        map { if (it.opcode == Opcode.GOTO_16 || it.opcode == Opcode.GOTO_32) Opcode.GOTO else it.opcode }

    private fun holders(bundle: File, string: String) =
        FixtureDex.classesHolding(bundle, string).filterNot { it.type.startsWith(EXTENSION_CLASSES) }

    private fun buttons(bundle: File) {
        val name = bundle.name
        val sockets = holders(bundle, BUTTON_SOCKET).flatMap { methodsHolding(it, BUTTON_SOCKET) }
        assertTrue("$name: nothing names \"$BUTTON_SOCKET\"", sockets.isNotEmpty())
        val found = buttonSocket(holders(bundle, GIF_BUTTON), sockets) { types -> FixtureDex.classes(bundle, types) }
        val table = found.table
        val check = found.check
        val where = "$name: ${check.descriptor()}"
        assertNotEquals("$where: the check was expected in another class than the table",
            table.definingClass, check.definingClass)
        assertTrue("$where isn't static", AccessFlags.STATIC.isSet(check.accessFlags))
        assertEquals("$where: the button's number isn't last", "I", check.parameterTypes.last().toString())
        assertTrue("$where: the table has fewer than the two buttons", switchKeys(table).single().size >= 2)

        val owner = FixtureDex.classes(bundle, setOf(check.definingClass)).values.single()
        val context = PatchContexts.of(listOf(owner))
        val method = context.mutableClassDefBy(owner.type).methods.single { it.descriptor() == check.descriptor() }
        val original = method.implementation!!.instructions.toList()
        val number = method.implementation!!.registerCount - 1
        method.holdButtons(table)
        val patched = method.implementation!!.instructions.toList()
        assertEquals("$where gains seven instructions", original.size + 7, patched.size)
        assertEquals("$where: the table is read with a range call", Opcode.INVOKE_STATIC_RANGE, patched[0].opcode)
        assertEquals("$where: the button's name comes from the table", table.descriptor(), patched[0].reference())
        val range = patched[0] as RegisterRangeInstruction
        assertEquals("$where: with the check's own number, its last register", listOf(number, 1),
            listOf(range.startRegister, range.registerCount))
        assertEquals("$where: the name is kept", Opcode.MOVE_RESULT_OBJECT, patched[1].opcode)
        val register = (patched[1] as OneRegisterInstruction).registerA
        assertTrue("$where: the hook writes v$register, which isn't a local", register < method.localRegisterCount())
        assertEquals("$where: the extension is asked", Opcode.INVOKE_STATIC, patched[2].opcode)
        assertEquals("$where: the extension is asked", HOLDS_BUTTON, patched[2].reference())
        val ask = patched[2] as FiveRegisterInstruction
        assertEquals("$where: with the name it was handed", listOf(1, register), listOf(ask.registerCount, ask.registerC))
        assertEquals("$where: its answer is kept", Opcode.MOVE_RESULT, patched[3].opcode)
        assertEquals("$where: a no goes on to Facebook", Opcode.IF_EQZ, patched[4].opcode)
        assertEquals("$where: a yes answers no", listOf(Opcode.CONST_4, Opcode.RETURN), patched.subList(5, 7).map { it.opcode })
        assertEquals("$where: Facebook's code stays", original.map { it.opcode }, patched.drop(7).map { it.opcode })
        assertEquals("$where: a no lands on Facebook's first instruction", setOf(5, 7), ControlFlow.of(method).normal[4].toSet())
    }

    private fun bottom(bundle: File) {
        val name = bundle.name
        val sockets = holders(bundle, BOTTOM_SOCKET).flatMap { methodsHolding(it, BOTTOM_SOCKET) }
        assertTrue("$name: nothing names \"$BOTTOM_SOCKET\"", sockets.isNotEmpty())
        val found = bottomSocket(holders(bundle, RELATED_GROUPS), sockets) { types -> FixtureDex.classes(bundle, types) }
        val buttons = buttonSocket(
            holders(bundle, GIF_BUTTON),
            holders(bundle, BUTTON_SOCKET).flatMap { methodsHolding(it, BUTTON_SOCKET) },
        ) { types -> FixtureDex.classes(bundle, types) }
        val table = found.table
        val check = found.check
        val where = "$name: ${check.descriptor()}"
        assertNotEquals("$where is the comment box's button check", buttons.check.descriptor(), check.descriptor())
        assertNotEquals("$where: the name table is the comment box's", buttons.table.descriptor(), table.descriptor())
        assertTrue("$where isn't static", AccessFlags.STATIC.isSet(check.accessFlags))
        assertEquals("$where: the plugin's number isn't last", "I", check.parameterTypes.last().toString())
        assertTrue("$where: the table has only Related groups", switchKeys(table).single().size >= 2)

        val owner = FixtureDex.classes(bundle, setOf(check.definingClass)).values.single()
        val context = PatchContexts.of(listOf(owner))
        val method = context.mutableClassDefBy(owner.type).methods.single { it.descriptor() == check.descriptor() }
        val original = method.implementation!!.instructions.toList()
        val number = method.implementation!!.registerCount - 1
        method.holdButtons(table, HOLDS_BOTTOM_CONTENT)
        val patched = method.implementation!!.instructions.toList()
        assertEquals("$where gains seven instructions", original.size + 7, patched.size)
        assertEquals("$where: the plugin's name comes from the table", table.descriptor(), patched[0].reference())
        val range = patched[0] as RegisterRangeInstruction
        assertEquals("$where: with the check's own number, its last register", listOf(number, 1),
            listOf(range.startRegister, range.registerCount))
        val register = (patched[1] as OneRegisterInstruction).registerA
        assertTrue("$where: the hook writes v$register, which isn't a local", register < method.localRegisterCount())
        assertEquals("$where: its own extension method is asked", HOLDS_BOTTOM_CONTENT, patched[2].reference())
        assertEquals("$where: a yes answers no", listOf(Opcode.CONST_4, Opcode.RETURN), patched.subList(5, 7).map { it.opcode })
        assertEquals("$where: Facebook's code stays", original.map { it.opcode }, patched.drop(7).map { it.opcode })
        assertEquals("$where: a no lands on Facebook's first instruction", setOf(5, 7), ControlFlow.of(method).normal[4].toSet())
    }

    private fun post(bundle: File) {
        val name = bundle.name
        val sockets = holders(bundle, POST_SOCKET).flatMap { methodsHolding(it, POST_SOCKET) }
        assertTrue("$name: nothing names \"$POST_SOCKET\"", sockets.isNotEmpty())
        val found = postSocket(holders(bundle, INLINE_COMMENTS), sockets) { types -> FixtureDex.classes(bundle, types) }
        val bottom = bottomSocket(
            holders(bundle, RELATED_GROUPS),
            holders(bundle, BOTTOM_SOCKET).flatMap { methodsHolding(it, BOTTOM_SOCKET) },
        ) { types -> FixtureDex.classes(bundle, types) }
        val table = found.table
        val check = found.check
        val where = "$name: ${check.descriptor()}"
        assertNotEquals("$where is the check under a post's comments", bottom.check.descriptor(), check.descriptor())
        for (plugin in listOf(INLINE_COMMENTS_DWELL_TIME, INLINE_COMMENTS_CLIENT_RANKING, POST_SUMMARY)) {
            assertTrue("$where: ${table.descriptor()} doesn't name $plugin", holdsString(table, plugin))
        }
        assertEquals("$where: Meta AI's inline summary isn't in the same name table",
            nameTable(holders(bundle, POST_SUMMARY), POST_SUMMARY).descriptor(), table.descriptor())

        val owner = FixtureDex.classes(bundle, setOf(check.definingClass)).values.single()
        val context = PatchContexts.of(listOf(owner))
        val method = context.mutableClassDefBy(owner.type).methods.single { it.descriptor() == check.descriptor() }
        val original = method.implementation!!.instructions.toList()
        val number = method.implementation!!.registerCount - 1
        // Hide Meta AI comment summaries hooks the same check first when both patches are selected.
        method.holdSummaries(table)
        method.holdButtons(table, HOLDS_POST_COMMENTS)
        val patched = method.implementation!!.instructions.toList()
        assertEquals("$where gains seven instructions per hook", original.size + 14, patched.size)
        val range = patched[0] as RegisterRangeInstruction
        assertEquals("$where: with the check's own number, its last register", listOf(number, 1),
            listOf(range.startRegister, range.registerCount))
        assertEquals("$where: the plugin's name comes from the table", table.descriptor(), patched[0].reference())
        assertEquals("$where: its own extension method is asked", HOLDS_POST_COMMENTS, patched[2].reference())
        assertEquals("$where: a yes answers no", listOf(Opcode.CONST_4, Opcode.RETURN), patched.subList(5, 7).map { it.opcode })
        assertEquals("$where: a no goes on to the Meta AI summary hook", setOf(5, 7), ControlFlow.of(method).normal[4].toSet())
        assertEquals("$where: the Meta AI summary hook is next", HOLDS, patched[9].reference())
        assertEquals("$where: Facebook's code stays", original.map { it.opcode }, patched.drop(14).map { it.opcode })
    }

    private fun picker(bundle: File) {
        val picker = reactionPicker(holders(bundle, DOCK_NAME))
        val where = "${bundle.name}: ${picker.descriptor()}"
        assertTrue("$where isn't the reaction picker", isReactionPicker(picker))

        val owner = FixtureDex.classes(bundle, setOf(picker.definingClass)).values.single()
        val context = PatchContexts.of(listOf(owner))
        val method = context.mutableClassDefBy(owner.type).methods.single { it.descriptor() == picker.descriptor() }
        val original = method.implementation!!.instructions.toList()
        method.skipPicker()
        val patched = method.implementation!!.instructions.toList()
        assertEquals("$where gains four instructions", original.size + 4, patched.size)
        assertEquals("$where: the extension is asked first", Opcode.INVOKE_STATIC, patched[0].opcode)
        assertEquals("$where: the extension is asked first", SKIP_PICKER, patched[0].reference())
        assertEquals("$where: with nothing handed over", 0, (patched[0] as FiveRegisterInstruction).registerCount)
        assertEquals("$where: its answer is kept", Opcode.MOVE_RESULT, patched[1].opcode)
        val register = (patched[1] as OneRegisterInstruction).registerA
        assertTrue("$where: the hook writes v$register, which isn't a local", register < method.localRegisterCount())
        assertEquals("$where: a no goes on to Facebook", Opcode.IF_EQZ, patched[2].opcode)
        assertEquals("$where: a yes returns before the picker opens", Opcode.RETURN_VOID, patched[3].opcode)
        assertEquals("$where: Facebook's code stays", original.map { it.opcode }, patched.drop(4).map { it.opcode })
        assertEquals("$where: a no lands on Facebook's first instruction", setOf(3, 4), ControlFlow.of(method).normal[2].toSet())
    }

    private fun replies(bundle: File) {
        val name = bundle.name
        val updates = holders(bundle, EXPAND_REPLIES).flatMap { methodsHolding(it, EXPAND_REPLIES) }
        assertEquals("$name: one method sends \"$EXPAND_REPLIES\"", 1, updates.size)
        val (_, number) = expandUpdate(updates.single())
        assertEquals("$name: the update a tap on View replies sends", 1, number)
        val threads = replyThreads(holders(bundle, COMMENT_SECTION), updates) { types -> FixtureDex.classes(bundle, types) }
        val start = threads.initialState
        val where = "$name: ${start.descriptor()}"
        val flag = threads.flag
        assertEquals("$where: the reply flag isn't a boolean", "Z", flag.type)
        assertNotEquals("$where: the reply flag sits on the section, not its state", start.definingClass, flag.definingClass)

        val section = FixtureDex.classes(bundle, setOf(start.definingClass)).values.single()
        fun reads(method: Method) = method.implementation?.instructions?.any {
            it.opcode == Opcode.IGET_BOOLEAN && ((it as ReferenceInstruction).reference as FieldReference).let { field ->
                field.definingClass == flag.definingClass && field.name == flag.name
            }
        } == true
        assertTrue("$where: the method drawing the comment doesn't read the reply flag",
            methodsHolding(section, COMMENT_SECTION).any { it.name != "<init>" && reads(it) })

        val context = PatchContexts.of(listOf(section))
        val method = context.mutableClassDefBy(section.type).methods.single { it.descriptor() == start.descriptor() }
        val original = method.implementation!!.instructions.toList()
        val put = original[threads.write] as TwoRegisterInstruction
        assertEquals("$where: the flag is written false", Opcode.IPUT_BOOLEAN, original[threads.write].opcode)
        assertEquals("$where: the hook goes before the return", Opcode.RETURN_VOID, original[threads.end].opcode)
        val state = put.registerB
        val free = freeRegister(state)
        assertTrue("$where: the hook borrows v$free, which isn't a local", free < method.localRegisterCount())

        method.openReplyThreads(threads)
        val patched = method.implementation!!.instructions.toList()
        val end = threads.end
        val field = "${flag.definingClass}->${flag.name}:${flag.type}"
        assertEquals("$where gains four instructions", original.size + 4, patched.size)
        assertEquals("$where: Facebook's code up to the return stays", original.take(end).map { it.opcode },
            patched.take(end).map { it.opcode })
        assertEquals("$where: the flag is read back", Opcode.IGET_BOOLEAN, patched[end].opcode)
        assertEquals("$where: the flag is read back", field, patched[end].reference())
        assertEquals("$where: from the state, into the borrowed register", listOf(free, state),
            (patched[end] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals("$where: the extension is asked with a range call", Opcode.INVOKE_STATIC_RANGE, patched[end + 1].opcode)
        assertEquals("$where: the extension is asked", OPEN_REPLY_THREADS, patched[end + 1].reference())
        val range = patched[end + 1] as RegisterRangeInstruction
        assertEquals("$where: with the flag it was handed", listOf(free, 1), listOf(range.startRegister, range.registerCount))
        assertEquals("$where: its answer is kept", Opcode.MOVE_RESULT, patched[end + 2].opcode)
        assertEquals("$where: its answer is kept", free, (patched[end + 2] as OneRegisterInstruction).registerA)
        assertEquals("$where: and written back", Opcode.IPUT_BOOLEAN, patched[end + 3].opcode)
        assertEquals("$where: and written back", field, patched[end + 3].reference())
        assertEquals("$where: to the state", listOf(free, state),
            (patched[end + 3] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals("$where: then Facebook returns", Opcode.RETURN_VOID, patched[end + 4].opcode)
        assertEquals("$where: the code before the return runs into the hook", listOf(end), ControlFlow.of(method).normal[end - 1])
    }

    private fun comments(bundle: File) {
        val drawn = commentDraw(holders(bundle, COMMENT_SECTION))
        val render = drawn.render
        val where = "${bundle.name}: ${render.descriptor()}"
        assertEquals("$where: the props are a field of the section", render.definingClass, drawn.props.definingClass)
        assertEquals("$where: the comment is read off the props", drawn.props.type, drawn.comment.definingClass)
        assertEquals("$where: the comment is read as an Object", "Ljava/lang/Object;", drawn.comment.type)

        val section = FixtureDex.classes(bundle, setOf(render.definingClass)).values.single()
        val context = PatchContexts.of(listOf(section))
        val method = context.mutableClassDefBy(section.type).methods.single { it.descriptor() == render.descriptor() }
        val original = method.implementation!!.instructions.toList()
        val self = method.implementation!!.registerCount - 2
        method.hideComments(drawn)
        val patched = method.implementation!!.instructions.toList()
        val props = drawn.props.let { "${it.definingClass}->${it.name}:${it.type}" }
        val comment = drawn.comment.let { "${it.definingClass}->${it.name}:${it.type}" }
        assertEquals("$where: the hook's shape", listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.IF_EQZ,
            Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4,
            Opcode.RETURN_OBJECT), patched.take(9).map { it.opcode })
        assertEquals("$where gains nine instructions", original.size + 9, patched.size)
        assertEquals("$where: the section is copied into v0", listOf(0, self),
            (patched[0] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals("$where: the props are read off it", listOf(0, 0),
            (patched[1] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals("$where: the props are read", props, patched[1].reference())
        assertEquals("$where: then the comment off them", comment, patched[3].reference())
        assertEquals("$where: the extension is asked", HIDES_COMMENT, patched[4].reference())
        assertTrue("$where: the hook writes v0, which isn't a local", method.localRegisterCount() > 0)
        assertEquals("$where: Facebook's code stays", original.map { it.opcode }, patched.drop(9).map { it.opcode })
        val flow = ControlFlow.of(method)
        assertEquals("$where: no props go on to Facebook's first instruction", setOf(3, 9), flow.normal[2].toSet())
        assertEquals("$where: a no goes on to Facebook's first instruction", setOf(7, 9), flow.normal[6].toSet())
    }

    private fun replyLists(bundle: File) {
        val found = replyList(holders(bundle, EXPANDED_REPLIES), holders(bundle, COMMENT_LIST))
        val build = found.build
        val flag = found.flag
        val where = "${bundle.name}: ${build.descriptor()}"
        assertEquals("$where: the flag is a boolean", "Z", flag.type)
        assertNotEquals("$where: the flag sits on the list, not the thread's section", build.definingClass, flag.definingClass)

        val thread = FixtureDex.classes(bundle, setOf(build.definingClass)).values.single()
        val context = PatchContexts.of(listOf(thread))
        val method = context.mutableClassDefBy(thread.type).methods.single { it.descriptor() == build.descriptor() }
        val original = method.implementation!!.instructions.toList()
        val write = found.write
        val put = original[write] as TwoRegisterInstruction
        assertEquals("$where: the flag is written", Opcode.IPUT_BOOLEAN, original[write].opcode)
        val literal = (write - 1 downTo 0).map { original[it] }.firstOrNull {
            it is OneRegisterInstruction && it.registerA == put.registerA && it.opcode.setsRegister()
        }
        assertTrue("$where: Facebook writes the flag false, from a literal 0",
            literal?.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16) &&
                (literal as NarrowLiteralInstruction).narrowLiteral == 0)

        method.loadWholeReplyThreads(found)
        val patched = method.implementation!!.instructions.toList()
        val field = "${flag.definingClass}->${flag.name}:${flag.type}"
        assertEquals("$where gains two instructions", original.size + 2, patched.size)
        assertEquals("$where: Facebook's code before the write stays", original.take(write).opcodes(),
            patched.take(write).opcodes())
        assertEquals("$where: the extension is asked with a range call", Opcode.INVOKE_STATIC_RANGE, patched[write].opcode)
        assertEquals("$where: the extension is asked", LOAD_WHOLE_REPLY_THREADS, patched[write].reference())
        val range = patched[write] as RegisterRangeInstruction
        assertEquals("$where: with the value Facebook gives the flag", listOf(put.registerA, 1),
            listOf(range.startRegister, range.registerCount))
        assertEquals("$where: its answer replaces the value", Opcode.MOVE_RESULT, patched[write + 1].opcode)
        assertEquals("$where: its answer replaces the value", put.registerA, (patched[write + 1] as OneRegisterInstruction).registerA)
        assertEquals("$where: then Facebook writes the flag", field, patched[write + 2].reference())
        assertEquals("$where: from the same registers", listOf(put.registerA, put.registerB),
            (patched[write + 2] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals("$where: Facebook's code after the write stays", original.drop(write).opcodes(),
            patched.drop(write + 2).opcodes())
        assertEquals("$where: the code before the hook runs into it", listOf(write), ControlFlow.of(method).normal[write - 1])
    }

    private fun replyRow(bundle: File, name: String): ReplyRowTap = hookedRow(bundle, replyRowTap(holders(bundle, name), name))

    private fun hookedRow(bundle: File, found: ReplyRowTap): ReplyRowTap {
        val render = found.render
        val where = "${bundle.name}: ${render.descriptor()}"
        val row = FixtureDex.classes(bundle, setOf(render.definingClass)).values.single()
        val context = PatchContexts.of(listOf(row))
        val method = context.mutableClassDefBy(row.type).methods.single { it.descriptor() == render.descriptor() }
        val original = method.implementation!!.instructions.toList()
        val kept = found.kept
        assertEquals("$where: Facebook's answer is kept", Opcode.MOVE_RESULT, original[kept].opcode)
        assertEquals("$where: in the flag's register", found.flag, (original[kept] as OneRegisterInstruction).registerA)
        val checks = original.indices.filter {
            original[it].opcode == Opcode.IF_EQZ && (original[it] as OneRegisterInstruction).registerA == found.flag
        }
        assertTrue("$where: the flag is checked on both sides of the tap target", checks.size >= 2)

        method.tapWholeReplyRow(found)
        val patched = method.implementation!!.instructions.toList()
        assertEquals("$where gains two instructions", original.size + 2, patched.size)
        assertEquals("$where: Facebook's code up to its answer stays", original.take(kept + 1).opcodes(),
            patched.take(kept + 1).opcodes())
        assertEquals("$where: the extension is asked with a range call", Opcode.INVOKE_STATIC_RANGE, patched[kept + 1].opcode)
        assertEquals("$where: the extension is asked", VIEW_MORE_REPLIES_TEXT_ONLY, patched[kept + 1].reference())
        val range = patched[kept + 1] as RegisterRangeInstruction
        assertEquals("$where: with Facebook's answer", listOf(found.flag, 1), listOf(range.startRegister, range.registerCount))
        assertEquals("$where: its answer replaces Facebook's", Opcode.MOVE_RESULT, patched[kept + 2].opcode)
        assertEquals("$where: its answer replaces Facebook's", found.flag, (patched[kept + 2] as OneRegisterInstruction).registerA)
        assertEquals("$where: Facebook's code after its answer stays", original.drop(kept + 1).opcodes(),
            patched.drop(kept + 3).opcodes())
        assertEquals("$where: Facebook's answer runs into the hook", listOf(kept + 1), ControlFlow.of(method).normal[kept])
        return found
    }

    private fun viewer(bundle: File) {
        val name = bundle.name
        val found = viewerButtons(holders(bundle, VIEWER_GIF))
        val render = found.render
        val where = "$name: ${render.descriptor()}"
        assertTrue("$where: the hook's register is a button's", found.free != found.sticker && found.free != found.gif)
        assertTrue("$where: the hook's register isn't local", found.free < render.localRegisterCount())

        val bar = FixtureDex.classes(bundle, setOf(render.definingClass)).values.single()
        val context = PatchContexts.of(listOf(bar))
        val method = context.mutableClassDefBy(bar.type).methods.single { it.descriptor() == render.descriptor() }
        val original = method.implementation!!.instructions.toList()
        val at = found.at
        assertEquals("$where: the hook follows a kept button", Opcode.MOVE_RESULT_OBJECT, original[at - 1].opcode)

        method.holdViewerButtons(found)
        val patched = method.implementation!!.instructions.toList()
        assertEquals("$where gains five instructions", original.size + 5, patched.size)
        assertEquals("$where: Facebook's code up to the buttons stays", original.take(at).map { it.opcode },
            patched.take(at).map { it.opcode })
        assertEquals("$where: the extension is asked", HOLDS_VIEWER_BUTTONS, patched[at].reference())
        assertEquals("$where: its answer", found.free, (patched[at + 1] as OneRegisterInstruction).registerA)
        val check = patched[at + 2]
        assertEquals("$where: a no keeps the buttons", Opcode.IF_EQZ, check.opcode)
        assertEquals("$where: the check reads the answer", found.free, (check as OneRegisterInstruction).registerA)
        assertEquals("$where: and skips to Facebook's next instruction", at + 5,
            (check as BuilderOffsetInstruction).target.location.index)
        val cleared = listOf(patched[at + 3], patched[at + 4])
        assertTrue("$where: a yes clears with literal zeros", cleared.all {
            it.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16) && (it as NarrowLiteralInstruction).narrowLiteral == 0
        })
        assertEquals("$where: both buttons", setOf(found.sticker, found.gif),
            cleared.map { (it as OneRegisterInstruction).registerA }.toSet())
        assertEquals("$where: Facebook's code after the buttons stays", original.drop(at).map { it.opcode },
            patched.drop(at + 5).map { it.opcode })
    }

    private fun videoComposer(bundle: File) {
        val row = viewerButtons(holders(bundle, VIEWER_GIF)).render
        val render = videoCommentBar(holders(bundle, VIDEO_COMMENT_BAR), row)
        val where = "${bundle.name}: ${render.descriptor()}"
        assertNotEquals("$where: the bar was expected in another class than its button row",
            row.definingClass, render.definingClass)
        val bar = FixtureDex.classes(bundle, setOf(render.definingClass)).values.single()
        val context = PatchContexts.of(listOf(bar))
        val method = context.mutableClassDefBy(bar.type).methods.single { it.descriptor() == render.descriptor() }
        val original = method.implementation!!.instructions.toList()

        method.hideVideoCommentComposer()
        val patched = method.implementation!!.instructions.toList()
        assertEquals("$where gains five instructions", original.size + 5, patched.size)
        assertEquals("$where: the extension is asked first", HIDES_VIDEO_COMMENT_COMPOSER, patched[0].reference())
        assertEquals("$where: its answer", 0, (patched[1] as OneRegisterInstruction).registerA)
        assertEquals("$where: a no goes on to Facebook", Opcode.IF_EQZ, patched[2].opcode)
        assertEquals("$where: and lands on Facebook's first instruction", 5,
            (patched[2] as BuilderOffsetInstruction).target.location.index)
        assertEquals("$where: a yes returns nothing", listOf(Opcode.CONST_4, Opcode.RETURN_OBJECT),
            patched.subList(3, 5).map { it.opcode })
        assertEquals("$where: Facebook's code stays", original.map { it.opcode }, patched.drop(5).map { it.opcode })
    }

    @Test
    fun `each declared build keeps a feed post's inline comments out from under its buttons`() = bundles { bundle ->
        post(bundle)
    }

    @Test
    fun `each declared build can hide the full-screen video comment composer`() = bundles { bundle ->
        videoComposer(bundle)
    }

    @Test
    fun `each declared build keeps the GIF and sticker buttons out of the video viewer's comment bar`() = bundles { bundle ->
        viewer(bundle)
    }

    @Test
    fun `each declared build asks before View more replies picks which part of it takes a tap`() = bundles { bundle ->
        replyRow(bundle, VIEW_MORE_REPLIES)
    }

    @Test
    fun `each declared build asks before the View more replies row under a feed post picks which part of it takes a tap`() =
        bundles { bundle ->
            val row = replyRow(bundle, FEED_VIEW_MORE_REPLIES)
            val sheet = replyRowTap(holders(bundle, VIEW_MORE_REPLIES))
            assertTrue("${bundle.name}: the feed row isn't the comment sheet's", row.render.definingClass != sheet.render.definingClass)
            val sheetAsks = sheet.render.implementation!!.instructions.toList()[sheet.kept - 1].reference()
            val feedAsks = row.render.implementation!!.instructions.toList()[row.kept - 1].reference()
            assertEquals("${bundle.name}: both rows read the same server answer", sheetAsks, feedAsks)
        }

    @Test
    fun `each declared build asks before the View more replies pager under an open thread picks which part of it takes a tap`() =
        bundles { bundle ->
            val sheet = replyRowTap(holders(bundle, VIEW_MORE_REPLIES))
            val found = threadPagerTap(holders(bundle, COMMENT_LIST), sheet) { types -> FixtureDex.classes(bundle, types) }
            val pager = hookedRow(bundle, found)
            assertNotEquals("${bundle.name}: the pager isn't the View replies row", sheet.render.definingClass,
                pager.render.definingClass)
            val sheetAsks = sheet.render.implementation!!.instructions.toList()[sheet.kept - 1].reference()
            val pagerAsks = pager.render.implementation!!.instructions.toList()[pager.kept - 1].reference()
            assertEquals("${bundle.name}: both rows read the same server answer", sheetAsks, pagerAsks)
            val list = holders(bundle, COMMENT_LIST).single { holder ->
                holder.methods.any { it.name == "<init>" && holdsString(it, COMMENT_LIST) }
            }
            assertTrue("${bundle.name}: the thread's list makes the pager", list.methods.any { method ->
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.NEW_INSTANCE && it.reference() == pager.render.definingClass
                } == true
            })
        }

    @Test
    fun `each declared build asks before an open reply thread's list decides whether it pages on by itself`() = bundles { bundle ->
        replyLists(bundle)
    }

    @Test
    fun `each declared build asks about each comment before the comment section draws it`() = bundles { bundle ->
        comments(bundle)
    }

    @Test
    fun `each declared build opens every reply thread through the comment section's first state`() = bundles { bundle ->
        replies(bundle)
    }

    @Test
    fun `each declared build keeps Related groups out from under a post's comments`() = bundles { bundle ->
        bottom(bundle)
    }

    @Test
    fun `each declared build keeps the GIF and sticker buttons out and the reaction picker closed`() = bundles { bundle ->
        buttons(bundle)
        picker(bundle)
    }
}
