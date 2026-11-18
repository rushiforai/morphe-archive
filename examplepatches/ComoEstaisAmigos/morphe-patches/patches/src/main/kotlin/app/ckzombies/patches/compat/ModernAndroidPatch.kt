package app.ckzombies.patches.compat

import app.ckzombies.patches.nativelib.jniArgumentsPatch
import app.ckzombies.patches.nativelib.jniGuardsPatch
import app.ckzombies.patches.nativelib.soundCacheModePatch
import app.ckzombies.patches.shared.Constants.COMPATIBILITY_CK_ZOMBIES
import app.morphe.patcher.patch.patch

@Suppress("unused")
val modernAndroidPatch = patch(
    name = "Modern Android compatibility",
    description = "Fixes the crash at launch on current Android and targets API 25 so that Android 14 and later " +
        "install the game normally.",
) {
    compatibleWith(COMPATIBILITY_CK_ZOMBIES)

    dependsOn(
        resourceFilePatch,
        externalStoragePatch,
        explicitServiceIntentPatch,
        targetSdkPatch,
        jniGuardsPatch,
        jniArgumentsPatch,
        soundCacheModePatch,
        openFeintPatch,
        deadServiceRequestsPatch,
        obbMessagePatch,
        touchEdgePatch,
    )
}
