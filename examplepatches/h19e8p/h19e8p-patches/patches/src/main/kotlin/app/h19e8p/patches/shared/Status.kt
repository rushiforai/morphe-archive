/*
 * h19e8p Patches
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.h19e8p.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH_STATUS = "Lapp/morphe/extension/h19e8p/PatchStatus;"

/** h19e8p Patches の版。ビルドの時にリソースに埋め込まれる。 */
val bundleVersion: String by lazy {
    object {}.javaClass
        .getResourceAsStream("/app/h19e8p/patches/bundle-version.txt")
        ?.bufferedReader()
        ?.use { it.readText().trim() }
        ?: "?"
}

/** 設定画面の「情報」に、このパッチが当たったと出す。key は PatchStatus の "status:key"。 */
fun BytecodePatchContext.markApplied(key: String) = setStatus("status:$key", "true")

/** 設定画面の「情報」に出す、h19e8p Patches の版を入れる。 */
fun BytecodePatchContext.setBundleVersion() = setStatus("status:version", bundleVersion)

private fun BytecodePatchContext.setStatus(mark: String, value: String) {
    val status = mutableClassDefBy(PATCH_STATUS)
    for (method in status.methods) {
        val index =
            method.instructions.indexOfFirst {
                (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((it as ReferenceInstruction).reference as StringReference).string == mark
            }
        if (index < 0) continue
        val register = (method.instructions.elementAt(index) as OneRegisterInstruction).registerA
        method.replaceInstruction(index, "const-string v$register, \"$value\"")
        return
    }
    throw PatchException("$mark is missing from PatchStatus")
}
