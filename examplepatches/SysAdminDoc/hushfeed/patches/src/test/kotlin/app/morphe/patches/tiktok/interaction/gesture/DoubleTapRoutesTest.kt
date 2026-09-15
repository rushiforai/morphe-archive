package app.morphe.patches.tiktok.interaction.gesture

import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * Pins the set of methods the double tap guard is installed on.
 *
 * <p>The patch shipped for months guarding only `BaseListFragmentPanel`, and a reporter said
 * twice that "do nothing" still liked the video. It resolved, so nothing failed and nothing
 * looked wrong. The reason is that a fingerprint resolving says the method exists, not that it
 * is the one the gesture reaches: the modern feed panel's own listener holds the digg component
 * and calls `DiggPanelComponent.handleDoubleClick` without going near the legacy panel.
 *
 * <p>Traced on the 46.2.3 fixture and confirmed on 46.7.3 and 46.8.3. Dropping any entry makes
 * this fail, which is the only thing standing between the next refactor and the same bug.
 */
class DoubleTapRoutesTest {
    @Test
    fun everyRouteFromADoubleTapToALikeIsGuarded() {
        assertEquals(
            listOf(
                "Lcom/ss/android/ugc/aweme/feed/panel/BaseListFragmentPanel;" to "handleDoubleClick",
                "Lcom/ss/android/ugc/feed/platform/panel/digg/DiggPanelComponent;" to "handleDoubleClick",
                "Lcom/ss/android/ugc/aweme/feed/landscape/LandscapeFragmentPanel;" to "handleDoubleClick",
                "Lcom/ss/android/ugc/aweme/friendstab/ui/feed/cell/component/base/" +
                    "FriendsV3GestureDetectorAssem;" to "onDoubleTap",
            ),
            doubleTapRouteMethods,
        )
    }

    @Test
    fun theTwoClassesThatCannotLikeAreNotGuarded() {
        // Both declare the same method on all three fixtures and neither can like anything:
        // LX/0SPC returns immediately and FriendsV3LegacyCompatAssem throws "Not yet
        // implemented". Guarding either would add an injection that can only ever be dead.
        val owners = doubleTapRouteMethods.map { it.first }
        assertEquals(emptyList<String>(), owners.filter { it == "LX/0SPC;" })
        assertEquals(
            emptyList<String>(),
            owners.filter { it.endsWith("FriendsV3LegacyCompatAssem;") },
        )
    }
}
