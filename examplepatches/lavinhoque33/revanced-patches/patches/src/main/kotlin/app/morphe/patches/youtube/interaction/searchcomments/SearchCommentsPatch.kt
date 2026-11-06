/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3942
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-10-24: adapted to the RVX settings, patcher and patch helpers.
 */

package app.morphe.patches.youtube.interaction.searchcomments

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.litho.addLithoFilter
import app.morphe.patches.shared.litho.lithoFilterPatch
import app.morphe.patches.youtube.player.comments.PanelSubheaderFingerprint
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.engagement.engagementPanelHookPatch
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.SEARCH_COMMENTS
import app.morphe.patches.youtube.utils.resourceid.sharedResourceIdPatch
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.patches.youtube.video.information.videoInformationPatch
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.indexOfFirstInstructionReversedOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val EXTENSION_FILTER =
    "Lapp/morphe/extension/youtube/patches/components/CommentsSearchFilter;"

private const val SECTION_LIST_ACCESS_INTERFACE =
    $$"Lapp/morphe/extension/youtube/patches/components/CommentsSearchFilter$SectionListAccess;"

private val searchCommentsResourcePatch = resourcePatch(
    description = "searchCommentsResourcePatch"
) {
    execute {
        copyResources(
            "youtube/searchcomments",
            ResourceGroup("drawable", "morphe_search_comments_button.xml")
        )
    }
}

/**
 * Adds a method with no parameters to a class of the app, so the extension can call it
 * through an interface.
 */
private fun MutableClass.addBridge(name: String, returnType: String, registerCount: Int, smali: String) {
    methods.add(
        ImmutableMethod(
            type,
            name,
            listOf(),
            returnType,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null,
            null,
            MutableMethodImplementation(registerCount),
        ).toMutable().apply {
            addInstructionsWithLabels(0, smali)
        }
    )
}

@Suppress("unused")
val searchCommentsPatch = bytecodePatch(
    name = SEARCH_COMMENTS.title,
    description = SEARCH_COMMENTS.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        sharedResourceIdPatch,
        lithoFilterPatch,
        engagementPanelHookPatch,
        videoInformationPatch,
        searchCommentsResourcePatch,
    )

    execute {
        addLithoFilter(EXTENSION_FILTER)

        // The search button is added next to the close button of the comments panel.
        PanelSubheaderFingerprint.method.apply {
            val removeAllViewsIndex = indexOfFirstInstructionReversedOrThrow {
                opcode == Opcode.INVOKE_VIRTUAL &&
                        getReference<MethodReference>()?.name == "removeAllViews"
            }

            val setVisibilityIndex = indexOfFirstInstructionOrThrow(removeAllViewsIndex) {
                opcode == Opcode.INVOKE_VIRTUAL &&
                        getReference<MethodReference>()?.name == "setVisibility"
            }

            val subheaderRegister = getInstruction<FiveRegisterInstruction>(setVisibilityIndex).registerC

            addInstruction(
                setVisibilityIndex + 1,
                "invoke-static { v$subheaderRegister }, $EXTENSION_FILTER->onPanelSubheaderShown(Landroid/view/View;)V"
            )
        }

        // The comments are reloaded after a search, as when the sort order is changed,
        // so the search applies to all of them.
        val refreshMatches = SectionListRefreshFingerprint.instructionMatches
        val reloadContinuationType = refreshMatches.first().getFieldAccessed()
        val hasContinuationMethod = refreshMatches[1].getMethodCalled()
        val reloadMethod = refreshMatches.last().getMethodCalled()
        val listViewField = SectionListControllerConstructorFingerprint.instructionMatches
            .first().getFieldAccessed()

        mutableClassDefBy(listViewField.definingClass).apply {
            interfaces.add(SECTION_LIST_ACCESS_INTERFACE)

            addBridge(
                "patch_getListView", "Landroid/view/View;", 2,
                """
                    iget-object v0, p0, $listViewField
                    return-object v0
                """
            )
            addBridge(
                "patch_reload", "Z", 2,
                """
                    sget-object v0, $reloadContinuationType
                    invoke-virtual { p0, v0 }, $hasContinuationMethod
                    move-result v0
                    if-eqz v0, :no_reload_continuation
                    invoke-virtual { p0 }, $reloadMethod
                    :no_reload_continuation
                    return v0
                """
            )
        }

        // The section list is handed to the extension once it is created.
        SectionListControllerConstructorFingerprint.method.apply {
            val returnIndex = indexOfFirstInstructionReversedOrThrow(Opcode.RETURN_VOID)

            addInstruction(
                returnIndex,
                "invoke-static/range { p0 .. p0 }, " +
                        "$EXTENSION_FILTER->onSectionListCreated($SECTION_LIST_ACCESS_INTERFACE)V"
            )
        }

        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: PLAYER",
                "SETTINGS: SEARCH_COMMENTS"
            ),
            SEARCH_COMMENTS
        )
    }
}
