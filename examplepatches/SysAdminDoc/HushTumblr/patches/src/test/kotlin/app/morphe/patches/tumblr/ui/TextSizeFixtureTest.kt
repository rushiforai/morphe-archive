/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureTests
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.experimental.categories.Category

/** #23: Text size needs nothing from Tumblr's code, only the extension's hooks, and turns its switch on. */
@Category(FixtureTests::class)
class TextSizeFixtureTest {
    private val flags = listOf("textSize", "fontScale")

    @Test fun `Text size turns its switch on and touches nothing of Tumblr's`() {
        val context = PatchContexts.of(ExtensionDex.classes())
        assertFlags(context, 0)
        textSizePatch.execute(context)
        assertFlags(context, 1)
    }

    private fun assertFlags(context: BytecodePatchContext, expected: Int) {
        for (flag in flags) assertEquals(flag, expected, (context.mutableClassDefBy(SETTINGS_STATUS).methods.single {
            it.name == flag }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
}
