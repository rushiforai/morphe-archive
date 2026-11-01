package patches.videolandatv

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import patches.atv.exact
import patches.shared.uniqueMatch

// Fixed itemContent paths only; -1 means absent, -2 means not an array.
private fun rawAssetCount(path: String?, label: String): String = """
    move-object v2, v4
    ${if (path == null) "" else """
    const-string v3, "$path"
    invoke-virtual {v2, v3}, LTv/y;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    instance-of v3, v2, LTv/y;
    if-eqz v3, :${label}Absent
    check-cast v2, LTv/y;
    """.trimIndent()}
    const-string v3, "assets"
    invoke-virtual {v2, v3}, LTv/y;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    if-eqz v2, :${label}Absent
    instance-of v3, v2, LTv/c;
    if-eqz v3, :${label}Invalid
    check-cast v2, LTv/c;
    invoke-virtual {v2}, LTv/c;->size()I
    move-result v5
    goto :${label}Log
    :${label}Absent
    const/4 v5, -0x1
    goto :${label}Log
    :${label}Invalid
    const/4 v5, -0x2
    :${label}Log
    const-string v2, " ${label}Assets="
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
""".trimIndent()

private val rawItemSummaryCode = """
    :summaryTryStart
    instance-of v0, p0, LTv/y;
    if-eqz v0, :summaryAbsent
    move-object v0, p0
    check-cast v0, LTv/y;
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "type="
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, "itemType"
    invoke-virtual {v0, v2}, LTv/y;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    instance-of v3, v2, LTv/B;
    if-eqz v3, :summaryOtherType
    check-cast v2, LTv/B;
    invoke-virtual {v2}, LTv/B;->d()Ljava/lang/String;
    move-result-object v2
    const-string v3, "classic|video|epg"
    invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :summaryTypeReady
    :summaryOtherType
    const-string v2, "other"
    :summaryTypeReady
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, "itemContent"
    invoke-virtual {v0, v2}, LTv/y;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    instance-of v3, v4, LTv/y;
    if-eqz v3, :summaryContentAbsent
    check-cast v4, LTv/y;
    const-string v2, "id"
    invoke-virtual {v4, v2}, LTv/y;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    instance-of v3, v2, LTv/B;
    if-eqz v3, :summaryIdOmitted
    check-cast v2, LTv/B;
    invoke-virtual {v2}, LTv/B;->d()Ljava/lang/String;
    move-result-object v2
    const-string v3, "[A-Za-z0-9_-]{1,96}"
    invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :summaryIdReady
    :summaryIdOmitted
    const-string v2, "<omitted>"
    :summaryIdReady
    const-string v3, " id="
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    ${rawAssetCount("video", "video")}
    ${rawAssetCount("media", "media")}
    ${rawAssetCount(null, "direct")}
    goto :summaryDone
    :summaryContentAbsent
    const-string v2, " content=absent"
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :summaryDone
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    :summaryTryEnd
    return-object v1
    :summaryAbsent
    const/4 v1, 0x0
    return-object v1
    :summaryError
    move-exception v0
    const/4 v1, 0x0
    return-object v1
""".trimIndent()

