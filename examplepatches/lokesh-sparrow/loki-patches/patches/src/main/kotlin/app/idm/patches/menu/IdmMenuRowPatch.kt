/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.idm.patches.menu

import app.loki.patches.universal.menuPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MAIN = "Lidm/internet/download/manager/MainActivity;"
private const val ROWS = "Lapp/loki/extension/LokiRows;"

/** `R.id.nav_upgrade` in 1DM 20.0: the drawer's "Upgrade to 1DM+" row. */
private const val NAV_UPGRADE = 0x7f0a0865

/**
 * A "Loki Patches" row in 1DM's own navigation drawer.
 *
 * The drawer has a row at the bottom that only sells 1DM+. It is the app's own view, found in `MainActivity.onCreate`
 * with `findViewById(nav_upgrade)` and given its click listener a few instructions later. `MainActivity` is declared
 * in the manifest, so its name survives obfuscation. Right after that listener is set, the view is handed to the
 * extension, which gives it the Loki Patches text, the puzzle icon and the tap. Nothing is added to the drawer's
 * list, so there is nothing to renumber, and the row keeps the drawer's own styling.
 */
internal val idmMenuRowPatch = bytecodePatch {
    dependsOn(menuPatch)

    execute {
        var main: ClassDef? = null
        classDefForEach { if (it.type == MAIN) main = it }
        val mainDef = main ?: throw PatchException("1DM: the main screen was not found")
        val onCreate = mutableClassDefBy(mainDef).methods.firstOrNull {
            it.name == "onCreate" && it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/os/Bundle;")
        } ?: throw PatchException("1DM: MainActivity.onCreate was not found")

        val body = onCreate.implementation!!.instructions.toList()
        val lookup = body.indexOfFirst { (it as? NarrowLiteralInstruction)?.narrowLiteral == NAV_UPGRADE }
        if (lookup < 0) throw PatchException("1DM: the drawer's upgrade row (nav_upgrade) is no longer looked up in onCreate")

        val click = (lookup until body.size).firstOrNull {
            val ref = (body[it] as? ReferenceInstruction)?.reference as? MethodReference
            ref != null && ref.name == "setOnClickListener" && body[it] is FiveRegisterInstruction
        } ?: throw PatchException("1DM: the upgrade row no longer gets a click listener in onCreate")
        val view = (body[click] as FiveRegisterInstruction).registerC

        onCreate.addInstructions(click + 1, "invoke-static {v$view}, $ROWS->idmRow(Landroid/view/View;)V")
    }
}
