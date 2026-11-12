// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.misc.openwebpages

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/** Makes a button of a post's bar, tagged with its action, and returns it. */
internal object ControlbarBaseCreateButtonFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/controlbar/ControlbarBase;",
    name = "createButton",
    returnType = "Landroid/widget/ImageView;",
    parameters = listOf("I", "I", "I"),
    filters = listOf(
        opcode(Opcode.RETURN_OBJECT),
    ),
)
