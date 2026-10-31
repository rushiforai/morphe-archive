/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The full-screen player's top bar (#311): in each declared build ImmersiveActivity's
 * setPipChromeVisibility gives up the bar's id, and the extension's id stub answers it.
 */
class ViewerTopBarFixtureTest {
    @Test
    fun `each declared build's player screen hands the extension its top bar id`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val screen = FixtureDex.classes(bundle, setOf(IMMERSIVE_ACTIVITY))[IMMERSIVE_ACTIVITY]
                assertNotNull("$name: no $IMMERSIVE_ACTIVITY", screen)
                val id = topBarId(pipChromeVisibility(screen))
                assertEquals("$name: the top bar's id isn't an id resource", 0x7f0a, id ushr 16)

                val context = PatchContexts.of(listOf(screen!!, ExtensionDex.classDef(VIEWER_TOP_BAR)))
                context.hideViewerTopButtons()
                val stub = context.mutableClassDefBy(VIEWER_TOP_BAR).methods.single { it.name == "barId" }
                val load = stub.implementation!!.instructions.first() as NarrowLiteralInstruction
                assertEquals("$name: barId() doesn't answer the bar's id", id, load.narrowLiteral)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun `a screen with no setPipChromeVisibility stops the patch`() {
        assertThrows(PatchException::class.java) { pipChromeVisibility(null) }
    }
}
