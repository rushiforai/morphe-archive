package app.southstar21.patches.instagram.layout.profilepicture

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.instagram.misc.extension.callThrough
import app.southstar21.patches.instagram.misc.extension.extensionStub
import app.southstar21.patches.instagram.misc.extension.markPatchIncluded
import app.southstar21.patches.instagram.misc.extension.sharedExtensionPatch
import app.southstar21.patches.instagram.shared.Constants.COMPATIBILITY_INSTAGRAM

@Suppress("unused")
val viewProfilePicturePatch = bytecodePatch(
    name = "View profile picture",
    description = "Adds a button on the profile picture of profile pages that shows the profile picture in full resolution " +
            "and saves it to the gallery.",
    default = true
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    dependsOn(sharedExtensionPatch)

    execute {
        // Let the extension read the profile's user and its picture urls.
        extensionStub(EXTENSION_CLASS, "hdProfilePicInfo").method
            .callThrough(UserHdProfilePicFingerprint.method)
        extensionStub(EXTENSION_CLASS, "profilePicUrl").method
            .callThrough(UserProfilePicFingerprint.method)
        extensionStub(EXTENSION_CLASS, "tabControllerUser").method
            .callThrough(TabControllerUserFingerprint.method)

        UserDetailFragmentOnViewCreatedFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p1 }, " +
                    "$EXTENSION_CLASS->onProfileCreated(Ljava/lang/Object;Landroid/view/View;)V"
        )
        OnUserUpdatedFromNetworkFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p1 }, " +
                    "$EXTENSION_CLASS->onProfileUserLoaded(Ljava/lang/Object;Ljava/lang/Object;)V"
        )

        markPatchIncluded(EXTENSION_CLASS)
    }
}
