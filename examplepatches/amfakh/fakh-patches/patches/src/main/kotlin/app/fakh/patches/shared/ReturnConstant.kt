/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

/** Makes a `boolean` method return true without running its body. */
fun MutableMethod.returnTrue() = addInstructions(
    0,
    """
        const/4 v0, 0x1
        return v0
    """,
)

/** Makes a method that returns an `Object` (such as a suspend function resolving to a Boolean) return `Boolean.TRUE`. */
fun MutableMethod.returnBoxedTrue() = addInstructions(
    0,
    """
        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
        return-object v0
    """,
)
