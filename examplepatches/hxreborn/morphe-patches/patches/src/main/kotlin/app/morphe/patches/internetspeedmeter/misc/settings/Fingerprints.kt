/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.internetspeedmeter.misc.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal fun settingsRowFingerprint(titleName: String) = Fingerprint(
    name = "<clinit>",
    filters = listOf(
        resourceLiteral(ResourceType.STRING, titleName),
        fieldAccess(opcode = Opcode.SPUT_OBJECT, location = MatchAfterWithin(4)),
    ),
)

internal fun settingsRowAddFingerprint(row: FieldReference) = Fingerprint(
    definingClass = "Lcom/internet/speed/meter/lite/settings/PreferencesListActivity;",
    name = "<init>",
    filters = listOf(
        fieldAccess(row, Opcode.SGET_OBJECT),
        methodCall(definingClass = "Ljava/util/ArrayList;", name = "add", location = MatchAfterImmediately()),
    ),
)
