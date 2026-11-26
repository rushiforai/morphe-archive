/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Ported from hxreborn/morphe-patches (protonvpn/misc/restrictions/FreeServerCheck.kt).
 */

package app.morphe.patches.protonvpn.shared.restrictions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionFilter
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.classDefBy
import app.morphe.patches.protonvpn.shared.fingerprints.SERVER
import app.morphe.patches.protonvpn.shared.fingerprints.SERVER_MANAGER
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal val freeServerMethod: Method
    get() = classDefBy(SERVER).methods.single { method ->
        method.returnType == "Z" &&
            method.parameterTypes.isEmpty() &&
            !AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.implementation?.instructions?.take(2)?.map { it.opcode } ==
            listOf(Opcode.IGET, Opcode.IF_NEZ)
    }

internal fun freeServerCheckFingerprint(
    vararg followingFilters: InstructionFilter,
) = Fingerprint(
    filters = listOf(
        methodCall(freeServerMethod),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ) + followingFilters,
)

internal fun invertFreeServerCheckForFreeAccount(check: Fingerprint) {
    check.match().run {
        val isFreeServerResult = instructionMatches[1]
        val register = isFreeServerResult.getInstruction<OneRegisterInstruction>().registerA
        method.addInstructions(
            isFreeServerResult.index + 1,
            """
                invoke-static { v$register }, ${SERVER_MANAGER}->hxShouldExcludeServer(Z)Z
                move-result v$register
            """,
        )
    }
}
