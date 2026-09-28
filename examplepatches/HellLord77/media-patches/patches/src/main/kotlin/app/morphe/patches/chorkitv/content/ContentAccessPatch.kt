package app.morphe.patches.chorkitv.content

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.patches.all.misc.hex.hexPatch
import app.morphe.patches.all.stripnativelibraries.stripNonArm64NativeLibraryPatch
import app.morphe.patches.chorkitv.shared.Constants.COMPATIBILITY_CHORKITV
import app.morphe.patches.shared.requireArm64

@Suppress("unused")
val contentAccessPatch = rawResourcePatch(
    name = "Content access",
    description = "Resolve content_access to ContentAccess.free.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CHORKITV)

    availability(requireArm64)

    dependsOn(
        stripNonArm64NativeLibraryPatch, changePackageInstallerPatch(), hexPatch(block = {
            val lib = "lib/arm64-v8a/libapp.so"
            val pat = "60 23 40 91 00 88 46 f9"

            // goplay_tv$data$models$content_model_ContentModel__toEntity
            // ContentAccess.purchase_or_subscription -> ContentAccess.free
            // add x0, x27, #8, lsl #12
            // ldr x0, [x0, #0xce8] -> ldr x0, [x0, #0xd10]
            "60 23 40 91 00 74 46 f9" asPatternTo pat inFile lib

            // goplay_tv$data$models$content_model_ContentModel__toEntity
            // ContentAccess.subscription -> ContentAccess.free
            // add x0, x27, #8, lsl #12
            // ldr x0, [x0, #0xcf8] -> ldr x0, [x0, #0xd10]
            "60 23 40 91 00 7c 46 f9" asPatternTo pat inFile lib

            // goplay_tv$data$models$content_model_ContentModel__toEntity
            // ContentAccess.purchase -> ContentAccess.free
            // add x0, x27, #8, lsl #12
            // ldr x0, [x0, #0xd08] -> ldr x0, [x0, #0xd10]
            "60 23 40 91 00 84 46 f9" asPatternTo pat inFile lib
        })
    )
}