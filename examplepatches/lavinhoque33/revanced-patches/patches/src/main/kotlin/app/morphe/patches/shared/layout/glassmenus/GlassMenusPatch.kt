/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/5107
 *
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-25.
 * Written by lavinhoque33, 2026-11-24.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.patches.shared.layout.glassmenus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patches.shared.drawable.addDrawableDrawnColorHook
import app.morphe.patches.shared.mapping.ResourceType.LAYOUT
import app.morphe.patches.shared.mapping.resourceLiteral
import app.morphe.util.Utils.printWarn
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.setExtensionIsPatchIncluded
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

internal const val GLASS_MENUS_EXTENSION = "Lapp/morphe/extension/shared/patches/glassmenus/GlassMenusPatch;"
internal const val GLASS_MENUS_NAME = "Glass menus"
internal const val GLASS_MENUS_DESCRIPTION = "Adds an optional frosted glass effect to menus on Android 12 and newer " +
    "when the device supports window blur."

private const val DIALOG = "Landroid/app/Dialog;"
private const val LITHO_BACKGROUND_HOOK =
    "$GLASS_MENUS_EXTENSION->onLithoBackgroundColor(Landroid/graphics/drawable/Drawable;I)V"

private object MaterialBottomSheetFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(resourceLiteral(LAYOUT, "design_bottom_sheet_dialog")),
    custom = { _, classDef ->
        classDef.fields.any { it.type == "Lcom/google/android/material/bottomsheet/BottomSheetBehavior;" }
    },
)

private object BottomSheetAttachedFingerprint : Fingerprint(
    name = "onAttachedToWindow",
    returnType = "V",
    parameters = emptyList(),
)

private object BottomSheetStartFingerprint : Fingerprint(
    name = "onStart",
    returnType = "V",
    parameters = emptyList(),
)

private object DialogFragmentShowFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, smali = "$DIALOG->show()V"),
        methodCall(smali = "$DIALOG->getWindow()Landroid/view/Window;", location = MatchAfterWithin(5)),
        methodCall(
            smali = "Landroid/view/Window;->getDecorView()Landroid/view/View;",
            location = MatchAfterWithin(5),
        ),
    ),
)

internal fun BytecodePatchContext.hasGlassMenusVersion(
    compatibility: Compatibility,
    forcedVersion: String? = null,
): Boolean {
    val version = packageMetadata.versionName
    if (packageMetadata.packageName == compatibility.packageName &&
        (version == forcedVersion || compatibility.targets.orEmpty().any { it.version == version })
    ) return true

    printWarn("Glass menus: ${compatibility.name} $version is not supported; menus are unchanged.")
    return false
}

private fun unavailableHook(surface: String): Boolean {
    printWarn("Glass menus: $surface hook is unavailable; menus are unchanged.")
    return false
}

internal fun BytecodePatchContext.installGlassMenus(): Boolean {
    val bottomSheetClass = MaterialBottomSheetFingerprint.matchAllOrNull()?.singleOrNull()?.classDef
        ?: return unavailableHook("Material bottom sheet")
    val bottomSheet = BottomSheetAttachedFingerprint.matchOrNull(bottomSheetClass)?.method
        ?: return unavailableHook("Material bottom sheet window")
    val bottomSheetStart = BottomSheetStartFingerprint.matchOrNull(bottomSheetClass)?.method
    val dialog = DialogFragmentShowFingerprint.matchAllOrNull()?.singleOrNull()
        ?: return unavailableHook("dialog fragment")
    val showIndex = dialog.instructionMatches.first().index
    val dialogRegister = dialog.method.getInstruction<FiveRegisterInstruction>(showIndex).registerC

    if (!addDrawableDrawnColorHook(LITHO_BACKGROUND_HOOK)) {
        return unavailableHook("Litho background")
    }

    if (bottomSheetStart == null) {
        printWarn("Glass menus: early Material bottom sheet hook is unavailable; keeping its stock dim.")
    } else {
        // Dialog has created its content but has not handed its window attributes to WindowManager.
        // Hook at entry: some versions reuse p0 before returning.
        bottomSheetStart.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $GLASS_MENUS_EXTENSION->onBottomSheetStarting($DIALOG)V",
        )
    }

    bottomSheet.addInstruction(
        0,
        "invoke-static/range {p0 .. p0}, $GLASS_MENUS_EXTENSION->onBottomSheetDialog($DIALOG)V",
    )
    dialog.method.addInstruction(
        showIndex + 1,
        "invoke-static/range {v$dialogRegister .. v$dialogRegister}, $GLASS_MENUS_EXTENSION->onDialogShown($DIALOG)V",
    )
    dialog.method.addInstructionsAtControlFlowLabel(
        showIndex,
        "invoke-static/range {v$dialogRegister .. v$dialogRegister}, " +
            "$GLASS_MENUS_EXTENSION->onDialogBeforeShow($DIALOG)V",
    )
    setExtensionIsPatchIncluded(GLASS_MENUS_EXTENSION)
    return true
}
