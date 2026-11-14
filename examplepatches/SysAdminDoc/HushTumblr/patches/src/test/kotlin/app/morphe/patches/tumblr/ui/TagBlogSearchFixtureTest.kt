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
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category
import java.io.File

/**
 * The tag listener a post card's tags are built with, in each declared build: its screen question
 * gets the extension's answer right after Tumblr's own, everything else in `onClick` stays as
 * Tumblr wrote it, and the listener answers its blog's name through the extension's interface, or
 * null when Tumblr's own emptiness test would find no blog.
 */
@Category(FixtureTests::class)
class TagBlogSearchFixtureTest {
    /** The tag drawer, the blog model, and every class built from a navigation state and a blog. */
    private fun classes(build: File): List<ClassDef> = FixtureDex.classesWhere(build, { true }) { method ->
        method.definingClass == WRAPPED_TAGS || method.definingClass == TAG_BLOG_INFO ||
            method.name == "<init>" && method.parameterTypes.map { it.toString() } == listOf(TAG_NAVIGATION, TAG_BLOG_INFO)
    }

    @Test
    fun `each declared build asks the extension after the tag listener's screen question`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + classes(build))
            val plan = context.resolveTagBlogSearch()
            val identity = "${build.name}: ${plan.listener}->onClick"
            val stock = plan.click.instructionList().map(::fingerprint)
            val question = plan.click.instructionList()[plan.hookAt - 2]
            val answer = (plan.click.instructionList()[plan.hookAt - 1] as OneRegisterInstruction).registerA
            val self = plan.click.implementation!!.registerCount - 2

            tagBlogSearchPatch.execute(context)

            val listener = context.mutableClassDefBy(plan.listener)
            val body = listener.methods.single { it.name == "onClick" }.instructionList()
            assertEquals("$identity: the screen question is still Tumblr's", fingerprint(question), fingerprint(body[plan.hookAt - 2]))
            assertEquals("$identity: the extension is asked", BLOG_SCREEN_HOOK, body[plan.hookAt].methodRef()?.let {
                "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" })
            assertEquals("$identity: on Tumblr's answer and the listener", listOf(answer, self), body[plan.hookAt].namedRegisters())
            assertEquals(identity, Opcode.MOVE_RESULT, body[plan.hookAt + 1].opcode)
            assertEquals("$identity: its answer replaces Tumblr's", answer, (body[plan.hookAt + 1] as OneRegisterInstruction).registerA)
            val kept = body.filterIndexed { at, _ -> at != plan.hookAt && at != plan.hookAt + 1 }.map(::fingerprint)
            assertEquals("$identity: every other instruction is Tumblr's own", stock.withoutNops(), kept.withoutNops())

            assertTrue("$identity: the listener answers the extension", HUSH_TAG_BLOG in listener.interfaces)
            val bridge = listener.methods.single { it.name == TAG_BLOG_NAME }
            assertEquals(identity, "Ljava/lang/String;", bridge.returnType)
            val bridged = bridge.instructionList()
            assertEquals(
                "$identity: the bridge's shape",
                listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.INVOKE_VIRTUAL,
                    Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT, Opcode.CONST_4, Opcode.RETURN_OBJECT),
                bridged.map { it.opcode },
            )
            val field = bridged[0].fieldRef()!!
            assertEquals("$identity: the bridge reads the listener's blog", plan.listener to TAG_BLOG_INFO, field.definingClass to field.type)
            assertTrue("$identity: the field onClick reads for Tumblr's own blog search", body.any {
                it.opcode == Opcode.IGET_OBJECT && it.fieldRef()?.toString() == field.toString() })
            val empty = bridged[1].methodRef()!!
            assertEquals("$identity: Tumblr's emptiness test", TAG_BLOG_INFO, empty.definingClass)
            assertTrue("$identity: onClick makes that test", body.any { it.methodRef()?.toString() == empty.toString() })
            val name = bridged[4].methodRef()!!
            assertEquals("$identity: the blog's name", TAG_BLOG_INFO, name.definingClass)
            assertEquals(identity, "Ljava/lang/String;", name.returnType)
            assertEquals("$identity: an empty blog answers null", 0, (bridged[7] as NarrowLiteralInstruction).narrowLiteral)

            assertSwitchedOn(context, build.name, "tagBlogSearch", "tagBlogLinks")
        }
    }

    @Test
    fun `a listener that's already bridged is refused before anything changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + classes(build))
            tagBlogSearchPatch.execute(context)
            val failure = assertThrows(PatchException::class.java) { context.resolveTagBlogSearch() }
            assertTrue(failure.message, failure.message!!.contains("already bridged"))
        }
    }

    private fun List<String>.withoutNops() = filterNot { it.startsWith("[NOP,") }

    /** An instruction without its branch offset, which the two added instructions move; a widened goto reads as a goto. */
    private fun fingerprint(i: Instruction): String = listOf(
        when (i.opcode) { Opcode.GOTO_16, Opcode.GOTO_32 -> Opcode.GOTO; else -> i.opcode },
        i.namedRegisters(), i.methodRef()?.toString(), i.fieldRef()?.toString(), i.stringRef(),
        (i as? NarrowLiteralInstruction)?.narrowLiteral,
    ).toString()

    /** Each of [flags] in the status class now answers true. */
    private fun assertSwitchedOn(context: BytecodePatchContext, build: String, vararg flags: String) {
        for (flag in flags) {
            val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }
                .implementation!!.instructions.first()
            assertEquals("$build: $flag", 1, (first as NarrowLiteralInstruction).narrowLiteral)
        }
    }
}
