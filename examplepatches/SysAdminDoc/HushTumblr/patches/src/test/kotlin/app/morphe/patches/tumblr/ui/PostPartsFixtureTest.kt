/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Test
import org.junit.experimental.categories.Category

/**
 * The tag drawer and the header's Follow button check in each declared build, and the question put
 * in front of each one's first instruction. On true the drawer gets an empty tag text and tag list
 * and the check answers yes; on false Tumblr's own code runs unchanged. Each patch then turns its
 * switch and its target on. The reblog trail's Follow button gets its entry back from the extension,
 * which hands it none while the switch is on.
 */
@Category(FixtureTests::class)
class PostPartsFixtureTest {
    @Test
    fun `each declared build hands the tag drawer no tags when asked to`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classesWhere(build, { true }) {
                it.definingClass == WRAPPED_TAGS || it.definingClass == VIDEO_HUB_TEXT
            }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val drawer = context.resolveTagDrawer()
            val identity = "${drawer.definingClass}->${drawer.name}"
            val before = drawer.instructionList().map { it.opcode }
            val text = drawer.parameterRegisterNumber(drawer.tagParameter("Ljava/lang/String;"))
            val list = drawer.parameterRegisterNumber(drawer.tagParameter("Ljava/util/List;"))
            val tv = context.resolveTvTags()
            val tvBefore = tv.method.instructionList().map { it.opcode }

            hideHashtagsPatch.execute(context)

            val body = context.mutableClassDefBy(drawer.definingClass).methods
                .single { it.name == drawer.name && it.parameterTypes == drawer.parameterTypes }
                .instructionList()
            assertEquals("$identity: five instructions added", before.size + 5, body.size)
            assertAsks(identity, HIDE_TAGS_HOOK, body)
            assertEquals("$identity: the tag text is emptied", Opcode.CONST_STRING, body[3].opcode)
            assertEquals(identity, text, (body[3] as OneRegisterInstruction).registerA)
            assertEquals(identity, "", body[3].stringRef())
            assertEquals("$identity: the tag list is emptied", Opcode.SGET_OBJECT, body[4].opcode)
            assertEquals(identity, list, (body[4] as OneRegisterInstruction).registerA)
            assertEquals(identity, EMPTY_LIST, body[4].fieldRef()?.let { "${it.definingClass}->${it.name}:${it.type}" })
            assertEquals("$identity: what follows is Tumblr's own code", before, body.drop(5).map { it.opcode })

            val where = "${tv.method.definingClass}->${tv.method.name}"
            val tvBody = context.mutableClassDefBy(tv.method.definingClass).methods
                .single { it.name == tv.method.name && it.parameterTypes == tv.method.parameterTypes }
                .instructionList()
            assertEquals("$where: four instructions added", tvBefore.size + 4, tvBody.size)
            assertEquals("$where: the extension is handed the tags", TV_TAGS_HOOK, tvBody[tv.at].methodRef()?.let {
                "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" })
            assertEquals(where, listOf(tv.register), tvBody[tv.at].namedRegisters())
            assertEquals("$where: its answer is the tags", Opcode.MOVE_RESULT_OBJECT, tvBody[tv.at + 1].opcode)
            assertEquals(where, tv.register, (tvBody[tv.at + 1] as OneRegisterInstruction).registerA)
            assertEquals("$where: right before the split", tv.register, tvBody[tv.at + 2].namedRegisters().first())

