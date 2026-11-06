/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2964
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-10-24: adapted to the RVX settings, toolbar hook and patcher.
 */

package app.morphe.patches.youtube.interaction.channelsearch

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.mapping.resourceMappingPatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.CHANNEL_SEARCH
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.patches.youtube.utils.toolbar.hookToolBarWithImageView
import app.morphe.patches.youtube.utils.toolbar.toolBarHookPatch
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources
import app.morphe.util.findFreeRegister
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.indexOfFirstInstructionReversedOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS = "Lapp/morphe/extension/youtube/patches/ChannelSearchPatch;"

private val channelSearchResourcePatch = resourcePatch(
    description = "channelSearchResourcePatch"
) {
    execute {
        copyResources(
            "youtube/channelsearch",
            ResourceGroup("drawable", "morphe_channel_search_button.xml")
        )
    }
}

@Suppress("unused")
val channelSearchPatch = bytecodePatch(
    name = CHANNEL_SEARCH.title,
    description = CHANNEL_SEARCH.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        resourceMappingPatch,
        toolBarHookPatch,
        channelSearchResourcePatch,
    )

    execute {
        // Add a dedicated channel-search action while keeping YouTube's original icon global.
        hookToolBarWithImageView("$EXTENSION_CLASS->setSearchButtonView")

        hookChannelBrowseId()

        // Leaving a channel for the search feed shows no browse page, so nothing would
        // otherwise replace the browse id of the channel.
        SearchResultsFragmentOnCreateViewFingerprint.method.addInstruction(
            0,
            "invoke-static { }, $EXTENSION_CLASS->clearBrowseId()V"
        )

        hookSearchBoxHint()

        SearchSubmitFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1 }, $EXTENSION_CLASS->searchInChannel(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :search_all_of_youtube
                return-void
                :search_all_of_youtube
                nop
            """
        )

        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: GENERAL",
                "SETTINGS: CHANNEL_SEARCH"
            ),
            CHANNEL_SEARCH
        )
    }
}

/**
 * A channel page browses by its channel id, which is what the search is scoped to.
 */
context(context: BytecodePatchContext)
private fun hookChannelBrowseId() {
    BrowseFragmentOnCreateViewFingerprint.let {
        it.method.apply {
            val endpointIndex = indexOfEndpointRead(it.instructionMatches.first().index)
            val endpointField = getInstruction<ReferenceInstruction>(endpointIndex)
                .getReference<FieldReference>()!!

            // Browse data is an extension of the endpoint, and reading it starts with that field.
            val browseDataExtensionIndex = indexOfFirstInstructionOrThrow(endpointIndex, Opcode.SGET_OBJECT)
            val browseDataExtensionField = getInstruction<ReferenceInstruction>(browseDataExtensionIndex)
                .getReference<FieldReference>()!!

            val browseIdMethod = findBrowseIdMethod(endpointField, browseDataExtensionField)

            hookEndpointSetter(definingClass, endpointField, browseIdMethod)
        }
    }
}

/**
 * The endpoint of the page is the field of the fragment read last before the
 * browse data check fails.
 */
private fun Method.indexOfEndpointRead(stringIndex: Int) =
    indexOfFirstInstructionReversedOrThrow(stringIndex) {
        opcode == Opcode.IGET_OBJECT &&
                getReference<FieldReference>()?.definingClass == definingClass
    }

/**
 * Matches two identical methods in different classes, either method works here.
 */
context(context: BytecodePatchContext)
private fun findBrowseIdMethod(endpointField: FieldReference, browseDataExtensionField: FieldReference) =
    Fingerprint(
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
        returnType = "Ljava/lang/String;",
        parameters = listOf(endpointField.type),
        filters = listOf(
            fieldAccess(browseDataExtensionField, Opcode.SGET_OBJECT)
        )
    ).matchAll(1..2).first().originalMethod

/**
 * The fragment is handed the endpoint of every page it shows, including a page that
 * is returned to and served from cache, which makes no browse request to read.
 */
context(context: BytecodePatchContext)
private fun hookEndpointSetter(fragmentClass: String, endpointField: FieldReference, browseIdMethod: Method) {
    Fingerprint(
        definingClass = fragmentClass,
        returnType = "V",
        parameters = listOf(endpointField.type),
        filters = listOf(
            fieldAccess(endpointField, Opcode.IPUT_OBJECT)
        )
    ).method.apply {
        val insertIndex = indexOfFirstInstructionOrThrow {
            opcode == Opcode.IPUT_OBJECT && getReference<FieldReference>() == endpointField
        } + 1
        val freeRegister = findFreeRegister(insertIndex)

        addInstructions(
            insertIndex,
            """
                invoke-static { p1 }, $browseIdMethod
                move-result-object v$freeRegister
                invoke-static { v$freeRegister }, $EXTENSION_CLASS->setBrowseId(Ljava/lang/String;)V
            """
        )
    }
}

/**
 * The search box otherwise still reads as a search of all of YouTube.
 * Only the default hint is replaced, not the hint of Shorts or playlist search.
 */
context(context: BytecodePatchContext)
private fun hookSearchBoxHint() {
    SearchBoxHintFingerprint.let {
        it.method.apply {
            val index = it.instructionMatches.last().index
            val register = getInstruction<OneRegisterInstruction>(index).registerA

            addInstructions(
                index + 1,
                """
                    invoke-static { v$register }, $EXTENSION_CLASS->getSearchHint(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                """
            )
        }
    }
}
