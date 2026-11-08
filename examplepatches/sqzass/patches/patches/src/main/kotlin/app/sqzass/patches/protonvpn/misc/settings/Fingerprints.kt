/*
 * Copyright (C) 2026 sqzass
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.sqzass.patches.protonvpn.misc.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.methodCall
import app.morphe.patcher.resource.ResourceType
import app.sqzass.patches.protonvpn.misc.anchors.resourceField
import com.android.tools.smali.dexlib2.Opcode

private const val WIDGET_ROW_CALL_DISTANCE = 8

internal object WidgetSettingsRowFingerprint : Fingerprint(
    filters = listOf(
        resourceField(ResourceType.STRING, "settings_widget_title"),
        methodCall(
            opcode = Opcode.INVOKE_STATIC_RANGE,
            returnType = "V",
            parameters = listOf("L", "I", "Ljava/lang/String;", "L", "L", "Z", "Z", "Z", "L", "L", "I", "I"),
            location = MatchAfterWithin(WIDGET_ROW_CALL_DISTANCE),
        ),
    ),
)
