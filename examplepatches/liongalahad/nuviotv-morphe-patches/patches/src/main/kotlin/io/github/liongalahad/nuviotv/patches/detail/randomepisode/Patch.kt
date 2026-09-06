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
import io.github.liongalahad.nuviotv.patches.shared.updates.patchedAppUpdatesPatch
import org.w3c.dom.Element

private const val RUNTIME =
    "Lio/github/liongalahad/nuviotv/extension/detail/randomepisode/RandomEpisodeRuntime;"
private const val CATEGORY_METADATA =
    "io.github.liongalahad.nuviotv.settings.provider.random_episode"
private const val CATEGORY_PROVIDER =
    "io.github.liongalahad.nuviotv.extension.detail.randomepisode.RandomEpisodeSettingsCategory"
private const val COMPOSER = "Lf1/p;"
private const val MODIFIER = "Lv1/q;"

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

private fun MutableMethod.injectContinueWatchingBadges(activateContent: Boolean) {
    data class BadgeCall(val index: Int, val composerRegister: Int, val image: Boolean)
    val allCalls = implementation!!.instructions.withIndex().mapNotNull { (index, instruction) ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapNotNull null
        val p = reference.parameterTypes.map(CharSequence::toString)
        val image = reference.returnType == "V" && p.size == 15 &&
            p[1] == "Ljava/lang/String;" && p[10] == "F" && p[11] == COMPOSER &&
            p.slice(12..14) == listOf("I", "I", "I")
        val placeholder = reference.returnType == "V" &&
            p == listOf(MODIFIER, COMPOSER, "I")
        if (!image && !placeholder) return@mapNotNull null
        val composerRegister = when (instruction) {
            is RegisterRangeInstruction -> instruction.startRegister + if (image) 11 else 1
            is FiveRegisterInstruction -> {
                check(!image && instruction.registerCount == 3) {
                    "Continue Watching image call must use range format"
                }
                instruction.registerD
            }
            else -> error("Continue Watching artwork call uses an unsupported invoke format")
        }
        BadgeCall(index, composerRegister, image)
    }
    val imageCalls = allCalls.filter(BadgeCall::image)
    check(imageCalls.size == 1) {
        "Continue Watching artwork image branch was not found exactly once"
    }
    val imageCall = imageCalls.single()
    val placeholderCall = allCalls.filterNot(BadgeCall::image)
        .minByOrNull { kotlin.math.abs(it.index - imageCall.index) }
        ?: error("Continue Watching artwork placeholder branch was not found")
    check(kotlin.math.abs(placeholderCall.index - imageCall.index) < 150) {
        "Continue Watching artwork placeholder is not adjacent to the image branch"
    }
    val calls = listOf(imageCall, placeholderCall).sortedBy(BadgeCall::index)
    calls.asReversed().forEach { (index, composerRegister, _) ->
        val activate = if (activateContent) {
            "invoke-static/range { p0 .. p0 }, $RUNTIME->activateContinueWatchingContent(Ljava/lang/Object;)V"
        } else {
            ""
        }
        addInstructions(
            index + 1,
            """
                $activate
                invoke-static/range { v$composerRegister .. v$composerRegister }, $RUNTIME->renderContinueWatchingBadge(Ljava/lang/Object;)V
            """
        )
    }
}

