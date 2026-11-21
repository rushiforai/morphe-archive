/*
 * Copyright (C) 2022-2026 anddea
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Original author(s):
 * - anddea (https://github.com/anddea)
 * - inotia00 (https://github.com/inotia00)
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14.
 *
 * ------------------------------------------------------------------------
 * GPLv3 Section 7 – Additional Terms & Attribution Requirements
 * ------------------------------------------------------------------------
 *
 * This file contains substantial original work by the author(s) listed above.
 *
 * In accordance with Section 7 of the GNU General Public License v3.0,
 * the following additional terms apply to this file:
 *
 * 1. Source Credit Preservation (Section 7(b)): This specific copyright notice
 *    and the list of original authors above must be preserved in any copy
 *    or derivative work. You may add your own copyright notice below it,
 *    but you may not remove the original one.
 *
 * 2. Origin & Modification Marking (Section 7(c)): Modified versions must be
 *    clearly marked as such (e.g., by adding a "Modified by" line or a new
 *    copyright notice) and must not be misrepresented as the original work.
 *
 * 3. Version Control Attribution (Section 7(b)): Any ports or substantial
 *    modifications must retain historical authorship credit in version control
 *    systems (e.g., Git), listing original author(s) appropriately and
 *    modifiers as committers or co-authors.
 *
 * 4. User Interface Attribution (Section 7(b)): Any works containing or
 *    derived from this material must maintain a visible credit or
 *    acknowledgment to the original author(s) within the application's
 *    user interface (e.g., in an "About" or "Credits" section).
 */

package app.morphe.patches.youtube.utils.returnyoutubedislike

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.litho.relayout.LithoTextMountFingerprint
import app.morphe.patches.shared.litho.relayout.lithoRelayoutPatch
import app.morphe.patches.shared.textcomponent.hookTextComponent
import app.morphe.patches.shared.textcomponent.textComponentPatch
import app.morphe.patches.youtube.shared.WatchNextResponseParserFingerprint
import app.morphe.patches.youtube.utils.extension.Constants.COMPONENTS_PATH
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.componentlist.hookElementList
import app.morphe.patches.youtube.utils.componentlist.lazilyConvertedElementHookPatch
import app.morphe.patches.youtube.utils.extension.Constants.UTILS_PATH
import app.morphe.patches.youtube.utils.feedcards.feedVideoCardsHookPatch
import app.morphe.patches.youtube.utils.fix.litho.lithoLayoutPatch
import app.morphe.patches.youtube.utils.patch.PatchList.RETURN_YOUTUBE_DISLIKE
import app.morphe.patches.youtube.utils.playservice.is_18_49_or_greater
import app.morphe.patches.youtube.utils.playservice.is_20_07_or_greater
import app.morphe.patches.youtube.utils.playservice.versionCheckPatch
import app.morphe.patches.youtube.utils.rollingNumberTextViewAnimationUpdateFingerprint
import app.morphe.patches.youtube.utils.rollingNumberTextViewFingerprint
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.patches.youtube.video.information.videoInformationPatch
import app.morphe.patches.youtube.video.videoid.hookPlayerResponseVideoId
import app.morphe.patches.youtube.video.videoid.hookVideoId
import app.morphe.patches.youtube.player.action.restoreOldVideoActionBarPatch
import app.morphe.util.Utils.printWarn
import app.morphe.util.addFreeRegisters
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.findInstructionIndicesReversedOrThrow
import app.morphe.util.findMethodOrThrow
import app.morphe.util.fingerprint.methodOrThrow
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.numberOfParameterRegisters
import app.morphe.util.indexOfFirstLiteralInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION_RYD_CLASS_DESCRIPTOR =
    "$UTILS_PATH/ReturnYouTubeDislikePatch;"

