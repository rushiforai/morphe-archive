/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.findFreeRegister
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.morphe.patches.facebook.shared.Constants
import app.morphe.patches.facebook.shared.FacebookTargets
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch

private val extensionPatch = sharedExtensionPatch("facebook", false)

private const val HOME_FILTER =
    "Lapp/morphe/extension/facebook/feed/HomeFeedFilter;"
private const val STRICT_FILTER =
    "Lapp/morphe/extension/facebook/StrictAdBlocker;"
private const val AI_FILTER =
    "Lapp/morphe/extension/facebook/AiContentFilter;"
private const val SETTINGS =
    "Lapp/morphe/extension/facebook/settings/DeVancedSettings;"

private fun MutableMethod.findGuardRegister(index: Int = 0): Int {
    return try {
        findFreeRegister(index)
    } catch (_: IllegalStateException) {
        val instructions = implementation!!.instructions.toList()
        val fallbackIndex = (index + 1).coerceAtMost(instructions.lastIndex)
        findFreeRegister(
            fallbackIndex,
            *instructions[index].registersUsed.toIntArray(),
        )
    }
}

private fun MutableMethod.returnFalseIfAdsDisabled(label: String) {
    val register = findGuardRegister()
    addInstructions(
        0,
        """
            invoke-static {}, $SETTINGS->isAdsDisabled()Z
            move-result v$register
            if-eqz v$register, :$label
            const/4 v$register, 0x0
            return v$register
            :$label
            nop
        """.trimIndent(),
    )
}

private fun MutableMethod.returnTrueIfAdsDisabled(label: String) {
    val register = findGuardRegister()
    addInstructions(
        0,
        """
            invoke-static {}, $SETTINGS->isAdsDisabled()Z
            move-result v$register
            if-eqz v$register, :$label
            const/4 v$register, 0x1
            return v$register
            :$label
            nop
        """.trimIndent(),
    )
}

private fun MutableMethod.returnNullIfAdsDisabled(label: String) {
    val register = findGuardRegister()
    addInstructions(
        0,
        """
            invoke-static {}, $SETTINGS->isAdsDisabled()Z
            move-result v$register
            if-eqz v$register, :$label
            const/4 v$register, 0x0
            return-object v$register
            :$label
            nop
        """.trimIndent(),
    )
}

private fun MutableMethod.returnVoidIfAdsDisabled(label: String) {
    val register = findGuardRegister()
    addInstructions(
        0,
        """
            invoke-static {}, $SETTINGS->isAdsDisabled()Z
            move-result v$register
            if-eqz v$register, :$label
            return-void
            :$label
            nop
        """.trimIndent(),
    )
}

private fun MutableMethod.returnEmptyListIfAdsDisabled(label: String) {
    val register = findGuardRegister()
    addInstructions(
        0,
        """
            invoke-static {}, $SETTINGS->isAdsDisabled()Z
            move-result v$register
            if-eqz v$register, :$label
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v$register
            return-object v$register
            :$label
            nop
        """.trimIndent(),
    )
}

private fun MutableMethod.returnObjectIfAdsDisabled(
    objectRegister: String,
    label: String,
) {
    val register = findGuardRegister()
    addInstructions(
        0,
        """
            invoke-static {}, $SETTINGS->isAdsDisabled()Z
            move-result v$register
            if-eqz v$register, :$label
            return-object $objectRegister
            :$label
            nop
        """.trimIndent(),
    )
}

private fun MutableMethod.filterAiItemsBeforeReturn(filterMethod: String) {
    val instructions = implementation!!.instructions.toList()
    val returnIndices = instructions.withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
        .map { (index, _) -> index }
    check(returnIndices.isNotEmpty()) {
        "AI list filter target has no object return: $this"
    }

    returnIndices.asReversed().forEach { index ->
        val register = (instructions[index] as OneRegisterInstruction).registerA
        addInstructions(
            index,
            """
                invoke-static/range {v$register .. v$register}, $AI_FILTER->$filterMethod(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$register
                check-cast v$register, $returnType
            """.trimIndent(),
        )
    }
}

private fun MutableMethod.rejectSingleReelsInsert(label: String) {
    val register = findGuardRegister()
    check(register <= 15) {
        "Reels single-item AI guard requires a 4-bit register"
    }
    addInstructions(
        0,
        """
            move-object/from16 v$register, p1
            invoke-static {v$register}, $AI_FILTER->shouldRejectReelsItem(Ljava/lang/Object;)Z
            move-result v$register
            if-eqz v$register, :$label
            return-void
            :$label
            nop
        """.trimIndent(),
    )
}

