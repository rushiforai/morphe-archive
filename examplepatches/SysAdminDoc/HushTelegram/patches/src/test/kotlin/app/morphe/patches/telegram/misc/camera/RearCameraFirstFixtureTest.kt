/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.camera

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Test
import app.morphe.util.names.origRef
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

/** The attachment gallery's camera constructor and the runtime. */
class RearCameraFirstFixtureTest {
    @Test fun `the extension answers the lens before CameraView reads it`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { m ->
                m.origName == "<init>" && m.parameterTypes.map(CharSequence::toString) == ATTACH_CAMERA_PARAMETERS
            }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val camera = context.resolveRearCameraFirst()
            val old = ImmutableMethod.of(camera)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { rearCameraFirstPatch.execute(context) })

            val front = camera.parameterRegisterNumber(2)
            val before = old.controlBody()
            val after = camera.controlBody()
            assertEquals("$name: two instructions", before.size + 2, after.size)
            assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT), after.take(2).map { it.opcode })
            assertEquals(REAR_CAMERA_FRONT, after[0].controlRef())
            assertEquals("$name: the lens choice in and out", listOf(listOf(front), listOf(front)), after.take(2).map { it.namedRegisters() })
            assertEquals("$name: CameraView gets the answer", front, after.first { it.controlRef() == ATTACH_CAMERA_INIT }.namedRegisters()[2])
            for (i in before.indices) {
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), before[i].origRef()),
                    listOf(after[i + 2].opcode, after[i + 2].namedRegisters(), after[i + 2].origRef()))
            }
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "rearCameraFirst" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
