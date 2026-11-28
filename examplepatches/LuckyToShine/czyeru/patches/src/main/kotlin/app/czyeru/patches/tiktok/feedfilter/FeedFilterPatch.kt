/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/feedfilter/FeedFilterPatch.kt
 */
package app.czyeru.patches.tiktok.feedfilter

import app.czyeru.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.czyeru.patches.tiktok.misc.extension.sharedExtensionPatch
import app.czyeru.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.czyeru.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint.method
import app.czyeru.patches.tiktok.misc.settings.settingsPatch
import app.czyeru.util.addInstructionsAtControlFlowLabel
import app.czyeru.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION_CLASS_DESCRIPTOR = "Lapp/czyeru/extension/tiktok/feedfilter/FeedItemsFilter;"
private const val TAKO_AI_FILTER_CLASS_DESCRIPTOR = "Lapp/czyeru/extension/tiktok/feedfilter/TakoAiFilter;"

private val feedListHooksPatch = bytecodePatch {
    dependsOn(
        sharedExtensionPatch,
    )

    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        fun requirePublicClass(type: String) = classDefBy(type).also { classDef ->
            if (!AccessFlags.PUBLIC.isSet(classDef.accessFlags)) {
                throw PatchException("Required feed model class is not public: $type")
            }
        }

        fun requirePublicInstanceMethod(
            definingClass: String,
            name: String,
            parameters: List<String>,
            returnType: String,
        ) {
            val matches = requirePublicClass(definingClass).methods.filter { candidate ->
                candidate.name == name &&
                    candidate.parameterTypes.map(CharSequence::toString) == parameters &&
                    candidate.returnType == returnType
            }
            if (matches.size != 1) {
                throw PatchException(
                    "Expected one $definingClass->$name$parameters$returnType, found ${matches.size}",
                )
            }
            val method = matches.single()
            if (!AccessFlags.PUBLIC.isSet(method.accessFlags) || AccessFlags.STATIC.isSet(method.accessFlags)) {
                throw PatchException("Required feed model method is not a public instance method: $definingClass->$name")
            }
        }

        fun requirePublicInstanceField(definingClass: String, name: String, type: String) {
            val matches = requirePublicClass(definingClass).fields.filter { candidate ->
                candidate.name == name && candidate.type == type
            }
            if (matches.size != 1) {
                throw PatchException(
                    "Expected one $definingClass->$name:$type, found ${matches.size}",
                )
            }
            val field = matches.single()
            if (!AccessFlags.PUBLIC.isSet(field.accessFlags) || AccessFlags.STATIC.isSet(field.accessFlags)) {
                throw PatchException("Required feed model field is not a public instance field: $definingClass->$name")
            }
        }

        val awemeType = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
        val aigcInfoType = "Lcom/ss/android/ugc/aweme/feed/AIGCInfo;"
        val moderationAigcInfoType = "Lcom/ss/android/ugc/aweme/feed/model/ModerationAigcInfo;"
        requirePublicInstanceMethod(awemeType, "getAigcInfo", emptyList(), aigcInfoType)
        requirePublicInstanceMethod(
            awemeType,
            "getModerationAigcInfo",
            emptyList(),
            moderationAigcInfoType,
        )
        requirePublicInstanceMethod(aigcInfoType, "getAIGCLabelType", emptyList(), "I")
        requirePublicInstanceField(aigcInfoType, "createByAI", "Z")
        requirePublicInstanceField(moderationAigcInfoType, "moderationAigcLabelType", "I")
        requirePublicInstanceMethod(awemeType, "getItemDistributeSource", emptyList(), "Ljava/lang/String;")
        requirePublicInstanceMethod(
            awemeType, "getRecReasonsStruct", emptyList(),
            "Lcom/ss/android/ugc/aweme/feed/model/RecReasonsStruct;",
        )
        requirePublicClass("Lcom/ss/android/ugc/aweme/feed/model/RecReasonsStruct;")
        requirePublicInstanceMethod(
            "Lcom/ss/android/ugc/aweme/feed/panel/BaseListFragmentPanel;",
            "getEventType", emptyList(), "Ljava/lang/String;",
        )

        MainFeedResponseFingerprint.method.let { method ->
            val returnIndices =
                method.implementation!!.instructions.withIndex()
                    .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                    .map { it.index }
                    .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                val register = (method.implementation!!.instructions[returnIndex] as OneRegisterInstruction).registerA

                method.addInstructionsAtControlFlowLabel(
                    returnIndex,
                    "invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS_DESCRIPTOR->filter(Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;)V",
                )
            }
        }

        FeedItemListGetItemsFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }

            if (returnIndices.size != 4) {
                throw PatchException(
                    "Expected four FeedItemList.getItems object returns, found ${returnIndices.size}",
                )
            }
            returnIndices.asReversed().forEach { returnIndex ->
                val register = method.getInstruction<OneRegisterInstruction>(returnIndex).registerA
                method.addInstructionsAtControlFlowLabel(
                    returnIndex,
                    """
                        invoke-static {p0, v$register}, $EXTENSION_CLASS_DESCRIPTOR->filterFeedItemListOnRead(Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;Ljava/util/List;)Ljava/util/List;
                        move-result-object v$register
                    """,
                )
            }
        }

        SearchMixFeedResponseFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p1 .. p1}, $EXTENSION_CLASS_DESCRIPTOR->filterSearchContent(Lcom/ss/android/ugc/aweme/search/pages/result/topsearch/core/model/SearchMixFeedList;)V",
        )

        FriendsFeedNetworkResponseFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p1 .. p1}, $EXTENSION_CLASS_DESCRIPTOR->filterFriendsContent(Ljava/lang/Object;)V",
        )
        FriendsFeedFinalDeliveryFingerprint.method.filterFriendsFinalDelivery()

        FollowFeedFingerprint.method.let { method ->
            val returnIndices =
                method.implementation!!.instructions.withIndex()
                    .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                    .map { it.index }
                    .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                val register = (method.implementation!!.instructions[returnIndex] as OneRegisterInstruction).registerA

                method.addInstructionsAtControlFlowLabel(
                    returnIndex,
                    "invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS_DESCRIPTOR->filter(Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;)V",
                )
            }
        }

        FollowFeedListGetItemsFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }

            returnIndices.asReversed().forEach { returnIndex ->
                val register = method.getInstruction<OneRegisterInstruction>(returnIndex).registerA
                method.addInstructionsAtControlFlowLabel(
                    returnIndex,
                    """
                        invoke-static {p0, v$register}, $EXTENSION_CLASS_DESCRIPTOR->filterLateResult(Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;Ljava/util/List;)Ljava/util/List;
                        move-result-object v$register
                    """,
                )
            }
        }

        FollowFeedPresenterPostProcessFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }

            returnIndices.asReversed().forEach { returnIndex ->
                method.addInstructionsAtControlFlowLabel(
                    returnIndex,
                    "invoke-static/range {p1 .. p1}, $EXTENSION_CLASS_DESCRIPTOR->filterLateFinal(Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;)V",
                )
            }
        }

        ProfileNativeListTransformFingerprint.method.filterProfileItemsAtReturns()

        ProfileDetailAdEventFingerprint.method.filterProfileDetailAdEvent()

        val finalFeedInsertionMethod = FinalFeedInsertionFingerprint.method
        val insertionPayloadType = finalFeedInsertionMethod.parameterTypes.single().toString()
        val insertionPayloadConstructors = mutableClassDefBy(insertionPayloadType).methods.filter { method ->
            method.name == "<init>" &&
                method.parameterTypes.map(CharSequence::toString) == listOf(
                    "I",
                    "Ljava/util/List;",
                    "Ljava/lang/String;",
                ) &&
                method.returnType == "V"
        }
        if (insertionPayloadConstructors.size != 1) {
            throw PatchException(
                "Expected one final feed insertion payload constructor for $insertionPayloadType, " +
                    "found ${insertionPayloadConstructors.size}",
            )
        }
        insertionPayloadConstructors.single().filterLateInsertedItems(insertionPayloadType)

        val finalInsertionInstructions = finalFeedInsertionMethod.implementation?.instructions
            ?: throw PatchException("Final feed insertion has no implementation")
        val firstPayloadRead = finalInsertionInstructions.withIndex().firstOrNull { (_, instruction) ->
            instruction.opcode == Opcode.IGET_OBJECT &&
                instruction.getReference<FieldReference>()?.let { field ->
                    field.definingClass == insertionPayloadType && field.type == "Ljava/util/List;"
                } == true
        } ?: throw PatchException("Final insertion does not read the payload List")
        if (firstPayloadRead.index != 2 ||
            finalInsertionInstructions.getOrNull(3)?.opcode != Opcode.IF_EQZ ||
            finalInsertionInstructions.getOrNull(4)?.opcode != Opcode.INVOKE_INTERFACE
        ) {
            throw PatchException("Final insertion no longer checks the payload List before use")
        }
        val payloadListField = firstPayloadRead.value.getReference<FieldReference>()!!
        val payloadClass = classDefBy(insertionPayloadType)
        val listFields = payloadClass.fields.filter { it.type == "Ljava/util/List;" }
        val positionFields = payloadClass.fields.filter { it.type == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) }
        val sourceFields = payloadClass.fields.filter { it.type == "Ljava/lang/String;" }
        if (listFields.size != 1 || listFields.single().name != payloadListField.name ||
            positionFields.size != 1 || sourceFields.size != 1
        ) {
            throw PatchException("Final insertion payload constructor fields have changed")
        }
        val positionField = "${insertionPayloadType}->${positionFields.single().name}:I"
        val sourceField = "${insertionPayloadType}->${sourceFields.single().name}:Ljava/lang/String;"
        finalFeedInsertionMethod.addInstructions(
            0,
            """
                iget-object v0, p1, $payloadListField
                invoke-static {p0, v0}, $EXTENSION_CLASS_DESCRIPTOR->filterFinalForYouInsertion(Lcom/ss/android/ugc/aweme/feed/panel/BaseListFragmentPanel;Ljava/util/List;)Ljava/util/List;
                move-result-object v1
                if-eq v0, v1, :morphe_keep_original_insertion_payload
                iget v2, p1, $positionField
                iget-object v3, p1, $sourceField
                new-instance v4, $insertionPayloadType
                invoke-direct {v4, v2, v1, v3}, $insertionPayloadType-><init>(ILjava/util/List;Ljava/lang/String;)V
                move-object p1, v4
                :morphe_keep_original_insertion_payload
                nop
            """,
        )

        InsertedFeedItemsFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range {p0 .. p3}, $EXTENSION_CLASS_DESCRIPTOR->filterInsertedFeedItems(Lcom/ss/android/ugc/aweme/feed/panel/BaseListFragmentPanel;ILjava/lang/String;Ljava/util/List;)Ljava/util/List;
                move-result-object p3
            """,
        )

        val cacheChainMethod = CacheChainDeliveryFingerprint.method
        val cacheChainLinkedMethod = CacheChainDeliveryLinkedFingerprint.method
        val cacheResultType = cacheChainMethod.parameterTypes.single().toString()
        if (cacheChainLinkedMethod.parameterTypes.single().toString() != cacheResultType) {
            throw PatchException("Chained cache callbacks use different result contracts")
        }
        val cacheResultClass = classDefBy(cacheResultType)
        // The result also carries other object fields (for example a batch payload), so the cache entry is
        // the L-typed field whose class holds exactly one Aweme.
        val cachePayloadFields = cacheResultClass.fields.filter { field ->
            field.type.startsWith("L") &&
                field.type != "Ljava/lang/String;" &&
                field.type != "Ljava/util/List;" &&
                classDefByOrNull(field.type)?.fields?.count {
                    it.type == "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
                } == 1
        }
        if (cachePayloadFields.size != 1) {
            throw PatchException(
                "Expected one cache-result payload field in $cacheResultType, " +
                    "found ${cachePayloadFields.size}",
            )
        }
        val cachePayloadField = cachePayloadFields.single()
        val cachedAwemeFields = classDefBy(cachePayloadField.type).fields.filter { field ->
            field.type == "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
        }
        if (cachedAwemeFields.size != 1) {
            throw PatchException(
                "Expected one Aweme field in ${cachePayloadField.type}, " +
                    "found ${cachedAwemeFields.size}",
            )
        }
        val cachedAwemeField = cachedAwemeFields.single()
        // In 47.2.41 the only boolean on the result is its success flag: every consumer treats `false`
        // as "this source produced nothing" and moves on.
        val cacheSuccessFields = cacheResultClass.fields.filter { it.type == "Z" }
        if (cacheSuccessFields.size != 1) {
            throw PatchException(
                "Expected one cache-result success field in $cacheResultType, " +
                    "found ${cacheSuccessFields.size}",
            )
        }
        val cacheSuccessField = cacheSuccessFields.single()

        cacheChainMethod.filterChainedCacheDelivery(cachePayloadField, cachedAwemeField)
        cacheChainLinkedMethod.filterChainedCacheDelivery(cachePayloadField, cachedAwemeField)
        InsertCacheWhenPlayLagFingerprint.method.filterPlayLagCacheInsertion()

        ReachBottomCacheDeliveryFingerprint.method.let { method ->
            if (method.parameterTypes.single().toString() != cacheResultType) {
                throw PatchException(
                    "Reach-bottom and chained cache callbacks use different result contracts",
                )
            }
            method.filterReachBottomCacheDelivery(
                cachePayloadField,
                cachedAwemeField,
                cacheSuccessField,
            )
        }

        // Golden-house and offline-mode cold-start cache hits each store one FeedItemList into a static field.
        listOf(
            ColdStartGoldenCachedFeedFingerprint.method to "filterCachedFeedList",
            ColdStartOfflineCachedFeedFingerprint.method to "filterOfflineFeedList",
        ).forEachIndexed { ordinal, (method, filterMethod) ->
            val storeIndices = method.implementation!!.instructions.withIndex()
                .filter {
                    it.value.opcode == Opcode.SPUT_OBJECT &&
                        it.value.getReference<FieldReference>()?.type ==
                        "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;"
                }
                .map { it.index }
                .toList()
            if (storeIndices.size != 1) {
                throw PatchException(
                    "Expected one cold-start cached FeedItemList store in ${method.name}, " +
                        "found ${storeIndices.size}",
                )
            }
            val storeIndex = storeIndices.single()
            val listRegister = (method.implementation!!.instructions[storeIndex] as OneRegisterInstruction).registerA
            method.addInstructionsWithLabels(
                storeIndex,
                """
                    invoke-static/range {v$listRegister .. v$listRegister}, $EXTENSION_CLASS_DESCRIPTOR->$filterMethod(Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;)Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;
                    move-result-object v$listRegister
                    if-nez v$listRegister, :morphe_keep_cold_cache_$ordinal
                    const/4 v$listRegister, 0x0
                    return v$listRegister
                """,
                ExternalLabel(
                    "morphe_keep_cold_cache_$ordinal",
                    method.getInstruction(storeIndex),
                ),
            )
        }

    }
}

@Suppress("unused")
val feedFilterPatch = bytecodePatch(
    name = "Feed filter",
    description = "Hides feed ads, TikTok Shop items, livestreams, stories, photo posts, and videos outside configured view or like ranges.",
    default = true,
) {
    dependsOn(feedListHooksPatch, settingsPatch)
    compatibleWith(*AppCompatibilities.tiktok())
    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/czyeru/extension/tiktok/settings/SettingsStatus;->enableFeedFilter()V",
        )

        DiscoverBannerResponseFingerprint.method.filterResponseAfterCast(
            "Lcom/ss/android/ugc/aweme/discover/model/BannerList;",
            "filterDiscoverBanners",
        )
        DiscoverTrendingResponseFingerprint.method.filterResponseAfterCast(
            "Lcom/ss/android/ugc/aweme/discover/model/TrendingTopicList;",
            "filterDiscoverTrending",
        )
        DiscoverTrendingPairResponseFingerprint.method.filterResponseAfterCast(
            "Lcom/ss/android/ugc/aweme/discover/model/TrendingTopicList;",
            "filterDiscoverTrending",
        )

        MidAdResponseFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .toList()
            returnIndices.asReversed().forEach { returnIndex ->
                val register = method.getInstruction<OneRegisterInstruction>(returnIndex).registerA
                method.addInstructions(
                    returnIndex,
                    """
                        invoke-static/range {v$register .. v$register}, $EXTENSION_CLASS_DESCRIPTOR->filterMidRollAd(Lcom/ss/android/ugc/aweme/feed/model/Aweme;)Lcom/ss/android/ugc/aweme/feed/model/Aweme;
                        move-result-object v$register
                    """,
                )
            }
        }

        ProfileAdEligibilityFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN }
                .map { it.index }
                .toList()
            returnIndices.asReversed().forEach { returnIndex ->
                val register = method.getInstruction<OneRegisterInstruction>(returnIndex).registerA
                method.addInstructionsAtControlFlowLabel(
                    returnIndex,
                    """
                        invoke-static/range {v$register .. v$register}, $EXTENSION_CLASS_DESCRIPTOR->filterProfileAdEligibility(Z)Z
                        move-result v$register
                    """,
                )
            }
        }

        TakoAiFeedButtonSetVisibleFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $TAKO_AI_FILTER_CLASS_DESCRIPTOR->shouldHideFeedButton()Z
                move-result v0
                if-eqz v0, :morphe_keep_feed_tako_visible_state
                const/4 p1, 0x0
                :morphe_keep_feed_tako_visible_state
                nop
            """,
        )
        TakoAiFeedButtonBindFingerprint.method.addInstructions(
            2,
            // range form: p1 is v18 on 48.0.2, past the v0-v15 limit of invoke-static {}
            "invoke-static/range {p1 .. p1}, $TAKO_AI_FILTER_CLASS_DESCRIPTOR->hideBoundFeedButtonView(Landroid/view/View;)V",
        )
    }
}

