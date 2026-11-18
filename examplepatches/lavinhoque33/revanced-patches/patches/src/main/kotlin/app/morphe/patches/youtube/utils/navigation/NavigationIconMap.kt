/*
 * Copyright (C) 2026 anddea
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-17.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.patches.youtube.utils.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.youtube.utils.resourceid.ytFillBell
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** Newer clients assemble icon maps from pairs instead of adding entries with EnumMap.put(). */
private object NavigationIconMapStoreFingerprint : Fingerprint(
    name = "<clinit>",
    filters = listOf(
        literal({ ytFillBell }),
        fieldAccess(opcode = Opcode.SPUT_OBJECT, definingClass = "this", type = "Ljava/util/Map;")
    )
)

context(_: BytecodePatchContext)
internal fun hookNavigationIconMap(enumField: String, callback: String) {
    NavigationIconMapStoreFingerprint.clearMatch()
    NavigationIconMapStoreFingerprint.let {
        it.method.hookNavigationIconMapStore(it.instructionMatches.last().index, enumField, callback)
    }
}

/** Replace the completed map before publication, including when a branch targets its store. */
internal fun MutableMethod.hookNavigationIconMapStore(storeIndex: Int, enumField: String, callback: String) {
    val mapRegister = (implementation!!.instructions[storeIndex] as OneRegisterInstruction).registerA
    val enumRegister = findFreeRegister(storeIndex, mapRegister)

    addInstructionsAtControlFlowLabel(
        storeIndex,
        """
            sget-object v$enumRegister, $enumField
            invoke-static { v$mapRegister, v$enumRegister }, $callback(Ljava/util/Map;Ljava/lang/Enum;)Ljava/util/Map;
            move-result-object v$mapRegister
        """
    )
}
