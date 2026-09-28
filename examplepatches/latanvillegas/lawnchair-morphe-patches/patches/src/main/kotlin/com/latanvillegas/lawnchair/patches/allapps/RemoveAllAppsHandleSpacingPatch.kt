package com.latanvillegas.lawnchair.patches.allapps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val ALL_APPS_CONTAINER =
    "Lcom/android/launcher3/allapps/ActivityAllAppsContainerView;"

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
    description = "Removes the top spacing reserved for the All Apps drag handle.",
) {
    compatibleWith(
        Compatibility(
            name = "Lawnchair Nightly",
            packageName = "app.lawnchair.nightly",
            appIconColor = 0x8BC34A,
        ),
    )

    execute {
        val handleCallIndex =
            LayoutWithoutSearchContainerFingerprint.instructionMatches.first().index
        val method = LayoutWithoutSearchContainerFingerprint.method

        // The invoke is followed by move-result. Read its actual destination register
        // instead of assuming that this APK always uses v0.
        val resultInstruction: OneRegisterInstruction =
            method.getInstruction(handleCallIndex + 1)
        val resultRegister = resultInstruction.registerA

        method.replaceInstruction(
            handleCallIndex + 1,
            "const/4 v$resultRegister, 0x0",
        )
    }
}