@Suppress("unused")
val hideAiContentPatch = bytecodePatch(
    name = "Hide AI content",
    description = "Hides posts marked as AI-generated or AI-modified by TikTok or their creators. Unmarked AI content may still appear.",
    default = true,
) {
    dependsOn(feedListHooksPatch, settingsPatch)
    compatibleWith(*AppCompatibilities.tiktok())
    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/czyeru/extension/tiktok/settings/SettingsStatus;->enableHideAiContent()V",
        )
    }
}

@Suppress("unused")
val hideFypSlopPatch = bytecodePatch(
    name = "Hide FYP unpersonalized slop videos",
    description = "Hides certain batches of unpersonalized slop posts that appear in your For You feed.",
    default = true,
) {
    dependsOn(feedListHooksPatch, settingsPatch)
    compatibleWith(*AppCompatibilities.tiktok())
    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/czyeru/extension/tiktok/settings/SettingsStatus;->enableHideFypSlop()V",
        )
    }
}

private fun MutableMethod.filterResponseAfterCast(targetType: String, extensionMethod: String) {
    val castIndices = implementation?.instructions?.withIndex()
        ?.filter { (_, instruction) ->
            instruction.opcode == Opcode.CHECK_CAST &&
                instruction.getReference<TypeReference>()?.type == targetType
        }
        ?.map { it.index }
        ?.toList()
        ?: throw PatchException("Response mapper has no implementation")
    if (castIndices.size != 1) {
        throw PatchException(
            "Expected one $targetType cast in $definingClass->$name, found ${castIndices.size}",
        )
    }

    val castIndex = castIndices.single()
    val register = getInstruction<OneRegisterInstruction>(castIndex).registerA
    addInstruction(
        castIndex + 1,
        "invoke-static/range {v$register .. v$register}, $EXTENSION_CLASS_DESCRIPTOR->$extensionMethod($targetType)V",
    )
}

