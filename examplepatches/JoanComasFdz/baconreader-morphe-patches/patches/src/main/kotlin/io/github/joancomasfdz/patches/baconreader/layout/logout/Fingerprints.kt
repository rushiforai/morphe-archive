// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.logout

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * Builds the menu's items, then hands them to the adapter. With an account logged in and the accounts open, the first
 * of them is "Log out", the only item whose taps log out: items.add(new DrawerItem(2, "Log out", icon, 100)).
 */
internal object DrawerHandlerUpdateDrawerFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/DrawerHandler;",
    name = "updateDrawer",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("Log out"),
        methodCall(
            name = "add",
            opcodes = listOf(Opcode.INVOKE_INTERFACE),
            location = InstructionLocation.MatchAfterWithin(2),
        ),
    ),
)
