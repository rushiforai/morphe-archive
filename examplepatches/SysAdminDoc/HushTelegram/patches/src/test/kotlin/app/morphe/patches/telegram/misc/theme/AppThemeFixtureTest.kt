/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.theme

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.shared.misc.extension.EXTENSION_CLASS_DESCRIPTOR
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import com.android.tools.smali.dexlib2.Opcode
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

/**
 * The dialogs' theme on each declared build: exactly one method is ThemeInfo.isDark, exactly one is
 * Theme.isCurrentThemeDark asking it, and the shared extension's stub ends up calling that one.
 */
class AppThemeFixtureTest {
    @Test
    fun `the dark mode stub asks Telegram's theme on each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val infos = FixtureDex.classesWhere(build, { true }) { isThemeInfoDark(it) }
            assertEquals("$name: one ThemeInfo.isDark", 1, infos.sumOf { info -> info.methods.count { isThemeInfoDark(it) } })
            val isDark = infos.single().methods.single { isThemeInfoDark(it) }
            val themes = FixtureDex.classesWhere(build, { true }) { asksCurrentThemeDark(it, isDark) }
            assertEquals("$name: one Theme.isCurrentThemeDark", 1,
                themes.sumOf { theme -> theme.methods.count { asksCurrentThemeDark(it, isDark) } })
            val check = themes.single().methods.single { asksCurrentThemeDark(it, isDark) }

            val context = PatchContexts.of(ExtensionDex.classes() + ExtensionDex.sharedClasses() +
                (infos + themes).distinctBy { it.type })
            assertEquals("$name: no warning", emptyList<String>(), PatchLogCapture.warnings { appThemePatch.execute(context) })
            val stub = context.tgMutableClassDefBy(EXTENSION_CLASS_DESCRIPTOR).methods.single { it.origName == APP_THEME_DARK }
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.RETURN), stub.controlBody().map { it.opcode })
            assertEquals("$name: the stub calls the theme check", "${check.definingClass}->${check.name}()Z",
                stub.controlBody()[0].controlRef())
        }
    }

    @Test
    fun `a build without the theme check patches on and keeps the phone's night mode`() {
        val context = PatchContexts.of(ExtensionDex.classes() + ExtensionDex.sharedClasses())
        val warnings = PatchLogCapture.warnings { appThemePatch.execute(context) }
        assertEquals(1, warnings.size)
        assertTrue(warnings.single(), warnings.single().startsWith("Dialogs:"))
        val stub = context.tgMutableClassDefBy(EXTENSION_CLASS_DESCRIPTOR).methods.single { it.origName == APP_THEME_DARK }
        assertEquals("the stub still answers unknown", listOf(Opcode.CONST_4, Opcode.RETURN), stub.controlBody().map { it.opcode })
    }
}
