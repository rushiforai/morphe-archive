/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.youtube.misc.toolbar

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object ToolBarPatchFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "hookToolBar",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC)
)
