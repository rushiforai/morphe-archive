package app.revanced.patches.pinterest

import app.morphe.patcher.patch.bytecodePatch
import app.revanced.util.returnEarly

val gmaAdsPatch = bytecodePatch(
    name = "Remove GMA ads",
) {
    compatibleWith("com.pinterest"("14.23.0"));

    execute {
        adsGmaExperimentFingerprint.method.returnEarly(false);
    }
}
