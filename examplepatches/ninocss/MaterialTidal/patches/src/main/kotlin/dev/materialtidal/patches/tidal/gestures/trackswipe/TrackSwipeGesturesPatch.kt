package dev.materialtidal.patches.tidal.gestures.trackswipe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.materialtidal.patches.shared.COMPATIBILITY_TIDAL

private const val CONFIG_CLASS = "Ldev/materialtidal/extension/tidal/gestures/TrackSwipeConfig;"
private const val BRIDGE_CLASS = "Ldev/materialtidal/extension/tidal/gestures/TidalActionBridge;"

private val ACTION_CHOICES = mapOf(
    "Add to Queue" to "Add to Queue",
    "Play Next" to "Play Next",
    "Toggle Favorite" to "Toggle Favorite",
    "Add to Playlist" to "Add to Playlist",
    "Disabled" to "Disabled",
)

private fun actionNameToCode(name: String?): Int = when (name) {
    "Disabled" -> 0
    "Add to Queue" -> 1
    "Play Next" -> 2
    "Toggle Favorite" -> 3
    "Add to Playlist" -> 4
    else -> throw PatchException("Invalid swipe action option value: $name")
}

@Suppress("unused")
val trackSwipeGesturesPatch = patch(
    name = "Track swipe gestures",
    description = "Adds Material 3 Expressive swipe gestures to track rows (queue, play next, favorite, add to playlist).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith("extensions/tidal.mpe")

    val swipeRightOption by stringOption(
        key = "swipeRightAction",
        default = "Add to Queue",
        values = ACTION_CHOICES,
        title = "Swipe right action",
        description = "Action triggered when swiping a track row to the right.",
        required = true,
    )

    val swipeLeftOption by stringOption(
        key = "swipeLeftAction",
        default = "Toggle Favorite",
        values = ACTION_CHOICES,
        title = "Swipe left action",
        description = "Action triggered when swiping a track row to the left.",
        required = true,
    )

    val hapticOption by booleanOption(
        key = "hapticFeedback",
        default = true,
        title = "Haptic feedback",
        description = "Vibrate subtly when crossing the swipe threshold and triggering an action.",
        required = true,
    )

    val thresholdDpOption by intOption(
        key = "swipeThresholdDp",
        default = 72,
        title = "Swipe threshold (dp)",
        description = "Horizontal drag distance in dp required to trigger a swipe action (36–160).",
        required = true,
        validator = { it != null && it in 36..160 },
    )

    execute {
        // 1. Configure TrackSwipeConfig options.
        val configClass = mutableClassDefBy(CONFIG_CLASS)
        val rightCode = actionNameToCode(swipeRightOption)
        val leftCode = actionNameToCode(swipeLeftOption)
        val hapticEnabled = hapticOption ?: true
        val thresholdDp = thresholdDpOption ?: 72

        configClass.methods.single { it.name == "getSwipeRightAction" }.returnEarly(rightCode)
        configClass.methods.single { it.name == "getSwipeLeftAction" }.returnEarly(leftCode)
        configClass.methods.single { it.name == "isHapticEnabled" }.returnEarly(hapticEnabled)
        configClass.methods.single { it.name == "getSwipeThresholdDp" }.returnEarly(thresholdDp)

        // 2. Resolve resource IDs.
        val addedToQueueStrId = resourceId(ResourceType.STRING, "added_to_play_queue")
        val addedToFavoritesStrId = resourceId(ResourceType.STRING, "added_to_favorites")

        // 3. Resolve action & DI fingerprints.
        val addToQueueActionMatch = AddToPlayQueueActionFingerprint.matchSingle()
        val playQueueAddNextMatch = PlayQueueAddNextFingerprint.matchSingle()
        val playQueueAddLastMatch = PlayQueueAddLastFingerprint.matchSingle()
        val favAddMatch = TrackFavoritesManagerAddFingerprint.matchSingle()
        val favProviderMatch = TrackFavoritesManagerProviderFingerprint.matchSingle()
        val favRepoRemoveMatch = TrackFavoriteRepoRemoveFingerprint.matchSingle()
        val showRemoveFavDialogMatch = ShowRemoveFromFavoritesDialogFingerprint.matchSingle()
        val addToPlaylistActionMatch = AddToPlaylistActionFingerprint.matchSingle()

        // Extract AddToQueueUseCase (Loi;) and its fields + toast helper (Lchi;).
        val queueOpsMethodRef = addToQueueActionMatch.instructionMatches[0]
            .getInstruction<ReferenceInstruction>().reference as MethodReference
        val addToQueueUseCaseType = addToQueueActionMatch.method.instructions
            .asSequence()
            .filter { it.opcode == Opcode.IGET_OBJECT }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .firstOrNull { it.definingClass == addToQueueActionMatch.classDef.type && it.type != SOURCE_TYPE }
            ?.type
            ?: throw PatchException("Could not resolve AddToQueueUseCase type from ${addToQueueActionMatch.classDef.type}")

        val addToQueueUseCaseClass = mutableClassDefBy(addToQueueUseCaseType)
        val queueOpsField = addToQueueUseCaseClass.fields.single { it.type == queueOpsMethodRef.definingClass }

        val toastCallInsn = addToQueueActionMatch.method.instructions.firstOrNull {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference ?: return@firstOrNull false
            ref.parameterTypes.size == 2 &&
                ref.parameterTypes[0] == "I" &&
                ref.parameterTypes[1] == "[Ljava/lang/Object;" &&
                ref.returnType == "V"
        } ?: throw PatchException("Could not locate toast helper call in ${addToQueueActionMatch.method}")
        val toastShowRef = (toastCallInsn as ReferenceInstruction).reference as MethodReference
        val toastInvokeOpcode = if (toastCallInsn.opcode == Opcode.INVOKE_INTERFACE) "invoke-interface" else "invoke-virtual"
        val useCaseToastField = addToQueueUseCaseClass.fields.single { it.type == toastShowRef.definingClass }

        // Find AddToQueueUseCase provider (Loi$a;).
        val addToQueueProviderFingerprint = Fingerprint(
            parameters = emptyList(),
            returnType = "Ljava/lang/Object;",
            filters = listOf(
                methodCall(
                    definingClass = addToQueueUseCaseType,
                    name = "<init>",
                ),
            ),
        )
        val addToQueueProviderMatch = addToQueueProviderFingerprint.matchSingle()
        val addToQueueProviderClass = addToQueueProviderMatch.classDef
        val addToQueueProviderInvoke = addToQueueProviderMatch.method

        // Hook AddToQueueUseCaseProvider.<init> and TrackFavoritesManagerProvider.<init>.
        hookConstructorEnd(
            addToQueueProviderClass,
            "registerAddToQueueProvider",
        )
        hookConstructorEnd(
            favProviderMatch.classDef,
            "registerFavoritesManagerProvider",
        )

        val favProviderClass = favProviderMatch.classDef
        val favProviderInvoke = favProviderMatch.method
        val favManagerClass = favAddMatch.classDef
        val favToastField = favManagerClass.fields.single { it.type == toastShowRef.definingClass }

        // Resolve isFavorite(int)Z on TrackFavoriteRepo (Looi;).
        val favRepoClass = favRepoRemoveMatch.classDef
        val isFavoriteMethod = favRepoClass.methods.single {
            AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.parameterTypes.size == 1 &&
                it.parameterTypes[0] == "I" &&
                it.returnType == "Z"
        }

        // Resolve removeFromFavorites dialog executor (Lakf;).
        val newDialogIdx = showRemoveFavDialogMatch.instructionMatches.last().index
        val removeFavDialogType = (showRemoveFavDialogMatch.method.getInstruction(newDialogIdx) as ReferenceInstruction)
            .reference.let { (it as TypeReference).type }
        val removeFavDialogClass = mutableClassDefBy(removeFavDialogType)
        val removeFavDialogInit = removeFavDialogClass.methods.single {
            it.name == "<init>" &&
                it.parameterTypes.size == 3 &&
                it.parameterTypes[0] == "Ljava/lang/Object;" &&
                it.parameterTypes[1] == CONTEXTUAL_METADATA_TYPE &&
                it.parameterTypes[2] == NAVIGATION_INFO_TYPE
        }
        val removeFavExecMethod = removeFavDialogClass.methods.single {
            !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.parameterTypes.isEmpty() &&
                it.returnType == "V" &&
                it.instructions.any { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == favRepoClass.type && ref.name == favRepoRemoveMatch.method.name
                }
        }

        // Resolve AddToPlaylist helper (Lx8l; and Lci;).
        val mediaItemParentInitIdx = addToPlaylistActionMatch.instructionMatches[0].index
        val x8lInitRef = addToPlaylistActionMatch.method.instructions
            .drop(mediaItemParentInitIdx + 1)
            .firstNotNullOfOrNull { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                if (insn.opcode == Opcode.INVOKE_DIRECT &&
                    ref != null &&
                    ref.name == "<init>" &&
                    ref.parameterTypes.size == 1 &&
                    ref.parameterTypes[0] == "Lcom/aspiro/wamp/model/MediaItemParent;"
                ) ref else null
            } ?: throw PatchException("Could not resolve MediaItemParent wrapper <init> in AddToPlaylistAction")

        val launchPlaylistRef = addToPlaylistActionMatch.instructionMatches[1]
            .getInstruction<ReferenceInstruction>().reference as MethodReference
        val addToPlaylistHelperClass = mutableClassDefBy(launchPlaylistRef.definingClass)
        val addToPlaylistHelperInit = addToPlaylistHelperClass.methods.single {
            it.name == "<init>" && it.parameterTypes.size == 4
        }

        // Resolve SearchTrack field (Lbqi;.a:Track).
        val searchTrackBindMatch = SearchTrackDelegateBindFingerprint.matchSingle()
        val searchTrackFieldRef = searchTrackBindMatch.instructionMatches[0]
            .getInstruction<ReferenceInstruction>().reference as FieldReference

        // 4. Implement the 9 native* stubs in TidalActionBridge.
        val bridgeClass = mutableClassDefBy(BRIDGE_CLASS)

        replaceBridgeMethod(
            bridgeClass,
            "nativeIsTrack",
            """
                instance-of v0, p0, $TRACK_TYPE
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeIsStreamReady",
            """
                check-cast p0, $TRACK_TYPE
                invoke-virtual { p0 }, $MEDIA_ITEM_TYPE->isStreamReady()Z
                move-result v0
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeIsFavorite",
            """
                check-cast p0, $TRACK_TYPE
                invoke-virtual { p0 }, $MEDIA_ITEM_TYPE->getId()I
                move-result v0
                invoke-static { v0 }, $isFavoriteMethod
                move-result v0
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeAddToQueue",
            buildQueueOperationSmali(
                providerType = addToQueueProviderClass.type,
                providerInvoke = addToQueueProviderInvoke,
                useCaseType = addToQueueUseCaseType,
                queueOpsField = queueOpsField,
                queueOpMethod = playQueueAddLastMatch.method,
                returnsBoolean = true,
                toastField = useCaseToastField,
                toastInvokeOpcode = toastInvokeOpcode,
                toastShowRef = toastShowRef,
                toastStringId = addedToQueueStrId,
            ),
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativePlayNext",
            buildQueueOperationSmali(
                providerType = addToQueueProviderClass.type,
                providerInvoke = addToQueueProviderInvoke,
                useCaseType = addToQueueUseCaseType,
                queueOpsField = queueOpsField,
                queueOpMethod = playQueueAddNextMatch.method,
                returnsBoolean = false,
                toastField = useCaseToastField,
                toastInvokeOpcode = toastInvokeOpcode,
                toastShowRef = toastShowRef,
                toastStringId = addedToQueueStrId,
            ),
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeAddToFavorites",
            """
                check-cast p0, ${favProviderClass.type}
                check-cast p1, $TRACK_TYPE
                invoke-virtual { p0 }, $favProviderInvoke
                move-result-object v1
                check-cast v1, $TRACK_FAVORITES_MANAGER_TYPE
                new-instance v3, $CONTEXTUAL_METADATA_TYPE
                const-string v0, "swipe"
                invoke-direct { v3, v0 }, $CONTEXTUAL_METADATA_TYPE-><init>(Ljava/lang/String;)V
                move-object v2, p1
                const/4 v4, 0x0
                const/4 v5, 0x0
                const/4 v6, 0x0
                invoke-virtual/range { v1 .. v6 }, ${favAddMatch.method}
                iget-object v2, v1, $favToastField
                const v3, 0x${addedToFavoritesStrId.toString(16)}
                const/4 v4, 0x0
                new-array v4, v4, [Ljava/lang/Object;
                $toastInvokeOpcode { v2, v3, v4 }, $toastShowRef
                const/4 v0, 0x1
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeRemoveFromFavorites",
            """
                check-cast p0, $TRACK_TYPE
                new-instance v0, $removeFavDialogType
                new-instance v1, $CONTEXTUAL_METADATA_TYPE
                const-string v2, "swipe"
                invoke-direct { v1, v2 }, $CONTEXTUAL_METADATA_TYPE-><init>(Ljava/lang/String;)V
                const/4 v2, 0x0
                invoke-direct { v0, p0, v1, v2 }, $removeFavDialogInit
                invoke-virtual { v0 }, $removeFavExecMethod
                const/4 v0, 0x1
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeAddToPlaylist",
            """
                check-cast p0, $TRACK_TYPE
                new-instance v0, Lcom/aspiro/wamp/model/MediaItemParent;
                invoke-direct { v0, p0 }, Lcom/aspiro/wamp/model/MediaItemParent;-><init>($MEDIA_ITEM_TYPE)V
                new-instance v1, ${x8lInitRef.definingClass}
                invoke-direct { v1, v0 }, $x8lInitRef
                new-instance v2, $CONTEXTUAL_METADATA_TYPE
                const-string v3, "swipe"
                invoke-direct { v2, v3 }, $CONTEXTUAL_METADATA_TYPE-><init>(Ljava/lang/String;)V
                invoke-virtual { p0 }, $MEDIA_ITEM_TYPE->getId()I
                move-result v4
                invoke-static { v4 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                move-result-object v4
                new-instance v3, Lcom/aspiro/wamp/eventtracking/model/ContentMetadata;
                const-string v5, "TRACK"
                invoke-direct { v3, v5, v4 }, Lcom/aspiro/wamp/eventtracking/model/ContentMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;)V
                new-instance v0, ${addToPlaylistHelperClass.type}
                const/4 v4, 0x0
                invoke-direct/range { v0 .. v4 }, $addToPlaylistHelperInit
                const/4 v1, 0x0
                invoke-virtual { v0, v1 }, $launchPlaylistRef
                const/4 v0, 0x1
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeExtractSearchTrack",
            """
                check-cast p0, ${searchTrackFieldRef.definingClass}
                iget-object v0, p0, $searchTrackFieldRef
                return-object v0
            """,
        )

        // 5. Hook all 6 Track row binders + 3 item-to-track mappers.

        // (a) MediaItemViewHolderBindFingerprint (Lg4b;.c(MediaItem)V) -> p0=ViewHolder, p1=MediaItem
        MediaItemViewHolderBindFingerprint.matchSingle().method.let { m ->
            val p0Reg = m.p0Register
            val p1Reg = p0Reg + 1
            val regs = m.getFreeRegisterProvider(0, 2, p0Reg, p1Reg)
            val rView = regs.getFreeRegister()
            val rItem = regs.getFreeRegister()
            val movVh = if (p0Reg < 16) "move-object v$rView, v$p0Reg" else "move-object/from16 v$rView, v$p0Reg"
            val movItem = if (p1Reg < 16) "move-object v$rItem, v$p1Reg" else "move-object/from16 v$rItem, v$p1Reg"
            m.addInstructions(
                0,
                """
                    $movVh
                    $movItem
                    iget-object v$rView, v$rView, $VIEW_HOLDER_TYPE->itemView:Landroid/view/View;
                    invoke-static { v$rView, v$rItem }, $BRIDGE_CLASS->bindTrackRow(Landroid/view/View;Ljava/lang/Object;)V
                """,
            )
        }

        // (b) PlaylistTrackDelegateBindFingerprint (Lj9e;.c(Object, ViewHolder)V)
        PlaylistTrackDelegateBindFingerprint.matchSingle().let { match ->
            val castIdx = match.instructionMatches[0].index
            val m = match.method
            val itemReg = (m.getInstruction(castIdx) as OneRegisterInstruction).registerA
            val vhParamReg = m.p0Register + 2
            val insertIdx = castIdx + 1
            val regs = m.getFreeRegisterProvider(insertIdx, 2, itemReg, vhParamReg)
            val rView = regs.getFreeRegister()
            val rTrack = regs.getFreeRegister()
            val movVh = if (vhParamReg < 16) "move-object v$rView, v$vhParamReg" else "move-object/from16 v$rView, v$vhParamReg"
            val movItem = if (itemReg < 16) "move-object v$rTrack, v$itemReg" else "move-object/from16 v$rTrack, v$itemReg"
            m.addInstructions(
                insertIdx,
                """
                    $movVh
                    $movItem
                    iget-object v$rView, v$rView, $VIEW_HOLDER_TYPE->itemView:Landroid/view/View;
                    invoke-virtual { v$rTrack }, Lcom/aspiro/wamp/playlist/viewmodel/item/TrackViewModel;->getTrack()$TRACK_TYPE
                    move-result-object v$rTrack
                    invoke-static { v$rView, v$rTrack }, $BRIDGE_CLASS->bindTrackRow(Landroid/view/View;Ljava/lang/Object;)V
                """,
            )
        }

        // (c) SuggestedTrackDelegateBindFingerprint (Louh;.c(Object, ViewHolder)V)
        SuggestedTrackDelegateBindFingerprint.matchSingle().let { match ->
            val castIdx = match.instructionMatches[0].index
            val m = match.method
            val itemReg = (m.getInstruction(castIdx) as OneRegisterInstruction).registerA
            val vhParamReg = m.p0Register + 2
            val insertIdx = castIdx + 1
            val regs = m.getFreeRegisterProvider(insertIdx, 2, itemReg, vhParamReg)
            val rView = regs.getFreeRegister()
            val rTrack = regs.getFreeRegister()
            val movVh = if (vhParamReg < 16) "move-object v$rView, v$vhParamReg" else "move-object/from16 v$rView, v$vhParamReg"
            val movItem = if (itemReg < 16) "move-object v$rTrack, v$itemReg" else "move-object/from16 v$rTrack, v$itemReg"
            m.addInstructions(
                insertIdx,
                """
                    $movVh
                    $movItem
                    iget-object v$rView, v$rView, $VIEW_HOLDER_TYPE->itemView:Landroid/view/View;
                    invoke-virtual { v$rTrack }, Lcom/aspiro/wamp/playlist/viewmodel/item/SuggestedTrackViewModel;->getTrack()$TRACK_TYPE
                    move-result-object v$rTrack
                    invoke-static { v$rView, v$rTrack }, $BRIDGE_CLASS->bindTrackRow(Landroid/view/View;Ljava/lang/Object;)V
                """,
            )
        }

        // (d) SearchTrackDelegateBindFingerprint (Lh6j;.c(Object, ViewHolder)V)
        hookDelegateBind(searchTrackBindMatch.method, "bindSearchTrackRow")

        // (e) AlbumTrackDelegateBindFingerprint (Ltt;.c(Object, ViewHolder)V)
        hookDelegateBind(AlbumTrackDelegateBindFingerprint.matchSingle().method, "bindMappedTrackRow")

        // (f) DynamicMediaItemDelegateBindFingerprint (Lr3b;.c(Object, ViewHolder)V)
        hookDelegateBind(DynamicMediaItemDelegateBindFingerprint.matchSingle().method, "bindMappedTrackRow")

        // (g) AlbumItemMapFingerprint (albumitemcollection/b.l(MediaItem, AlbumItemCollectionModule) -> a$a)
        AlbumItemMapFingerprint.matchSingle().let { match ->
            val m = match.method
            val newInstanceIdx = match.instructionMatches[match.instructionMatches.size - 2].index
            val uiItemReg = (m.getInstruction(newInstanceIdx) as OneRegisterInstruction).registerA
            val initIdx = match.instructionMatches.last().index
            val mediaItemParamReg = m.p0Register + 1
            val insertIdx = initIdx + 1
            val regs = m.getFreeRegisterProvider(insertIdx, 2, uiItemReg, mediaItemParamReg)
            val rUi = regs.getFreeRegister()
            val rMedia = regs.getFreeRegister()
            val movUi = if (uiItemReg < 16) "move-object v$rUi, v$uiItemReg" else "move-object/from16 v$rUi, v$uiItemReg"
            val movMedia = if (mediaItemParamReg < 16) "move-object v$rMedia, v$mediaItemParamReg" else "move-object/from16 v$rMedia, v$mediaItemParamReg"
            m.addInstructions(
                insertIdx,
                """
                    $movUi
                    $movMedia
                    invoke-static { v$rUi, v$rMedia }, $BRIDGE_CLASS->mapItemToTrack(Ljava/lang/Object;Ljava/lang/Object;)V
                """,
            )
        }

        // (h) DynamicTrackItemMapFingerprint (Ldni;.o(TrackCollectionModule)Lymi;)
        DynamicTrackItemMapFingerprint.matchSingle().let { match ->
            val origCastIdx = match.instructionMatches[0].index
            val origNewIdx = match.instructionMatches[match.instructionMatches.size - 2].index
            val origZmiInitIdx = match.instructionMatches.last().index
            val castReg = (match.method.getInstruction(origCastIdx) as OneRegisterInstruction).registerA
            val zmiReg = (match.method.getInstruction(origNewIdx) as OneRegisterInstruction).registerA

            val (cloned, added) = match.method.addFreeRegisters(1)
            val trackSaveReg = cloned.implementation!!.registerCount - 1

            // Save Track right after `check-cast vX, Track`.
            val saveInsertIdx = origCastIdx + added + 1
            cloned.addInstructions(
                saveInsertIdx,
                "move-object/from16 v$trackSaveReg, v$castReg",
            )

            // Map Track to newly constructed Lzmi; right after `Lzmi;.<init>`.
            val mapInsertIdx = origZmiInitIdx + added + 1 + 1
            if (zmiReg < 16) {
                val rTrack = cloned.findFreeRegister(mapInsertIdx, zmiReg, trackSaveReg)
                cloned.addInstructions(
                    mapInsertIdx,
                    """
                        move-object/from16 v$rTrack, v$trackSaveReg
                        invoke-static { v$zmiReg, v$rTrack }, $BRIDGE_CLASS->mapItemToTrack(Ljava/lang/Object;Ljava/lang/Object;)V
                    """,
                )
            } else {
                val regs = cloned.getFreeRegisterProvider(mapInsertIdx, 2, zmiReg, trackSaveReg)
                val rUi = regs.getFreeRegister()
                val rTrack = regs.getFreeRegister()
                cloned.addInstructions(
                    mapInsertIdx,
                    """
                        move-object/from16 v$rUi, v$zmiReg
                        move-object/from16 v$rTrack, v$trackSaveReg
                        invoke-static { v$rUi, v$rTrack }, $BRIDGE_CLASS->mapItemToTrack(Ljava/lang/Object;Ljava/lang/Object;)V
                    """,
                )
            }
        }

        // (i) AdapterItemCloneFingerprint (Logf;.a) -> preserve track mapping across Logf;.invoke
        val cloneHelperClass = AdapterItemCloneFingerprint.matchSingle().classDef
        val cloneInvokeMethod = cloneHelperClass.methods.single {
            it.name == "invoke" &&
                it.parameterTypes.size == 1 &&
                it.parameterTypes[0] == "Ljava/lang/Object;" &&
                it.returnType == "Ljava/lang/Object;"
        }
        val retIdx = cloneInvokeMethod.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        if (retIdx < 0) {
            throw PatchException("Could not find return-object in ${cloneHelperClass.type}->invoke")
        }
        val newItemReg = (cloneInvokeMethod.getInstruction(retIdx) as OneRegisterInstruction).registerA
        val oldItemParamReg = cloneInvokeMethod.p0Register + 1
        if (newItemReg < 16 && oldItemParamReg < 16 && newItemReg != oldItemParamReg) {
            cloneInvokeMethod.addInstructions(
                retIdx,
                """
                    invoke-static { v$oldItemParamReg }, $BRIDGE_CLASS->resolveMappedTrack(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$oldItemParamReg
                    invoke-static { v$newItemReg, v$oldItemParamReg }, $BRIDGE_CLASS->mapItemToTrack(Ljava/lang/Object;Ljava/lang/Object;)V
                """,
            )
        } else {
            val (clonedInvoke, addedClone) = cloneInvokeMethod.addFreeRegisters(1)
            val clonedRetIdx = retIdx + addedClone
            val rOld = clonedInvoke.findFreeRegister(clonedRetIdx, newItemReg, oldItemParamReg)
            val rNew = if (newItemReg < 16) newItemReg else clonedInvoke.findFreeRegister(clonedRetIdx, rOld, oldItemParamReg)
            val copyNew = if (rNew == newItemReg) "" else "move-object/from16 v$rNew, v$newItemReg\n"
            val copyOld = if (oldItemParamReg < 16) "move-object v$rOld, v$oldItemParamReg" else "move-object/from16 v$rOld, v$oldItemParamReg"
            clonedInvoke.addInstructions(
                clonedRetIdx,
                """
                    $copyNew$copyOld
                    invoke-static { v$rOld }, $BRIDGE_CLASS->resolveMappedTrack(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$rOld
                    invoke-static { v$rNew, v$rOld }, $BRIDGE_CLASS->mapItemToTrack(Ljava/lang/Object;Ljava/lang/Object;)V
                """,
            )
        }
    }
}

private fun hookConstructorEnd(
    targetClass: MutableClass,
    bridgeRegisterMethod: String,
) {
    val initMethod = targetClass.methods.singleOrNull { it.name == "<init>" }
        ?: throw PatchException("Expected single <init> in ${targetClass.type}")
    val retIdx = initMethod.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
    if (retIdx < 0) {
        throw PatchException("No return-void found in ${targetClass.type}-><init>")
    }
    val p0Reg = initMethod.p0Register
    if (p0Reg < 16) {
        initMethod.addInstructions(
            retIdx,
            "invoke-static { v$p0Reg }, $BRIDGE_CLASS->$bridgeRegisterMethod(Ljava/lang/Object;)V",
        )
    } else {
        val tmp = initMethod.getFreeRegisterProvider(retIdx, 1, p0Reg).getFreeRegister()
        initMethod.addInstructions(
            retIdx,
            """
                move-object/from16 v$tmp, v$p0Reg
                invoke-static { v$tmp }, $BRIDGE_CLASS->$bridgeRegisterMethod(Ljava/lang/Object;)V
            """,
        )
    }
}

private fun hookDelegateBind(
    method: MutableMethod,
    bridgeBindMethod: String,
) {
    val p0Reg = method.p0Register
    val itemParamReg = p0Reg + 1
    val vhParamReg = p0Reg + 2
    val regs = method.getFreeRegisterProvider(0, 2, itemParamReg, vhParamReg)
    val rView = regs.getFreeRegister()
    val rItem = regs.getFreeRegister()
    val movVh = if (vhParamReg < 16) "move-object v$rView, v$vhParamReg" else "move-object/from16 v$rView, v$vhParamReg"
    val movItem = if (itemParamReg < 16) "move-object v$rItem, v$itemParamReg" else "move-object/from16 v$rItem, v$itemParamReg"
    method.addInstructions(
        0,
        """
            $movVh
            $movItem
            iget-object v$rView, v$rView, $VIEW_HOLDER_TYPE->itemView:Landroid/view/View;
            invoke-static { v$rView, v$rItem }, $BRIDGE_CLASS->$bridgeBindMethod(Landroid/view/View;Ljava/lang/Object;)V
        """,
    )
}

private fun replaceBridgeMethod(
    bridgeClass: MutableClass,
    methodName: String,
    smali: String,
) {
    val oldMethod = bridgeClass.methods.singleOrNull { it.name == methodName }
        ?: throw PatchException("Bridge method not found: $BRIDGE_CLASS->$methodName")

    val newMethod = ImmutableMethod(
        bridgeClass.type,
        oldMethod.name,
        oldMethod.parameters.map { ImmutableMethodParameter(it.type, it.annotations, it.name) },
        oldMethod.returnType,
        oldMethod.accessFlags,
        oldMethod.annotations,
        oldMethod.hiddenApiRestrictions,
        MutableMethodImplementation(10),
    ).toMutable()

    newMethod.addInstructionsWithLabels(0, smali.trimIndent())

    bridgeClass.methods.remove(oldMethod)
    bridgeClass.methods.add(newMethod)
}

private fun buildQueueOperationSmali(
    providerType: String,
    providerInvoke: MethodReference,
    useCaseType: String,
    queueOpsField: FieldReference,
    queueOpMethod: MethodReference,
    returnsBoolean: Boolean,
    toastField: FieldReference,
    toastInvokeOpcode: String,
    toastShowRef: MethodReference,
    toastStringId: Long,
): String {
    val resultBlock = if (returnsBoolean) {
        "move-result v2"
    } else {
        "const/4 v2, 0x1"
    }
    return """
        check-cast p0, $providerType
        check-cast p1, $TRACK_TYPE
        invoke-virtual { p1 }, $MEDIA_ITEM_TYPE->getId()I
        move-result v0
        invoke-static { v0 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
        move-result-object v4
        invoke-virtual { p1 }, $TRACK_TYPE->getDisplayTitle()Ljava/lang/String;
        move-result-object v5
        if-nez v5, :has_title
        const-string v5, ""
        :has_title
        new-instance v3, Lcom/aspiro/wamp/playqueue/source/model/ItemSource;
        sget-object v6, Lcom/aspiro/wamp/playqueue/source/model/ItemSource${'$'}NavigationType${'$'}None;->INSTANCE:Lcom/aspiro/wamp/playqueue/source/model/ItemSource${'$'}NavigationType${'$'}None;
        const/4 v7, 0x0
        invoke-direct/range { v3 .. v7 }, Lcom/aspiro/wamp/playqueue/source/model/ItemSource;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/aspiro/wamp/playqueue/source/model/ItemSource${'$'}NavigationType;Lcom/tidal/android/navigation/NavigationInfo${'$'}Node;)V
        invoke-virtual { v3, p1 }, $SOURCE_TYPE->addSourceItem($MEDIA_ITEM_TYPE)V
        invoke-virtual { p0 }, $providerInvoke
        move-result-object v0
        check-cast v0, $useCaseType
        iget-object v1, v0, $queueOpsField
        invoke-virtual { v1, v3 }, $queueOpMethod
        $resultBlock
        iget-object v1, v0, $toastField
        const v4, 0x${toastStringId.toString(16)}
        const/4 v5, 0x0
        new-array v5, v5, [Ljava/lang/Object;
        $toastInvokeOpcode { v1, v4, v5 }, $toastShowRef
        return v2
    """
}
