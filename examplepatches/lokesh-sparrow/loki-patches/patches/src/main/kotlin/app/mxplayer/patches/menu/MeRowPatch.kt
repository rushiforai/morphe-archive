/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.mxplayer.patches.menu

import app.loki.patches.universal.menuPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction


/** `const v0, 0x7f0d00ee` - res/layout/fragment_me, the layout the Me page inflates. */
private const val ME_LAYOUT_ID = 0x7f0d00ee

/**
 * The Me page's fragment hands back a view binding; the injected call builds a "Loki Patches" row and puts it above
 * MX's Settings row. The row is built at runtime from that Settings row - same layout params, background, padding,
 * text colour, size and typeface, and a copy of its icon and chevron - so it follows whatever theme is active.
 * Nothing is added to res/layout/fragment_me.xml: an extra row there sent MX's skin inflater down a fallback path
 * that painted the whole page in the light theme on Android 16.
 */
/** Found by the layout id it inflates, not by name - MX obfuscates the fragment and the method. */
private val mePage = Fingerprint(
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;"),
    returnType = "L",
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction is NarrowLiteralInstruction &&
                (instruction.narrowLiteral.toLong() and 0xffffffffL) == ME_LAYOUT_ID.toLong()
        } == true
    },
)

@Suppress("unused")
internal val meRowHookPatch = bytecodePatch {
    dependsOn(menuPatch)

    extendWith("extensions/extension.mpe")

    execute {
        val method = mePage.method
        var injected = 0
        for (index in method.instructions.count() - 1 downTo 0) {
            val instruction = method.instructions.elementAt(index)
            if (instruction.opcode != Opcode.RETURN_OBJECT) continue
            val register = (instruction as OneRegisterInstruction).registerA
            method.addInstructions(
                index,
                "invoke-static {v$register}, Lapp/loki/extension/MxMe;->addRow(Ljava/lang/Object;)V",
            )
            injected++
        }
        if (injected == 0) throw PatchException("MX's Me page changed - its binding is not returned from one place")
    }
}
