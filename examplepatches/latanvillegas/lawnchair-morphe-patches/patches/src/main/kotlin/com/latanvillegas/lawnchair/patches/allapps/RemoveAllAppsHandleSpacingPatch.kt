package com.latanvillegas.lawnchair.patches.allapps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private const val ALL_APPS_CONTAINER =
    "Lcom/android/launcher3/allapps/ActivityAllAppsContainerView;"

/**
 * Removes the extra top margin Lawnchair reserves for the All Apps drag handle.
 *
 * Stock layoutWithoutSearchContainer() asks DeviceProfile.shouldShowAllAppsOnSheet()
 * and, when true, initializes topMargin with bottom_sheet_handle_area_height.
 * The customized Lawnchair source removes that block entirely. This patch reproduces
 * the same result by forcing that one call's result to false only inside this method.
 */
private object LayoutWithoutSearchContainerFingerprint : Fingerprint(
    definingClass = ALL_APPS_CONTAINER,
    name = "layoutWithoutSearchContainer",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Z"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/android/launcher3/DeviceProfile;",
            name = "shouldShowAllAppsOnSheet",
            parameters = emptyList(),
            returnType = "Z",
        ),
    ),
)

@Suppress("unused")
val removeAllAppsHandleSpacingPatch = bytecodePatch(
    name = "Remove All Apps handle spacing",
    description = "Removes the empty top spacing reserved for the All Apps drag handle.",
) {
    compatibleWith(
        Compatibility(
            name = "Lawnchair Nightly",
            packageName = "app.lawnchair.nightly",
            appIconColor = 0x8BC34A,
        ),
    )

    execute {
        val callIndex = LayoutWithoutSearchContainerFingerprint.instructionMatches.first().index

        // In #5155 this is:
        // invoke-virtual {v0}, DeviceProfile->shouldShowAllAppsOnSheet()Z
        // move-result v0
        // Replace only the move-result so the existing control flow takes the zero-margin path.
        LayoutWithoutSearchContainerFingerprint.method.replaceInstruction(
            callIndex + 1,
            "const/4 v0, 0x0",
        )
    }
}
