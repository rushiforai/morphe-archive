/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * What resolveScreenshots walks: the secure window helper and its builders, their conditions and the
 * three screens. MessageMenuFixtureTest slices these in too, since the whole patch must not warn.
 */
internal fun Method.isScreenshotSlice(): Boolean {
    val code = implementation?.instructions ?: return false
    return code.any { i ->
        val ref = (i as? ReferenceInstruction)?.reference
        val text = ref?.toString().orEmpty()
        text == "Landroid/view/Window;->addFlags(I)V" || text == "Landroid/view/SurfaceView;->setSecure(Z)V" ||
            text == "Landroid/view/WindowManager\$LayoutParams;->flags:I" ||
            (ref is MethodReference && ref.name == "<init>" && ref.parameterTypes.firstOrNull()?.toString() == "Landroid/view/Window;") ||
            (name == "run" && ref is FieldReference && ref.type == "Lorg/telegram/tgnet/TLRPC\$EncryptedChat;") ||
            (name == "run" && ref is FieldReference && text == "Lorg/telegram/tgnet/TLRPC\$Message;->noforwards:Z")
    }
}

/** Every spot that blocks screen capture for protected content, in every declared build. */
class ScreenshotsFixtureTest {
    private fun operand(i: Instruction) = listOf(i.opcode, i.namedRegisters(), i.controlRef())

    @Test fun `each check hands its answer over right before Telegram acts on it, and the code is otherwise unchanged`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classesWhere(build, { true }) { it.isScreenshotSlice() }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val plan = context.resolveScreenshots()
            assertEquals("${build.name}: ${plan.missing}", null, plan.missing)
            assertEquals(build.name, listOf(ScreenshotSite.CONDITION, ScreenshotSite.CONDITION, ScreenshotSite.CELL,
                ScreenshotSite.VIEWER, ScreenshotSite.STORY, ScreenshotSite.TRANSLATE), plan.targets.map { it.second })
            val before = plan.targets.map { (method, _) -> method.controlBody().map(::operand) }
            plan.apply()
            plan.targets.forEachIndexed { n, (method, site) ->
                val after = method.controlBody()
                val hooks = after.indices.filter { after[it].controlRef()?.startsWith(SCREENSHOTS) == true }
                val wanted = when (site) {
                    ScreenshotSite.VIEWER -> List(3) { SCREENSHOTS_PROTECTED } + SCREENSHOTS_SECRET
                    ScreenshotSite.STORY -> listOf(SCREENSHOTS_STORY)
                    ScreenshotSite.CONDITION -> listOf(SCREENSHOTS_PROTECTED, SCREENSHOTS_SECRET)
                    else -> listOf(SCREENSHOTS_PROTECTED)
                }
                assertEquals("${build.name} $site", wanted.sorted(), hooks.mapNotNull { after[it].controlRef() }.sorted())
                val added = mutableSetOf<Int>()
                for (at in hooks) {
                    val invoke = after[at] as RegisterRangeInstruction
                    val secret = after[at].controlRef() == SCREENSHOTS_SECRET
                    assertEquals(build.name, Opcode.INVOKE_STATIC_RANGE, after[at].opcode)
                    assertEquals(build.name, 1, invoke.registerCount)
                    assertEquals(build.name, if (secret) Opcode.MOVE_RESULT_OBJECT else Opcode.MOVE_RESULT, after[at + 1].opcode)
                    assertEquals(build.name, invoke.startRegister, (after[at + 1] as OneRegisterInstruction).registerA)
                    added += listOf(at, at + 1)
                    if (secret) {
                        // Cast back, so the verifier still sees the secret chat Telegram read.
                        assertEquals(build.name, Opcode.CHECK_CAST, after[at + 2].opcode)
                        assertEquals(build.name, ENCRYPTED_CHAT, after[at + 2].controlRef())
                        assertEquals(build.name, invoke.startRegister, (after[at + 2] as OneRegisterInstruction).registerA)
                        added += at + 2
                    }
                    val next = after[if (secret) at + 3 else at + 2]
                    when {
                        site == ScreenshotSite.STORY -> assertEquals("${build.name}: the story's answer goes over first", 0, at)
                        site == ScreenshotSite.VIEWER || secret -> {
                            assertEquals(build.name, Opcode.IF_NEZ, next.opcode)
                            assertEquals(build.name, invoke.startRegister, (next as OneRegisterInstruction).registerA)
                        }
                        else -> {
                            assertEquals(build.name, Opcode.IF_EQZ, next.opcode)
                            assertEquals(build.name, invoke.startRegister, (next as OneRegisterInstruction).registerA)
                        }
                    }
                    if (secret) {
                        // Handed over straight from the secret chat field Telegram reads.
                        val read = after[at - 1]
                        assertEquals(build.name, Opcode.IGET_OBJECT, read.opcode)
                        assertEquals(build.name, ENCRYPTED_CHAT, ((read as ReferenceInstruction).reference as FieldReference).type)
                        assertEquals(build.name, invoke.startRegister, (read as OneRegisterInstruction).registerA)
                    }
                }
                val without = after.indices.filter { it !in added }.map { operand(after[it]) }
                assertEquals("${build.name} $site: stock code stays", before[n], without)
            }
            // In each condition the secret chat goes over first, then the chat's own answer.
            for ((method, site) in plan.targets.filter { it.second == ScreenshotSite.CONDITION }) {
                val after = method.controlBody()
                val hook = after.indexOfFirst { it.controlRef() == SCREENSHOTS_PROTECTED }
                val secret = after.indexOfFirst { it.controlRef() == SCREENSHOTS_SECRET }
                assertEquals("${build.name} $site", true, secret in 0 until hook)
            }
            // The message cell hands over the message's noforwards answer, read right before the hook.
            // Its paid media and view-once checks come after and are left as they were.
            val (cell, _) = plan.targets.single { it.second == ScreenshotSite.CELL }
            val after = cell.controlBody()
            val hook = after.indexOfFirst { it.controlRef() == SCREENSHOTS_PROTECTED }
            assertEquals(build.name, Opcode.IGET_BOOLEAN, after[hook - 1].opcode)
            assertEquals(build.name, "Lorg/telegram/tgnet/TLRPC\$Message;->noforwards:Z", after[hook - 1].controlRef())
            assertEquals(build.name, (after[hook - 1] as OneRegisterInstruction).registerA, (after[hook] as RegisterRangeInstruction).startRegister)
        }
    }
}