/**
 * Index of the instruction a branch at [branchIndex] jumps to.
 */
private fun MutableMethod.branchTargetIndex(branchIndex: Int): Int {
    val instructions = implementation!!.instructions.toList()
    val offsets = IntArray(instructions.size)
    var offset = 0
    instructions.forEachIndexed { index, instruction ->
        offsets[index] = offset
        offset += instruction.codeUnits
    }
    val branch = instructions[branchIndex] as? OffsetInstruction
        ?: throw PatchException("Instruction $branchIndex is not a branch")
    val targetOffset = offsets[branchIndex] + branch.codeOffset
    val target = offsets.indexOf(targetOffset)
    if (target < 0) throw PatchException("Branch at $branchIndex has no target instruction")
    return target
}

private fun MutableMethod.filterChainedCacheDelivery(
    cachePayloadField: FieldReference,
    cachedAwemeField: FieldReference,
) {
    val instructions = implementation?.instructions
        ?: throw PatchException("Chained cache delivery method has no implementation")
    val payloadReadIndices = instructions.withIndex()
        .filter { (_, instruction) ->
            instruction.opcode == Opcode.IGET_OBJECT &&
                instruction.getReference<FieldReference>() == cachePayloadField
        }
        .map { it.index }
        .toList()
    if (payloadReadIndices.size != 1) {
        throw PatchException(
            "Expected one cache payload read in chained cache delivery, " +
                "found ${payloadReadIndices.size}",
        )
    }

    val payloadReadIndex = payloadReadIndices.single()
    val payloadRegister = getInstruction<TwoRegisterInstruction>(payloadReadIndex).registerA
    // 47.2.41: `payload = result.entry; if (payload == null) goto nextSource;` then the payload is delivered.
    val branch = instructions.getOrNull(payloadReadIndex + 1)
    if (branch?.opcode != Opcode.IF_EQZ || (branch as OneRegisterInstruction).registerA != payloadRegister) {
        throw PatchException("Chained cache delivery no longer branches on its payload")
    }
    val nextSourceIndex = branchTargetIndex(payloadReadIndex + 1)

    addInstructionsWithLabels(
        payloadReadIndex + 2,
        """
            iget-object v$payloadRegister, v$payloadRegister, $cachedAwemeField
            invoke-static/range {v$payloadRegister .. v$payloadRegister}, $EXTENSION_CLASS_DESCRIPTOR->shouldKeepCachedAweme(Lcom/ss/android/ugc/aweme/feed/model/Aweme;)Z
            move-result v$payloadRegister
            if-eqz v$payloadRegister, :morphe_cache_chain_next_source
        """,
        ExternalLabel("morphe_cache_chain_next_source", getInstruction(nextSourceIndex)),
    )
}

