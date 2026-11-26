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

package app.morphe.patches.youtube.layout.glassmenus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patches.shared.drawable.drawableColorHookPatch
import app.morphe.patches.shared.layout.glassmenus.GLASS_MENUS_DESCRIPTION
import app.morphe.patches.shared.layout.glassmenus.GLASS_MENUS_EXTENSION
import app.morphe.patches.shared.layout.glassmenus.GLASS_MENUS_NAME
import app.morphe.patches.shared.layout.glassmenus.hasGlassMenusVersion
import app.morphe.patches.shared.layout.glassmenus.installGlassMenus
import app.morphe.patches.shared.mapping.ResourceType.LAYOUT
import app.morphe.patches.shared.mapping.resourceLiteral
import app.morphe.patches.shared.mapping.resourceMappingPatch
import app.morphe.patches.youtube.general.downloads.FeedPopupWindowFlyoutFingerprint
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.util.Utils.printWarn
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findInstructionIndicesReversedOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val POPUP_WINDOW = "Landroid/widget/PopupWindow;"
private const val SHOW_POPUP = "$POPUP_WINDOW->showAtLocation(Landroid/view/View;III)V"

private object AddToPlaylistViewFingerprint : Fingerprint(
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    filters = listOf(resourceLiteral(LAYOUT, "playlist_add_to_fragment")),
)

private object PlayerGearControllerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "I", "Ljava/util/Set;"),
    filters = listOf(
        methodCall(parameters = listOf("L", "Lcom/google/protobuf/MessageLite;"), returnType = "V"),
        literal(400L), // The Gear fragment's large-form width in dp.
        methodCall(name = "getSupportFragmentManager", parameters = emptyList()),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf("L", "Ljava/lang/String;"),
            returnType = "V",
            location = MatchAfterWithin(3),
        ),
    ),
)

private fun BytecodePatchContext.hookLandscapePlayerGear() {
    val controller = PlayerGearControllerFingerprint.matchAllOrNull()?.singleOrNull()
    val gearFragment = controller?.instructionMatches?.lastOrNull()
        ?.instruction?.getReference<MethodReference>()?.definingClass
    val content = gearFragment?.let { fragment ->
        Fingerprint(
            definingClass = fragment,
            returnType = "Landroid/view/View;",
            parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
            filters = listOf(
                methodCall(opcode = Opcode.INVOKE_SUPER, returnType = "Landroid/view/View;"),
                opcode(Opcode.RETURN_OBJECT),
            ),
        ).matchAllOrNull()?.singleOrNull()
    }
    if (content == null) {
        printWarn("Glass menus: landscape player Gear panel hook is unavailable; keeping its existing presentation.")
        return
    }

    val returnIndex = content.instructionMatches.last().index
    val register = content.method.getInstruction<OneRegisterInstruction>(returnIndex).registerA
    content.method.addInstructionsAtControlFlowLabel(
        returnIndex,
        "invoke-static/range {v$register .. v$register}, " +
            "$GLASS_MENUS_EXTENSION->markLandscapePlayerGearView(Landroid/view/View;)V",
    )
}

@Suppress("unused")
val glassMenusPatch = bytecodePatch(GLASS_MENUS_NAME, GLASS_MENUS_DESCRIPTION) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(sharedExtensionPatch, settingsPatch, drawableColorHookPatch, resourceMappingPatch)

    execute {
        if (!hasGlassMenusVersion(COMPATIBILITY_YOUTUBE)) return@execute

        val playlist = AddToPlaylistViewFingerprint.matchAllOrNull()?.singleOrNull()?.method
        if (playlist == null) {
            return@execute printWarn("Glass menus: Save to playlist view hook is unavailable; menus are unchanged.")
        }

        // Reuse the feed flyout match but exclude methods that only dismiss an existing popup.
        // The stock call builds the popup wrapper synchronously, before the first traversal.
        val popups = FeedPopupWindowFlyoutFingerprint.matchAllOrNull().orEmpty().mapNotNull { match ->
            val method = match.method
            val displayIndex = method.implementation!!.instructions.indexOfFirst {
                it.getReference<MethodReference>()?.toString() == SHOW_POPUP
            }
            if (displayIndex < 0) null else method to displayIndex
        }
        if (popups.isEmpty()) {
            return@execute printWarn("Glass menus: popup window hook is unavailable; menus are unchanged.")
        }
        if (!installGlassMenus()) return@execute

        popups.forEach { (method, index) ->
            val register = method.getInstruction<FiveRegisterInstruction>(index).registerC
            method.addInstruction(
                index + 1,
                "invoke-static/range {v$register .. v$register}, $GLASS_MENUS_EXTENSION->onPopupWindow($POPUP_WINDOW)V",
            )
        }

        playlist.findInstructionIndicesReversedOrThrow(Opcode.RETURN_OBJECT).forEach { index ->
            val register = playlist.getInstruction<OneRegisterInstruction>(index).registerA
            playlist.addInstructionsAtControlFlowLabel(
                index,
                "invoke-static/range {v$register .. v$register}, " +
                    "$GLASS_MENUS_EXTENSION->onAddToPlaylistView(Landroid/view/View;)V",
            )
        }

        hookLandscapePlayerGear()

        addPreference(arrayOf("PREFERENCE_SCREEN: GENERAL", "SETTINGS: GLASS_MENUS"))
    }
}