private val returnYouTubeDislikeRollingNumberPatch = bytecodePatch(
    description = "returnYouTubeDislikeRollingNumberPatch"
) {
    dependsOn(versionCheckPatch)

    execute {
        if (!is_18_49_or_greater) {
            return@execute
        }

        RollingNumberSetterFingerprint.let {
            val method = it.method
            val modelCast = it.instructionMatches.first().index
            val modelClass = method.getInstruction<ReferenceInstruction>(modelCast).reference.toString()
            val constructor = findMethodOrThrow(modelClass)
            val textField = constructor.getInstruction<ReferenceInstruction>(
                constructor.indexOfFirstInstructionOrThrow(Opcode.IPUT_OBJECT)
            ).reference
            val readText = method.indexOfFirstInstruction(modelCast + 1) {
                opcode == Opcode.IGET_OBJECT && getReference<FieldReference>() == textField
            }
            if (readText < 0 || (textField as? FieldReference)?.type != "Ljava/lang/String;") {
                printWarn("Return YouTube Dislike: native rolling count model unavailable.")
                return@execute
            }

            // Preserve the conversion context parameter. Native code reuses its original register
            // before it reads the string for the rolling model. Leave the shared proto untouched.
            val context = method.implementation!!.registerCount
            val scratchText = context + 1
            val (converter, offset) = method.addFreeRegisters(method.numberOfParameterRegisters + 2)
            converter.apply {
                val index = readText + offset
                val text = getInstruction<TwoRegisterInstruction>(index).registerA

                addInstructions(index + 1, """
                    move-object/from16 v$context, p2
                    move-object/from16 v$scratchText, v$text
                    invoke-static/range {v$context .. v$scratchText}, $EXTENSION_RYD_CLASS_DESCRIPTOR->onRollingNumberLoaded(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$text
                """)
            }
        }

        // Rolling Number text views use the measured width of the raw string for layout.
        // Modify the measure text calculation to include the left drawable separator if needed.
        RollingNumberMeasureAnimatedTextFingerprint.let {
            it.method.apply {
                val endIndex = it.instructionMatches.last().index
                val measuredTextWidthIndex = endIndex - 2
                val measuredTextWidthRegister =
                    getInstruction<TwoRegisterInstruction>(measuredTextWidthIndex).registerA

                addInstructions(
                    endIndex + 1, """
                        invoke-static {p1, v$measuredTextWidthRegister}, $EXTENSION_RYD_CLASS_DESCRIPTOR->onRollingNumberMeasured(Ljava/lang/String;F)F
                        move-result v$measuredTextWidthRegister
                        """
                )

                val ifGeIndex = indexOfFirstInstructionOrThrow(Opcode.IF_GE)
                val ifGeInstruction = getInstruction<TwoRegisterInstruction>(ifGeIndex)

                removeInstruction(ifGeIndex)
                addInstructionsWithLabels(
                    ifGeIndex, """
                        if-ge v${ifGeInstruction.registerA}, v${ifGeInstruction.registerB}, :jump
                        """, ExternalLabel("jump", getInstruction(endIndex))
                )
                hookRollingMeasureText()
            }
        }

        val rollingNumberMeasureTextClass = RollingNumberMeasureTextParentFingerprint.match().classDef
        RollingNumberMeasureStaticLabelFingerprint.match(rollingNumberMeasureTextClass).let {
            it.method.apply {
                val measureTextIndex = it.instructionMatches.first().index + 1
                val freeRegister = getInstruction<TwoRegisterInstruction>(0).registerA

                addInstructions(
                    measureTextIndex + 1, """
                        move-result v$freeRegister
                        invoke-static {p1, v$freeRegister}, $EXTENSION_RYD_CLASS_DESCRIPTOR->onRollingNumberMeasured(Ljava/lang/String;F)F
                        """
                )
                hookRollingMeasureText()
            }
        }

        // The rolling number Span is missing styling since it's initially set as a String.
        // Modify the UI text view and use the styled like/dislike Span.
        arrayOf(
            rollingNumberTextViewFingerprint.methodOrThrow() to "bindRollingNumber",
            rollingNumberTextViewAnimationUpdateFingerprint.methodOrThrow(rollingNumberTextViewFingerprint)
                    to "updateRollingNumber",
        ).forEach { (method, hook) ->
            // Recent versions have both a static label and a bitmap animation branch.
            method.findInstructionIndicesReversedOrThrow {
                val reference = getReference<MethodReference>()
                reference?.name == "setText" && reference.parameterTypes == listOf("Ljava/lang/CharSequence;")
            }.forEach { index ->
                val instruction = method.getInstruction<FiveRegisterInstruction>(index)
                method.replaceInstruction(index,
                    "invoke-static {v${instruction.registerC}, v${instruction.registerD}}, " +
                            "$EXTENSION_RYD_CLASS_DESCRIPTOR->$hook(Landroid/widget/TextView;Ljava/lang/CharSequence;)V")
            }
        }
    }
}

private fun MutableMethod.hookRollingMeasureText() {
    addInstructions(0, """
        invoke-static/range {p1 .. p1}, $EXTENSION_RYD_CLASS_DESCRIPTOR->rollingNumberTextForMeasure(Ljava/lang/String;)Ljava/lang/String;
        move-result-object p1
    """)
}