private fun MutableMethod.filterPlayLagCacheInsertion() {
    addInstructionsWithLabels(
        0,
        """
            invoke-static/range {p1 .. p1}, $EXTENSION_CLASS_DESCRIPTOR->shouldKeepCachedAweme(Lcom/ss/android/ugc/aweme/feed/model/Aweme;)Z
            move-result v0
            if-nez v0, :morphe_keep_play_lag_cache_item
            return-void
        """,
        ExternalLabel("morphe_keep_play_lag_cache_item", getInstruction(0)),
    )
}

private fun MutableMethod.filterReachBottomCacheDelivery(
    cachePayloadField: FieldReference,
    cachedAwemeField: FieldReference,
    cacheSuccessField: FieldReference,
) {
    addInstructions(
        0,
        """
            move-object/from16 v0, p1
            iget-object v0, v0, $cachePayloadField
            if-eqz v0, :morphe_keep_reach_bottom_cache_result
            iget-object v0, v0, $cachedAwemeField
            invoke-static/range {v0 .. v0}, $EXTENSION_CLASS_DESCRIPTOR->shouldKeepCachedAweme(Lcom/ss/android/ugc/aweme/feed/model/Aweme;)Z
            move-result v0
            if-nez v0, :morphe_keep_reach_bottom_cache_result
            const/4 v0, 0x0
            move-object/from16 v1, p1
            iput-boolean v0, v1, $cacheSuccessField
            :morphe_keep_reach_bottom_cache_result
            nop
        """,
    )
}

