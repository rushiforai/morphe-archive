/*
 * Copyright (C) 2026 hxreborn
 * Copyright (C) 2026 Wagg13
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Adaptado de hxreborn/morphe-patches (patches/src/main/kotlin/app/morphe/patches/
 * graphmessenger/misc/update/{RemoveForcedUpdatePatch,Fingerprints}.kt):
 * https://github.com/hxreborn/morphe-patches
 */
package app.morphe.patches.telegraph.update

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patches.telegraph.TelegraphCompatibility
import app.morphe.patches.telegraph.signature.spoofSignaturePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

// O servidor manda a versão mínima suportada na chave de config
// "tph_force_update_version"; se a versão instalada ficar abaixo dela, o app
// mostra um diálogo bloqueando o uso até atualizar. Localiza a comparação
// pela string da chave de config, que não é ofuscada, em vez de um endereço
// fixo — deve sobreviver a atualizações futuras do app.
private val ForcedUpdateVersionFingerprint = Fingerprint(
    filters = listOf(
        string("tph_force_update_version"),
        methodCall(parameters = listOf("Ljava/lang/String;"), returnType = "I", location = MatchAfterImmediately()),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

@Suppress("unused")
val removeForcedUpdatePatch = bytecodePatch(
    name = "Remove forced update",
    description = "Removes the blocking dialog shown when Graph marks the installed version " +
        "as outdated.",
    default = true
) {
    compatibleWith(TelegraphCompatibility.TELEGRAPH)
    dependsOn(spoofSignaturePatch)

    execute {
        val match = ForcedUpdateVersionFingerprint.match()
        val moveResult = match.instructionMatches.last().index
        val register = match.method.getInstruction<OneRegisterInstruction>(moveResult).registerA
        match.method.addInstruction(moveResult + 1, "const/16 v$register, 0x0")
    }
}
