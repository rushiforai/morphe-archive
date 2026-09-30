/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.tabbar

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.navigation.marketplaceonly.marketplaceOnlyPatch
import app.morphe.patches.facebook.navigation.reelstab.hideReelsTabPatch
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The patches that take tabs off Facebook's tab bar: each goes in through the one tab bar filter,
 * which puts the single call in the builder, and each turns on its own switch in the extension and
 * no other, so selecting one never runs the other's rule.
 */
class TabBarPatchesTest {
    @Test
    fun `each patch that drops tabs brings the one filter and turns on only its own switch`() {
        for ((patch, status) in listOf(marketplaceOnlyPatch to "marketplaceOnly", hideReelsTabPatch to "reelsTab")) {
            assertTrue("${patch.name} doesn't bring the tab bar filter", tabBarFilterPatch in patch.dependencies)

            val context = PatchContexts.of(listOf(ExtensionDex.classDef(SETTINGS_STATUS)))
            patch.execute(context)

            val answers = context.mutableClassDefBy(SETTINGS_STATUS).methods
                .filter { it.returnType == "Z" && it.parameterTypes.isEmpty() }
                .associate { method ->
                    val literal = method.implementation!!.instructions.first { it is NarrowLiteralInstruction }
                    method.name to (literal as NarrowLiteralInstruction).narrowLiteral
                }
            assertEquals("${patch.name}: the settings screen isn't told the patch is in", 1, answers[status])
            assertEquals("${patch.name} turns on another patch's switch", listOf(status),
                answers.filterValues { it != 0 }.keys.toList())
        }
    }
}
