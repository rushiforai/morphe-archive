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
                    ScreenshotSite.VIEWER -> List(3) { SCREENSHOTS_PROTECTED }
                    ScreenshotSite.STORY -> listOf(SCREENSHOTS_STORY)
                    else -> listOf(SCREENSHOTS_PROTECTED)
                }
                assertEquals("${build.name} $site", wanted, hooks.map { after[it].controlRef() })
                for (at in hooks) {
                    val invoke = after[at] as RegisterRangeInstruction
                    assertEquals(build.name, Opcode.INVOKE_STATIC_RANGE, after[at].opcode)
                    assertEquals(build.name, 1, invoke.registerCount)
                    assertEquals(build.name, Opcode.MOVE_RESULT, after[at + 1].opcode)
                    assertEquals(build.name, invoke.startRegister, (after[at + 1] as OneRegisterInstruction).registerA)
                    val next = after[at + 2]
                    when (site) {
                        ScreenshotSite.STORY -> assertEquals("${build.name}: the story's answer goes over first", 0, at)
                        ScreenshotSite.VIEWER -> {
                            assertEquals(build.name, Opcode.IF_NEZ, next.opcode)
                            assertEquals(build.name, invoke.startRegister, (next as OneRegisterInstruction).registerA)
                        }
                        else -> {
                            assertEquals(build.name, Opcode.IF_EQZ, next.opcode)
                            assertEquals(build.name, invoke.startRegister, (next as OneRegisterInstruction).registerA)
                        }
                    }
                }
                val without = after.indices.filter { it !in hooks && (it - 1) !in hooks }.map { operand(after[it]) }
                assertEquals("${build.name} $site: stock code stays", before[n], without)
            }
            // The secret chat check in each condition comes before its hook and is left as it was.
            for ((method, site) in plan.targets.filter { it.second == ScreenshotSite.CONDITION }) {
                val after = method.controlBody()
                val hook = after.indexOfFirst { it.controlRef() == SCREENSHOTS_PROTECTED }
                val secret = after.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.type == "Lorg/telegram/tgnet/TLRPC\$EncryptedChat;" }
                assertEquals("${build.name} $site", Opcode.IF_NEZ, after[secret + 1].opcode)
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