private fun MutableMethod.filterLateInsertedItems(payloadType: String) {
    val listStoreIndices = implementation?.instructions?.withIndex()
        ?.filter { (_, instruction) ->
            instruction.opcode == Opcode.IPUT_OBJECT &&
                instruction.getReference<FieldReference>()?.let { reference ->
                    reference.definingClass == payloadType &&
                        reference.type == "Ljava/util/List;"
                } == true
        }
        ?.map { it.index }
        ?.toList()
        ?: throw PatchException("Final feed insertion payload constructor has no implementation")
    if (listStoreIndices.size != 1) {
        throw PatchException(
            "Expected one List field store in final feed insertion payload constructor, " +
                "found ${listStoreIndices.size}",
        )
    }

    addInstructions(
        listStoreIndices.single(),
        """
            invoke-static {p3, p2}, $EXTENSION_CLASS_DESCRIPTOR->filterLateInsertedItems(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
            move-result-object p2
        """,
    )
}

private fun MutableMethod.filterProfileItemsAtReturns() {
    val instructions = implementation?.instructions
        ?: throw PatchException("Profile native list transform has no implementation")
    val returnIndices = instructions.withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
        .map { (index, _) -> index }
        .toList()
    if (returnIndices.isEmpty()) {
        throw PatchException(
            "Expected profile native list transform to return at least one List",
        )
    }

    returnIndices.asReversed().forEach { returnIndex ->
        val returnRegister = getInstruction<OneRegisterInstruction>(returnIndex).registerA
        addInstructionsAtControlFlowLabel(
            returnIndex,
            """
                invoke-static/range {v$returnRegister .. v$returnRegister}, $EXTENSION_CLASS_DESCRIPTOR->filterProfileItems(Ljava/util/List;)Ljava/util/List;
                move-result-object v$returnRegister
            """,
        )
    }
}