private fun MutableMethod.rejectReelsFeedItem(label: String) {
    val register = findGuardRegister()
    check(register <= 15) {
        "580 Reels feed-item guard requires a 4-bit register"
    }
    addInstructions(
        0,
        """
            move-object/from16 v$register, p1
            invoke-static {v$register}, $AI_FILTER->shouldRejectReelsFeedItem(Ljava/lang/Object;)Z
            move-result v$register
            if-eqz v$register, :$label
            return-void
            :$label
            nop
        """.trimIndent(),
    )
}

private fun MutableMethod.filterReelsCollectionParameter(parameter: String) {
    val register = findGuardRegister()
    check(register <= 15) {
        "Reels collection filter requires a 4-bit register"
    }
    addInstructions(
        0,
        """
            move-object/from16 v$register, $parameter
            invoke-static {v$register}, $AI_FILTER->filterReelsSemanticCollection(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$register
            check-cast v$register, Ljava/util/Collection;
            move-object/from16 $parameter, v$register
        """.trimIndent(),
    )
}

private fun MutableMethod.filterReelsFeedCollectionParameter(
    parameter: String,
) {
    val register = findGuardRegister()
    check(register <= 15) {
        "580 Reels feed-collection filter requires a 4-bit register"
    }
    addInstructions(
        0,
        """
            move-object/from16 v$register, $parameter
            invoke-static {v$register}, $AI_FILTER->filterReelsFeedCollection(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$register
            check-cast v$register, Ljava/util/Collection;
            move-object/from16 $parameter, v$register
        """.trimIndent(),
    )
}

private fun MutableMethod.rejectReelsReplacement(label: String) {
    val register = findGuardRegister()
    check(register <= 15) {
        "Reels replacement AI guard requires a 4-bit register"
    }
    addInstructions(
        0,
        """
            move-object/from16 v$register, p1
            invoke-static {v$register}, $AI_FILTER->shouldRejectReelsItem(Ljava/lang/Object;)Z
            move-result v$register
            if-eqz v$register, :$label
            const/4 v$register, 0x0
            return v$register
            :$label
            nop
        """.trimIndent(),
    )
}

private fun MutableMethod.filterDirectReelsAddAll() {
    val calls = implementation!!.instructions.withIndex().filter { (_, instruction) ->
        val reference = (instruction as? ReferenceInstruction)
            ?.reference as? MethodReference
        reference != null &&
            (reference.definingClass == "Ljava/util/List;" ||
                reference.definingClass == "Ljava/util/Collection;") &&
            reference.name == "addAll" &&
            reference.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/util/Collection;")
    }
    check(calls.size == 1) {
        "Expected one direct Reels List.addAll call"
    }

    val (index, instruction) = calls.single()
    val collectionRegister = when (instruction) {
        is FiveRegisterInstruction -> instruction.registerD
        is RegisterRangeInstruction -> instruction.startRegister + 1
        else -> error("Unsupported Reels addAll instruction shape")
    }
    addInstructions(
        index,
        """
            invoke-static/range {v$collectionRegister .. v$collectionRegister}, $AI_FILTER->filterReelsSemanticCollection(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$collectionRegister
            check-cast v$collectionRegister, Ljava/util/Collection;
        """.trimIndent(),
    )
}

private fun MutableMethod.finishActivityIfAdsDisabled(
    index: Int,
    label: String,
) {
    val register = findGuardRegister(index)
    check(register <= 15) {
        "Activity ad guard requires a 4-bit register"
    }
    addInstructions(
        index,
        """
            invoke-static {}, $SETTINGS->isAdsDisabled()Z
            move-result v$register
            if-eqz v$register, :$label
            move-object/from16 v$register, p0
            invoke-virtual {v$register}, Landroid/app/Activity;->finish()V
            return-void
            :$label
            nop
        """.trimIndent(),
    )
}

private fun String.isFeedListType() =
    this == "Ljava/util/List;" ||
        this == "Lcom/google/common/collect/ImmutableList;" ||
        this.endsWith("/ImmutableList;")

