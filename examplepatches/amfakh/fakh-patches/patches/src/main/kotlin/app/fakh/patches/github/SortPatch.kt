/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.register
import app.fakh.patches.github.shared.Constants.SORT_BY_RECENTLY_UPDATED
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val SORT_FILTER = "Lcom/github/domain/searchandfilter/filters/data/SortFilter;"

private const val DEFAULT_SORT = "Lapp/fakh/extension/github/DefaultSort;"

private const val SORT_SERIAL_NAME = "com.github.android.common.SearchFilterSort"

/**
 * The factory that rebuilds a saved filter from its stored value. Its sort branch decodes the sort enum by this name
 * and builds `new SortFilter(sort)`.
 */
private object SavedSortFingerprint : Fingerprint(
    strings = listOf(SORT_SERIAL_NAME),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                ref.definingClass == SORT_FILTER && ref.name == "<init>" && ref.parameterTypes.size == 1
            } == true
        } == true
    },
)

/** `SortFilter`'s static initializer, which stores the default sort (Newest) in a static field of the sort enum. */
private object SortFilterInitFingerprint : Fingerprint(
    definingClass = SORT_FILTER,
    name = "<clinit>",
)

@Suppress("unused")
val sortByRecentlyUpdatedPatch = patch(
    name = "Sort by Recently updated first",
    description = "Sorts issue and pull request lists by Recently updated instead of Newest. Another sort you pick " +
        "lasts until you leave the list.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(SORT_BY_RECENTLY_UPDATED)

        // Every default filter set builds `new SortFilter()`, which takes the sort from this static field, and the
        // filter bar counts a sort as changed only when it differs from it. Storing UpdatedDescending there
        // changes the default everywhere and keeps the sort chip unmarked.
        val init = SortFilterInitFingerprint.method
        val instructions = init.implementation!!.instructions.toList()
        // The default is the one static field of SortFilter set straight from a constant of its own enum type.
        val loadAt = (1 until instructions.size).firstOrNull { index ->
            val stored = (instructions[index] as? ReferenceInstruction)?.reference as? FieldReference
            val loaded = (instructions[index - 1] as? ReferenceInstruction)?.reference as? FieldReference
            instructions[index].opcode == Opcode.SPUT_OBJECT && stored?.definingClass == SORT_FILTER &&
                instructions[index - 1].opcode == Opcode.SGET_OBJECT && loaded?.type == stored.type &&
                loaded.definingClass == stored.type
        }?.minus(1) ?: throw PatchException("SortFilter default sort not found")
        val sortEnum = ((instructions[loadAt] as ReferenceInstruction).reference as FieldReference).type

        val register = (instructions[loadAt] as OneRegisterInstruction).registerA
        init.addInstructions(
            loadAt + 1,
            """
                invoke-static/range { v$register .. v$register }, $DEFAULT_SORT->saved(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$register
                check-cast v$register, $sortEnum
            """,
        )

        // The app saves the filters of every list it opens, the sort included even when it is the default, and reads
        // them back by decoding the sort's name and building `new SortFilter(sort)`. A saved Newest is read as the
        // new default, or every list opened before the patch would keep Newest.
        val restore = SavedSortFingerprint.method
        val restoreInstructions = restore.implementation!!.instructions.toList()
        val decodeAt = restoreInstructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == SORT_SERIAL_NAME
        }
        val buildAt = (decodeAt until restoreInstructions.size).firstOrNull { index ->
            val ref = (restoreInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            restoreInstructions[index].opcode == Opcode.INVOKE_DIRECT && ref?.definingClass == SORT_FILTER &&
                ref.name == "<init>" && ref.parameterTypes.map(CharSequence::toString) == listOf(sortEnum)
        } ?: throw PatchException("Saved sort SortFilter constructor call not found")
        val sortRegister = (restoreInstructions[buildAt] as FiveRegisterInstruction).registerD
        restore.addInstructions(
            buildAt,
            """
                invoke-static { v$sortRegister }, $DEFAULT_SORT->saved(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$sortRegister
                check-cast v$sortRegister, $sortEnum
            """,
        )
    }
}
