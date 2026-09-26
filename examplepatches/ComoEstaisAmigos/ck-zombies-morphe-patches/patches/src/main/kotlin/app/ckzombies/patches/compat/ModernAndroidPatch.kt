package app.ckzombies.patches.compat

import app.ckzombies.patches.nativelib.jniGuardsPatch
import app.ckzombies.patches.shared.Constants.COMPATIBILITY_CK_ZOMBIES
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val modernAndroidPatch = bytecodePatch(
    name = "Modern Android compatibility",
    description = "Fixes the crash at launch on current Android and targets API 25 so that Android 14 and later " +
        "install the game normally. " +
        "The game is 32-bit only, so the device must still run 32-bit apps.",
) {
    compatibleWith(COMPATIBILITY_CK_ZOMBIES)

    dependsOn(
        resourceFilePatch,
        externalStoragePatch,
        explicitServiceIntentPatch,
        targetSdkPatch,
        jniGuardsPatch,
        openFeintPatch,
        deadServiceRequestsPatch,
    )
}
