/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.upsells

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/*
 * The share sheet's Threads button, read from 577, 580 and 581 on 2026-10-07. The obfuscated names
 * here are for reviewers; the code finds each by a kept name.
 *
 * Every item the share sheet can show has a type, a constant of one enum whose names include
 * SHARE_TO_THREADS, OFF_PLATFORM_WHATSAPP, COPY_LINK and SHARE_NOW (581 LX/AyF). One method decides
 * which items a sheet gets and in what order: it answers an ImmutableList of those types, putting
 * SHARE_TO_THREADS in for several kinds of sheet (581 LX/aPc;->A00 with five returns, 580
 * LX/dpQ;->A0E and 577 LX/aW2;->A0E with three). The sheet's builder and the Threads item's own
 * controller both take their items from it. Each list it returns goes through the extension, which
 * takes out what Hide Meta upsells (SHARE_TO_THREADS) and Share sheet items (the picked types) ask
 * for and leaves the rest in order, and back through ImmutableList.copyOf, so the method answers
 * the type it declares. The hook is its own patch, shareSheetHookPatch, which both depend on.
 */

internal const val SHARE_TO_THREADS = "SHARE_TO_THREADS"
internal val SHARE_ITEM_TYPES = listOf(SHARE_TO_THREADS, "OFF_PLATFORM_WHATSAPP", "COPY_LINK", "SHARE_NOW")

/**
 * The extension class the hook hands each list to. It runs Hide Meta upsells' Threads switch and
 * Share sheet items' picks, each only when its patch is in.
 */
internal const val SHARE_SHEET_ITEMS = "$EXTENSION_PACKAGE/misc/ShareSheetItems;"
internal const val SHARE_TARGETS = "$SHARE_SHEET_ITEMS->targets(Ljava/util/List;)Ljava/util/List;"

/** How the hook names itself when it refuses: it goes in for either patch. */
private const val SHARE_SHEET_HOOK = "Share sheet item list"

private fun refuseShareHook(detail: String): Nothing = throw PatchException("$SHARE_SHEET_HOOK: $detail")

/**
 * Finds the share sheet's one list of item types and puts the extension in front of each of its
 * returns. Everything is found before anything changes, and it refuses unless the item enum,
 * Guava's copy and exactly one list are there.
 */
internal fun BytecodePatchContext.hookShareSheetItems() {
    val enums = classDefByStrings(SHARE_TO_THREADS, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_PACKAGE) }.distinctBy { it.type }
        .filter { isEnumNaming(it, SHARE_ITEM_TYPES) }
    val enum = enums.singleOrNull()
        ?: refuseShareHook("expected one enum naming ${SHARE_ITEM_TYPES.joinToString()}, found ${enums.size}")
    val threads = enumConstant(enum, SHARE_TO_THREADS)
    val immutableList = classDefByOrNull(IMMUTABLE_LIST) ?: refuseShareHook("this Facebook build has no $IMMUTABLE_LIST")
    if (!definesImmutableCopy(immutableList)) refuseShareHook("$IMMUTABLE_LIST has no copyOf(Collection) here")
    val lists = mutableListOf<Pair<String, Method>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
        for (method in classDef.methods) {
            if (isShareItemList(method, threads)) lists += classDef.type to method
        }
    }
    val list = lists.singleOrNull()
        ?: refuseShareHook("expected one share sheet item list reading $threads, found ${lists.map { it.first }}")
    mutableClassDefBy(list.first).findMutableMethodOf(list.second).filterShareTargets()
}

private fun Method.reads(field: FieldReference) = implementation?.instructions?.any {
    it.opcode == Opcode.SGET_OBJECT && (it as ReferenceInstruction).reference.toString() == field.toString()
} == true

/** Whether [method] is the share sheet's list of item types: it answers an ImmutableList and loads [threads]. */
internal fun isShareItemList(method: Method, threads: FieldReference): Boolean =
    method.returnType == IMMUTABLE_LIST && method.reads(threads) &&
        method.implementation!!.instructions.any { it.opcode == Opcode.RETURN_OBJECT }

/** Whether [immutableList], Guava's ImmutableList, defines the static copyOf(Collection) the hook copies back with. */
internal fun definesImmutableCopy(immutableList: ClassDef): Boolean = immutableList.methods.any {
    it.name == "copyOf" && AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == IMMUTABLE_LIST &&
        it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/Collection;")
}

/**
 * In front of each return of the share sheet's list of item types, the list goes through the
 * extension and back through copyOf on its own register. The code goes in at each return's control
 * flow label, so every branch to a return runs it.
 */
internal fun MutableMethod.filterShareTargets() {
    val returns = implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
    for (index in returns.asReversed()) {
        val answer = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructionsAtControlFlowLabel(
            index,
            """
                invoke-static/range { v$answer .. v$answer }, $SHARE_TARGETS
                move-result-object v$answer
                invoke-static/range { v$answer .. v$answer }, $IMMUTABLE_COPY
                move-result-object v$answer
            """,
        )
    }
}
