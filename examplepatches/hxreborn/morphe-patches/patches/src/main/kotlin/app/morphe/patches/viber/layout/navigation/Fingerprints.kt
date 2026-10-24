/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.viber.layout.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal object BuildHomeTabsFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            parameters = listOf("Ljava/util/ArrayList;", "I", "L"),
            returnType = "Z",
        ),
        string("Home tabs count("),
    ),
)

internal fun tabVisibilityFingerprint(tabVisibilityMethod: MethodReference) = Fingerprint(
    definingClass = tabVisibilityMethod.definingClass,
    name = tabVisibilityMethod.name,
    returnType = tabVisibilityMethod.returnType,
    parameters = tabVisibilityMethod.parameterTypes.map(CharSequence::toString),
)
