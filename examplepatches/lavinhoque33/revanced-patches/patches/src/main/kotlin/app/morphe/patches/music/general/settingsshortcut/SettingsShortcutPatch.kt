/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-14.
 */

package app.morphe.patches.music.general.settingsshortcut

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.Constants.GENERAL_PATH
import app.morphe.patches.music.utils.patch.PatchList.SETTINGS_SHORTCUT
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.ResourceUtils.updatePatchStatus
import app.morphe.patches.music.utils.settings.addSwitchPreference
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.shared.mapping.ResourceType
import app.morphe.patches.shared.mapping.resourceLiteral
import app.morphe.util.Utils.printWarn
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "$GENERAL_PATH/SettingsShortcutPatch;"

private object AvatarActionViewFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/youtube/music/ui/avatarmenu/AvatarActionProvider;",
    returnType = "Landroid/view/View;",
    parameters = emptyList(),
    filters = listOf(
        resourceLiteral(ResourceType.LAYOUT, "avatar_menu_button"),
        opcode(Opcode.RETURN_OBJECT),
    ),
)

@Suppress("unused")
val settingsShortcutPatch = bytecodePatch(
    SETTINGS_SHORTCUT.title,
    SETTINGS_SHORTCUT.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    dependsOn(settingsPatch)

    execute {
        val match = AvatarActionViewFingerprint.matchOrNull()
        if (match == null) {
            printWarn("Settings shortcut: this Music version has no supported avatar toolbar hook; skipping.")
            return@execute
        }

        val returnIndex = match.instructionMatches.last().index
        val register = match.method.getInstruction<OneRegisterInstruction>(returnIndex).registerA
        match.method.addInstructions(
            returnIndex,
            "invoke-static/range {v$register .. v$register}, " +
                "$EXTENSION_CLASS->addShortcut(Landroid/view/View;)Landroid/view/View;\n" +
                "move-result-object v$register",
        )

        addSwitchPreference(CategoryType.GENERAL, "revanced_settings_shortcut", "false")
        updatePatchStatus(SETTINGS_SHORTCUT)
    }
}