/**
 * Comprehensive Facebook 576 ad removal.
 *
 * Every hook is anchored to an internal model/component/query identifier or a
 * narrow method shape. Localized UI labels and generic strings such as "ad",
 * "promoted", "suggested", and "midcard" are intentionally not used.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable all ads",
    description = "Blocks Facebook sponsored feed units, Stories ads, Reels ads, Marketplace ads, and Instant Games/Audience Network ads.",
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(extensionPatch)

    execute {
        if (packageMetadata.versionName == FacebookTargets.V580) {
            var stableHooks = 0
            val feedInsert = FeedUnitCollectionInsertFingerprint.method
            val originalInstruction = feedInsert.getInstruction(0)
            val free = feedInsert.getFreeRegisterProvider(0, 2)
            val managerRegister = free.getFreeRegister4Bit()
            val edgeRegister = free.getFreeRegister4Bit()
            check(managerRegister <= 15 && edgeRegister <= 15) {
                "580 feed guard requires two 4-bit registers"
            }
            feedInsert.addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v$managerRegister, p0
                    move-object/from16 v$edgeRegister, p2
                    invoke-static {v$managerRegister, v$edgeRegister}, $HOME_FILTER->shouldDropEdge(Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v$managerRegister
                    if-eqz v$managerRegister, :keep
                    const/4 v$managerRegister, 0x1
                    return v$managerRegister
                """.trimIndent(),
                ExternalLabel("keep", originalInstruction),
            )
            stableHooks++

            ReelsItemCollectionAdd580Fingerprint.method
                .rejectReelsFeedItem("reels_feed_single_580")
            stableHooks++

            ReelsItemCollectionAddAll580Fingerprint.method
                .filterReelsFeedCollectionParameter("p1")
            stableHooks++

            ReelsItemCollectionAddAllAtIndex580Fingerprint.method
                .filterReelsFeedCollectionParameter("p2")
            stableHooks++

            Reels580AdsRootRenderFingerprint.method
                .returnNullIfAdsDisabled("reels_ads_root_580")
            stableHooks++

            Reels580BannerAdsRenderFingerprint.method
                .returnNullIfAdsDisabled("reels_ads_banner_580")
            stableHooks++

            Reels580RealTimeIntentRenderFingerprint.method
                .returnNullIfAdsDisabled("reels_ads_realtime_580")
            stableHooks++

            Reels580SponsoredInfoRowFingerprint.method
                .returnNullIfAdsDisabled("reels_ads_info_row_580")
            stableHooks++

            runCatching {
                ReelsCollectionBulkInsertFingerprint.method
                    .filterReelsCollectionParameter("p1")
                stableHooks++
            }
            runCatching {
                ReelsCollectionReplaceFingerprint.method
                    .rejectReelsReplacement("ai_reels_replace_580")
                stableHooks++
            }
            runCatching {
                ReelsInitialBatchInsertFingerprint.method
                    .filterDirectReelsAddAll()
                stableHooks++
            }
            runCatching {
                VideoHomeFeedUnitSectionItemsFingerprint.method
                    .filterAiItemsBeforeReturn("filterReelsList")
                stableHooks++
            }
            runCatching {
                StoryBucketCardsFingerprint.method
                    .filterAiItemsBeforeReturn("filterList")
                stableHooks++
            }
            runCatching {
                AudienceNetworkRemoteActivityCreateFingerprint.method
                    .finishActivityIfAdsDisabled(0, "audience_580_continue")
                stableHooks++
            }
            check(stableHooks > 0) {
                "No stable 580 ad hook applied"
            }
            println("[DisableAllAds] 580 stableHooks=$stableHooks")
            return@execute
        }

        val sponsoredPoolAdd = SponsoredPoolAddFingerprint.method
        sponsoredPoolAdd.returnFalseIfAdsDisabled("sponsored_pool_add_continue")

        // Empty every zero-argument List view of the dedicated Sponsored Pool,
        // preventing cached/vended units from reaching later feed consumers.
        var sponsoredPoolListHooks = 0
        SponsoredPoolAddFingerprint.classDef.methods.forEach { method ->
            if (method.parameters.isEmpty() && method.returnType == "Ljava/util/List;") {
                method.returnEmptyListIfAdsDisabled(
                    "sponsored_pool_list_continue_$sponsoredPoolListHooks",
                )
                sponsoredPoolListHooks++
            }
        }
        check(sponsoredPoolListHooks > 0) {
            "Facebook sponsored pool list methods were not resolved"
        }

        // News Feed sponsored ads are handled by the dedicated Sponsored Pool and runtime sanitizers.
        VideoHomeFeedUnitSectionItemsFingerprint.method.filterAiItemsBeforeReturn(
            "filterReelsList",
        )
        StoryBucketCardsFingerprint.method.filterAiItemsBeforeReturn("filterList")
        ReelsCollectionSingleInsertFingerprint.method
            .rejectSingleReelsInsert("ai_reels_single_insert_continue")
        ReelsCollectionBulkInsertFingerprint.method
            .filterReelsCollectionParameter("p1")
        ReelsCollectionReplaceFingerprint.method
            .rejectReelsReplacement("ai_reels_replace_continue")
        ReelsInitialBatchInsertFingerprint.method
            .filterDirectReelsAddAll()

        // Story ad provider: block the known bulk fetch/update/insertion paths.
        StoryAdBulkFetchFingerprint.method.returnVoidIfAdsDisabled("story_bulk_continue")
        StoryAdDeferredUpdateFingerprint.method.returnVoidIfAdsDisabled("story_update_continue")
        StoryAdInsertionFingerprint.method.returnVoidIfAdsDisabled("story_insert_continue")

        // Also apply the structural provider rules used by the current runtime
        // implementation so minor method-name changes do not restore story ads.
        var storyProviderShapeHooks = 0
        StoryAdStoreClassFingerprint.classDef.methods.forEach { method ->
            val parameters = method.parameterTypes.map(CharSequence::toString)
            when {
                parameters.size == 3 &&
                    parameters[0] == "Lcom/facebook/auth/usersession/FbUserSession;" &&
                    parameters[2].isFeedListType() &&
                    method.returnType.isFeedListType() -> {
                    method.returnObjectIfAdsDisabled(
                        "p3",
                        "story_provider_list_continue_$storyProviderShapeHooks",
                    )
                    storyProviderShapeHooks++
                }

                method.returnType == "V" &&
                    parameters.size == 2 &&
                    parameters[0].isFeedListType() &&
                    parameters[1] == "I" -> {
                    method.returnVoidIfAdsDisabled(
                        "story_provider_index_continue_$storyProviderShapeHooks",
                    )
                    storyProviderShapeHooks++
                }

                method.returnType == "V" &&
                    parameters.size == 2 &&
                    parameters[0].startsWith("L") &&
                    parameters[1].isFeedListType() -> {
                    method.returnVoidIfAdsDisabled(
                        "story_provider_object_continue_$storyProviderShapeHooks",
                    )
                    storyProviderShapeHooks++
                }
            }
        }
        check(storyProviderShapeHooks > 0) {
            "Facebook structural story-ad provider methods were not resolved"
        }

        // Reels: suppress eligibility, stop client/network insertion, empty the
        // sponsored pool fill, and null every dedicated ad component.
        ReelsSuppressionGateFingerprint.method.returnTrueIfAdsDisabled("reels_gate_continue")
        ReelsFetchTriggerFingerprint.method.returnVoidIfAdsDisabled("reels_fetch_continue")
        ReelsClientInsertionFingerprint.method.returnVoidIfAdsDisabled("reels_insert_continue")
        ReelsSponsoredPoolFillFingerprint.method.returnVoidIfAdsDisabled("reels_pool_continue")
        ReelsBannerRenderFingerprint.method.returnNullIfAdsDisabled("reels_banner_continue")
        ReelsRootRenderFingerprint.method.returnNullIfAdsDisabled("reels_root_continue")
        ReelsRealTimeIntentRenderFingerprint.method.returnNullIfAdsDisabled(
            "reels_realtime_continue",
        )

        // Marketplace: remove already-fetched ad renderers, block dedicated ad
        // Relay queries, and set the server-supported skip flags on organic
        // Marketplace feed requests when possible.
        MarketplaceVideoAdQueryRenderFingerprint.method.returnNullIfAdsDisabled(
            "marketplace_query_continue",
        )
        MarketplaceVideoAdsRenderFingerprint.method.returnNullIfAdsDisabled(
            "marketplace_render_continue",
        )
        MarketplaceNetworkSendFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p2
                move-object/from16 v1, p6
                invoke-static {v0, v1}, $STRICT_FILTER->filterMarketplaceRequest(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                if-nez v0, :marketplace_request_continue
                return-void
                :marketplace_request_continue
                move-object/from16 p6, v0
            """.trimIndent(),
        )

        // Instant Games and Audience Network.
        GameAdBridgeFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p1
                move-object/from16 v1, p2
                invoke-static {v0, v1}, $STRICT_FILTER->shouldBlockGameAdMessage(Ljava/lang/String;Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :game_message_continue
                return-void
                :game_message_continue
                nop
            """.trimIndent(),
        )

        NekoPlayableAdActivityCreateFingerprint.method.finishActivityIfAdsDisabled(
            0,
            "neko_activity_continue",
        )

        AudienceNetworkRemoteActivityCreateFingerprint.method.let { method ->
            val superCallIndex = method.implementation!!.instructions
                .indexOfFirst { instruction -> instruction.opcode == Opcode.INVOKE_SUPER }
            check(superCallIndex >= 0) {
                "Audience Network activity super.onCreate call was not resolved"
            }
            method.finishActivityIfAdsDisabled(
                superCallIndex + 1,
                "audience_activity_continue",
            )
        }

        println(
            "[DisableAllAds] feedPoolLists=$sponsoredPoolListHooks " +
                "storyProviderShapes=$storyProviderShapeHooks " +
                "stories=3 reels=7 marketplace=3 games=3",
        )
    }
}
