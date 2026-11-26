/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef

private const val ROWS = "Lapp/loki/extension/LokiRows;"
private const val MENU = "Landroid/view/Menu;"
private const val MENU_ITEM = "Landroid/view/MenuItem;"

/**
 * A "Loki Patches" row in an activity's own options menu, for hosts whose menu is the framework one
 * (`onCreateOptionsMenu` / `onOptionsItemSelected`, names the obfuscator cannot change).
 *
 * The row is added just before every return of `onCreateOptionsMenu`, after the host has built its own items, and a
 * tap on it is answered at the top of `onOptionsItemSelected` before the host's own switch runs. Every step that
 * could silently go wrong throws instead: a menu that was moved or whose register is reused must fail in Manager
 * and never ship an app without the entry.
 */
internal fun BytecodePatchContext.addOptionsMenuRow(activity: String, app: String) {
    var found: ClassDef? = null
    classDefForEach { if (it.type == activity) found = it }
    val classDef = found ?: throw PatchException("$app: the main screen ($activity) was not found")
    val methods = mutableClassDefBy(classDef).methods

    val create = methods.firstOrNull {
        it.name == "onCreateOptionsMenu" && it.parameterTypes.map { type -> type.toString() } == listOf(MENU)
    } ?: throw PatchException("$app: onCreateOptionsMenu was not found")
    val selected = methods.firstOrNull {
        it.name == "onOptionsItemSelected" && it.parameterTypes.map { type -> type.toString() } == listOf(MENU_ITEM)
    } ?: throw PatchException("$app: onOptionsItemSelected was not found")

    // The compiler reuses the menu register after its last use (`return true` becomes `const/4 p1, 0x1`), so the
    // menu is remembered on entry and the row is added at each return without touching any register.
    val body = create.implementation!!.instructions.toList()
    val returns = body.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.RETURN || instruction.opcode == Opcode.RETURN_OBJECT ||
            instruction.opcode == Opcode.RETURN_VOID || instruction.opcode == Opcode.RETURN_WIDE
    }.map { it.index }
    if (returns.isEmpty()) throw PatchException("$app: onCreateOptionsMenu has no return to hook")
    for (index in returns.sortedDescending()) {
        create.addInstructions(index, "invoke-static {}, $ROWS->optionsAddRemembered()V")
    }
    // /range: the host's parameter registers can sit above v15, where the plain form silently assembles to nothing.
    create.addInstructions(0, "invoke-static/range {p1 .. p1}, $ROWS->optionsRemember($MENU)V")

    // A free local register for the answer: registerCount counts the locals plus this and the item.
    if (selected.implementation!!.registerCount - 2 < 1) {
        throw PatchException("$app: onOptionsItemSelected has no free register for the Loki tap")
    }
    selected.addInstructions(
        0,
        """
            invoke-static/range {p0 .. p1}, $ROWS->optionsSelected(Landroid/content/Context;$MENU_ITEM)Z
            move-result v0
            if-eqz v0, :loki_not_ours
            const/4 v0, 0x1
            return v0
            :loki_not_ours
        """.trimIndent(),
    )
}
