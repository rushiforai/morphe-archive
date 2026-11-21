/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.patches.music.navigation.components

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.music.utils.extension.Constants.NAVIGATION_CLASS_DESCRIPTOR
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PIVOT_TAB = "Lapp/morphe/extension/music/patches/navigation/NavigationPatch\$PivotTab;"
private const val LIST = "Ljava/util/List;"
private const val STRING = "Ljava/lang/String;"

internal fun BytecodePatchContext.installSearchTabFilter(renderer: MutableMethod): Boolean {
    // The older pivot model uses a different destination from 9.15+. Only the destination the
    // stock pivot controller recognizes for this target may be removed.
    val legacy = when (packageMetadata.versionName) {
        "6.20.51", "8.12.54", "8.28.54", "8.30.54" -> true
        "9.15.51", "9.40.51", "9.45.51" -> false
        else -> return false
    }
    val searchId = if (legacy) "FEmusic_search" else "FEsearch"
    val filter = if (legacy) "filterLegacySearchTab" else "filterSearchTab"
    val instructions = renderer.implementation?.instructions ?: return false

    // Follow the model list into its iteration and the model's browse ID into the pivot tab map.
    val iteratorIndex = instructions.indexOfFirst {
        it.opcode == Opcode.INVOKE_INTERFACE &&
            it.getReference<MethodReference>()?.toString() == "$LIST->iterator()Ljava/util/Iterator;"
    }
    val listLoad = instructions.getOrNull(iteratorIndex - 1) ?: return false
    val iterator = instructions[iteratorIndex] as FiveRegisterInstruction
    val tabList = listLoad.getReference<FieldReference>() ?: return false
    if (listLoad.opcode != Opcode.IGET_OBJECT || tabList.type != LIST ||
        (listLoad as TwoRegisterInstruction).registerA != iterator.registerC) return false

    val mapIndex = indexOfMapInstruction(renderer)
    val map = instructions.getOrNull(mapIndex) as? FiveRegisterInstruction ?: return false
    val nextIndex = (iteratorIndex + 1 until mapIndex).firstOrNull {
        instructions[it].getReference<MethodReference>()?.toString() ==
            "Ljava/util/Iterator;->next()Ljava/lang/Object;"
    } ?: return false
    val itemCast = instructions.getOrNull(nextIndex + 2) ?: return false
    val itemType = itemCast.getReference<TypeReference>()?.type ?: return false
    if (itemCast.opcode != Opcode.CHECK_CAST) return false
    val itemRegister = (itemCast as OneRegisterInstruction).registerA

    val browseId = (nextIndex + 3 until mapIndex).asSequence().mapNotNull { index ->
        val instruction = instructions[index]
        if (instruction.opcode != Opcode.IGET_OBJECT) return@mapNotNull null
        val field = instruction.getReference<FieldReference>() ?: return@mapNotNull null
        val load = instruction as TwoRegisterInstruction
        field.takeIf {
            field.definingClass == itemType && field.type == STRING &&
                load.registerA == map.registerD && load.registerB == itemRegister
        }
    }.distinct().singleOrNull() ?: return false

    val controller = classDefByOrNull(tabList.definingClass) ?: return false
    if (!renderer.checksForSearchTab(tabList, browseId, searchId) &&
        controller.methods.none { it.checksForSearchTab(tabList, browseId, searchId) }) return false

    val storeIndex = (0 until iteratorIndex).singleOrNull {
        val instruction = instructions[it]
        instruction.opcode == Opcode.IPUT_OBJECT && instruction.getReference<FieldReference>() == tabList
    } ?: return false
    val store = instructions[storeIndex] as TwoRegisterInstruction
    val itemClass = mutableClassDefByOrNull(itemType) ?: return false
    if (itemClass.fields.none { it == browseId }) return false

    itemClass.interfaces.add(PIVOT_TAB)
    itemClass.methods.add(ImmutableMethod(
        itemType, "rvxPivotBrowseId", emptyList(), STRING, AccessFlags.PUBLIC.value,
        null, null, MutableMethodImplementation(2),
    ).toMutable().apply {
        addInstructions(0, """
            iget-object v0, p0, $browseId
            return-object v0
        """)
    })

    // Replace the store in place: on modern targets the nonempty input branch jumps directly here.
    // Both tab indexing and the stock toolbar-presence check use the same installed list.
    val listRegister = store.registerA
    renderer.replaceInstruction(storeIndex, "check-cast v$listRegister, $LIST")
    renderer.addInstructions(storeIndex + 1, """
        invoke-static/range {v$listRegister .. v$listRegister}, $NAVIGATION_CLASS_DESCRIPTOR->$filter($LIST)$LIST
        move-result-object v$listRegister
        iput-object v$listRegister, v${store.registerB}, $tabList
    """)
    return true
}

private fun Method.checksForSearchTab(tabList: FieldReference, browseId: FieldReference, searchId: String): Boolean {
    val instructions = implementation?.instructions ?: return false
    if (instructions.none { it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>() == tabList }) {
        return false
    }

    return instructions.asSequence().windowed(3).any { (idLoad, literal, call) ->
        idLoad.opcode == Opcode.IGET_OBJECT && idLoad.getReference<FieldReference>() == browseId &&
            literal.getReference<StringReference>()?.string == searchId &&
            call.opcode == Opcode.INVOKE_VIRTUAL &&
            call.getReference<MethodReference>()?.toString() == "$STRING->equals(Ljava/lang/Object;)Z" &&
            (call as FiveRegisterInstruction).registerC == (idLoad as TwoRegisterInstruction).registerA &&
            call.registerD == (literal as OneRegisterInstruction).registerA
    }
}
