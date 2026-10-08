/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.upsells

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.addInstructionsAtControlFlowLabel
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
 * SHARE_TO_THREADS, OFF_PLATFORM_WHATSAPP, COPY_LINK and SHARE_NOW (581 LX/AyF, 580 LX/Azp, 577
 * LX/B30). One method decides which items a sheet gets and in what order: it answers an
 * ImmutableList of those types, putting SHARE_TO_THREADS in for several kinds of sheet (581
 * LX/aPc;->A00 with five returns, 580 LX/dpQ;->A0E and 577 LX/aW2;->A0E with three). The sheet's
 * builder and the Threads item's own controller both take their items from it. Each list it
 * returns goes through the extension, which takes SHARE_TO_THREADS out and leaves the rest in
 * order, and back through ImmutableList.copyOf, so the method answers the type it declares.
 */

internal const val SHARE_TO_THREADS = "SHARE_TO_THREADS"
internal val SHARE_ITEM_TYPES = listOf(SHARE_TO_THREADS, "OFF_PLATFORM_WHATSAPP", "COPY_LINK", "SHARE_NOW")

internal const val SHARE_TARGETS = "$META_UPSELLS->shareTargets(Ljava/util/List;)Ljava/util/List;"

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
