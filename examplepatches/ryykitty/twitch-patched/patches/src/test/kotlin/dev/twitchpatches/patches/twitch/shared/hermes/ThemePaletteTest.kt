package dev.twitchpatches.patches.twitch.shared.hermes

import org.junit.Assert.assertEquals
import org.junit.Test

class ThemePaletteTest {
    private fun dependency(result: Int) = listOf(
        HermesInstruction("GetByIndex", listOf(1, 2, 7)),
        HermesInstruction("Call2", listOf(result, 3, 4, 1)),
        HermesInstruction("GetById", listOf(6, 5, 0, 0)))

    @Test fun followsTheThemeImportRegister() {
        assertEquals(7, themePaletteDependency(dependency(5), listOf("darkTheme")))
    }

    @Test(expected = IllegalArgumentException::class) fun rejectsUnrelatedImports() {
        themePaletteDependency(dependency(8), listOf("darkTheme"))
    }
}
