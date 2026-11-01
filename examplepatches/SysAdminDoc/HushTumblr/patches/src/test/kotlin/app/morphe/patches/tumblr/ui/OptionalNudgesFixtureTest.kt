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
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.patches.tumblr.misc.extension.localRegisterCount
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category
import java.io.File

@Category(FixtureTests::class)
class OptionalNudgesFixtureTest {
    private val headerTypes = setOf("Lcom/tumblr/ui/fragment/BlogHeaderFragment;",
        "Lcom/tumblr/ui/fragment/BlogHeaderLegacyFragment;", "Lcom/tumblr/ui/widget/c;", "Lcom/tumblr/ui/widget/a;")
    private val flags = listOf("hideBlogNotificationReminders", "blogNotificationReminder", "hideGiftMessagePopups", "giftMessagePopup")

    private fun hosts(build: File): List<ClassDef> = FixtureDex.classes(build, headerTypes).values.toList() +
        FixtureDex.classesWhere(build, { true }) { BLOG_NOTIFY_ENABLED in it.strings() || GIFT_POPUP_SEEN in it.strings() }

    @Test fun `only the reminder decision and keyed renderer change while deliberate actions stay native`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val reminder = context.resolveBlogNotificationReminder()
            val gift = context.resolveGiftPopup()
            val before = classes.flatMap { it.methods }.associate { it.toString() to it.instructionList().map(::fingerprint) }
            val reminderBefore = reminder.instructionList().map(::fingerprint)
            val giftBefore = gift.renderer.instructionList().map(::fingerprint)
            assertEquals("the exact reminder target", "Lrs2;->l()Z", reminder.toString())
            assertEquals("the exact shared renderer", "Lfr9;->h(Landroid/app/Activity;Landroid/view/View;FLandroid/view/View\$OnClickListener;)V", gift.renderer.toString())
            val schedules = classes.flatMap { it.methods }.filter { method -> method.instructionList().any {
                it.fieldRef()?.let { f -> f.definingClass == "Lcom/tumblr/R\$string;" && f.name == "ad_free_browsing_gift_message" } == true
            } }
            assertEquals(2, schedules.size)
            for (schedule in schedules) {
                assertTrue(schedule.toString(), schedule.instructionList().any { it.fieldRef()?.name == "GIVE_GIFT" })
                assertTrue(schedule.toString(), schedule.instructionList().any { it.methodRef()?.let { call ->
                    call.definingClass == "Landroid/os/Handler;" && call.name == "postDelayed" } == true })
            }
            hideBlogNotificationRemindersPatch.execute(context)
            hideGiftMessagePopupsPatch.execute(context)
            val reminderBody = reminder.instructionList()
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN),
                reminderBody.take(5).map { it.opcode })
            assertEquals(BLOG_REMINDER_HOOK, reminderBody[0].methodRef().toString())
            assertEquals(0, (reminderBody[3] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(5, target(reminderBody, 2))
            assertEquals(reminderBefore, reminderBody.drop(5).map(::fingerprint))
            val giftBody = gift.renderer.instructionList()
            assertEquals(listOf(Opcode.INVOKE_VIRTUAL_RANGE, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC,
                Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), giftBody.take(6).map { it.opcode })
            assertEquals(gift.keyGetter.toString(), giftBody[0].methodRef().toString())
            assertEquals(listOf(gift.renderer.localRegisterCount()), giftBody[0].namedRegisters())
            assertEquals(GIFT_POPUP_HOOK, giftBody[2].methodRef().toString())
            assertEquals(listOf(0), giftBody[2].namedRegisters())
            assertEquals(6, target(giftBody, 4))
            assertEquals(giftBefore, giftBody.drop(6).map(::fingerprint))
            val edited = setOf(reminder.toString(), gift.renderer.toString())
            for (owner in classes) for (method in context.mutableClassDefBy(owner.type).methods) {
                if (method.toString() !in edited) assertEquals("${build.name}: keep $method", before.getValue(method.toString()),
                    method.instructionList().map(::fingerprint))
            }
            // The menu and popup click may open gifting through these launchers. Neither passes the renderer.
            for (owner in classes.filter { it.type in headerTypes }) {
                val deliberate = owner.methods.filter { "gift" in it.strings() &&
                    it.instructionList().any { instruction -> instruction.methodRef()?.name == "startActivity" } }
                if (owner.type.contains("BlogHeader")) assertEquals(1, deliberate.size)
                for (method in deliberate) assertFalse(method.toString(),
                    context.mutableOf(method).instructionList().any { it.methodRef()?.toString() == GIFT_POPUP_HOOK })
            }
            assertFlags(context, 1)
        }
    }

    @Test fun `a preference lookalike without the native read refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val decision = context.resolveBlogNotificationReminder()
            val read = decision.instructionList().indexOfFirst { it.methodRef()?.definingClass == "Lcom/tumblr/Remember;" }
            decision.replaceInstruction(read, "nop")
            val before = decision.instructionList().map(::fingerprint)
            assertThrows(PatchException::class.java) { hideBlogNotificationRemindersPatch.execute(context) }
            assertEquals(before, decision.instructionList().map(::fingerprint))
            assertFlags(context, 0)
        }
    }

    @Test fun `a generic popup without separate gift and crab keys cannot bind`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveGiftPopup()
            val keys = context.mutableClassDefBy(plan.renderer.definingClass).methods.single { CRAB_POPUP_SEEN in it.strings() }
            keys.replaceInstruction(keys.instructionList().indexOfFirst { it.stringRef() == CRAB_POPUP_SEEN },
                "const-string v0, \"another_popup\"")
            val before = plan.renderer.instructionList().map(::fingerprint)
            assertThrows(PatchException::class.java) { hideGiftMessagePopupsPatch.execute(context) }
            assertEquals(before, plan.renderer.instructionList().map(::fingerprint))
            assertFlags(context, 0)
        }
    }

    @Test fun `a renderer calling an unrelated string getter refuses instead of guessing a gift key`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveGiftPopup()
            val at = plan.renderer.instructionList().indexOfFirst { it.methodRef()?.toString() == plan.keyGetter.toString() }
            plan.renderer.replaceInstruction(at, "invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;")
            val before = plan.renderer.instructionList().map(::fingerprint)
            assertThrows(PatchException::class.java) { hideGiftMessagePopupsPatch.execute(context) }
            assertEquals(before, plan.renderer.instructionList().map(::fingerprint))
            assertFlags(context, 0)
        }
    }

    private fun assertFlags(context: BytecodePatchContext, expected: Int) {
        for (flag in flags) assertEquals(flag, expected, (context.mutableClassDefBy(SETTINGS_STATUS).methods.single {
            it.name == flag }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }

    private fun target(body: List<Instruction>, at: Int): Int {
        val address = body.take(at).sumOf { it.codeUnits } + (body[at] as OffsetInstruction).codeOffset
        return body.indices.single { body.take(it).sumOf { instruction -> instruction.codeUnits } == address }
    }

    private fun fingerprint(instruction: Instruction): String = listOf(instruction.opcode, instruction.namedRegisters(),
        instruction.methodRef()?.toString(), instruction.fieldRef()?.toString(), instruction.stringRef(),
        (instruction as? NarrowLiteralInstruction)?.narrowLiteral, (instruction as? OffsetInstruction)?.codeOffset).toString()
}
