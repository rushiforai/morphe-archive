package com.nmnvan.patches.thescore.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import com.nmnvan.patches.thescore.shared.Constants.EXTENSION_PACKAGE
import com.nmnvan.patches.thescore.shared.filterReturnedObjects
import com.nmnvan.patches.thescore.shared.resourceReference
import com.nmnvan.patches.thescore.shared.sharedExtensionPatch

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/settings/SettingsMenuPatch;"

/**
 * Lambda that builds the My Account rows (… App Preferences, Help, About, Log Out).
 */
internal object AccountRowsFingerprint : Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        resourceReference(ResourceType.STRING, "title_app_preferences"),
        resourceReference(ResourceType.STRING, "title_help"),
        resourceReference(ResourceType.STRING, "title_about"),
    )
)

/**
 * SettingsOptionItemViewHolder.onClick(View, SettingsItem): opens a row's destination.
 */
internal object SettingsRowClickFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "L"),
    filters = listOf(
        resourceReference(ResourceType.MENU, "leagues_done_menu"),
        resourceReference(ResourceType.MENU, "favorites_reorder_menu"),
        resourceReference(ResourceType.MENU, "bookmarks_clear_all_menu"),
    )
)

/**
 * Adds a "Morphe Settings" row under "App Preferences" on the My Account screen.
 * Feature patches with settings depend on this patch.
 */
internal val settingsPatch = bytecodePatch {
    dependsOn(sharedExtensionPatch)

    execute {
        AccountRowsFingerprint.method.filterReturnedObjects(
            "$EXTENSION_CLASS->addSettingsRow(Ljava/lang/Object;)Ljava/lang/Object;"
        )

        SettingsRowClickFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p1 .. p2 }, $EXTENSION_CLASS->onSettingsRowClick(Landroid/view/View;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :not_handled
                return-void
                :not_handled
                nop
            """
        )
    }
}
