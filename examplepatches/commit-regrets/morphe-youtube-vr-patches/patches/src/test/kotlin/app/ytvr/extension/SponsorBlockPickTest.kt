package app.ytvr.extension

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test

/**
 * The per-category behaviour precedence, now that the settings screen writes a String (a
 * ListPreference value) where it used to write a Boolean (a switch). Ported from the build/probe
 * `SbPickCheck` harness so it runs on every build.
 *
 * The screen has changed shape twice, so three sources are read in order: the picker's String, the
 * old switch (with the global "skip each segment only once" switch), then the behaviour baked into
 * the build. A wrong order here is silent -- the user picks something and the player does
 * something else -- so each step is asserted rather than assumed.
 */
class SponsorBlockPickTest {

    private fun resolve(
        picked: String?,
        legacySwitch: Boolean?,
        legacyOnce: Boolean?,
        baked: String?,
    ): String = SponsorBlockSettings.resolveBehaviour(picked, legacySwitch, legacyOnce, baked)

    @Test
    fun `nothing stored falls back to the baked default`() {
        assertEquals("skip-once", resolve(null, null, null, "skip-once"))
        assertEquals("skip-once", resolve("banana", null, null, "skip-once")) // junk falls through
        assertEquals("ignore", resolve(null, null, null, null)) // no baked default at all
    }

    @Test
    fun `the old switch is honoured where no picker value exists`() {
        assertEquals("skip", resolve(null, true, null, "skip-once"))
        assertEquals("skip-once", resolve(null, true, true, "seekbar-only"))
        assertEquals("ignore", resolve(null, false, true, "skip"))
    }

    @Test
    fun `the picker's value beats the switch`() {
        assertEquals("seekbar-only", resolve("seekbar-only", true, null, "skip"))
        assertEquals("skip", resolve("skip", false, null, "ignore"))
        assertEquals("manual-skip", resolve("manual-skip", null, null, "skip"))
        assertEquals("ignore", resolve("ignore", true, true, "skip"))
    }

    @Test
    fun `every behaviour the pickers can write round-trips`() {
        val writable = arrayOf("skip", "skip-once", "manual-skip", "seekbar-only", "ignore")
        for (behaviour in writable) {
            assertEquals(behaviour, resolve(behaviour, null, null, "skip"))
        }
    }

    /** Reads the two key prefixes back, so the crash guard cannot be edited away silently. */
    @Test
    fun `the picker key differs from the legacy switch key`() {
        val picker = SponsorBlockSettings::class.java.getDeclaredField("KEY_CATEGORY")
        val legacy = SponsorBlockSettings::class.java.getDeclaredField("KEY_LEGACY_CATEGORY")
        picker.isAccessible = true
        legacy.isAccessible = true
        val pickerKey = picker.get(null) as String
        val legacyKey = legacy.get(null) as String

        // A ListPreference reads its key with getString, and a Boolean left there by the switch
        // makes opening the screen throw ClassCastException (this shipped once).
        assertFalse(
            pickerKey.equals(legacyKey),
            "the picker key equals the legacy switch key: '$pickerKey' -- opening the screen " +
                "would throw Boolean-cannot-be-cast-to-String",
        )
    }

    @Test
    fun `stored old defaults migrate to the current map`() {
        // Chained, because a row can be two defaults behind (`skip` -> `seekbar-only` ->
        // `manual-skip`), and a wrong chain is silent: the viewer keeps a behaviour the screen
        // no longer shows as the default.
        assertEquals("skip-once", SponsorBlockSettings.migrateDefault("sponsor", "skip"))
        assertEquals("skip-once", SponsorBlockSettings.migrateDefault("sponsor", "skip-once"))
        assertEquals("manual-skip", SponsorBlockSettings.migrateDefault("selfpromo", "skip"))
        assertEquals("manual-skip", SponsorBlockSettings.migrateDefault("selfpromo", "seekbar-only"))
        assertEquals("manual-skip", SponsorBlockSettings.migrateDefault("music_offtopic", "ignore"))
        assertEquals("ignore", SponsorBlockSettings.migrateDefault("preview", "ignore"))
        assertEquals("manual-skip", SponsorBlockSettings.migrateDefault("selfpromo", "manual-skip"))
    }

    @Test
    fun `the migration is idempotent`() {
        // Bounded because it runs inside Application.onCreate: a cyclic move table would hang
        // the app's start-up with no crash and no log line.
        val once = SponsorBlockSettings.migrateDefault("selfpromo", "skip")
        assertEquals(once, SponsorBlockSettings.migrateDefault("selfpromo", once))
    }
}