            // The label's two come after the line is written, behind the tag hook's two.
            val more = tv.moreAt + 2
            assertEquals("$where: right after the line is written", "setText", tvBody[more - 1].methodRef()?.name)
            assertEquals(where, tv.written, tvBody[more - 1].namedRegisters()[1])
            assertEquals("$where: the label is read into a free local", Opcode.IGET_OBJECT, tvBody[more].opcode)
            val read = tvBody[more] as TwoRegisterInstruction
            assertEquals(where, tv.scratch, read.registerA)
            assertEquals("$where: from the view itself", tv.self, read.registerB)
            assertEquals(where, tv.more, tvBody[more].fieldRef()?.let { "${it.definingClass}->${it.name}:${it.type}" })
            assertNotEquals("$where: the label isn't the line", tvBody[more - 2].fieldRef()?.name, tvBody[more].fieldRef()?.name)
            assertEquals("$where: the extension is handed the label and the line", TV_MORE_HOOK,
                tvBody[more + 1].methodRef()?.let {
                    "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" })
            assertEquals(where, listOf(tv.scratch, tv.written), tvBody[more + 1].namedRegisters())
            assertEquals("$where: Tumblr's own code around them", tvBefore,
                tvBody.filterIndexed { at, _ -> at !in setOf(tv.at, tv.at + 1, more, more + 1) }.map { it.opcode })
            assertSwitchedOn(context, build.name, "hideHashtags", "postTags")
        }
    }

    @Test
    fun `each declared build answers the header's Follow button check first thing when asked to`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + followClasses(build))
            val check = context.resolveFollowButtonCheck()
            val identity = "${check.definingClass}->${check.name}"
            val before = check.instructionList().map { it.opcode }

            hideFollowButtonPatch.execute(context)

            val body = context.mutableClassDefBy(check.definingClass).methods
                .single { it.name == check.name && it.parameterTypes == check.parameterTypes }
                .instructionList()
            assertEquals("$identity: five instructions added", before.size + 5, body.size)
            assertAsks(identity, HIDE_FOLLOW_HOOK, body)
            assertEquals("$identity: true answers yes", Opcode.CONST_4, body[3].opcode)
            assertEquals(identity, 1, (body[3] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(identity, Opcode.RETURN, body[4].opcode)
            assertEquals("$identity: the yes is what's returned",
                (body[3] as OneRegisterInstruction).registerA, (body[4] as OneRegisterInstruction).registerA)
            assertEquals("$identity: what follows is Tumblr's own code", before, body.drop(5).map { it.opcode })
            assertSwitchedOn(context, build.name, "hideFollowButton", "followButton")
        }
    }

    @Test
    fun `each declared build hands the reblog trail's Follow button its entry through the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + followClasses(build))
            val site = context.resolveTrailFollow()
            val shower = site.method
            val identity = "${shower.definingClass}->${shower.name}"
            assertEquals("$identity: it's handed the reblog header", true,
                shower.parameterTypes.any { it.toString() == REBLOG_HEADER })
            val entry = shower.parameterRegisterNumber(site.parameter)
            val before = shower.instructionList().map { it.opcode }

            hideFollowButtonPatch.execute(context)

            val body = context.mutableClassDefBy(shower.definingClass).methods
                .single { it.name == shower.name && it.parameterTypes == shower.parameterTypes }
                .instructionList()
            assertEquals("$identity: three instructions added", before.size + 3, body.size)
            assertEquals(identity, Opcode.INVOKE_STATIC, body[0].opcode)
            assertEquals("$identity: the extension is handed the entry", TRAIL_FOLLOW_HOOK, body[0].methodRef()?.let {
                "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" })
            assertEquals(identity, listOf(entry), body[0].namedRegisters())
            assertEquals("$identity: its answer is the entry", Opcode.MOVE_RESULT_OBJECT, body[1].opcode)
            assertEquals(identity, entry, (body[1] as OneRegisterInstruction).registerA)
            assertEquals("$identity: and keeps the entry's type", Opcode.CHECK_CAST, body[2].opcode)
            assertEquals(identity, entry, (body[2] as OneRegisterInstruction).registerA)
            assertEquals(identity, site.type, body[2].typeRef())
            assertEquals("$identity: what follows is Tumblr's own code", before, body.drop(3).map { it.opcode })
        }
    }

    /** The post card header, the reblog trail's header, and every class with a method handed one. */
    private fun followClasses(build: java.io.File) = FixtureDex.classesWhere(build, { true }) { method ->
        method.definingClass == POST_CARD_HEADER || method.definingClass == REBLOG_HEADER ||
            method.parameterTypes.any { it.toString() == REBLOG_HEADER }
    }

    /** The type a check-cast or new-instance names. */
    private fun Instruction.typeRef(): String? =
        ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

    /** The first three instructions ask [hook] and test its answer. */
    private fun assertAsks(identity: String, hook: String, body: List<Instruction>) {
        assertEquals(identity, Opcode.INVOKE_STATIC, body[0].opcode)
        assertEquals("$identity: the extension is asked", hook, body[0].methodRef()?.let {
            "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" })
        assertEquals(identity, Opcode.MOVE_RESULT, body[1].opcode)
        assertEquals(identity, Opcode.IF_EQZ, body[2].opcode)
        assertEquals("$identity: the answer is what's tested",
            (body[1] as OneRegisterInstruction).registerA, (body[2] as OneRegisterInstruction).registerA)
    }

    /** Each of [flags] in the status class now answers true. */
    private fun assertSwitchedOn(context: BytecodePatchContext, build: String, vararg flags: String) {
        for (flag in flags) {
            val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }
                .implementation!!.instructions.first()
            assertEquals("$build: $flag", 1, (first as NarrowLiteralInstruction).narrowLiteral)
        }
    }
}