/** Test-only target class observation. Excluded from the deliverable bundle. */
@Suppress("unused")
val subscriptionProbePatch = bytecodePatch(name = "Observe subscription routing (test only)", default = false) {
    compatibleWith(videolandTv)
    dependsOn(originalInput, subscriptionRoutingPatch)
    execute {
        val selector = exact("LL7/f;", "e(LTv/k;)LOv/a;", 4, 57)
        val selectorClass = Fingerprint(definingClass = "LL7/f;", name = "e",
            parameters = listOf("LTv/k;"), returnType = "LOv/a;").uniqueMatch().classDef
        check(selectorClass.methods.none { it.name == "morpheItemAssetSummary" })
        val summary = MutableMethod(ImmutableMethod("LL7/f;", "morpheItemAssetSummary",
            listOf(ImmutableMethodParameter("LTv/k;", emptySet(), null)), "Ljava/lang/String;",
            9, emptySet(), emptySet(), ImmutableMethodImplementation(7, emptyList(), emptyList(), emptyList())))
        summary.addInstructionsWithLabels(0, rawItemSummaryCode)
        fun summaryIndex(label: String) = rawItemSummaryCode.lineSequence()
            .takeWhile { it.trim() != label }
            .count { it.isNotBlank() && !it.trim().startsWith(":") && !it.trim().startsWith(".") }
        summary.implementation!!.let { body ->
            body.addCatch("Ljava/lang/Exception;", body.newLabelForIndex(summaryIndex(":summaryTryStart")),
                body.newLabelForIndex(summaryIndex(":summaryTryEnd")), body.newLabelForIndex(summaryIndex(":summaryError")))
        }
        check(selectorClass.methods.add(summary))
        selector.addInstructionsWithLabels(0, """
            invoke-static {p1}, LL7/f;->morpheItemAssetSummary(LTv/k;)Ljava/lang/String;
            move-result-object v0
            if-eqz v0, :rawItemProbeDone
            const-string v1, "MorpheRawItemAssets"
            invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            :rawItemProbeDone
            nop
        """.trimIndent())
        val navigation = exact(NAVIGATION, NAVIGATION_SIGNATURE, 17, 387)
        val action = exact(HANDLE_ACTION, HANDLE_ACTION_SIGNATURE, 48, 658)
        navigation.addInstructionsWithLabels(0, """
            const-string v0, "MorpheSubTarget"
            invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
            move-result-object v2
            invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;
            move-result-object v2
            invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            instance-of v0, p1, $SUBSCRIPTION
            if-eqz v0, :probeDone
            move-object v2, p1
            check-cast v2, $SUBSCRIPTION
            invoke-virtual {v2}, $SUBSCRIPTION->b()$TARGET
            move-result-object v2
            if-eqz v2, :probeNull
            invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
            move-result-object v2
            invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;
            move-result-object v2
            goto :probeLog
            :probeNull
            const-string v2, "null"
            :probeLog
            const-string v0, "MorpheSubOriginal"
            invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            :probeDone
            instance-of v0, p1, $SUBSCRIPTION
            if-eqz v0, :probeEnd
            move-object v2, p1
            check-cast v2, $SUBSCRIPTION
            invoke-virtual {v2}, $SUBSCRIPTION->b()$TARGET
            move-result-object v2
            instance-of v0, v2, Lcom/bedrockstreaming/component/layout/domain/core/model/Target${'$'}Layout;
            if-eqz v0, :probeEnd
            check-cast v2, Lcom/bedrockstreaming/component/layout/domain/core/model/Target${'$'}Layout;
            iget-object v2, v2, Lcom/bedrockstreaming/component/layout/domain/core/model/Target${'$'}Layout;->O:Ljava/lang/String;
            if-eqz v2, :probeEnd
            const-string v0, "MorpheSubLayoutType"
            invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            :probeEnd
            instance-of v0, p4, Lcom/bedrockstreaming/component/layout/domain/core/model/MediaItem;
            if-eqz v0, :itemAssetsAbsent
            move-object v2, p4
            check-cast v2, Lcom/bedrockstreaming/component/layout/domain/core/model/MediaItem;
            iget-object v2, v2, Lcom/bedrockstreaming/component/layout/domain/core/model/MediaItem;->d0:Lcom/bedrockstreaming/component/layout/domain/core/model/player/Media;
            if-eqz v2, :itemAssetsAbsent
            iget-object v2, v2, Lcom/bedrockstreaming/component/layout/domain/core/model/player/Media;->P:Ljava/util/List;
            if-eqz v2, :itemAssetsAbsent
            invoke-interface {v2}, Ljava/util/List;->size()I
            move-result v2
            invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
            move-result-object v2
            goto :itemAssetsLog
            :itemAssetsAbsent
            const-string v2, "no supplied media/assets"
            :itemAssetsLog
            const-string v0, "MorpheItemAssets"
            invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            nop
        """.trimIndent())
        exact("Lcom/bedrockstreaming/component/navigation/domain/ReplayDestination;",
            "<init>(Lcom/bedrockstreaming/component/layout/domain/core/model/Target${'$'}Layout;)V", 3, 6)
            .addInstructions(0, """
                const-string v0, "MorpheSubReplay"
                invoke-static {v0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            """.trimIndent())
        exact("Lcom/bedrockstreaming/component/layout/presentation/ConvertLayoutToNavigationRequestUseCase;",
            "a(LR7/g;Lg8/g;Lcom/bedrockstreaming/component/layout/presentation/configuration/LayoutConfig;Ljava/lang/String;)Lcom/bedrockstreaming/component/navigation/presentation/NavigationRequest${'$'}DestinationRequest;", 23, 145)
            .addInstructions(70, """
                const-string v4, "MorpheLayoutBoundary"
                const-string v5, "returned entity frontspace/offers"
                invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            """.trimIndent())
        exact("Lcom/bedrockstreaming/shared/tv/feature/home/HomeActivity;",
            "l(Lcom/bedrockstreaming/shared/tv/feature/home/HomeActivity;Lcom/bedrockstreaming/component/navigation/domain/usecase/a;)V", 8, 156)
            .addInstructions(0, """
                instance-of v0, p1, Lcom/bedrockstreaming/component/navigation/domain/usecase/a${'$'}a;
                if-eqz v0, :destinationProbeEnd
                move-object v0, p1
                check-cast v0, Lcom/bedrockstreaming/component/navigation/domain/usecase/a${'$'}a;
                iget-object v0, v0, Lcom/bedrockstreaming/component/navigation/domain/usecase/a${'$'}a;->a:Lcom/bedrockstreaming/component/navigation/domain/Destination;
                invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                move-result-object v0
                invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;
                move-result-object v0
                const-string v1, "MorpheSubDestination"
                invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                :destinationProbeEnd
                nop
            """.trimIndent())
        exact("Lcom/bedrockstreaming/feature/player/domain/mediaplayer/usecase/CreateMediaContentUseCase;",
            "a(LZe/c;Lmf/d;LR7/g;Lcom/bedrockstreaming/component/layout/domain/core/model/MediaItem;Ljava/lang/String;Ljava/lang/String;)Lof/a;", 27, 426)
            .addInstructions(0, """
                const-string v0, "MorpheMediaAssets"
                invoke-static {v0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            """.trimIndent())
        exact("Lcom/bedrockstreaming/plugin/exoplayer/drm/WidevineDrmTodayMediaDrmCallback;",
            "b(Ljava/util/UUID;Lr3/u;)[B", 6, 41)
            .addInstructions(0, """
                const-string v0, "MorpheLicence"
                invoke-static {v0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            """.trimIndent())
        exact("Lcom/bedrockstreaming/feature/player/data/drm/remote/DrmServer;",
            "a(Lcom/bedrockstreaming/component/layout/domain/core/model/player/DrmConfig;ZLbv/c;)Ljava/lang/Object;", 13, 87)
            .addInstructions(0, """
                const-string v0, "MorpheToken"
                invoke-static {v0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            """.trimIndent())
        // Observe already parsed layout, block and modal bodies and provenance only.
        // Never consume a body, print a URL/header or expose capacity/auth tokens.
        exact("Lcom/bedrockstreaming/component/layout/data/core/remote/LayoutRemoteDataSource;",
            "f(Lcom/bedrockstreaming/component/layout/data/core/remote/LayoutRemoteDataSource;LHw/U;)Ljava/lang/Object;", 6, 46)
            // Patcher 2.0.1 rebases internal labels only through this API.
            .addInstructionsWithLabels(6, """
                instance-of v1, p0, LG7/Z;
                if-nez v1, :httpKnownRoot
                instance-of v1, p0, LG7/b0;
                if-nez v1, :httpKnownRoot
                instance-of v1, p0, LG7/n0;
                if-eqz v1, :httpProbeDone
                :httpKnownRoot
                new-instance v1, Ljava/lang/StringBuilder;
                invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
                const-string v2, "status="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                iget v2, v0, Lokhttp3/r;->Q:I
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
                const-string v2, " network="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                iget-object v2, v0, Lokhttp3/r;->U:Lokhttp3/r;
                if-eqz v2, :probeNoNetwork
                const/4 v2, 0x1
                goto :probeNetworkValue
                :probeNoNetwork
                const/4 v2, 0x0
                :probeNetworkValue
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
                const-string v2, " cache="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                iget-object v2, v0, Lokhttp3/r;->V:Lokhttp3/r;
                if-eqz v2, :probeNoCache
                const/4 v2, 0x1
                goto :probeCacheValue
                :probeNoCache
                const/4 v2, 0x0
                :probeCacheValue
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
                const-string v2, " root="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                move-result-object v2
                invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;
                move-result-object v2
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                instance-of v2, p0, LG7/Z;
                if-eqz v2, :httpSummaryDone
                move-object v3, p0
                check-cast v3, LG7/Z;
                iget-object v3, v3, LG7/Z;->b:LG7/A;
                if-eqz v3, :httpSummaryDone
                const-string v2, " entityType="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                iget-object v2, v3, LG7/A;->c:Ljava/lang/String;
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                const-string v2, " entityIdIsOffers="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                iget-object v2, v3, LG7/A;->a:Ljava/lang/String;
                const-string v3, "offers"
                invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v2
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
                :httpSummaryDone
                invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v1
                const-string v2, "MorpheLayoutHTTP"
                invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                instance-of v1, p0, LG7/Z;
                if-eqz v1, :assetNonLayoutRoot
                move-object v0, p0
                check-cast v0, LG7/Z;
                iget-object v0, v0, LG7/Z;->a:Ljava/util/List;
                goto :assetRootReady
                :assetNonLayoutRoot
                instance-of v1, p0, LG7/n0;
                if-eqz v1, :assetSingleBlockRoot
                move-object v0, p0
                check-cast v0, LG7/n0;
                iget-object v0, v0, LG7/n0;->b:Ljava/util/List;
                goto :assetRootReady
                :assetSingleBlockRoot
                invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;
                move-result-object v0
                :assetRootReady
                if-eqz v0, :httpProbeDone
                invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v0
                :assetBlockLoop
                invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
                move-result v2
                if-eqz v2, :httpProbeDone
                invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v1
                instance-of v2, v1, LG7/b0;
                if-eqz v2, :assetBlockLoop
                check-cast v1, LG7/b0;
                iget-object v2, v1, LG7/b0;->b:Ljava/lang/String;
                if-eqz v2, :blockIdProbeDone
                const-string v3, "[A-Za-z0-9_.:-]{1,160}"
                invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v3
                if-eqz v3, :blockIdProbeDone
                const-string v3, "MorpheBlockId"
                invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                :blockIdProbeDone
                iget-object v1, v1, LG7/b0;->d:LG7/d0;
                if-eqz v1, :assetBlockLoop
                iget-object v1, v1, LG7/d0;->d:Ljava/util/List;
                if-eqz v1, :assetBlockLoop
                invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v1
                :assetItemLoop
                invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
                move-result v2
                if-eqz v2, :assetBlockLoop
                invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v2
                instance-of v3, v2, LG7/x0;
                if-eqz v3, :assetItemLoop
                check-cast v2, LG7/x0;
                iget-object v3, v2, LG7/x0;->d:Ljava/lang/String;
                const-string p1, "MorpheDTOItemId"
                invoke-static {p1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                iget-object v2, v2, LG7/x0;->q:LJ7/u;
                if-eqz v2, :assetItemEmpty
                iget-object v2, v2, LJ7/u;->c:Ljava/util/List;
                if-eqz v2, :assetItemEmpty
                invoke-interface {v2}, Ljava/util/List;->size()I
                move-result v2
                invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
                move-result-object v2
                goto/16 :assetItemLog
                :assetItemEmpty
                const-string v2, "0"
                :assetItemLog
                const-string v3, "MorpheDTOAssetCount"
                invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                goto/16 :assetItemLoop
                :httpProbeDone
                nop
            """.trimIndent())
        // Episode coordinates only; omit credentials, capacity tokens and URLs.
        exact("LK7/l;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 26, 246)
            .addInstructionsWithLabels(0, """
                move-object/from16 v0, p0
                iget v1, v0, LK7/l;->N:I
                if-nez v1, :requestProbeDone
                new-instance v1, Ljava/lang/StringBuilder;
                invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
                const-string v2, "section="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                iget-object v2, v0, LK7/l;->P:Ljava/lang/String;
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                const-string v2, " entityType="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                iget-object v2, v0, LK7/l;->Q:Ljava/lang/String;
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                const-string v2, " entityId="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                iget-object v2, v0, LK7/l;->R:Ljava/lang/String;
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v1
                const-string v2, "MorpheLayoutRequest"
                invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                :requestProbeDone
                nop
            """.trimIndent())
        action.addInstructions(113, """
            const-string v6, "MorpheSubAction"
            invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
            move-result-object v7
            invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;
            move-result-object v7
            invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
        """.trimIndent())
    }
}
