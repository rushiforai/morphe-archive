/*
 * Expert RAW patches for Morphe.
 * Licensed under the GNU General Public License version 3 (GPLv3), with the Additional
 * Terms under Section 7 described in the LICENSE file of this repository.
 */

package app.morphe.patches.expertraw.misc.extension

import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook
import app.morphe.patches.all.misc.extension.sharedExtensionPatch

val sharedExtensionPatch = sharedExtensionPatch(
    "expertraw",
    activityOnCreateExtensionHook("Lcom/samsung/android/app/galaxyraw/GalaxyRaw;")
)
