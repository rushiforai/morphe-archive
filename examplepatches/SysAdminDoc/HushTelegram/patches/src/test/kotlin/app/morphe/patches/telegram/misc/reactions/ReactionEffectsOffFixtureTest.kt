/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.reactions

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Test

/** The reaction effect overlay's entry and the runtime. */
class ReactionEffectsOffFixtureTest {
    @Test fun `the extension answers before the overlay starts and a no runs it as before`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { m ->
                AccessFlags.STATIC.isSet(m.accessFlags) && m.parameterTypes.size == 9 && m.controlBody().any { it.controlString() == ANIMATIONS_KEY }
            }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val show = context.resolveReactionEffectsOff()
            val old = ImmutableMethod.of(show)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { reactionEffectsOffPatch.execute(context) })

            val before = old.controlBody()
            val after = show.controlBody()
            assertEquals("$name: four instructions", before.size + 4, after.size)
            assertEquals("$REACTION_EFFECTS->skipped()Z", after[0].controlRef())
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), after.take(4).map { it.opcode })
            assertEquals(listOf(0), after[1].namedRegisters())
            assertEquals("$name: a no runs the stock overlay", listOf(3, 4), ControlFlow.of(show).normal[2].sorted())
            for (i in before.indices) {
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), (before[i] as? ReferenceInstruction)?.reference?.toString()),
                    listOf(after[i + 4].opcode, after[i + 4].namedRegisters(), (after[i + 4] as? ReferenceInstruction)?.reference?.toString()))
            }
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "reactionEffectsOff" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
