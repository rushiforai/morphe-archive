package app.morphe.patches.chorkitv.settings

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.patches.all.misc.hex.hexPatch
import app.morphe.patches.all.misc.lib.stripNonArmNativeLibraryPatch
import app.morphe.patches.chorkitv.shared.Constants.COMPATIBILITY_CHORKITV
import app.morphe.patches.shared.requireArm

@Suppress("unused")
val loginRequiredPatch = rawResourcePatch(
    name = "Login required",
    description = "Resolve login_required to false.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CHORKITV)

    availability(requireArm)

    dependsOn(
        stripNonArmNativeLibraryPatch, changePackageInstallerPatch(), hexPatch(true, block = {
            // package:goplay_tv/data/models/settings_model.json -> SettingsModel.fromJson
            // login_required -> restrict_vpn
            // ADD             R2, R5, #0x8000
            // LDR             R2, [R2,#0xA5B] -> LDR             R2, [R2,#0xA57]
            """
                02 29 85 e2
                5b 2a 92 e5
            """ asPatternTo """
                02 29 85 e2
                57 2a 92 e5
            """ inFile "lib/armeabi-v7a/libapp.so"
        }), hexPatch(true, block = {
            // package:goplay_tv/data/models/settings_model.json -> SettingsModel.fromJson
            // login_required -> restrict_vpn
            // ADD             X2, X27, #0xF,LSL#12
            // LDR             X2, [X2,#0xFB0]      -> LDR             X2, [X2,#0xFA8]
            """
                62 3f 40 91
                42 d8 47 f9
            """ asPatternTo """
                62 3f 40 91
                42 d4 47 f9
            """ inFile "lib/arm64-v8a/libapp.so"
        })
    )
}
