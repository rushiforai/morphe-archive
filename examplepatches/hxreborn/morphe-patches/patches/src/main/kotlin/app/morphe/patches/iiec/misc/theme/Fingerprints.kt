/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.iiec.misc.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

internal const val DARK_SCHEME_BACKGROUND = -0xfbfbfc

internal object DarkSchemeConstructorFingerprint : Fingerprint(
    name = "<init>",
    filters = listOf(
        opcode(Opcode.SGET_OBJECT),
        literal(DARK_SCHEME_BACKGROUND, location = MatchAfterImmediately()),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, location = MatchAfterImmediately()),
    ),
)

internal object EditorThemeSelectionFingerprint : Fingerprint(
    strings = listOf("appearance_editor_theme_dark", "solarized_dark"),
)
