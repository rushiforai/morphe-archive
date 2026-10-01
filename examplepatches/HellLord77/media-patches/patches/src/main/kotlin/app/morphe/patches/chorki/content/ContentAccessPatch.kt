package app.morphe.patches.chorki.content

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.patches.all.misc.hex.hexPatch
import app.morphe.patches.all.misc.lib.stripNonArmNativeLibraryPatch
import app.morphe.patches.chorki.shared.Constants.COMPATIBILITY_CHORKI
import app.morphe.patches.shared.requireArm

@Suppress("unused")
val contentAccessPatch = rawResourcePatch(
    name = "Content access",
    description = "Resolve content_access to ContentAccess.free.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CHORKI)

    availability(requireArm)

    dependsOn(
        stripNonArmNativeLibraryPatch, changePackageInstallerPatch(), hexPatch(true, block = {
            // package:chorki/data/models/content_model.dart -> ContentModel.toEntity
            // content_access -> content_access_token
            // ADD             R0, R5, #0xB000
            // LDR             R2, [R2,#0x877] -> LDR             R2, [R2,#0x87F]
            """
                0b 2a 85 e2
                77 28 92 e5
            """ asPatternTo """
                0b 2a 85 e2
                7f 28 92 e5
            """ inFile "lib/armeabi-v7a/libapp.so"
        }), hexPatch(true, block = {
            // package:chorki/data/models/content_model.dart -> ContentModel.toEntity
            // content_access -> content_access_token
            // ADD             X0, X27, #0x15,LSL#12
            // LDR             X0, [X0,#0xA40]       -> LDR             X0, [X0,#0xA50]
            """
                62 57 40 91
                42 20 45 f9
            """ asPatternTo """
                62 57 40 91
                42 28 45 f9
            """ inFile "lib/arm64-v8a/libapp.so"
        })
    )
}