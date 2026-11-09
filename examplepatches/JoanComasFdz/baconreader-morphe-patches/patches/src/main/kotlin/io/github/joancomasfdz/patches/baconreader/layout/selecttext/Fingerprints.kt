// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.selecttext

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal const val POST_CONTROL_BAR_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/controlbar/PostControlBar;"
internal const val CONTROLBAR_BASE_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/controlbar/ControlbarBase;"

/**
 * The action bar of a comment, or of a post in the list, adds its buttons for the post or comment it shows; the ones
 * past the bar's width go to its "More options" menu. The filter is where it keeps "Copy":
 * this.copyButton = setButton("Copy").setImage(...).
 */
internal object PostControlBarUpdateButtonsFingerprint : Fingerprint(
    definingClass = POST_CONTROL_BAR_CLASS_DESCRIPTOR,
    name = "updateButtons",
    returnType = "V",
    parameters = listOf("Lcom/onelouder/baconreader/reddit/ThingData;"),
    filters = listOf(
        fieldAccess(
            definingClass = POST_CONTROL_BAR_CLASS_DESCRIPTOR,
            name = "copyButton",
            opcode = Opcode.IPUT_OBJECT,
        ),
    ),
)

/** The bar under a post, and under a post card, inflates its ⋮ menu (link_card.xml) and sets its click listener. */
internal object ControlbarBaseDrawBarFingerprint : Fingerprint(
    definingClass = CONTROLBAR_BASE_CLASS_DESCRIPTOR,
    name = "drawBar",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/appcompat/widget/PopupMenu;",
            name = "setOnMenuItemClickListener",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
)

/** Runs the tapped item of a post's ⋮ menu, by its id. */
internal object ControlbarBaseOnActionFingerprint : Fingerprint(
    definingClass = CONTROLBAR_BASE_CLASS_DESCRIPTOR,
    name = "onAction",
    returnType = "Z",
    parameters = listOf("I"),
)
