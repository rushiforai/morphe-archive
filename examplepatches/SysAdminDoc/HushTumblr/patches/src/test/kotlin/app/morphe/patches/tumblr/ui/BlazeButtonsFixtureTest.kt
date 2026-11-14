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
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.PatchLogCapture
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/**
 * Hide Blaze prompts' Blaze buttons on posts in each declared build: the show-Blaze getter of the
 * row under your own posts, the can-Blaze getter the post menus ask, the share sheet's can_blaze
 * test and a community post menu's list of items. Each gets its hook on the value Tumblr reads, with
 * the answer moved back into the same register, and Tumblr's own code is otherwise unchanged.
 */
@Category(FixtureTests::class)
class BlazeButtonsFixtureTest {
    @Test
    fun `each declared build hooks every Blaze button on posts`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + slice(build))
            val sites = context.resolveBlazeSites()
            assertEquals("${build.name}: one site per button, in order",
                listOf(OWN_POST_BLAZE_HOOK, POST_MENU_BLAZE_HOOK, SHARE_BLAZE_HOOK, COMMUNITY_MENU_HOOK), sites.map { it.hook })
            val (flame, menuItem, share, community) = sites
            for (getter in listOf(flame, menuItem)) {
                assertEquals("${build.name}: ${getter.hook} goes in front of the getter's return", 1, getter.at)
                assertEquals(build.name, listOf(Opcode.IGET_BOOLEAN, Opcode.RETURN), getter.method.instructionList().map { it.opcode })
                assertEquals(build.name, getter.register, (getter.method.instructionList()[0] as OneRegisterInstruction).registerA)
            }
            assertNotEquals("${build.name}: the row's flag and the post's flag are two getters",
                flame.method.definingClass, menuItem.method.definingClass)
            val asked = menuAskers(context)
            assertTrue("${build.name}: a post menu asks before it adds the Blaze item", asked.isNotEmpty())
            assertTrue("${build.name}: every post menu asks the hooked getter, $asked",
                asked.all { it == "${menuItem.method.definingClass}->${menuItem.method.name}()Z" })

            val shareBody = share.method.instructionList()
            assertEquals("${build.name}: the share sheet's hook goes in front of its test", Opcode.IF_EQZ, shareBody[share.at].opcode)
            assertEquals(build.name, Opcode.MOVE_RESULT, shareBody[share.at - 1].opcode)
            assertEquals(build.name, "getBoolean", shareBody[share.at - 2].methodRef()?.name)
            assertEquals(build.name, share.register, (shareBody[share.at] as OneRegisterInstruction).registerA)

            val communityBody = community.method.instructionList()
            assertEquals("${build.name}: the community hook takes the list as it's handed over",
                Opcode.MOVE_RESULT_OBJECT, communityBody[community.at - 1].opcode)
            assertEquals(build.name, community.register, (communityBody[community.at - 1] as OneRegisterInstruction).registerA)
            assertEquals(build.name, listOf(COMMUNITY_POST_INFO),
                communityBody[community.at - 2].methodRef()!!.parameterTypes.map(CharSequence::toString))

            val before = sites.map { it.method.instructionList().map { it.opcode } }

            val warnings = PatchLogCapture.warnings { hideBlazePromptsPatch.execute(context) }

            assertEquals("${build.name}: nothing refused", emptyList<String>(), warnings)
            for ((index, site) in sites.withIndex()) {
                val key = "${build.name}: ${site.method.definingClass}->${site.method.name}"
                val after = site.method.instructionList()
                assertEquals(key, Opcode.INVOKE_STATIC_RANGE, after[site.at].opcode)
                assertEquals(key, site.hook, after[site.at].methodRef().toString())
                assertEquals("$key: on the value Tumblr reads", listOf(site.register), after[site.at].namedRegisters())
                assertEquals(key, if (site.list) Opcode.MOVE_RESULT_OBJECT else Opcode.MOVE_RESULT, after[site.at + 1].opcode)
                assertEquals("$key: the answer goes back where Tumblr reads it", site.register,
                    (after[site.at + 1] as OneRegisterInstruction).registerA)
                assertEquals("$key: the rest is Tumblr's own code", before[index],
                    after.filterIndexed { at, _ -> at != site.at && at != site.at + 1 }.map { it.opcode })
            }
            for (flag in listOf("hideBlazePrompts", "blazePromptFlags", "blazeButtons")) assertEquals("${build.name}: $flag", 1, flag(context, flag))
        }
    }

    @Test
    fun `a build missing one of the four keeps every Blaze button on posts and the rest of the switch`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = slice(build).filterNot { it.methods.any { m -> m.listsCommunityItems() } }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val printers = classes.flatMap { it.methods }.filter { AUTHOR_ACTIONS_STATE in it.strings() }
            assertEquals("${build.name}: the row's state is still there", 1, printers.size)
            val state = printers.single().definingClass
            val before = context.mutableClassDefBy(state).methods.associate { it.toString() to it.instructionList().map { it.opcode } }

            val warnings = PatchLogCapture.warnings { hideBlazePromptsPatch.execute(context) }

            assertEquals(build.name, 1, warnings.size)
            assertTrue(warnings.single(), warnings.single().endsWith("so the Blaze buttons on posts stay"))
            for (method in context.mutableClassDefBy(state).methods)
                assertEquals("${build.name}: $method", before.getValue(method.toString()), method.instructionList().map { it.opcode })
            assertEquals("${build.name}: blazeButtons", 0, flag(context, "blazeButtons"))
            for (flag in listOf("hideBlazePrompts", "blazePromptFlags")) assertEquals("${build.name}: $flag", 1, flag(context, flag))
        }
    }

    /**
     * Each class that holds one of the four: the row state's printout, the post menus that read the
     * Blaze label, the share sheet, the community menu, plus the getter the menus ask and the
     * Promote item, which live in classes of their own.
     */
    private fun slice(build: File): List<ClassDef> {
        val classes = FixtureDex.classesWhere(build, { true }) { method ->
            val strings = method.strings()
            AUTHOR_ACTIONS_STATE in strings || CAN_BLAZE in strings ||
                method.instructionList().any { it.readsBlazeLabel() || it.castsTo(COMMUNITY_MENU_ITEM) }
        }
        val asked = classes.flatMap { it.methods }.flatMap { method ->
            val body = method.instructionList()
            body.indices.filter { body[it].readsBlazeLabel() && it >= 3 }.mapNotNull { body[it - 3].methodRef()?.definingClass }
        }.toSet()
        val have = classes.map { it.type }.toSet()
        return classes + FixtureDex.classes(build, asked + COMMUNITY_PROMOTE - have).values
    }

    /** Every getter a post menu asks, invoke-virtual then move-result then if-eqz, right before it reads the Blaze label. */
    private fun menuAskers(context: BytecodePatchContext): Set<String> {
        val asked = mutableSetOf<String>()
        context.classDefForEach { owner ->
            for (method in owner.methods) {
                val body = method.instructionList()
                for (at in body.indices) {
                    if (!body[at].readsBlazeLabel() || at < 3) continue
                    if (body[at - 3].opcode != Opcode.INVOKE_VIRTUAL || body[at - 2].opcode != Opcode.MOVE_RESULT ||
                        body[at - 1].opcode != Opcode.IF_EQZ) continue
                    val getter = body[at - 3].methodRef() ?: continue
                    if (getter.parameterTypes.isEmpty() && getter.returnType == "Z") asked += "${getter.definingClass}->${getter.name}()Z"
                }
            }
        }
        return asked
    }

    private fun flag(context: BytecodePatchContext, name: String): Int {
        val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.first()
        return (first as NarrowLiteralInstruction).narrowLiteral
    }

    private fun Instruction.readsBlazeLabel(): Boolean =
        opcode == Opcode.SGET && fieldRef()?.let { it.definingClass == CORE_STRINGS && it.name == BLAZE_MENU_LABEL } == true

    private fun Instruction.castsTo(type: String): Boolean =
        opcode == Opcode.CHECK_CAST && ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type == type

    private fun Method.listsCommunityItems(): Boolean = instructionList().any { instruction ->
        instruction.opcode == Opcode.INVOKE_INTERFACE &&
            instruction.methodRef()?.parameterTypes?.map(CharSequence::toString) == listOf(COMMUNITY_POST_INFO)
    }
}
