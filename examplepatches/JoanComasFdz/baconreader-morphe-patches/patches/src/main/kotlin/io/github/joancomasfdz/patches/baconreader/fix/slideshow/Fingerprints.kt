// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.slideshow

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

/** Sizes a post's page in the Slide Show View from the display, and returns its layout params. */
internal object PortraitPageLayoutGetLayoutParamsFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/PortraitPageLayout;",
    name = "getLayoutParams",
    returnType = "Landroid/view/ViewGroup\$LayoutParams;",
)

/** Image, GIF and video posts: sets their text, under the media, in an ExpandableTextView. */
internal object PostMediaHandlerConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/PostMediaHandler;",
    name = "<init>",
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Lcom/onelouder/baconreader/ExpandableTextView;",
            name = "setText",
            parameters = listOf("Ljava/lang/CharSequence;"),
        ),
    ),
)
