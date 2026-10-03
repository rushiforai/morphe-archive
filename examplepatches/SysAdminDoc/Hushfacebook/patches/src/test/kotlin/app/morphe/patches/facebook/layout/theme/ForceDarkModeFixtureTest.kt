/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

/**
 * Force dark mode on each declared build (#64): the patch alone puts the extension before each
 * return of Facebook's dark mode controller, the place Meta's end-to-end switch answers dark, and
 * switches its status on. With a theme's hook already there it adds none, so the extension sees each
 * answer once. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class ForceDarkModeFixtureTest {
    @Before
    @After
    fun forgetMatches() {
        DarkModeFingerprint.clearMatch()
    }

    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    private fun bundles(version: String) = Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.reference(): String? = (this as? ReferenceInstruction)?.reference?.toString()

    @Test
    fun `the patch hooks each return of the dark mode answer once and switches its status on, on each declared build`() {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in bundles(version)) {
                val name = bundle.name
                val controller = FixtureDex.classesHolding(bundle, E2E_DARK_MODE).single()
                val answer = controller.methods.single { holdsString(it, E2E_DARK_MODE) }
                val returns = answer.body().count { it.opcode == Opcode.RETURN }
                fun hooked(context: BytecodePatchContext) = context.mutableClassDefBy(controller.type)
                    .methods.single { it.name == answer.name && it.returnType == "Z" && it.parameterTypes.isEmpty() }.body()

                forgetMatches()
                val alone = PatchContexts.of(listOf(controller, ExtensionDex.classDef(SETTINGS_STATUS)))
                forceDarkModePatch.execute(alone)
                assertEquals("$name: one hook per return", returns, hooked(alone).count { it.reference() == DARK_MODE_ANSWER })
                val status = alone.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "forceDarkMode" }
                assertEquals("$name: SettingsStatus.forceDarkMode() isn't switched on", 1,
                    (status.body()[0] as NarrowLiteralInstruction).narrowLiteral)

                forgetMatches()
                val withTheme = PatchContexts.of(listOf(controller, ExtensionDex.classDef(SETTINGS_STATUS)))
                with(withTheme) { hookDarkModeAnswer() }
                forgetMatches()
                forceDarkModePatch.execute(withTheme)
                assertEquals("$name: a theme's hook is shared, not doubled", returns,
                    hooked(withTheme).count { it.reference() == DARK_MODE_ANSWER })
                assertTrue("$name: the answer has returns to hook", returns > 0)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private companion object {
        const val E2E_DARK_MODE = "fb.e2e.enable_dark_mode"
    }
}
