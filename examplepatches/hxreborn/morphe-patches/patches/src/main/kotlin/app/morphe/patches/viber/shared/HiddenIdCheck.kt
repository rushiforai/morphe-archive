/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.viber.shared

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patches.shared.misc.smali.addStaticMethod

internal fun MutableClass.addHiddenIdCheck(name: String, hiddenIds: Collection<Number>): String = addStaticMethod(
    name = name,
    parameters = listOf("I"),
    returnType = "Z",
    registers = 2,
    smali = hiddenIds.joinToString("") { id ->
        """
            const v0, $id
            if-eq p0, v0, :hidden
        """
    } + """
        const/4 v0, 0x0
        return v0
        :hidden
        const/4 v0, 0x1
        return v0
    """,
)
