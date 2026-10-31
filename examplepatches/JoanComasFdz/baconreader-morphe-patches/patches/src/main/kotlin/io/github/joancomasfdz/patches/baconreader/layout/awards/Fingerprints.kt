// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.awards

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal const val CONTROL_BAR_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/controlbar/ControlBar;"
internal const val CONTROL_BAR_BUTTON_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/controlbar/ControlBarButton;"

/** Adds a button to the action bar of comments and posts. */
internal object ControlBarSetButtonFingerprint : Fingerprint(
    definingClass = CONTROL_BAR_CLASS_DESCRIPTOR,
    name = "setButton",
    returnType = CONTROL_BAR_BUTTON_CLASS_DESCRIPTOR,
    parameters = listOf("Ljava/lang/String;"),
)

/** Handles the clicks of the post bar, including the ⋮ button that shows its menu. */
internal object ControlbarBaseOnClickFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/controlbar/ControlbarBase;",
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/appcompat/widget/PopupMenu;",
            name = "show",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
)

internal object HideAwardIconsFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/Preferences;",
    name = "hideAwardIcons",
    returnType = "Z",
    parameters = listOf(),
)

internal object HideAwardIconsOnDetailViewFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/Preferences;",
    name = "hideAwardIconsOnDetailView",
    returnType = "Z",
    parameters = listOf(),
)

/**
 * Fills the settings lists, including the two "Hide Reddit Awards" settings: list.add(new Setting(id, ...)).
 * The app adds HIDE_AWARD_ICONS_DETAIL_VIEW before HIDE_AWARD_ICONS.
 */
internal object SettingsAdapterInitSettingsFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/SettingsAdapter;",
    name = "initSettings",
    returnType = "V",
    filters = listOf(
        *addSetting("HIDE_AWARD_ICONS_DETAIL_VIEW"),
        *addSetting("HIDE_AWARD_ICONS"),
    ),
)

private fun addSetting(settingId: String) = arrayOf(
    fieldAccess(
        definingClass = "Lcom/onelouder/baconreader/adapters/SettingIds;",
        name = settingId,
        opcode = Opcode.SGET_OBJECT,
    ),
    methodCall(
        name = "add",
        opcodes = listOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_INTERFACE),
        location = InstructionLocation.MatchAfterWithin(2),
    ),
)
