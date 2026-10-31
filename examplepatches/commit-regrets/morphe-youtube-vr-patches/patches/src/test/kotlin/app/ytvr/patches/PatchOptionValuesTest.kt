package app.ytvr.patches

import app.ytvr.patches.misc.clonePackageChoices
import app.ytvr.patches.playback.qualityChoices
import app.ytvr.patches.sponsorblock.behaviourChoices
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test

/**
 * The option choices each patch declares, and the stored-value resolution the Morphe 2.x hosts
 * need (issue #45): Manager 2.2.0 rendered this bundle's 1.x-shaped `{token: label}` maps and
 * *saved the label*, so SponsorBlock received 'Show on the seekbar only (never skips)' and the
 * whole patch pass failed. On patcher 2.x a `values` map is `{display name: stored value}` --
 * the orientation the official bundle declares -- and `storedChoice` still resolves the label a
 * Manager has already persisted, because resetting saved options is not something to ask of the
 * bug reporter.
 */
class PatchOptionValuesTest {

    @Test
    fun `display names and stored values are disjoint in every choice map`() {
        // Disjointness is what makes `storedChoice` order-independent: a display-name lookup can
        // never shadow a stored value or the other way round.
        for (choices in listOf(behaviourChoices, qualityChoices, clonePackageChoices)) {
            val overlap = choices.keys.intersect(choices.values.toSet())
            assertTrue(overlap.isEmpty(), "$choices mixes display names and values at $overlap")
        }
    }

    @Test
    fun `behaviour choices hold exactly the five behaviours the extension understands`() {
        // The extension treats an unknown token as `ignore` (SponsorBlockModelTest), so a typo in
        // this map would silently switch a category off rather than fail the patch.
        assertEquals(
            setOf("skip", "skip-once", "manual-skip", "seekbar-only", "ignore"),
            behaviourChoices.values.toSet(),
        )
    }

    @Test
    fun `every behaviour token and display name resolves to the token`() {
        for ((displayName, token) in behaviourChoices) {
            assertEquals(token, storedChoice(behaviourChoices, displayName), displayName)
            assertEquals(token, storedChoice(behaviourChoices, token), token)
        }
    }

    @Test
    fun `the value issue 45 reports resolves to seekbar-only`() {
        // Verbatim from the failing run: SponsorBlock: unknown category behaviour
        // 'Show on the seekbar only (never skips)'.
        assertEquals(
            "seekbar-only",
            storedChoice(behaviourChoices, "Show on the seekbar only (never skips)"),
        )
    }

    @Test
    fun `video quality display names resolve to heights`() {
        assertEquals("highest", storedChoice(qualityChoices, "Highest available (the video's best, 8K included)"))
        assertEquals("4320", storedChoice(qualityChoices, "8K (4320p)"))
        assertEquals("1080", storedChoice(qualityChoices, "1080p (Full HD)"))
        assertEquals("auto", storedChoice(qualityChoices, "Auto (the app's own per-video choice)"))
        assertEquals("1080", storedChoice(qualityChoices, "1080"))
        assertNull(storedChoice(qualityChoices, "2160p60"))
    }

    @Test
    fun `clone presets resolve and a custom package name is left to the validator`() {
        assertEquals(
            "app.morphe.android.youtube",
            storedChoice(clonePackageChoices, "Clone — separate app next to the store app (recommended)"),
        )
        assertEquals(
            "com.google.android.apps.youtube.vr.oculus",
            storedChoice(
                clonePackageChoices,
                "Replace the official app — removes the store copy; " +
                    "Meta then treats this build as YouTube VR",
            ),
        )
        // A typed id matches neither preset; the patch's validator accepts it and `finalize`
        // passes it through -- `storedChoice` returning null is what makes that pass-through work.
        assertNull(storedChoice(clonePackageChoices, "com.example headset.youtubevr"))
    }
}