private fun MutableMethod.filterFriendsFinalDelivery() {
    val instructions = implementation?.instructions
        ?: throw PatchException("Friends final-delivery method has no implementation")
    val callbackIndices = instructions.withIndex()
        .filter { (_, instruction) ->
            instruction.getReference<MethodReference>()?.let { reference ->
                reference.parameterTypes == listOf("I", "Z", "Z", "Ljava/util/List;") &&
                    reference.returnType == "V"
            } == true
        }
        .map { (index, _) -> index }
        .toList()
    if (callbackIndices.size != 1) {
        throw PatchException(
            "Expected one Friends final list callback, found ${callbackIndices.size}",
        )
    }

    val callbackIndex = callbackIndices.single()
    val finalListReadIndices = instructions.withIndex()
        .filter { (index, instruction) ->
            index < callbackIndex && instruction.getReference<FieldReference>()?.let { reference ->
                instruction.opcode == Opcode.IGET_OBJECT &&
                    reference.definingClass ==
                        "Lcom/ss/android/ugc/aweme/friendstab/api/FriendsFeedResponse;" &&
                    reference.name == "friendFeedData" &&
                    reference.type == "Ljava/util/List;"
            } == true
        }
        .map { (index, _) -> index }
        .toList()
    if (finalListReadIndices.isEmpty()) {
        throw PatchException("Friends final callback has no preceding friendFeedData read")
    }

    val finalListReadIndex = finalListReadIndices.last()
    val finalListRead = getInstruction<TwoRegisterInstruction>(finalListReadIndex)
    val responseRegister = finalListRead.registerB
    addInstructionsAtControlFlowLabel(
        finalListReadIndex,
        "invoke-static/range {v$responseRegister .. v$responseRegister}, $EXTENSION_CLASS_DESCRIPTOR->filterFriendsContent(Ljava/lang/Object;)V",
    )
}

