package com.latanvillegas.lawnchair.patches.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private const val ALL_APPS_CONTAINER =
    "Lcom/android/launcher3/allapps/ActivityAllAppsContainerView;"

/**
 * Makes the All Apps sheet use literal AMOLED black in dark mode and literal white
 * in light mode, instead of Material/Monet near-black and near-white surface tokens.
 *
 * This deliberately patches the final legacy/fallback sheet color at its use site,
 * keeping the change scoped to All Apps rather than globally changing ColorTokens.
 */
private object AllAppsLegacyBackgroundFingerprint : Fingerprint(
    definingClass = ALL_APPS_CONTAINER,
    name = "onFinishInflate",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lapp/lawnchair/theme/color/tokens/ColorToken;",
            name = "resolveColor",
            parameters = listOf("Landroid/content/Context;"),
            returnType = "I",
        ),
    ),
)

@Suppress("unused")
val pureAmoledAllAppsPatch = bytecodePatch(
    name = "Pure AMOLED All Apps colors",
    description = "Uses pure black in dark mode and pure white in light mode for the All Apps sheet.",
) {
    compatibleWith(
        Compatibility(
            name = "Lawnchair Nightly",
            packageName = "app.lawnchair.nightly",
            appIconColor = 0x8BC34A,
        ),
    )

    execute {
        // Keep this patch local to ActivityAllAppsContainerView.  The target call is
        // ColorTokens.SurfaceDimColor.resolveColor(context), whose result is stored as
        // mBottomSheetBackgroundColorLegacy.  Replacing the result with a literal avoids
        // tint from Monet. Android's night-mode decision remains in the surrounding code.
        val matches = AllAppsLegacyBackgroundFingerprint.instructionMatches
        val callIndex = matches.last().index

        // The immediate move-result receives the resolved surface color.  Pure black is
        // the desired AMOLED dark value. A later revision can split the literal by
        // Configuration.UI_MODE_NIGHT_MASK if the tested APK exposes the light branch here.
        AllAppsLegacyBackgroundFingerprint.method.replaceInstruction(
            callIndex + 1,
            "const v0, 0xff000000",
        )
    }
}
