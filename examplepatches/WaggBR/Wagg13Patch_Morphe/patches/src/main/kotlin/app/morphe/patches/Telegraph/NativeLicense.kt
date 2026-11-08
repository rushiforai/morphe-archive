/*
 * Copyright (C) 2026 hxreborn
 * Copyright (C) 2026 Wagg13
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Adaptado de hxreborn/morphe-patches (patches/src/main/kotlin/app/morphe/patches/
 * graphmessenger/shared/NativeLicense.kt):
 * https://github.com/hxreborn/morphe-patches
 *
 * O Graph Messenger tem, além do isPremium() do Telegram, um sistema de
 * licença PRÓPRIO: três métodos nativos em ConnectionsManager —
 * native_checkLicense, native_daysFile e native_expireFile — que controlam
 * um período de teste e, aparentemente, se os anúncios são exibidos. Sem
 * zerar isso também, o app continua se achando "expirado" mesmo com o
 * isPremium() do Telegram forçado, e os anúncios continuam aparecendo.
 *
 * Reescrito para não depender de app.morphe.util.findInstructionIndicesReversed
 * (privado ao build do hxreborn); a mesma varredura reversa está reimplementada
 * aqui com dexlib2 puro.
 */
package app.morphe.patches.telegraph.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val CONNECTIONS_MANAGER_CLASS = "Lorg/telegram/tgnet/ConnectionsManager;"

internal const val LICENSE_CHECK_METHOD = "native_checkLicense"
internal const val LICENSE_DAYS_LEFT_METHOD = "native_daysFile"
internal const val LICENSE_EXPIRED_METHOD = "native_expireFile"

/**
 * Troca o valor de retorno de toda chamada a [methodName] (de
 * ConnectionsManager, que deve vir seguida de move-result) dentro deste
 * método, varrendo de trás para frente para não deslocar os índices
 * encontrados à medida que instruções são inseridas.
 */
internal fun MutableMethod.overrideNativeLicenseCallResults(methodName: String, value: Int) {
    val indices = implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (instruction.opcode == Opcode.INVOKE_STATIC &&
            reference?.definingClass == CONNECTIONS_MANAGER_CLASS &&
            reference.name == methodName
        ) index else null
    }

    indices.reversed().forEach { callIndex ->
        val moveResult = getInstruction<OneRegisterInstruction>(callIndex + 1)
        if (moveResult.opcode != Opcode.MOVE_RESULT) {
            throw PatchException("$methodName call in $this is not followed by move-result")
        }
        addInstruction(callIndex + 2, "const/16 v${moveResult.registerA}, $value")
    }
}
