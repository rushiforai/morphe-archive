/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.tasker.patches.menu

import app.loki.patches.universal.menuPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MAIN = "Lnet/dinglisch/android/taskerm/Main;"
private const val ROWS = "Lapp/loki/extension/LokiRows;"
private const val MENU = "Landroid/view/Menu;"
private const val MENU_ITEM = "Landroid/view/MenuItem;"

/**
 * A "Loki Patches" row at the end of Tasker's own overflow menu (the three dots on its main screen).
 *
 * Tasker builds that menu in code: `Main.onPrepareOptionsMenu` hands it to one of Main's own methods, and taps
 * arrive in `onOptionsItemSelected`. Both are framework names the obfuscator cannot change, so they are the
 * anchors. The row is added right after Tasker has finished building the menu, and a tap on it is answered
 * before Tasker's own switch sees it. Tasky, the beginner screen, has no overflow menu; it is reached from the
 * launcher shortcut and the Loki Patches launcher entry.
 */
internal val taskerMenuRowPatch = bytecodePatch {
    dependsOn(menuPatch)

    execute {
        var main: ClassDef? = null
        classDefForEach { if (it.type == MAIN) main = it }
        val mainDef = main ?: throw PatchException("Tasker: the main screen was not found")
        val mutable = mutableClassDefBy(mainDef)

        val prepare = mutable.methods.firstOrNull {
            it.name == "onPrepareOptionsMenu" && it.parameterTypes.map { type -> type.toString() } == listOf(MENU)
        } ?: throw PatchException("Tasker: onPrepareOptionsMenu was not found")

        val body = prepare.implementation!!.instructions.toList()
        val build = body.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref != null && ref.definingClass == MAIN && ref.returnType == "V" &&
                ref.parameterTypes.map { type -> type.toString() } == listOf(MENU)
        }
        require(build >= 0) { "Tasker: the overflow menu builder is no longer called from onPrepareOptionsMenu" }

        prepare.addInstructions(build + 1, "invoke-static {p1}, $ROWS->taskerAdd($MENU)V")

        val selected = mutable.methods.firstOrNull {
            it.name == "onOptionsItemSelected" && it.parameterTypes.map { type -> type.toString() } == listOf(MENU_ITEM)
        } ?: throw PatchException("Tasker: onOptionsItemSelected was not found")

        selected.addInstructions(
            0,
            """
                invoke-static {p0, p1}, $ROWS->taskerSelected(Landroid/content/Context;$MENU_ITEM)Z
                move-result v0
                if-eqz v0, :loki_not_ours
                const/4 v0, 0x1
                return v0
                :loki_not_ours
            """.trimIndent(),
        )
    }
}
