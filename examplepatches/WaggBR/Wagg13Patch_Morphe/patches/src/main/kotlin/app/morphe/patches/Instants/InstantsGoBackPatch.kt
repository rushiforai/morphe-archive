package app.morphe.patches.instants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val GO_BACK_HELPER = "Lapp/morphe/extension/instants/InstantsGoBack;"

/**
 * "Go back" for the friends' viewer: replays the last Instant that was passed. Part of
 * [instantsModPatch].
 *
 * The tracking itself runs on the viewer state that [instantsSaveImagePatch] already reports on
 * every composition, and on the camera and navigation reports of [instantsGalleryPatch]. This patch
 * only adds the report of the viewer's empty state.
 */
val instantsGoBackPatch = bytecodePatch {  // unnamed: only loaded through [instantsModPatch]
    compatibleWith(INSTANTS_COMPATIBILITY)
    extendWith("extensions/extension.mpe")
    dependsOn(instantsActivityPatch, instantsSaveImagePatch, instantsGalleryPatch)

    execute {
        // When no posts are left the viewer shows its empty state instead of a post.
        ViewerEmptyStateFingerprint.method.addInstructions(
            0,
            """
            invoke-static {}, $GO_BACK_HELPER->onEmpty()V
            """.trimIndent(),
        )
    }
}
