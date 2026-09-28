package app.morphe.patches.chorkitv.settings

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.patches.all.misc.hex.hexPatch
import app.morphe.patches.all.stripnativelibraries.stripNonArm64NativeLibraryPatch
import app.morphe.patches.chorkitv.shared.Constants.COMPATIBILITY_CHORKITV
import app.morphe.patches.shared.requireArm64

@Suppress("unused")
val loginRequiredPatch = rawResourcePatch(
    name = "Login required",
    description = "Resolve login_required using restrict_vpn.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CHORKITV)

    availability(requireArm64)

    dependsOn(
        stripNonArm64NativeLibraryPatch, changePackageInstallerPatch(), hexPatch(block = {
            // goplay_tv$data$models$settings_model_SettingsModel__factory_ctor_fromJson
            // add x2, x27, #0xf, lsl #12
            // ldr x2, [x2, #0xfb0] -> ldr x2, [x2, #0xfa8]
            "62 3f 40 91 42 d8 47 f9" asPatternTo "62 3f 40 91 42 d4 47 f9" inFile "lib/arm64-v8a/libapp.so"
        })
    )
}