context(_: BytecodePatchContext)
private fun hookSegmentedCountResolution() {
    val mount = LithoTextMountFingerprint.method
    val component = LithoTextMountFingerprint.classDef
    val contextType = mount.parameterTypes.first()
    val layoutDataType = mount.parameterTypes.last()
    val layoutMethods = component.methods.filter {
        it.returnType == "V" && it.parameterTypes.size >= 3 && it.parameterTypes.first() == contextType &&
                it.parameterTypes.last() == layoutDataType && it.parameterTypes[1] != "Ljava/lang/Object;"
    }
    val measure = layoutMethods.singleOrNull { it.parameterTypes.size == 3 }
    val layout = layoutMethods.singleOrNull {
        it.parameterTypes.size == 6 && it.parameterTypes[1] == measure?.parameterTypes?.get(1) &&
                it.parameterTypes.subList(2, 4) == listOf("I", "I")
    }
    if (measure == null || layout == null) {
        printWarn("Return YouTube Dislike: native segmented count layout unavailable.")
        return
    }

    // Both native sizing passes read text before the separately stored content description.
    val reads = listOf(measure, layout).map { method ->
        val index = method.indexOfFirstInstruction {
            val reference = getReference<FieldReference>()
            opcode == Opcode.IGET_OBJECT && reference?.definingClass == component.type &&
                    reference.type == "Ljava/lang/CharSequence;"
        }
        method to index
    }
    if (reads.any { (_, index) -> index < 0 } ||
        reads.map { (method, index) -> method.getInstruction<ReferenceInstruction>(index).reference }.distinct().size != 1
    ) {
        printWarn("Return YouTube Dislike: native segmented count text field unavailable.")
        return
    }

    // The three-parameter pass can reuse layouts from the preceding sizing pass when specs
    // match. Reject only a cached layout whose marked RYD presentation has since changed.
    val (cacheMethod, textIndex) = reads.first()
    val textRegister = cacheMethod.getInstruction<TwoRegisterInstruction>(textIndex).registerA
    val implementation = cacheMethod.implementation!!
    val instructions = implementation.instructions
    val dataParameterRegister = implementation.registerCount - 1
    val dataCast = instructions.withIndex().filter { (index, instruction) ->
        if (index <= textIndex || instruction.opcode != Opcode.CHECK_CAST) {
            return@filter false
        }
        val input = instructions[index - 1]
        input.opcode == Opcode.MOVE_OBJECT_FROM16 && input is TwoRegisterInstruction &&
                input.registerB == dataParameterRegister &&
                input.registerA == (instruction as OneRegisterInstruction).registerA
    }.singleOrNull()
    // The parameter's declared type is a common base type; the Layout fields live on its cast.
    val dataClass = dataCast?.value?.getReference<TypeReference>()?.type
    val dataRegister = (dataCast?.value as? OneRegisterInstruction)?.registerA
    val cacheReads = instructions.withIndex().filter { (index, instruction) ->
        if (dataCast == null || index <= dataCast.index || instruction.opcode != Opcode.IGET_OBJECT) {
            return@filter false
        }
        val reference = instruction.getReference<FieldReference>()
        reference?.definingClass == dataClass && reference?.type == "Landroid/text/Layout;" &&
                (instruction as TwoRegisterInstruction).registerB == dataRegister
    }
    if (cacheReads.size != 2 || cacheReads.any { (_, instruction) ->
            (instruction as TwoRegisterInstruction).registerA == textRegister
        }
    ) {
        printWarn("Return YouTube Dislike: native segmented count layout cache unavailable.")
        return
    }
    for ((index, instruction) in cacheReads.asReversed()) {
        val cachedLayout = (instruction as TwoRegisterInstruction).registerA
        cacheMethod.addInstructions(index + 1, """
            invoke-static {v$cachedLayout, v$textRegister}, $EXTENSION_RYD_CLASS_DESCRIPTOR->reuseSegmentedCountLayout(Landroid/text/Layout;Ljava/lang/CharSequence;)Landroid/text/Layout;
            move-result-object v$cachedLayout
        """)
    }

    for ((method, index) in reads) {
        val register = method.getInstruction<TwoRegisterInstruction>(index).registerA
        method.addInstructions(index + 1, """
            invoke-static {v$register}, $EXTENSION_RYD_CLASS_DESCRIPTOR->resolveSegmentedCount(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
            move-result-object v$register
        """)
    }
    hookTextComponent(EXTENSION_RYD_CLASS_DESCRIPTOR)
}

