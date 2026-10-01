package app.morphe.patches.chorkitv.content

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.patches.all.misc.hex.hexPatch
import app.morphe.patches.all.misc.lib.stripNonArmNativeLibraryPatch
import app.morphe.patches.chorkitv.shared.Constants.COMPATIBILITY_CHORKITV
import app.morphe.patches.shared.requireArm

@Suppress("unused")
val contentAccessPatch = rawResourcePatch(
    name = "Content access",
    description = "Resolve content_access to ContentAccess.free.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CHORKITV)

    availability(requireArm)

    dependsOn(
        stripNonArmNativeLibraryPatch, changePackageInstallerPatch(), hexPatch(true, block = {
            // package:goplay_tv/data/models/content_model.dart -> ContentModel.toEntity
            // content_access -> id
            // ADD             R2, R5, #0x5000
            // LDR             R2, [R2,#0x1E3]  -> LDR             R2, [R2,#0x1AF]
            """
                05 2a 85 e2
                e3 21 92 e5
            """ asPatternTo """
                05 2a 85 e2
                af 21 92 e5
            """ inFile "lib/armeabi-v7a/libapp.so"
        }), hexPatch(true, block = {
            // package:goplay_tv/data/models/content_model.dart -> ContentModel.toEntity
            // content_access -> id
            // ADD             X0, X27, #8,LSL#12
            // LDR             X0, [X0,#0xF00]    -> LDR             X0, [X0,#0xE98]
            """
                62 23 40 91
                42 80 47 f9
            """ asPatternTo """
                62 23 40 91
                42 4c 47 f9
            """ inFile "lib/arm64-v8a/libapp.so"
        })
    )
}