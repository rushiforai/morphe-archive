/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.lightroom.shared.pairip

import hoodles.morphe.patches.shared.misc.pairip.getStripPairipPatch
import hoodles.morphe.util.Arm64Constants

internal val stripPairipPatch = getStripPairipPatch("lightroom", true) {
    "30 05 00 D0 11 7E 46 F9" asPatternTo Arm64Constants.RETURN_NULL inFile "lib/arm64-v8a/libadobe_c2pa.so"
}
