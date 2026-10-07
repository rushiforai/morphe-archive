/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.haptics

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** Every haptic and vibrator call outside calls, the ringing that stays, and the runtime. */
class NoHapticsFixtureTest {
    @Test fun `every buzz outside calls asks the extension with the same registers`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { m -> m.controlBody().any { it.controlRef() in HAPTIC_CALLS } }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val site = context.resolveNoHaptics()
            val before = site.calls.associate { (m, indices) -> key(m) to indices.map { i -> m.controlBody()[i].let { it.controlRef() to it.namedRegisters() } } }
            val taps = before.values.flatten().count { it.first!!.startsWith("Landroid/view/View;") }
            val buzzes = before.values.flatten().count { it.first!!.startsWith("Landroid/os/Vibrator;") }
            assertTrue("$name: $taps taps", taps >= 200)
            assertTrue("$name: $buzzes buzzes", buzzes >= 15)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { noHapticsPatch.execute(context) })

            for ((method, indices) in site.calls) {
                val body = method.controlBody()
                assertEquals("$name: ${key(method)}", before.getValue(key(method)).map { (ref, registers) -> HAPTIC_CALLS.getValue(ref!!) to registers },
                    indices.map { body[it].controlRef() to body[it].namedRegisters() })
                assertTrue(indices.all { body[it].opcode == Opcode.INVOKE_STATIC || body[it].opcode == Opcode.INVOKE_STATIC_RANGE })
            }
            val left = hosts.filter { !it.type.startsWith("Lapp/hushtelegram/") }.flatMap { cls ->
                context.mutableClassDefBy(cls.type).methods.filter { m ->
                    m.controlBody().any { (it.opcode == Opcode.INVOKE_VIRTUAL || it.opcode == Opcode.INVOKE_VIRTUAL_RANGE) && it.controlRef() in HAPTIC_CALLS }
                }.map { cls.type }
            }.toSet()
            assertTrue("$name: only calls still vibrate directly, not $left", left.isNotEmpty() && left.all { it.startsWith(VOIP) })
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "noHaptics" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    private fun key(m: com.android.tools.smali.dexlib2.iface.Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
}
