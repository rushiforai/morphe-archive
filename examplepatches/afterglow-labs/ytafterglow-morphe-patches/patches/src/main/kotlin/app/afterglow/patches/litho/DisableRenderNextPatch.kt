/*
 * YTAfterglow for Android.
 *
 * Adapted from the RenderNext patch of Morphe patches v2.2.0
 * (https://github.com/MorpheApp/morphe-patches, GPLv3). Modified for YTAfterglow:
 * rewritten for patcher 2.1.0 and only the paths YouTube 21.43.523 has.
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
 * Reuse Morphe's RenderNext implementation once for both sets of Litho hooks.
 * Keep the additional 21.35+ Home page-fragment override from Afterglow: this
 * route is not covered by the pinned upstream helper. Applying two copies of
 * the common RenderNext hooks changes the branch layout before strict matching.
 */
internal val disableRenderNextPatch = bytecodePatch(
    description = "Renders every element with Litho, so Afterglow's Litho filters see all of them.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(app.morphe.patches.youtube.misc.litho.rendernext.disableRenderNextPatch)

    execute {
        val pageRoute = PageFragmentRouteFingerprint.method
        val pageRouteFlagResult = PageFragmentRouteFingerprint.instructionMatches[3].index
        pageRoute.setRegisterFalseAfter(pageRouteFlagResult)
    }
}
