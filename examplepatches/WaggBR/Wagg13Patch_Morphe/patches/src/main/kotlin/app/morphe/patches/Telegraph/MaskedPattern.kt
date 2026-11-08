/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Portado de hxreborn/morphe-patches (patches/src/main/kotlin/app/morphe/patches/
 * readera/shared/NativeSignatureChecks.kt — apenas a classe MaskedPattern):
 * https://github.com/hxreborn/morphe-patches
 *
 * Busca um padrão de bytes de código de máquina dentro de uma lib nativa,
 * onde "??" marca um byte qualquer (usado para ignorar imediatos/registradores
 * que variam, mantendo só o esqueleto fixo da instrução).
 */
package app.morphe.patches.telegraph.shared

import app.morphe.patcher.patch.PatchException

internal class MaskedPattern(val name: String, hex: String) {
    private val bytes = hex.trim().split(Regex("\\s+")).map { if (it == "??") null else it.toInt(16).toByte() }

    val size get() = bytes.size

    fun indicesIn(library: ByteArray): List<Int> = (0..library.size - bytes.size).filter { start ->
        bytes.indices.all { bytes[it] == null || library[start + it] == bytes[it] }
    }

    fun singleIn(library: ByteArray): Int = indicesIn(library).singleOrNull()
        ?: throw PatchException("$name: expected 1 match, found ${indicesIn(library).size}")
}
