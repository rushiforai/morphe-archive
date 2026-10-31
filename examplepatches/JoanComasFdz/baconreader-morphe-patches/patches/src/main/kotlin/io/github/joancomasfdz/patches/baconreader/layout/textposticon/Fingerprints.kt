// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.textposticon

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode

/** Post list rows: LinkHolder (list view) and LinkCardHolder (card view). */
internal const val LINK_HOLDER_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/adapters/LinkHolder;"
internal const val LINK_CARD_HOLDER_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/adapters/LinkCardHolder;"

/** The constructor, where "this.next = (ImageView) findViewById(R.id.next)" sets the expand button. */
internal object LinkHolderConstructorFingerprint : Fingerprint(
    definingClass = LINK_HOLDER_CLASS_DESCRIPTOR,
    name = "<init>",
    filters = listOf(setNextButton(LINK_HOLDER_CLASS_DESCRIPTOR)),
)

internal object LinkCardHolderConstructorFingerprint : Fingerprint(
    definingClass = LINK_CARD_HOLDER_CLASS_DESCRIPTOR,
    name = "<init>",
    filters = listOf(setNextButton(LINK_CARD_HOLDER_CLASS_DESCRIPTOR)),
)

private fun setNextButton(holder: String) = fieldAccess(
    definingClass = holder,
    name = "next",
    type = "Landroid/widget/ImageView;",
    opcode = Opcode.IPUT_OBJECT,
)

internal object LinkHolderRotateSelftextArrowFingerprint : Fingerprint(
    definingClass = LINK_HOLDER_CLASS_DESCRIPTOR,
    name = "rotateSelftextArrow",
    returnType = "V",
    parameters = listOf("Z", "I"),
)

internal object LinkCardHolderRotateSelftextArrowFingerprint : Fingerprint(
    definingClass = LINK_CARD_HOLDER_CLASS_DESCRIPTOR,
    name = "rotateSelftextArrow",
    returnType = "V",
    parameters = listOf("Z", "I"),
)
