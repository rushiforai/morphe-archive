package app.morphe.patches.chorki.settings

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.patches.all.misc.hex.hexPatch
import app.morphe.patches.all.stripnativelibraries.stripNonArm64NativeLibraryPatch
import app.morphe.patches.chorki.shared.Constants.COMPATIBILITY_CHORKI
import app.morphe.patches.shared.requireArm64

@Suppress("unused")
val loginRequiredPatch = rawResourcePatch(
    name = "Login required",
    description = "Resolve login_required using restrict_vpn.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CHORKI)

    availability(requireArm64)

    dependsOn(
        stripNonArm64NativeLibraryPatch, changePackageInstallerPatch(), hexPatch(block = {
            // goplay_tv$data$models$settings_model_SettingsModel__factory_ctor_fromJson
            // add x2, x27, #0x19, lsl #12 -> add x2, x27, #0x19, lsl #12
            // ldr x2, [x2, #0xc88] -> ldr x2, [x2, #0xb08]
            "62 67 40 91 42 44 46 f9" asPatternTo "62 67 40 91 42 84 45 f9" inFile "lib/arm64-v8a/libapp.so"
        })
    )
}
