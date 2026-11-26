/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.patchLog
import app.morphe.patches.pinterest.misc.extension.requireStub
import app.morphe.patches.pinterest.misc.extension.writeStub
import app.morphe.patches.pinterest.ui.calls
import app.morphe.patches.pinterest.ui.mutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

private const val SEEN_PINS = "$EXTENSION_PACKAGE/ads/SeenPins;"
internal const val SEEN_PINS_HOOK = "$SEEN_PINS->shown(Ljava/lang/Object;)V"
private const val PIN_MODELS = "Lcom/pinterest/api/model/"

/**
 * The pin grid cells (#52): each one's impression start, which Pinterest runs when the cell comes on
 * screen, and the getter for the pin it shows, by class name.
 */
internal class SeenCells(val starts: List<Method>, val pins: List<Method>)

/**
 * A pin grid cell is a class that declares both `getPin()`, answering a pin model, and its own
 * `markImpressionStart()`, the one that isn't the `Object` bridge. Both names are kept, being an
 * interface's. In 14.45.0 that's `d02/k`, the cell, and `d02/p`, a wrapper that starts its cell's
 * impression; a pin seen through both is noted once. Null when the build has none.
 */
internal fun BytecodePatchContext.seenCellsOrNull(what: String): SeenCells? {
    val cells = mutableListOf<Pair<Method, Method>>()
    classDefForEach { owner ->
        if (owner.type.startsWith("Lapp/hushpinterest/") || AccessFlags.INTERFACE.isSet(owner.accessFlags)) return@classDefForEach
        val pin = owner.methods.singleOrNull { it.isOwn() && it.name == "getPin" && it.returnType.startsWith(PIN_MODELS) }
        val start = owner.methods.singleOrNull { it.isOwn() && it.name == "markImpressionStart" && it.returnType != "Ljava/lang/Object;" }
        if (pin == null || start == null) return@classDefForEach
        // The stub casts to the class and calls its getter from the extension's own package.
        if (!owner.isPublic() || !AccessFlags.PUBLIC.isSet(pin.accessFlags)) {
            patchLog.warning("$what: the pin cell ${owner.type} isn't public, so pins it shows aren't noted as seen")
            return@classDefForEach
        }
        cells += pin to start
    }
    if (cells.isEmpty()) return null
    requireStub(SEEN_PINS, "pinOf")
    // By class, so the stub reads the same way every time this build is patched.
    val sorted = cells.sortedBy { it.first.definingClass }
    return SeenCells(sorted.map { it.second }, sorted.map { it.first })
}

private fun Method.isOwn() = implementation != null && parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(accessFlags) &&
    !AccessFlags.ABSTRACT.isSet(accessFlags)

private fun ClassDef.isPublic() = AccessFlags.PUBLIC.isSet(accessFlags)

/**
 * Has each cell hand itself to the extension first thing in its impression start, and writes the
 * stub that reads the pin off whichever cell it is. Goes in once.
 */
internal fun BytecodePatchContext.installSeenCells(cells: SeenCells) {
    val read = buildString {
        cells.pins.forEachIndexed { at, pin ->
            appendLine("instance-of v0, p0, ${pin.definingClass}")
            appendLine("if-eqz v0, :hush_other_cell_$at")
            appendLine("check-cast p0, ${pin.definingClass}")
            appendLine("invoke-virtual { p0 }, $pin")
            appendLine("move-result-object v0")
            appendLine("return-object v0")
            appendLine(":hush_other_cell_$at")
        }
        appendLine("const/4 v0, 0x0")
        append("return-object v0")
    }
    writeStub(SEEN_PINS, "pinOf", 2, read)
    for (start in cells.starts) {
        val method = mutable(start)
        if (method.calls().any { it.definingClass == SEEN_PINS }) continue
        method.addInstructions(0, "invoke-static/range { p0 .. p0 }, $SEEN_PINS_HOOK")
    }
}
