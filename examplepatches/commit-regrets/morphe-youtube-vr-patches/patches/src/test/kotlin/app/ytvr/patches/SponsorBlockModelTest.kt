package app.ytvr.patches

import app.ytvr.extension.SponsorBlockSettings
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test

/**
 * The SponsorBlock behaviour model: the decision logic that could silently auto-skip a segment it
 * should only mark. Ported from the build/probe `SbModelCheck` harness so it runs on every build
 * instead of when somebody remembers it.
 *
 * Needs no device: `configure` is a pure parser, and `behaviour` falls back to the configured
 * values because there is no app context here, which is exactly the path a fresh install takes
 * before the settings screen is touched.
 *
 * `manual-skip` is a real behaviour since 2026-10-14 (the app's own skip-Ad card, see
 * docs/SPONSORBLOCK-NOTES.md Addendum 19), so it is not normalised to `seekbar-only`, and the
 * tick's gate is `anyHandled()` rather than `anySkipping()`, because a build whose categories are
 * all `manual-skip` still has to run or the button would never be offered.
 */
class SponsorBlockModelTest {

    private fun configure(map: String) {
        SponsorBlockSettings.configure("https://sponsor.ajay.app", map)
    }

    private fun behaviour(category: String) = SponsorBlockSettings.behaviour(category)

    @Test
    fun `configure parses the baked behaviour map`() {
        configure("sponsor=skip-once;selfpromo=manual-skip;intro=seekbar-only;outro=ignore;filler=bogus")

        assertEquals("skip-once", behaviour("sponsor"))
        assertEquals("manual-skip", behaviour("selfpromo")) // a real behaviour since 2026-10-14
        assertEquals("seekbar-only", behaviour("intro"))
        assertEquals("ignore", behaviour("outro"))
        assertEquals("ignore", behaviour("filler")) // unknown behaviour
        assertEquals("ignore", behaviour("preview")) // absent category
    }

    @Test
    fun `only the skip behaviours move the playhead`() {
        assertFalse(SponsorBlockSettings.autoSkips("seekbar-only"))
        assertFalse(SponsorBlockSettings.autoSkips("manual-skip"))
        assertFalse(SponsorBlockSettings.autoSkips("ignore"))
        assertTrue(SponsorBlockSettings.autoSkips("skip"))
        assertTrue(SponsorBlockSettings.autoSkips("skip-once"))
    }

    @Test
    fun `only manual-skip offers the button`() {
        assertTrue(SponsorBlockSettings.manualSkips("manual-skip"))
        assertFalse(SponsorBlockSettings.manualSkips("skip"))
        assertFalse(SponsorBlockSettings.manualSkips("skip-once"))
        assertFalse(SponsorBlockSettings.manualSkips("seekbar-only"))
        assertFalse(SponsorBlockSettings.manualSkips("ignore"))
    }

    @Test
    fun `marking categories are marked, ignore is not`() {
        assertTrue(SponsorBlockSettings.marks("seekbar-only"))
        assertTrue(SponsorBlockSettings.marks("manual-skip"))
        assertTrue(SponsorBlockSettings.marks("skip"))
        assertFalse(SponsorBlockSettings.marks("ignore"))
    }

    @Test
    fun `a skip-once category counts as handled`() {
        configure("sponsor=skip-once;intro=seekbar-only;outro=ignore")
        assertTrue(SponsorBlockSettings.anyHandled())
    }

    @Test
    fun `a manual-skip category counts as handled - the button must be offered`() {
        configure("sponsor=seekbar-only;intro=manual-skip;outro=ignore")
        assertTrue(SponsorBlockSettings.anyHandled())
    }

    @Test
    fun `marking-only categories must not count as handled`() {
        configure("sponsor=seekbar-only;intro=seekbar-only;outro=ignore")
        assertFalse(SponsorBlockSettings.anyHandled())
        assertEquals("seekbar-only", behaviour("intro"))
    }
}
