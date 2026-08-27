package io.github.liongalahad.nuviotv.patches.detail.randomepisode

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.liongalahad.nuviotv.patches.settings.hub.settingsUiPatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY
import org.w3c.dom.Element

private const val RUNTIME =
    "Lio/github/liongalahad/nuviotv/extension/detail/randomepisode/RandomEpisodeRuntime;"
private const val CATEGORY_METADATA =
    "io.github.liongalahad.nuviotv.settings.provider.random_episode"
private const val CATEGORY_PROVIDER =
    "io.github.liongalahad.nuviotv.extension.detail.randomepisode.RandomEpisodeSettingsCategory"

private val randomEpisodeCategoryResourcePatch = resourcePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            application.appendChild(document.createElement("meta-data").apply {
                setAttribute("android:name", CATEGORY_METADATA)
                setAttribute("android:value", CATEGORY_PROVIDER)
            })
        }
    }
}

private fun MutableMethod.guardVoid() = addInstructionsWithLabels(
    0,
    """
        invoke-static {}, $RUNTIME->shouldSkipTracking()Z
        move-result v0
        if-eqz v0, :morphe_random_continue
        return-void
        :morphe_random_continue
        nop
    """
)

private fun MutableMethod.guardObjectWithNull() = addInstructionsWithLabels(
    0,
    """
        invoke-static {}, $RUNTIME->shouldSkipTracking()Z
        move-result v0
        if-eqz v0, :morphe_random_continue
        const/4 v0, 0x0
        return-object v0
        :morphe_random_continue
        nop
    """
)

private fun MutableMethod.guardSuspendUnit() = addInstructionsWithLabels(
    0,
    """
        invoke-static {}, $RUNTIME->shouldSkipTracking()Z
        move-result v0
        if-eqz v0, :morphe_random_continue
        sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
        return-object v0
        :morphe_random_continue
        nop
    """
)

