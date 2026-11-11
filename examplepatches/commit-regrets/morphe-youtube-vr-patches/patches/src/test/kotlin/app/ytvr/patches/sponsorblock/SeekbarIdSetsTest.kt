package app.ytvr.patches.sponsorblock

import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test

/**
 * The supported seek-bar id sets, held to the invariants the bake site relies on. The runtime
 * guard (`matchingSeekbarSets` throwing on two matches) is the real backstop; this test catches
 * a bad set at `buildAndroid` instead of at a device patch run. What it can and cannot prove:
 *
 * - it PROVES no two sets' five code-referenced ids overlap completely, which is the necessary
 *   condition for "one method matches both sets" (a method matching both must contain the union
 *   of both `allFive` arrays; if one allFive is a subset of the other, every method matching the
 *   bigger also matches the smaller and the guard fires on every supported build);
 * - it cannot prove a denser partial overlap can never match one method -- that stays the bake
 *   site's job.
 */
class SeekbarIdSetsTest {

    @Test
    fun `at least one set is supported`() {
        assertTrue(SEEKBAR_SETS.isNotEmpty(), "SEEKBAR_SETS is empty: no build can be fingerprinted")
    }

    @Test
    fun `every set carries six distinct ids`() {
        for (set in SEEKBAR_SETS) {
            val ids = listOf(set.seekbar, set.seekbarBg, set.seekbarBuffered, set.seekbarContainer, set.seekbarPosition, set.seekbarThumb)
            assertTrue(ids.toSet().size == ids.size, "set $ids reuses an id: a copy-paste or a wrong lookup")
        }
    }

    @Test
    fun `no set is redundant against another - the bake guard could not fire needlessly`() {
        for (a in SEEKBAR_SETS) {
            for (b in SEEKBAR_SETS) {
                if (a === b) continue
                val aSubsetOfB = a.allFive.all { five -> b.allFive.contains(five) }
                assertTrue(
                    !aSubsetOfB,
                    "a supported allFive is contained in another: any method " +
                        "matching ${b.allFive.toList()} would also match ${a.allFive.toList()} and the " +
                        "bake site would throw -- drop the stale set instead of shipping the collision",
                )
            }
        }
    }
}
