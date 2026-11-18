/*
 * Copyright (C) 2026 lavinhoque33
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-17.
 * Written by lavinhoque33, 2026-11-17.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.music.general.components

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val FILTER_CLASS =
    "Lapp/morphe/extension/music/patches/components/LayoutComponentsFilter;"

internal fun BytecodePatchContext.hideSuggestedSearchShelves() {
    // Each shelf item holds one renderer: a search history entry, a suggested search,
    // or another renderer used outside the search page.
    val shelfItemsMatches = MusicShelfItemsFingerprint.instructionMatches
    val shelfItemsField = shelfItemsMatches[0].fieldReference
    val searchHistoryField = shelfItemsMatches[2].fieldReference
    val suggestedSearchField = shelfItemsMatches[4].fieldReference
    val shelfType = shelfItemsField.definingClass
    val shelfItemType = searchHistoryField.definingClass
    val protoListType = shelfItemsField.type
    val protoListMutableCopyMethod = Fingerprint(
        definingClass = protoListType,
        returnType = protoListType,
        parameters = listOf("I")
    ).method

    SearchSuggestionsRenderFingerprint.let {
        it.method.apply {
            val sectionListWrapperInit = it.instructionMatches[1]
            val sectionListWrapperInitReference = sectionListWrapperInit.getInstruction<ReferenceInstruction>()
                .reference as MethodReference
            val sectionListType = sectionListWrapperInitReference.parameterTypes.first().toString()
            val sectionListRegister = sectionListWrapperInit.instruction.registersUsed[1]

            // The section list wrapper converts a section list item to its renderer.
            val sectionListItemType = Fingerprint(
                definingClass = sectionListWrapperInitReference.definingClass,
                returnType = "Lj$/util/Optional;",
                parameters = listOf("L")
            ).method.parameterTypes.first().toString()

            val sectionListItemShelfField = classDefBy(sectionListItemType).fields.first { field ->
                field.type == shelfType
            }
            val sectionListContentsFields = classDefBy(sectionListType).fields.filter { field ->
                !AccessFlags.STATIC.isSet(field.accessFlags) && field.type == protoListType
            }
            val recyclerViewField = it.classDef.fields.first { field ->
                field.type == "Landroid/support/v7/widget/RecyclerView;"
            }

            // Returns the list without the shelves that only hold suggested searches.
            // Copy the protobuf list only on the first removal; keep the original list otherwise.
            val removeShelvesMethod = ImmutableMethod(
                definingClass,
                "patch_removeSuggestedSearchShelves",
                listOf(ImmutableMethodParameter(protoListType, null, null)),
                protoListType,
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(10),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-interface { p0 }, Ljava/util/List;->size()I
                        move-result v0
                        const/4 v1, 0x0
                        const/4 v2, 0x0
                        const/4 v3, 0x0

                        :next_section
                        if-ge v3, v0, :sections_done
                        invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
                        move-result-object v4
                        add-int/lit8 v3, v3, 0x1
                        instance-of v5, v4, $sectionListItemType
                        if-eqz v5, :keep_section
                        move-object v5, v4
                        check-cast v5, $sectionListItemType
                        iget-object v5, v5, $sectionListItemShelfField
                        if-eqz v5, :keep_section
                        iget-object v5, v5, $shelfItemsField
                        invoke-interface { v5 }, Ljava/util/List;->iterator()Ljava/util/Iterator;
                        move-result-object v5
                        const/4 v6, 0x0

                        :next_shelf_item
                        invoke-interface { v5 }, Ljava/util/Iterator;->hasNext()Z
                        move-result v7
                        if-eqz v7, :shelf_items_done
                        invoke-interface { v5 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
                        move-result-object v7
                        check-cast v7, $shelfItemType
                        iget-object v8, v7, $searchHistoryField
                        if-nez v8, :keep_section
                        iget-object v8, v7, $suggestedSearchField
                        if-eqz v8, :keep_section
                        const/4 v6, 0x1
                        goto :next_shelf_item

                        :shelf_items_done
                        if-eqz v6, :keep_section
                        if-nez v1, :remove_section
                        invoke-interface { p0, v0 }, $protoListMutableCopyMethod
                        move-result-object v1

                        :remove_section
                        sub-int v4, v3, v2
                        add-int/lit8 v4, v4, -0x1
                        invoke-interface { v1, v4 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
                        add-int/lit8 v2, v2, 0x1
                        goto :next_section

                        :keep_section
                        goto :next_section

                        :sections_done
                        if-eqz v1, :unchanged
                        return-object v1

                        :unchanged
                        return-object p0
                    """
                )
            }.also { method -> it.classDef.methods.add(method) }

            // Removes the 'You may also like' shelf from the section list, if enabled.
            val hideSectionMethod = ImmutableMethod(
                definingClass,
                "patch_hideYouMayAlsoLikeSection",
                listOf(
                    ImmutableMethodParameter(definingClass, null, null),
                    ImmutableMethodParameter(sectionListType, null, null)
                ),
                "V",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(3),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    """
                        iget-object v0, p0, $recyclerViewField
                        invoke-static { v0 }, $FILTER_CLASS->hideYouMayAlsoLikeSection(Landroid/view/View;)Z
                        move-result v0
                        if-eqz v0, :exit
                    """ + sectionListContentsFields.joinToString("") { field ->
                        """
                        iget-object v0, p1, $field
                        invoke-static { v0 }, $removeShelvesMethod
                        move-result-object v0
                        iput-object v0, p1, $field
                        """
                    } + """
                        :exit
                        return-void
                    """
                )
            }.also { method -> it.classDef.methods.add(method) }

            addInstruction(
                it.instructionMatches[0].index,
                "invoke-static { p0, v$sectionListRegister }, $hideSectionMethod"
            )
        }
    }
}
