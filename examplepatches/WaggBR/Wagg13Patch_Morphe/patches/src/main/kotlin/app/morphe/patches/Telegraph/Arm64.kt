/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Portado de hxreborn/morphe-patches (patches/src/main/kotlin/app/morphe/patches/
 * netanalyzer/shared/Arm64ElfReader.kt — objeto Arm64 extraído sozinho, sem o
 * leitor de ELF completo, que não é usado por este patch):
 * https://github.com/hxreborn/morphe-patches
 *
 * Decodificador mínimo de instruções AArch64 usado para localizar e reescrever
 * as rotinas nativas de checagem de certificado dentro de libtmessages.49.so.
 */
package app.morphe.patches.telegraph.shared

internal object Arm64 {
    const val INSTRUCTION_BYTES = 4

    private const val REGISTER_MASK = 0x1f
    private const val BASE_REGISTER_SHIFT = 5
    private const val RETURN = 0xd65f03c0.toInt()

    private const val ADRP_MASK = 0x9f000000.toInt()
    private const val ADRP = 0x90000000.toInt()
    private const val ADRP_LOW_SHIFT = 29
    private const val ADRP_LOW_MASK = 0x3
    private const val ADRP_HIGH_SHIFT = 5
    private const val ADRP_HIGH_MASK = 0x7ffff
    private const val ADRP_HIGH_BITS = 2
    private const val ADRP_IMMEDIATE_BITS = 21
    private const val PAGE_BITS = 12

    private const val LOAD64_MASK = 0xffc00000.toInt()
    private const val LOAD64 = 0xf9400000.toInt()
    private const val LOAD64_IMMEDIATE_SHIFT = 10
    private const val LOAD64_IMMEDIATE_MASK = 0xfff
    private const val LOAD64_SCALE = 8

    private const val BRANCH_LINK_MASK = 0xfc000000.toInt()
    private const val BRANCH_LINK = 0x94000000.toInt()
    private const val BRANCH = 0x14000000
    private const val BRANCH_IMMEDIATE_BITS = 26
    private const val BRANCH_IMMEDIATE_MASK = (1 shl BRANCH_IMMEDIATE_BITS) - 1

    fun isReturn(instruction: Int) = instruction == RETURN

    fun isAdrp(instruction: Int) = instruction and ADRP_MASK == ADRP

    fun isLoad64(instruction: Int) = instruction and LOAD64_MASK == LOAD64

    fun isBranchLink(instruction: Int) = instruction and BRANCH_LINK_MASK == BRANCH_LINK

    fun destination(instruction: Int) = instruction and REGISTER_MASK

    fun baseRegister(instruction: Int) = (instruction ushr BASE_REGISTER_SHIFT) and REGISTER_MASK

    fun adrpPage(instruction: Int, address: Long): Long {
        val low = (instruction ushr ADRP_LOW_SHIFT) and ADRP_LOW_MASK
        val high = (instruction ushr ADRP_HIGH_SHIFT) and ADRP_HIGH_MASK
        val immediate = signExtend((high shl ADRP_HIGH_BITS) or low, ADRP_IMMEDIATE_BITS).toLong()
        return (address shr PAGE_BITS shl PAGE_BITS) + (immediate shl PAGE_BITS)
    }

    fun load64Offset(instruction: Int) =
        ((instruction ushr LOAD64_IMMEDIATE_SHIFT) and LOAD64_IMMEDIATE_MASK).toLong() * LOAD64_SCALE

    fun branchLinkTarget(instruction: Int, address: Int) =
        address + signExtend(instruction and BRANCH_IMMEDIATE_MASK, BRANCH_IMMEDIATE_BITS) * INSTRUCTION_BYTES

    fun branch(offsetWords: Int) = BRANCH or (offsetWords and BRANCH_IMMEDIATE_MASK)

    fun branchLink(offsetWords: Int) = BRANCH_LINK or (offsetWords and BRANCH_IMMEDIATE_MASK)

    private fun signExtend(value: Int, bits: Int) = (value shl (Int.SIZE_BITS - bits)) shr (Int.SIZE_BITS - bits)
}
