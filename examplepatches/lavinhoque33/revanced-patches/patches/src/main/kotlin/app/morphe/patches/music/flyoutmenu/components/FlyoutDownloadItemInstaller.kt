/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.patches.music.flyoutmenu.components

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.music.interaction.downloads.addDownloadsBridge
import app.morphe.patches.music.utils.extension.Constants.FLYOUT_CLASS_DESCRIPTOR
import app.morphe.patches.shared.misc.fix.proto.parseByteArrayMethodRef
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val ITEM_FACTORY =
    $$"Lapp/morphe/extension/music/patches/flyout/FlyoutPatch$ItemFactory;"
private const val REGISTRY = "Lcom/google/protobuf/ExtensionRegistryLite;"

/** The factory of the song menu sheet: the one place that names the fragment that shows the items. */
private object MenuSheetFactoryFingerprint : Fingerprint(
    strings = listOf("MUSIC_MENU_BOTTOM_SHEET_FRAGMENT_TAG"),
)

/** The loop of the sheet fragment that turns the items of the menu into the rows of its adapter. */
private class RowProvider(val method: Method, val iteratorIndex: Int, val itemType: String)

private fun Instruction.methodRef(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

/**
 * The method of a sheet fragment that iterates the menu's item list, casts each item to the item model and adds it
 * to the adapter, found by that loop and not by name; null when the method is not it.
 */
private fun Method.rowProvider(): RowProvider? {
    if (parameterTypes.isNotEmpty() || AccessFlags.STATIC.isSet(accessFlags) || returnType.length == 1) return null

    val code = implementation?.instructions?.toList() ?: return null
    val iterator = code.indexOfFirst {
        val ref = it.methodRef()
        it.opcode == Opcode.INVOKE_INTERFACE && ref?.name == "iterator" && ref.definingClass == "Ljava/util/List;"
    }
    if (iterator < 0) return null

    val next = code.withIndex().indexOfFirst {
        it.index > iterator && it.value.opcode == Opcode.INVOKE_INTERFACE && it.value.methodRef()?.name == "next"
    }
    if (next < 0) return null

    val cast = (next + 1 until code.size).firstOrNull { code[it].opcode == Opcode.CHECK_CAST } ?: return null
    val added = (cast + 1 until code.size).any {
        code[it].opcode == Opcode.INVOKE_VIRTUAL && code[it].methodRef()?.name == "add"
    }
    if (!added) return null

    val itemType = ((code[cast] as ReferenceInstruction)
        .reference as TypeReference).type
    return RowProvider(this, iterator, itemType)
}

/**
 * Hooks the item list of the song menu sheet so a song menu without a Download item gets one (see
 * FlyoutDownloadEntry), and lets the extension build an item of the menu's own item class. The sheet is found
 * through the fragment its factory creates; when any step does not match, the menu stays as the app builds it.
 */
internal fun BytecodePatchContext.installDownloadItem() {
    try {
        // The factory names the fragment in the method that shows the sheet; that is a method of the same class.
        val fragmentTypes = MenuSheetFactoryFingerprint.classDef.methods
            .flatMap { it.implementation?.instructions.orEmpty() }
            .filter { it.opcode == Opcode.NEW_INSTANCE }
            .map { ((it as ReferenceInstruction).reference as TypeReference).type }
            .distinct()
        val provider = fragmentTypes.firstNotNullOf { type ->
            // Library classes (ArrayList) are not part of the app.
            runCatching { mutableClassDefBy(type) }.getOrNull()?.methods?.firstNotNullOfOrNull { it.rowProvider() }
        }

        bridgeItemFactory(provider.itemType)

        val list = (provider.method.implementation!!.instructions.toList()[provider.iteratorIndex]
            as FiveRegisterInstruction).registerC
        (provider.method as MutableMethod).addInstructions(
            provider.iteratorIndex, """
                invoke-static {v$list}, $FLYOUT_CLASS_DESCRIPTOR->withDownloadItem(Ljava/util/List;)Ljava/util/List;
                move-result-object v$list
            """
        )
        printInfo("Flyout Download item: sheet ${provider.method.definingClass}->${provider.method.name}, " +
            "items ${provider.itemType}")
    } catch (ex: Exception) {
        printWarn("The Download item of the song menu is unavailable on this Music version: ${ex.message}")
    }
}

/** Gives the item model class a method that builds another item of its class from serialized bytes. */
private fun BytecodePatchContext.bridgeItemFactory(itemType: String) {
    val item = mutableClassDefBy(itemType)
    val default = item.fields.single { it.type == itemType && AccessFlags.STATIC.isSet(it.accessFlags) }
    val parserOwner = parseByteArrayMethodRef.get()!!.definingClass
    val parser = mutableClassDefBy(parserOwner).methods.single {
        it.name == "parseFrom" && it.parameterTypes == listOf(parserOwner, "[B", REGISTRY)
    }

    item.interfaces.add(ITEM_FACTORY)
    item.addDownloadsBridge("rvxWithBytes", listOf("[B"), "Ljava/lang/Object;", 4, """
        sget-object v0, $default
        invoke-static {}, $REGISTRY->getGeneratedRegistry()$REGISTRY
        move-result-object v1
        invoke-static {v0, p1, v1}, $parser
        move-result-object v0
        return-object v0
    """)
}
