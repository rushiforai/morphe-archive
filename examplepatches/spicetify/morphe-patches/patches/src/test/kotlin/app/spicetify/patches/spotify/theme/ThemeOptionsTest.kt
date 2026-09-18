package app.spicetify.patches.spotify.theme

import app.morphe.patcher.patch.setOptions
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertThrows
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.ValueSource

class ThemeOptionsTest {
    @ParameterizedTest
    @ValueSource(strings = ["backgroundColor", "accentColor", "pressedAccentColor"])
    fun `invalid submitted colors reach execution validation instead of reverting to defaults`(key: String) {
        try {
            setOf(themePatch).setOptions(mapOf("Theme colors" to mapOf(key to "invalid")))

            assertEquals("invalid", themePatch.options[key].value)
            assertThrows(IllegalArgumentException::class.java) {
                ThemeColors(
                    themePatch.options["backgroundColor"].value as String,
                    themePatch.options["accentColor"].value as String,
                    themePatch.options["pressedAccentColor"].value as String,
                )
            }
        } finally {
            themePatch.options.values.forEach { it.reset() }
        }
    }
}
