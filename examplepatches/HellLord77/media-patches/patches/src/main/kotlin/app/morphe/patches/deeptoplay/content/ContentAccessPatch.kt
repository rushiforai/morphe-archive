package app.morphe.patches.deeptoplay.content

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.all.misc.hex.hexPatch
import app.morphe.patches.all.misc.lib.stripNonArmNativeLibraryPatch
import app.morphe.patches.deeptoplay.shared.Constants.COMPATIBILITY_DEEPTOPLAY
import app.morphe.patches.shared.requireArm

@Suppress("unused")
val contentAccessPatch = rawResourcePatch(
    name = "Content access",
    description = "Resolve content_access to ContentAccess.free.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DEEPTOPLAY)

    availability(requireArm)

    dependsOn(stripNonArmNativeLibraryPatch, hexPatch(true, block = {
        // package:core_models/src/content_model.dart -> ContentModel.fromJson
        // content_access -> id
        // ADD             R2, R5, #0xA000 -> ADD             R2, R5, #0x5000
        // LDR             R2, [R2,#0xF8B] -> LDR             R2, [R2,#0x7DB]
        """
            0a 2a 85 e2
            8b 2f 92 e5
        """ asPatternTo """
            05 2a 85 e2
            db 27 92 e5
        """ inFile "lib/armeabi-v7a/libapp.so"

        // package:core_models/src/content_model.dart -> ContentModel.fromJson
        // ContentAccess.unspecified -> ContentAccess.free
        // ADD             LR, R5, #0xA000 -> ADD             LR, R5, #0x13000
        // LDR             LR, [LR,#0xF97] -> LDR             LR, [LR,#0x2A3]
        """
            0a ea 85 e2
            97 ef 9e e5
        """ asPatternTo """
            13 ea 85 e2
            a3 e2 9e e5
        """ inFile "lib/armeabi-v7a/libapp.so"
    }), hexPatch(true, block = {
        // package:core_models/src/content_model.dart -> ContentModel.fromJson
        // content_access -> id
        // ADD             X2, X27, #0x14,LSL#12 -> ADD             X2, X27, #9,LSL#12
        // LDR             X2, [X2,#0x18]        -> LDR             X2, [X2,#0x758]
        """
            62 53 40 91
            42 0c 40 f9
        """ asPatternTo """
            62 27 40 91
            42 ac 43 f9
        """ inFile "lib/arm64-v8a/libapp.so"

        // package:core_models/src/content_model.dart -> ContentModel.fromJson
        // ContentAccess.unspecified -> ContentAccess.free
        // ADD             X16, X27, #0x14,LSL#12 -> ADD             X16, X27, #0x23,LSL#12
        // LDR             X16, [X16,#0x30]       -> LDR             X16, [X16,0x9A0]
        """
            70 53 40 91
            10 1a 40 f9
        """ asPatternTo """
            70 8f 40 91
            10 d2 44 f9
        """ inFile "lib/arm64-v8a/libapp.so"
    }))
}