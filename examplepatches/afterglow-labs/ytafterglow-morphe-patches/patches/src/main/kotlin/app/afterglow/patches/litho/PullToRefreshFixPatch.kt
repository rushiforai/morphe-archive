/*
 * YTAfterglow for Android.
 *
 * Adapted from the vertical scroll fix of Morphe patches v2.2.0
 * (https://github.com/MorpheApp/morphe-patches, GPLv3). Modified for YTAfterglow:
 * rewritten for patcher 2.1.0, without the unrelated flag 45782902.
 * Not an official Morphe file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.patches.litho

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.setRegisterFalseAfter
import app.morphe.patcher.patch.bytecodePatch

/**
 * Keeps pull to refresh working when a filter hides the first item of a list.
 *
 * A hidden element becomes an EmptyComponent with no height. When it is the first item, the
 * RecyclerView does not count it as visible, so `computeVerticalScrollOffset()` is above zero
 * even at the top and `canScrollVertically(-1)` stays true. `SwipeRefreshLayout.canChildScrollUp()`
 * then never lets the refresh start. The list's own check is replaced by false: the
 * SwipeRefreshLayout still only gets the overscroll the RecyclerView could not use, which happens
 * only at its real top, through nested scrolling.
 *
 * The result is set only on the `View.canScrollVertically` path; the ListView path of the same
 * method jumps past the inserted instruction and is unchanged.
 */
internal val pullToRefreshFixPatch = bytecodePatch(
    description = "Keeps pull to refresh working when Afterglow hides the first item of a list.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        SwipeRefreshCanChildScrollUpFingerprint.let { fingerprint ->
            fingerprint.method.setRegisterFalseAfter(fingerprint.instructionMatches.last().index)
        }
    }
}
