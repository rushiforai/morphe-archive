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
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** The attachment gallery's constructor, the camera choice it keeps and the runtime. */
class HideGalleryCameraTileFixtureTest {
    @Test fun `the extension answers the camera choice before the gallery keeps it`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { m -> m.definingClass == PHOTO_LAYOUT }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val site = context.resolveHideGalleryCameraTile()
            val old = ImmutableMethod.of(site.init)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideGalleryCameraTilePatch.execute(context) })

            val wanted = site.init.parameterRegisterNumber(3)
            val before = old.controlBody()
            val after = site.init.controlBody()
            assertEquals("$name: two instructions", before.size + 2, after.size)
            assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT), after.take(2).map { it.opcode })
            assertEquals(GALLERY_CAMERA_TILE_ASK, after[0].controlRef())
            assertEquals("$name: the camera choice in and out", listOf(listOf(wanted), listOf(wanted)), after.take(2).map { it.namedRegisters() })
            assertTrue("$name: the gallery keeps a camera choice field", after.any { it.opcode == Opcode.IPUT_BOOLEAN && it.controlField() == site.needCamera })
            for (i in before.indices) {
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), (before[i] as? ReferenceInstruction)?.reference?.toString()),
                    listOf(after[i + 2].opcode, after[i + 2].namedRegisters(), (after[i + 2] as? ReferenceInstruction)?.reference?.toString()))
            }
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideGalleryCameraTile" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