@Suppress("unused")
val randomepisodePatch = bytecodePatch(
    name = "Random Episode",
    description = "Adds persistent per-show random playback with All or Unwatched episode pools.",
    default = false
) {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(patchedAppUpdatesPatch, settingsUiPatch, randomEpisodeCategoryResourcePatch)
    extendWith("extensions/nuviotv.mpe")

    execute {
        listOf(
            HeroContentFingerprint,
            HeroActionIconFingerprint,
            HeroActionRowFingerprint,
            MetaDetailsContentFingerprint,
            HomeContentFingerprint,
            HomeCatalogSummaryFingerprint,
            SplitUpcomingFingerprint,
            HomeStateFingerprint,
            ManualPlayDialogFingerprint,
            StreamRouteFingerprint,
            RecomputeNextEpisodeFingerprint,
            SaveWatchProgressFingerprint,
            ContinueWatchingCardFingerprint,
            ContinueWatchingArtworkFingerprint,
            ContinueWatchingWideFingerprint,
            ContinueWatchingWideRestartFingerprint
        ).forEach { it.matchAll(1..1) }

        HeroContentFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                move-object/from16 v1, p2
                move-object/from16 v2, p3
                move-object/from16 v3, p4
                move-object/from16 v4, p21
                move-object/from16 v5, p24
                invoke-static/range { v0 .. v5 }, $RUNTIME->enterHero(Ljava/lang/Object;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Ljava/lang/Object;)Lkotlin/jvm/functions/Function0;
                move-result-object p3
                move-object/from16 v0, p2
                invoke-static/range { v0 .. v0 }, $RUNTIME->rewriteHeroNextToWatch(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p2
                check-cast p2, $NEXT_TO_WATCH
                move-object/from16 v0, p4
                invoke-static/range { v0 .. v0 }, $RUNTIME->wrapHeroLongPress(Lkotlin/jvm/functions/Function0;)Lkotlin/jvm/functions/Function0;
                move-result-object p4
            """
        )

        MetaDetailsContentFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p2
                move-object/from16 v1, p14
                invoke-static { v0, v1 }, $RUNTIME->captureDetailState(Ljava/lang/Object;Ljava/util/Set;)V
            """
        )

        HomeContentFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                invoke-static/range { v0 .. v0 }, $RUNTIME->enterHome(Ljava/lang/Object;)V
            """
        )

        HomeCatalogSummaryFingerprint.method.apply {
            check(parameterTypes.size == 12 && parameterTypes.last().toString() == "Ljava/util/ArrayList;") {
                "Home episode summary constructor shape changed"
            }
            val returnIndex = implementation!!.instructions.indexOfLast {
                it.opcode == Opcode.RETURN_VOID
            }
            check(returnIndex >= 0) { "Home episode summary constructor has no return" }
            addInstructions(
                returnIndex,
                """
                    move-object/from16 v0, p0
                    move-object/from16 v1, p12
                    invoke-static { v0, v1 }, $RUNTIME->captureHomeCatalog(Ljava/lang/Object;Ljava/util/List;)V
                """
            )
        }

        SplitUpcomingFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static/range { p0 .. p0 }, $RUNTIME->rewriteHomeContinueItems(Ljava/util/List;)Ljava/util/List;
                    move-result-object p0
                """
            )
            implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index to (it.value as OneRegisterInstruction).registerA }
                .asReversed()
                .forEach { (index, register) ->
                    addInstructions(
                        index,
                        """
                            invoke-static/range { v$register .. v$register }, $RUNTIME->captureHomeContinueSplit(Ljava/lang/Object;)Ljava/lang/Object;
                            move-result-object v$register
                            check-cast v$register, Lkotlin/Pair;
                        """
                    )
                }
        }

        HomeStateFingerprint.method.apply {
            val returnIndex = implementation!!.instructions.indexOfLast {
                it.opcode == Opcode.RETURN_VOID
            }
            check(returnIndex >= 0) { "Home state constructor has no return" }
            addInstructions(
                returnIndex,
                """
                    move-object/from16 v0, p0
                    move-object/from16 v1, p2
                    move-object/from16 v2, p3
                    invoke-static { v0, v1, v2 }, $RUNTIME->captureHomeState(Ljava/lang/Object;Ljava/util/List;Ljava/util/List;)V
                """
            )
        }

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
            val resolver = (instructions[callIndex] as ReferenceInstruction)
                .reference as MethodReference
            check(resolver.parameterTypes.map(CharSequence::toString) ==
                listOf("I", INTEGER, "Ljava/util/List;")) {
                "Sequential next-episode resolver parameter order changed"
            }
            val captureCall = when (val call = instructions[callIndex]) {
                is FiveRegisterInstruction -> {
                    check(call.registerCount == 3) {
                        "Sequential next-episode resolver uses an unexpected register count"
                    }
                    "invoke-static { v${call.registerC}, v${call.registerD}, v${call.registerE} }, " +
                        "$RUNTIME->captureNextContext(ILjava/lang/Integer;Ljava/util/List;)V"
                }
                is RegisterRangeInstruction -> {
                    check(call.registerCount == 3) {
                        "Sequential next-episode resolver range has an unexpected size"
                    }
                    val end = call.startRegister + 2
                    "invoke-static/range { v${call.startRegister} .. v$end }, " +
                        "$RUNTIME->captureNextContext(ILjava/lang/Integer;Ljava/util/List;)V"
                }
                else -> error("Next-episode resolver uses an unsupported invoke format")
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
            addInstructions(callIndex, captureCall)
        }

        SaveWatchProgressFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p1 .. p5 }, $RUNTIME->recordProgress(JJZ)V"
        )

        ContinueWatchingCardFingerprint.method.apply {
            val itemType = parameterTypes[0].toString()
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p0 .. p0 }, $RUNTIME->rewriteHomeContinueItem(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object p0
                    if-nez p0, :morphe_random_home_card_continue
                    return-void
                    :morphe_random_home_card_continue
                    check-cast p0, $itemType
                    invoke-static/range { p0 .. p1 }, $RUNTIME->wrapHomeContinuePlay(Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)Lkotlin/jvm/functions/Function0;
                    move-result-object p1
                    invoke-static/range { p0 .. p0 }, $RUNTIME->prepareContinueWatchingItem(Ljava/lang/Object;)V
                """
            )
            val lambdaCallIndex = implementation!!.instructions.indexOfFirst { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@indexOfFirst false
                reference.returnType.startsWith("Lp1/") &&
                    reference.parameterTypes.map(CharSequence::toString).let { p ->
                        p.size == 3 && p[0] == "I" && p[1] == "Lkotlin/Function;" &&
                            p[2] == COMPOSER
                    }
            }
            check(lambdaCallIndex >= 0) { "Continue Watching card content lambda was not found" }
            val lambdaCall = implementation!!.instructions[lambdaCallIndex]
            val lambdaRegister = when (lambdaCall) {
                is FiveRegisterInstruction -> {
                    check(lambdaCall.registerCount == 3) {
                        "Continue Watching lambda wrapper uses an unexpected register count"
                    }
                    lambdaCall.registerD
                }
                is RegisterRangeInstruction -> {
                    check(lambdaCall.registerCount == 3) {
                        "Continue Watching lambda wrapper range has an unexpected size"
                    }
                    lambdaCall.startRegister + 1
                }
                else -> error("Continue Watching lambda wrapper uses an unsupported invoke format")
            }
            val result = implementation!!.instructions.getOrNull(lambdaCallIndex + 1)
                    as? OneRegisterInstruction
                ?: error("Continue Watching card content lambda has no move-result-object")
            check(result.opcode == Opcode.MOVE_RESULT_OBJECT) {
                "Continue Watching card content lambda result format changed"
            }
            val register = result.registerA
            addInstructions(
                lambdaCallIndex + 2,
                """
                    invoke-static/range { v$lambdaRegister .. v$lambdaRegister }, $RUNTIME->bindContinueWatchingContent(Ljava/lang/Object;)V
                    invoke-static/range { v$register .. v$register }, $RUNTIME->bindContinueWatchingContent(Ljava/lang/Object;)V
                """
            )
        }

        ContinueWatchingArtworkFingerprint.method.injectContinueWatchingBadges(true)

        // The first wide render inherits the item activated by the bound card-content lambda.
        // Its retained restart lambda must carry the same binding for isolated recompositions.
        ContinueWatchingWideFingerprint.method.injectContinueWatchingBadges(false)
        ContinueWatchingWideRestartFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p0 }, $RUNTIME->activateContinueWatchingContent(Ljava/lang/Object;)V"
        )
        mutableClassDefBy(ContinueWatchingWideRestartFingerprint.classDef).methods
            .single { method -> method.name == "<init>" }
            .apply {
                val returnIndex = implementation!!.instructions.indexOfLast {
                    it.opcode == Opcode.RETURN_VOID
                }
                check(returnIndex >= 0) {
                    "Continue Watching wide restart constructor has no return"
                }
                addInstructions(
                    returnIndex,
                    "invoke-static/range { p0 .. p0 }, $RUNTIME->bindContinueWatchingContent(Ljava/lang/Object;)V"
                )
            }
    }
}
