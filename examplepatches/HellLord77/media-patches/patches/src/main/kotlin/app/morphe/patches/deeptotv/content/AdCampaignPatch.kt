package app.morphe.patches.deeptotv.content

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.all.misc.hex.hexPatch
import app.morphe.patches.all.misc.lib.stripNonArmNativeLibraryPatch
import app.morphe.patches.deeptotv.shared.Constants.COMPATIBILITY_DEEPTOTV
import app.morphe.patches.shared.requireArm


@Suppress("unused")
val adCampaignPatch = rawResourcePatch(
    name = "Ad campaign",
    description = "Resolve ad_campaign to null.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DEEPTOTV)

    availability(requireArm)

    dependsOn(stripNonArmNativeLibraryPatch, hexPatch(true, block = {
        // package:core_models/src/content_model.dart -> ContentModel.fromJson
        // ad_campaign -> ads
        // ADD             R2, R5, #0x9000 -> ADD             R2, R5, #0xD000
        // LDR             R2, [R2,#0x913] -> LDR             R2, [R2,#0x67B]
        """
            09 2a 85 e2
            13 29 92 e5
        """ asPatternTo """
            0d 2a 85 e2
            7b 26 92 e5
        """ inFile "lib/armeabi-v7a/libapp.so"
    }), hexPatch(true, block = {
        // package:core_models/src/content_model.dart -> ContentModel.fromJson
        // ad_campaign -> ads
        // ADD             X2, X27, #0x11,LSL#12 -> ADD             X2, X27, #0x18,LSL#12
        // LDR             X2, [X2,#0x520]       -> LDR             X2, [X2,#0xB48]
        """
            62 47 40 91
            42 90 42 f9
        """ asPatternTo """
            62 63 40 91
            42 a4 45 f9
        """ inFile "lib/arm64-v8a/libapp.so"
    }))
}