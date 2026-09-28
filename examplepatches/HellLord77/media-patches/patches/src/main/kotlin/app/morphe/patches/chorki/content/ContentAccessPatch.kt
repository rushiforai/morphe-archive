package app.morphe.patches.chorki.content

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.patches.all.misc.hex.hexPatch
import app.morphe.patches.all.stripnativelibraries.stripNonArm64NativeLibraryPatch
import app.morphe.patches.chorki.shared.Constants.COMPATIBILITY_CHORKI
import app.morphe.patches.shared.requireArm64

@Suppress("unused")
val contentAccessPatch = rawResourcePatch(
    name = "Content access",
    description = "Resolve content_access to ContentAccess.free.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CHORKI)

    availability(requireArm64)

    dependsOn(
        stripNonArm64NativeLibraryPatch, changePackageInstallerPatch(), hexPatch(block = {
            val lib = "lib/arm64-v8a/libapp.so"
            val pat = "60 43 40 91 00 78 41 f9"

            // goplay_tv$data$models$content_model_ContentModel__toEntity
            // ContentAccess.purchase_or_subscription -> ContentAccess.free
            // add x0, x27, #0x15, lsl #12 -> add x0, x27, #0x10, lsl #12
            // ldr x0, [x0, #0x848] -> ldr x0, [x0, #0x2f0]
            "60 57 40 91 00 24 44 f9" asPatternTo pat inFile lib

            // goplay_tv$data$models$content_model_ContentModel__toEntity
            // ContentAccess.subscription -> ContentAccess.free
            // add x0, x27, #0x15, lsl #12 -> add x0, x27, #0x10, lsl #12
            // ldr x0, [x0, #0x850] -> ldr x0, [x0, #0x2f0]
            "60 57 40 91 00 28 44 f9" asPatternTo pat inFile lib

            // goplay_tv$data$models$content_model_ContentModel__toEntity
            // ContentAccess.purchase -> ContentAccess.free
            // add x0, x27, #0x15, lsl #12 -> add x0, x27, #0x10, lsl #12
            // ldr x0, [x0, #0x860] -> ldr x0, [x0, #0x2f0]
            "60 57 40 91 00 30 44 f9" asPatternTo pat inFile lib
        })
    )
}