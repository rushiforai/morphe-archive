package app.morphe.patches.chorki.settings

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.patches.all.misc.hex.hexPatch
import app.morphe.patches.all.misc.lib.stripNonArmNativeLibraryPatch
import app.morphe.patches.chorki.shared.Constants.COMPATIBILITY_CHORKI
import app.morphe.patches.shared.requireArm

@Suppress("unused")
val loginRequiredPatch = rawResourcePatch(
    name = "Login required",
    description = "Resolve login_required to false.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CHORKI)

    availability(requireArm)

    dependsOn(
        stripNonArmNativeLibraryPatch, changePackageInstallerPatch(), hexPatch(true, block = {
            // package:chorki/data/models/settings_model.json -> SettingsModel.fromJson
            // login_required -> restrict_vpn
            // ADD             R2, R5, #0xD000
            // LDR             R2, [R2,#0x9D7] -> LDR             R2, [R2,#0x917]
            """
                0d 2a 85 e2
                d7 29 92 e5
            """ asPatternTo """
                0d 2a 85 e2
                17 29 92 e5
            """ inFile "lib/armeabi-v7a/libapp.so"
        }), hexPatch(true, block = {
            // package:chorki/data/models/settings_model.json -> SettingsModel.fromJson
            // login_required -> restrict_vpn
            // ADD             X2, X27, #0x19,LSL#12
            // LDR             X2, [X2,#0xC88]       -> LDR             X2, [X2,#0xB08]
            """
                62 67 40 91
                42 44 46 f9
            """ asPatternTo """
                62 67 40 91
                42 84 45 f9
            """ inFile "lib/arm64-v8a/libapp.so"
        })
    )
}