@Suppress("unused")
val returnYouTubeDislikePatch = bytecodePatch(
    RETURN_YOUTUBE_DISLIKE.title,
    RETURN_YOUTUBE_DISLIKE.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(
        settingsPatch,
        returnYouTubeDislikeRollingNumberPatch,
        textComponentPatch,
        lithoLayoutPatch,
        lithoRelayoutPatch,
        restoreOldVideoActionBarPatch,
        videoInformationPatch,
        lazilyConvertedElementHookPatch,
        // Finds the feed video cards for the like counts on their thumbnails.
        feedVideoCardsHookPatch,
    )

    execute {
        // RYD owns its server-layout detection even when Hide action buttons is excluded.
        WatchNextResponseParserFingerprint.let {
            it.clearMatch()
            it.method.apply {
                val index = it.instructionMatches[5].index
                val register = getInstruction<OneRegisterInstruction>(index).registerA

                addInstruction(
                    index + 1,
                    "invoke-static { v$register }, $COMPONENTS_PATH/ActionButtonsFilter;->" +
                        "onSingleColumnWatchNextResultsLoaded(Lcom/google/protobuf/MessageLite;)V"
                )
            }
        }

        // Hook the endpoint parser instead of three endpoint methods. Playlist actions use the
        // same endpoint names but omit the video ID, so passing both values lets the extension
        // reject them without generating incorrect RYD requests.
        val endpointServiceNameField = EndpointServiceNameFingerprint
            .instructionMatches.last().fieldReference
        val likeEndpointParserClass = DislikeFingerprint.classDef.superclass!!
        val videoIdField = requestParameterCheckFingerprint(likeEndpointParserClass)
            .instructionMatches.last().fieldReference

        likeEndpointParserFingerprint(likeEndpointParserClass).let {
            it.method.apply {
                val insertIndex = it.instructionMatches[1].index + 1
                val likeEndpointTargetClassRegister =
                    getInstruction<TwoRegisterInstruction>(insertIndex - 1).registerA
                val registerProvider = getFreeRegisterProvider(
                    insertIndex,
                    2,
                    likeEndpointTargetClassRegister,
                )
                val endpointServiceNameRegister = registerProvider.getFreeRegister()
                val videoIdRegister = registerProvider.getFreeRegister()

                addInstructions(
                    insertIndex,
                    """
                        iget-object v$endpointServiceNameRegister, p0, $endpointServiceNameField
                        iget-object v$videoIdRegister, v$likeEndpointTargetClassRegister, $videoIdField
                        invoke-static {v$endpointServiceNameRegister, v$videoIdRegister}, $EXTENSION_RYD_CLASS_DESCRIPTOR->sendVote(Ljava/lang/String;Ljava/lang/String;)V
                    """,
                )
            }
        }

        hookSegmentedCountResolution()
        hookElementList("$EXTENSION_RYD_CLASS_DESCRIPTOR->onLazilyConvertedElementLoaded")
        hookDislikePill()

        // region Inject newVideoLoaded event handler to update dislikes when a new video is loaded
        hookVideoId("$EXTENSION_RYD_CLASS_DESCRIPTOR->newVideoLoaded(Ljava/lang/String;)V")

        // Hook the player response video id, to start loading RYD sooner in the background.
        hookPlayerResponseVideoId("$EXTENSION_RYD_CLASS_DESCRIPTOR->preloadVideoId(Ljava/lang/String;Z)V")

        // endregion

        if (is_20_07_or_greater) {
            // Turn off a/b flag that enables new code for creating litho spans.
            // If enabled then the litho text span hook is never called.
            // Target code is very obfuscated and exactly what the code does is not clear.
            // Return late so debug patch logs if the flag is enabled.
            TextComponentFeatureFlagFingerprint.method.apply {
                val literalIndex = indexOfFirstLiteralInstruction(LITHO_NEW_TEXT_COMPONENT_FEATURE_FLAG)
                val moveResultIndex = indexOfFirstInstructionOrThrow(literalIndex, Opcode.MOVE_RESULT)
                val register = getInstruction<OneRegisterInstruction>(moveResultIndex).registerA
                addInstructions(
                    moveResultIndex + 1,
                    "const/16 v$register, 0x0",
                )
            }
        }

        // region add settings

        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: RETURN_YOUTUBE_DISLIKE"
            ),
            RETURN_YOUTUBE_DISLIKE
        )

        // endregion
    }
}
