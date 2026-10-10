/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.layout.branding.header

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object DrawerHeaderRenderFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Landroid/view/ViewGroup;->removeAllViews()V"
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Landroid/view/ViewGroup;->addView(Landroid/view/View;)V"
        )
    )
)
