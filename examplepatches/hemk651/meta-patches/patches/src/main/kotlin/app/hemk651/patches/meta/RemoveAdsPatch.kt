/*
 * Meta Patches — Remove ads.
 *
 * Ported from InstaFL patcher-core "Remove Ads"
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut),
 * reworked for the Morphe patcher.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.patches.meta

import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import app.hemk651.patches.shared.MetaCompatibilities

@Suppress("unused")
val removeAdsPatch = patch(
    name = "Remove ads",
    description = "Removes ads in Instagram by stopping the ad pod flow.",
    default = true
) {
    compatibleWith(MetaCompatibilities.INSTAGRAM)

    execute {
        // The ad pod tracker is the only class in the app that contains the
        // "Is ad pod" string. Its static helper is called to decide whether the
        // ad pod is registered, so returning true skips the ad pod flow.
        //
        // Original InstaFL patch injects "const/4 v0, 0x1" and "return v0" at the
        // start of the method, which returnEarly(true) does the same way.
        AdPodFingerprint.method.returnEarly(true)
    }
}
