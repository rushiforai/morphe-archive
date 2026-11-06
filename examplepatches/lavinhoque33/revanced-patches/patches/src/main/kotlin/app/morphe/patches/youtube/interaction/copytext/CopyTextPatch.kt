/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3592
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Ported to RVX by lavinhoque33, 2026-10-16.
 */

package app.morphe.patches.youtube.interaction.copytext

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.litho.context.conversionContextPatch
import app.morphe.patches.shared.textcomponent.hookSpannableString
import app.morphe.patches.shared.textcomponent.hookTextComponent
import app.morphe.patches.shared.textcomponent.textComponentPatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.COPY_TEXT
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.patches.youtube.video.information.videoInformationPatch
import app.morphe.util.findMutableClassOrThrow

private const val EXTENSION_CLASS = "Lapp/morphe/extension/youtube/patches/CopyTextPatch;"

/**
 * The shown texts are recognized by the path of their component,
 * so the ConversionContext class is extended with the [conversionContextPatch],
 * and the title can be auto-translated, so it is taken from the text that is drawn.
 *
 * The texts are drawn by Litho and have no view of their own,
 * so the host that draws them is found by its text when touched.
 */
val copyTextPatch = bytecodePatch(
    name = COPY_TEXT.title,
    description = COPY_TEXT.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        conversionContextPatch,
        textComponentPatch,
        videoInformationPatch,
    )

    execute {
        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: GENERAL",
                "SETTINGS: COPY_TEXT"
            ),
            COPY_TEXT
        )

        // Verify stubbed classes are not obfuscated.
        findMutableClassOrThrow("Lcom/facebook/litho/TextContent;")

        hookSpannableString(EXTENSION_CLASS, "onLithoTextLoaded")
        hookTextComponent(EXTENSION_CLASS)

        ComponentHostDispatchTouchEventFingerprint.method.addInstruction(
            0,
            "invoke-static { p0, p1 }, $EXTENSION_CLASS->" +
                    "onComponentHostTouch(Lcom/facebook/litho/ComponentHost;Landroid/view/MotionEvent;)V"
        )
    }
}