private fun MutableMethod.filterProfileDetailAdEvent() {
    val pagerUpdateIndices = implementation?.instructions?.withIndex()
        ?.filter { (_, instruction) ->
            instruction.getReference<MethodReference>()?.let { reference ->
                reference.definingClass ==
                    "Lcom/ss/android/ugc/aweme/detail/platform/IDetailPageAbility;" &&
                    reference.parameterTypes == listOf("Ljava/util/List;") &&
                    reference.returnType == "V"
            } == true
        }
        ?.map { it.index }
        ?.toList()
        ?: throw PatchException("Profile detail ad event method has no implementation")
    if (pagerUpdateIndices.size != 1) {
        throw PatchException(
            "Expected one profile detail pager list update in $definingClass->$name, " +
                "found ${pagerUpdateIndices.size}",
        )
    }

    val pagerUpdateIndex = pagerUpdateIndices.single()
    val pagerUpdate = getInstruction<FiveRegisterInstruction>(pagerUpdateIndex)
    if (pagerUpdate.registerCount != 2) {
        throw PatchException(
            "Expected profile detail pager update to use receiver and list registers, " +
                "found ${pagerUpdate.registerCount}",
        )
    }

    val listRegister = pagerUpdate.registerD
    addInstructionsAtControlFlowLabel(
        pagerUpdateIndex,
        """
            invoke-static/range {v$listRegister .. v$listRegister}, $EXTENSION_CLASS_DESCRIPTOR->filterProfileItems(Ljava/util/List;)Ljava/util/List;
            move-result-object v$listRegister
        """,
    )
}