@Suppress("unused")
val randomepisodePatch = bytecodePatch(
    name = "Random Episode",
    description = "Adds Morphe > Detail Page > Show Random Episode Button and random series playback.",
    default = false
) {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(settingsUiPatch, randomEpisodeCategoryResourcePatch)
    extendWith("extensions/nuviotv.mpe")

    execute {
        listOf(
            HeroContentFingerprint,
            HeroActionIconFingerprint,
            HeroActionRowFingerprint,
            ManualPlayDialogFingerprint,
            StreamRouteFingerprint,
            RecomputeNextEpisodeFingerprint,
            SaveWatchProgressFingerprint,
            BuildScrobbleItemFingerprint,
            LoadSavedProgressSuspendFingerprint,
            ReturnFocusFingerprint,
            WarmTraktMappingFingerprint
        ).forEach { it.matchAll(1..1) }

        HeroContentFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                move-object/from16 v1, p3
                move-object/from16 v2, p4
                move-object/from16 v3, p21
                move-object/from16 v4, p24
                invoke-static { v0, v1, v2, v3, v4 }, $RUNTIME->enterHero(Ljava/lang/Object;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Ljava/lang/Object;)Lkotlin/jvm/functions/Function0;
                move-result-object p3
            """
        )

        HeroActionRowFingerprint.method.apply {
            val actionCallIndex = implementation!!.instructions.indexOfFirst { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@indexOfFirst false
                val p = reference.parameterTypes.map(CharSequence::toString)
                reference.returnType == "V" && p.size == 13 &&
                    p[2] == "Ljava/lang/String;" && p[3] == "Lkotlin/jvm/functions/Function0;" &&
                    p[4] == "Lkotlin/jvm/functions/Function0;" && p[5] == "Z" && p[6] == "Z" &&
                    p[7] == "J" && p[8] == "J" &&
                    p[9] == "Lkotlin/jvm/functions/Function0;" && p[11] == "I" && p[12] == "I"
            }
            check(actionCallIndex >= 0) { "First native hero action call was not found" }
            val actionCall = implementation!!.instructions[actionCallIndex] as? RegisterRangeInstruction
                ?: error("Native hero action call does not use the expected range format")
            check(actionCall.registerCount == 15) {
                "Native hero action call uses an unexpected register count"
            }
            val composerRegister = actionCall.startRegister + 12
            addInstructions(
                actionCallIndex,
                "invoke-static/range { v$composerRegister .. v$composerRegister }, $RUNTIME->renderAction(Ljava/lang/Object;)V"
            )
        }

        ManualPlayDialogFingerprint.method.apply {
            val resultIndexes = implementation!!.instructions.withIndex()
                .filter { (_, instruction) ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.definingClass == "Lcom/nuvio/tv/domain/model/NextToWatch;" &&
                        reference.name == "getDisplayText" &&
                        reference.returnType == "Ljava/lang/String;"
                }
                .map { (index, _) -> index + 1 }
            check(resultIndexes.isNotEmpty()) { "Manual-play subtitle result was not found" }
            resultIndexes.asReversed().forEach { resultIndex ->
                val result = implementation!!.instructions[resultIndex] as? OneRegisterInstruction
                    ?: error("Manual-play subtitle has no move-result-object")
                check(result.opcode == Opcode.MOVE_RESULT_OBJECT) {
                    "Manual-play subtitle call is not followed by move-result-object"
                }
                val register = result.registerA
                addInstructions(
                    resultIndex + 1,
                    """
                        invoke-static/range { v$register .. v$register }, $RUNTIME->rewriteManualSubtitle(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v$register
                    """
                )
            }
        }

        StreamRouteFingerprint.method.apply {
            implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index to (it.value as OneRegisterInstruction).registerA }
                .asReversed()
                .forEach { (index, register) ->
                    addInstructions(
                        index,
                        """
                            invoke-static/range { v$register .. v$register }, $RUNTIME->rewriteStreamRoute(Ljava/lang/String;)Ljava/lang/String;
                            move-result-object v$register
                        """
                    )
                }
        }

        RecomputeNextEpisodeFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val callIndex = instructions.indexOfFirst { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@indexOfFirst false
                reference.returnType == VIDEO &&
                    reference.parameterTypes.size == 3 &&
                    reference.parameterTypes.any { it.toString() == "Ljava/util/List;" }
            }
            check(callIndex >= 0) { "Sequential next-episode resolver call was not found" }
            check(instructions[callIndex] is FiveRegisterInstruction ||
                instructions[callIndex] is RegisterRangeInstruction) {
                "Next-episode resolver uses an unsupported invoke format"
            }
            val moveResult = instructions.getOrNull(callIndex + 1) as? OneRegisterInstruction
                ?: error("Next-episode resolver has no move-result-object")
            check(moveResult.opcode == Opcode.MOVE_RESULT_OBJECT) {
                "Next-episode resolver is not followed by move-result-object"
            }
            val register = moveResult.registerA
            addInstructions(
                callIndex + 2,
                """
                    invoke-static/range { v$register .. v$register }, $RUNTIME->chooseNextEpisode(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$register
                    check-cast v$register, $VIDEO
                """
            )
        }

        SaveWatchProgressFingerprint.method.guardVoid()
        BuildScrobbleItemFingerprint.method.guardObjectWithNull()
        LoadSavedProgressSuspendFingerprint.method.guardSuspendUnit()

        ReturnFocusFingerprint.method.apply {
            val resultIndexes = implementation!!.instructions.withIndex()
                .filter { (_, instruction) ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.definingClass == "Lkotlin/text/StringsKt;" &&
                        reference.name == "toIntOrNull" && reference.returnType == INTEGER
                }
                .map { (index, _) -> index + 1 }
            check(resultIndexes.size == 2) { "Return-focus season/episode conversions were not found" }
            resultIndexes.withIndex().reversed().forEach { (position, resultIndex) ->
                val result = implementation!!.instructions[resultIndex] as? OneRegisterInstruction
                    ?: error("Return-focus conversion has no move-result-object")
                check(result.opcode == Opcode.MOVE_RESULT_OBJECT) {
                    "Return-focus conversion is not followed by move-result-object"
                }
                val register = result.registerA
                val methodName = if (position == 0) "filterReturnFocusSeason" else "filterReturnFocusEpisode"
                addInstructions(
                    resultIndex + 1,
                    """
                        invoke-static/range { v$register .. v$register }, $RUNTIME->$methodName(Ljava/lang/Integer;)Ljava/lang/Integer;
                        move-result-object v$register
                    """
                )
            }
        }

        WarmTraktMappingFingerprint.method.guardSuspendUnit()
    }
}
