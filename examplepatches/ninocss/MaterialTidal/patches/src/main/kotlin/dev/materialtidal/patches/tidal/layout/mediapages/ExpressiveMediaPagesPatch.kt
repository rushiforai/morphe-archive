package dev.materialtidal.patches.tidal.layout.mediapages

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.materialtidal.patches.shared.COMPATIBILITY_TIDAL
import dev.materialtidal.patches.shared.EXPRESSIVE_COLLECTION_BRIDGE_CLASS
import dev.materialtidal.patches.shared.EXPRESSIVE_FACTORY_CLASS
import dev.materialtidal.patches.shared.EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS
import dev.materialtidal.patches.shared.EXTENSION_PATH
import dev.materialtidal.patches.shared.MATERIAL_YOU_CONFIG_CLASS
import dev.materialtidal.patches.shared.MATERIAL_YOU_ENGINE_CLASS
import dev.materialtidal.patches.tidal.layout.playlist.expressivePlaylistPatch
import dev.materialtidal.patches.tidal.theme.materialyou.materialYouThemePatch

private fun invokeStaticSingleRegVoid(reg: Int, methodSig: String): String =
    if (reg <= 15) {
        "invoke-static { v$reg }, $methodSig"
    } else {
        "invoke-static/range { v$reg .. v$reg }, $methodSig"
    }

/** Saves {@code this} at entry and calls {@code bridgeMethodSig} before every {@code return-void}. */
private fun hookAfterInstanceVoid(
    method: MutableMethod,
    bridgeMethodSig: String,
) {
    val (cloned, added) = method.addFreeRegisters(1)
    val saveReg = cloned.implementation!!.registerCount - 1
    val thisAfterPrologue = cloned.p0Register - 1
    cloned.addInstructions(
        added,
        "move-object/from16 v$saveReg, v$thisAfterPrologue",
    )

    val retIndices = cloned.instructions.withIndex()
        .filter { it.index > added && it.value.opcode == Opcode.RETURN_VOID }
        .map { it.index }
        .sortedDescending()
    if (retIndices.isEmpty()) {
        throw PatchException("No return-void found in ${cloned.definingClass}.${cloned.name}")
    }
    for (retIdx in retIndices) {
        cloned.replaceInstruction(
            retIdx,
            "invoke-static/range { v$saveReg .. v$saveReg }, $bridgeMethodSig",
        )
        cloned.addInstructions(retIdx + 1, "return-void")
    }
}

/** Saves {@code (this, view)} at entry and calls {@code bridgeMethodSig} before the last {@code return-void}. */
private fun hookAfterViewCreatedLastReturn(
    method: MutableMethod,
    bridgeMethodSig: String,
) {
    val (cloned, added) = method.addFreeRegisters(2)
    val regCount = cloned.implementation!!.registerCount
    val saveP0 = regCount - 2
    val saveP1 = regCount - 1
    val p0AfterPrologue = cloned.p0Register - 2
    val p1AfterPrologue = cloned.p0Register - 1

    cloned.addInstructions(
        added,
        """
            move-object/from16 v$saveP0, v$p0AfterPrologue
            move-object/from16 v$saveP1, v$p1AfterPrologue
        """.trimIndent(),
    )

    val retIdx = cloned.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
    if (retIdx <= added) {
        throw PatchException("No return-void found after prologue in ${cloned.definingClass}.${cloned.name}")
    }
    cloned.replaceInstruction(
        retIdx,
        "invoke-static/range { v$saveP0 .. v$saveP1 }, $bridgeMethodSig",
    )
    cloned.addInstructions(retIdx + 1, "return-void")
}

/** Saves {@code view} (p1) at entry and calls {@code bridgeMethodSig} before the last {@code return-void}. */
private fun hookAfterViewCreatedViewOnlyLastReturn(
    method: MutableMethod,
    bridgeMethodSig: String,
) {
    val (cloned, added) = method.addFreeRegisters(1)
    val saveViewReg = cloned.implementation!!.registerCount - 1
    val viewAfterPrologue = cloned.p0Register // (cloned.p0Register - 1) + 1
    cloned.addInstructions(
        added,
        "move-object/from16 v$saveViewReg, v$viewAfterPrologue",
    )

    val retIdx = cloned.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
    if (retIdx <= added) {
        throw PatchException("No return-void found after prologue in ${cloned.definingClass}.${cloned.name}")
    }
    cloned.replaceInstruction(
        retIdx,
        "invoke-static/range { v$saveViewReg .. v$saveViewReg }, $bridgeMethodSig",
    )
    cloned.addInstructions(retIdx + 1, "return-void")
}

/** Saves {@code ViewHolder} (p2) at entry and calls {@code bridgeMethodSig} before the last {@code return-void}. */
private fun hookAfterDelegateBindLastReturn(
    method: MutableMethod,
    bridgeMethodSig: String,
) {
    val (cloned, added) = method.addFreeRegisters(1)
    val saveVhReg = cloned.implementation!!.registerCount - 1
    val vhAfterPrologue = cloned.p0Register + 1 // (cloned.p0Register - 1) + 2
    cloned.addInstructions(
        added,
        "move-object/from16 v$saveVhReg, v$vhAfterPrologue",
    )

    val retIdx = cloned.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
    if (retIdx <= added) {
        throw PatchException("No return-void found after prologue in ${cloned.definingClass}.${cloned.name}")
    }
    cloned.replaceInstruction(
        retIdx,
        "invoke-static/range { v$saveVhReg .. v$saveVhReg }, $bridgeMethodSig",
    )
    cloned.addInstructions(retIdx + 1, "return-void")
}

/** Saves {@code (this, float alpha)} at entry of {@code FadingToolbar.H(F)} and notifies bridge before return. */
private fun hookFadingToolbarAlpha(
    method: MutableMethod,
    bridgeMethodSig: String,
) {
    val (cloned, added) = method.addFreeRegisters(2)
    val regCount = cloned.implementation!!.registerCount
    val save0 = regCount - 2
    val save1 = regCount - 1
    val p0AfterPrologue = cloned.p0Register - 2
    val p1AfterPrologue = cloned.p0Register - 1

    cloned.addInstructions(
        added,
        """
            move-object/from16 v$save0, v$p0AfterPrologue
            move/from16 v$save1, v$p1AfterPrologue
        """.trimIndent(),
    )

    val retIndices = cloned.instructions.withIndex()
        .filter { it.index > added && it.value.opcode == Opcode.RETURN_VOID }
        .map { it.index }
        .sortedDescending()
    if (retIndices.isEmpty()) {
        throw PatchException("No return-void found in ${cloned.definingClass}.${cloned.name}")
    }
    for (retIdx in retIndices) {
        cloned.addInstructions(
            retIdx,
            "invoke-static/range { v$save0 .. v$save1 }, $bridgeMethodSig",
        )
    }
}

@Suppress("unused")
val expressiveMediaPagesPatch = patch(
    name = "M3 albums, artists & library",
    description = "Extends M3 design (fading hero artwork, adaptive Monet colors, pill controls, and a Bento-style Collection tile grid) to Albums, Artists, My Tracks, and your Library.",
    default = true,
) {
    dependsOn(materialYouThemePatch, expressivePlaylistPatch)

    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith(EXTENSION_PATH)

    val expressiveAlbumsOption by booleanOption(
        key = "expressiveAlbums",
        default = true,
        title = "Expressive Album pages",
        description = "Apply fading hero artwork, adaptive Monet colors, pill controls, and connected action bars to Album pages and My Albums (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val expressiveArtistsOption by booleanOption(
        key = "expressiveArtists",
        default = true,
        title = "Expressive Artist pages",
        description = "Apply fading portrait heroes, adaptive Monet colors, contributor chips, pill controls, and connected action bars to Artist pages and My Artists (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val expressiveMyTracksOption by booleanOption(
        key = "expressiveMyTracks",
        default = true,
        title = "Expressive My Tracks screen",
        description = "Apply Monet pill Play/Shuffle controls, a tonal Offline Download card, and polished track rows to My Tracks (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val expressiveCollectionOption by booleanOption(
        key = "expressiveCollection",
        default = true,
        title = "Expressive Collection tile grid",
        description = "Redesigns the Library collection menu into a Bento-style tile grid with circular tonal top-bar buttons (also toggleable in Settings → MaterialTidal).",
        required = true,
    )

    execute {
        // 1. Wire MaterialYouConfig options.
        val configClass = mutableClassDefBy(MATERIAL_YOU_CONFIG_CLASS)
        configClass.methods.single { it.name == "isExpressiveMediaPagesPatchInstalled" }
            .returnEarly(true)
        configClass.methods.single { it.name == "defaultExpressiveAlbumsEnabled" }
            .returnEarly(expressiveAlbumsOption ?: true)
        configClass.methods.single { it.name == "defaultExpressiveArtistsEnabled" }
            .returnEarly(expressiveArtistsOption ?: true)
        configClass.methods.single { it.name == "defaultExpressiveMyTracksEnabled" }
            .returnEarly(expressiveMyTracksOption ?: true)
        configClass.methods.single { it.name == "defaultExpressiveCollectionEnabled" }
            .returnEarly(expressiveCollectionOption ?: true)

        // 2. DynamicPage base Fragment lifecycle (Albums, Artists, Contributors, Mixes).
        hookAfterViewCreatedLastReturn(
            DynamicPageOnViewCreatedFingerprint.matchSingle().method,
            "$EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS->onDynamicPageViewCreated(Ljava/lang/Object;Landroid/view/View;)V",
        )
        DynamicPageOnDestroyViewFingerprint.matchSingle().method.let { m ->
            m.addInstructions(
                0,
                invokeStaticSingleRegVoid(
                    m.p0Register,
                    "$EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS->onDynamicPageDestroyView(Ljava/lang/Object;)V",
                ),
            )
        }

        // 3. FadingToolbar transparent-toolbar morphing hooks.
        hookAfterInstanceVoid(
            FadingToolbarInitFingerprint.matchSingle().method,
            "$EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS->onFadingToolbarInit(Landroid/view/View;)V",
        )
        hookFadingToolbarAlpha(
            FadingToolbarSetAlphaFingerprint.matchSingle().method,
            "$EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS->onFadingToolbarAlphaUpdated(Landroid/view/View;F)V",
        )

        // 4. Album & Artist header adapter delegate create/bind hooks.
        hookAfterDelegateBindLastReturn(
            AlbumHeaderDelegateBindFingerprint.matchSingle().method,
            "$EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS->onAlbumHeaderBound(Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;)V",
        )
        val artistBindMatch = ArtistHeaderDelegateBindFingerprint.matchSingle()
        val artistDelegateClass = mutableClassDefBy(artistBindMatch.classDef.type)
        val artistCreateMethod = artistDelegateClass.methods.single {
            it.parameterTypes == listOf("Landroid/view/View;") &&
                it.returnType == "Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;"
        }
        val artistRetIdx = artistCreateMethod.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        if (artistRetIdx < 0) {
            throw PatchException("No return-object found in ${artistCreateMethod.definingClass}.${artistCreateMethod.name}")
        }
        val artistRetReg = (artistCreateMethod.getInstruction(artistRetIdx) as OneRegisterInstruction).registerA
        artistCreateMethod.replaceInstruction(
            artistRetIdx,
            invokeStaticSingleRegVoid(
                artistRetReg,
                "$EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS->onArtistHeaderCreated(Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;)V",
            ),
        )
        artistCreateMethod.addInstructions(artistRetIdx + 1, "return-object v$artistRetReg")

        hookAfterDelegateBindLastReturn(
            artistBindMatch.method,
            "$EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS->onArtistHeaderBound(Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;)V",
        )

        // 5. My Tracks (FavoriteTracksFragment) hooks.
        hookAfterViewCreatedLastReturn(
            FavoriteTracksOnViewCreatedFingerprint.matchSingle().method,
            "$EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS->onMyTracksViewCreated(Ljava/lang/Object;Landroid/view/View;)V",
        )
        FavoriteTracksOnDestroyViewFingerprint.matchSingle().method.let { m ->
            m.addInstructions(
                0,
                invokeStaticSingleRegVoid(
                    m.p0Register,
                    "$EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS->onMyTracksDestroyView(Ljava/lang/Object;)V",
                ),
            )
        }
        hookAfterInstanceVoid(
            FavoriteTracksOnCreateOptionsMenuFingerprint.matchSingle().method,
            "$EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS->onMyTracksMenuUpdated(Ljava/lang/Object;)V",
        )
        hookAfterInstanceVoid(
            FavoriteTracksUpdateMenuVisibilityFingerprint.matchSingle().method,
            "$EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS->onMyTracksMenuUpdated(Ljava/lang/Object;)V",
        )
        hookAfterInstanceVoid(
            FavoriteTracksShowHeaderFingerprint.matchSingle().method,
            "$EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS->onMyTracksStateUpdated(Ljava/lang/Object;)V",
        )
        hookAfterInstanceVoid(
            FavoriteTracksSetOfflineCheckedFingerprint.matchSingle().method,
            "$EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS->onMyTracksStateUpdated(Ljava/lang/Object;)V",
        )

        // 6. My Albums & My Artists collection screens.
        hookAfterViewCreatedViewOnlyLastReturn(
            MyAlbumsViewOnViewCreatedFingerprint.matchSingle().method,
            "$EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS->onMyAlbumsViewCreated(Landroid/view/View;)V",
        )
        hookAfterViewCreatedViewOnlyLastReturn(
            MyArtistsViewOnViewCreatedFingerprint.matchSingle().method,
            "$EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS->onMyArtistsViewCreated(Landroid/view/View;)V",
        )

        // 7. Compose Profile / Artist Page v2 hero cover fade, Monet action buttons, Light Mode theme & tabs.
        patchComposeProfileHeaderView(ProfileHeaderViewFingerprint.matchSingle().method)
        patchComposeProfileCircularActions(ProfileCircularActionFingerprint.matchSingle().method)
        patchComposeProfileSecondaryAction(ProfileSecondaryActionFingerprint.matchSingle().method)
        patchComposeProfilePageTheme(ProfilePageThemeLambdaFingerprint.matchSingle().method)
        patchComposeProfileScreenContent(ProfileScreenContentFingerprint.matchSingle().method)
        patchComposeProfileTopBar(ProfileTopBarFingerprint.matchSingle().method)
        patchComposeProfileTabsIndicator(ProfileTabsRowLambdaFingerprint.matchSingle().method)

        // 8. Collection Screen Expressive Bento Tile Grid & Circular Top-Bar Action Pills.
        val collectionItemsMethod = MyCollectionItemsFingerprint.matchSingle().method
        val function1Type = collectionItemsMethod.parameterTypes[1].toString()
        if (!function1Type.startsWith("L")) {
            throw PatchException("Unexpected eventConsumer type $function1Type in ${collectionItemsMethod.definingClass}.${collectionItemsMethod.name}")
        }
        val factoryClass = mutableClassDefBy(EXPRESSIVE_FACTORY_CLASS)
        if (!factoryClass.interfaces.contains(function1Type)) {
            factoryClass.interfaces.add(function1Type)
        }

        val collectionBridgeClass = mutableClassDefBy(EXPRESSIVE_COLLECTION_BRIDGE_CLASS)
        replaceCollectionBridgeMethod(
            collectionBridgeClass,
            "nativeMountCollectionAndroidView",
            registerCount = 10,
            """
                check-cast p0, $function1Type
                check-cast p1, $function1Type
                check-cast p2, Landroidx/compose/runtime/Composer;
                sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier${'$'}Companion;
                const/4 v1, 0x0
                const/4 v2, 0x1
                const/4 v3, 0x0
                invoke-static { v0, v1, v2, v3 }, Landroidx/compose/foundation/layout/SizeKt;->fillMaxWidth${'$'}default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;
                move-result-object v1
                move-object v0, p0
                move-object v2, p1
                move-object v3, p2
                const/4 v4, 0x0
                const/4 v5, 0x0
                invoke-static/range { v0 .. v5 }, Landroidx/compose/ui/viewinterop/AndroidView_androidKt;->AndroidView(${function1Type}Landroidx/compose/ui/Modifier;${function1Type}Landroidx/compose/runtime/Composer;II)V
                return-void
            """,
        )

        replaceCollectionBridgeMethod(
            collectionBridgeClass,
            "nativeDispatchCollectionEvent",
            registerCount = 6,
            """
                check-cast p0, $function1Type
                const/4 v1, 0x0
                if-ne p1, v1, :c1
                sget-object v0, Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}j;->a:Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}j;
                goto :dispatch
                :c1
                const/4 v1, 0x1
                if-ne p1, v1, :c2
                sget-object v0, Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}s;->a:Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}s;
                goto :dispatch
                :c2
                const/4 v1, 0x2
                if-ne p1, v1, :c3
                sget-object v0, Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}b;->a:Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}b;
                goto :dispatch
                :c3
                const/4 v1, 0x3
                if-ne p1, v1, :c4
                sget-object v0, Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}c;->a:Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}c;
                goto :dispatch
                :c4
                const/4 v1, 0x4
                if-ne p1, v1, :c5
                sget-object v0, Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}g;->a:Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}g;
                goto :dispatch
                :c5
                const/4 v1, 0x5
                if-ne p1, v1, :c6
                sget-object v0, Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}u;->a:Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}u;
                goto :dispatch
                :c6
                const/4 v1, 0x6
                if-ne p1, v1, :c7
                sget-object v0, Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}l;->a:Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}l;
                goto :dispatch
                :c7
                const/4 v1, 0x7
                if-ne p1, v1, :c8
                sget-object v0, Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}q;->a:Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}q;
                goto :dispatch
                :c8
                const/16 v1, 0x8
                if-ne p1, v1, :c9
                sget-object v0, Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}d;->a:Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}d;
                goto :dispatch
                :c9
                const/16 v1, 0x9
                if-ne p1, v1, :done
                sget-object v0, Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}h;->a:Lcom/aspiro/wamp/mycollectionscreen/presentation/c${'$'}h;
                :dispatch
                invoke-interface { p0, v0 }, $function1Type->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                :done
                return-void
            """,
        )

        collectionItemsMethod.let { m ->
            if (m.p0Register < 1 || m.parameterTypes.size != 7) {
                throw PatchException(
                    "Unexpected MyCollectionItems signature/p0=${m.p0Register} params=${m.parameterTypes.size} in ${m.definingClass}.${m.name}"
                )
            }
            val p0 = m.p0Register
            val p6 = p0 + 6
            m.addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $MATERIAL_YOU_CONFIG_CLASS->isExpressiveCollectionEnabled()Z
                    move-result v0
                    if-eqz v0, :mt_legacy_collection_items
                    invoke-static/range { v$p0 .. v$p6 }, $EXPRESSIVE_COLLECTION_BRIDGE_CLASS->renderCollectionItems(Ljava/lang/Object;Ljava/lang/Object;ZZZLjava/lang/Object;I)V
                    return-void
                    :mt_legacy_collection_items
                    nop
                """,
            )
        }

        patchCollectionAppBarIcon(MyCollectionAppBarIconFingerprint.matchSingle().method)
    }
}

private fun patchComposeProfileHeaderView(method: MutableMethod) {
    val insns = method.instructions.toList()
    val vgIdx = insns.indexOfFirst { insn ->
        insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == "Landroidx/compose/ui/graphics/Brush\$Companion;" &&
                    it.name.startsWith("verticalGradient")
            } == true
    }
    if (vgIdx < 0) {
        throw PatchException("Missing Brush.Companion.verticalGradient in ${method.definingClass}.${method.name}")
    }
    val listReg = (insns[vgIdx] as RegisterRangeInstruction).startRegister + 1
    val listMoveIdx = (vgIdx - 1 downTo 1).firstOrNull { idx ->
        insns[idx].opcode == Opcode.MOVE_RESULT_OBJECT &&
            (insns[idx] as OneRegisterInstruction).registerA == listReg &&
            insns[idx - 1].opcode == Opcode.INVOKE_STATIC &&
            ((insns[idx - 1] as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.parameterTypes == listOf("[Ljava/lang/Object;") && it.returnType == "Ljava/util/List;"
            } == true
    } ?: throw PatchException("Missing listOf([Color]) producing v$listReg before verticalGradient in ${method.definingClass}.${method.name}")

    val arrIdx = (listMoveIdx - 2 downTo maxOf(0, listMoveIdx - 6)).firstOrNull { idx ->
        insns[idx].opcode == Opcode.FILLED_NEW_ARRAY
    } ?: throw PatchException("Missing filled-new-array before listOf in ${method.definingClass}.${method.name}")

    val arrInsn = insns[arrIdx] as FiveRegisterInstruction
    val regA = arrInsn.registerC
    val regB = arrInsn.registerD
    if (regA > 15 || regB > 14 || regA == regB || regA == regB + 1) {
        throw PatchException("Unexpected scratch registers regA=v$regA regB=v$regB in ${method.definingClass}.${method.name}")
    }

    val multiplyIdx = insns.indexOfFirst { insn ->
        insn.opcode == Opcode.INVOKE_VIRTUAL &&
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == "Landroidx/compose/ui/graphics/BlendMode\$Companion;" &&
                    it.name.startsWith("getMultiply") &&
                    it.returnType == "I"
            } == true
    }
    if (multiplyIdx < 0 || multiplyIdx <= listMoveIdx + 1) {
        throw PatchException("Missing BlendMode.Multiply after verticalGradient in ${method.definingClass}.${method.name}")
    }
    val moveMultIdx = multiplyIdx + 1
    if (insns[moveMultIdx].opcode != Opcode.MOVE_RESULT) {
        throw PatchException("Expected move-result after getMultiply in ${method.definingClass}.${method.name}")
    }
    val bmReg = (insns[moveMultIdx] as OneRegisterInstruction).registerA
    val deadBoolIdx = (moveMultIdx + 1 until minOf(insns.size, moveMultIdx + 16)).firstOrNull { idx ->
        insns[idx].opcode == Opcode.IGET_BOOLEAN
    } ?: throw PatchException("Missing IGET_BOOLEAN after BlendMode switch in ${method.definingClass}.${method.name}")
    val deadBoolReg = (insns[deadBoolIdx] as TwoRegisterInstruction).registerA
    if (bmReg > 15 || deadBoolReg > 15 || bmReg == deadBoolReg) {
        throw PatchException("Unexpected BlendMode registers bmReg=v$bmReg deadBoolReg=v$deadBoolReg in ${method.definingClass}.${method.name}")
    }

    // Apply edits in descending index order so earlier instruction indices stay valid.
    method.addInstructionsWithLabels(
        moveMultIdx + 1,
        """
            invoke-static {}, $MATERIAL_YOU_CONFIG_CLASS->isExpressiveArtistsEnabled()Z
            move-result v$deadBoolReg
            if-eqz v$deadBoolReg, :mt_keep_artist_multiply
            invoke-static {}, $MATERIAL_YOU_CONFIG_CLASS->isMaterialYouEnabled()Z
            move-result v$deadBoolReg
            if-eqz v$deadBoolReg, :mt_keep_artist_multiply
            sget-object v$bmReg, Landroidx/compose/ui/graphics/BlendMode;->Companion:Landroidx/compose/ui/graphics/BlendMode${'$'}Companion;
            invoke-virtual { v$bmReg }, Landroidx/compose/ui/graphics/BlendMode${'$'}Companion;->getSrcOver-0nO6VwU()I
            move-result v$bmReg
            :mt_keep_artist_multiply
            nop
        """,
    )

    val stopsSmali = buildString {
        appendLine("invoke-static {}, $MATERIAL_YOU_CONFIG_CLASS->isExpressiveArtistsEnabled()Z")
        appendLine("move-result v$regB")
        appendLine("if-eqz v$regB, :mt_skip_artist_fade")
        appendLine("invoke-static {}, $MATERIAL_YOU_CONFIG_CLASS->isMaterialYouEnabled()Z")
        appendLine("move-result v$regB")
        appendLine("if-eqz v$regB, :mt_skip_artist_fade")
        appendLine("new-instance v$regA, Ljava/util/ArrayList;")
        appendLine("const/4 v$regB, 0x6")
        appendLine("invoke-direct { v$regA, v$regB }, Ljava/util/ArrayList;-><init>(I)V")
        for (i in 0..5) {
            appendLine("const/4 v$regB, 0x$i")
            appendLine("invoke-static { v$regB }, $MATERIAL_YOU_ENGINE_CLASS->getArtistHeroFadeStopCompose(I)J")
            appendLine("move-result-wide v$regB")
            appendLine("invoke-static { v$regB, v${regB + 1} }, Landroidx/compose/ui/graphics/Color;->box-impl(J)Landroidx/compose/ui/graphics/Color;")
            appendLine("move-result-object v$regB")
            appendLine("invoke-virtual { v$regA, v$regB }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z")
        }
        appendLine("move-object/from16 v$listReg, v$regA")
        appendLine(":mt_skip_artist_fade")
        append("nop")
    }
    method.addInstructionsWithLabels(listMoveIdx + 1, stopsSmali)
}

private fun patchComposeProfileCircularActions(method: MutableMethod) {
    val insns = method.instructions.toList()
    val z0Reads = insns.withIndex().filter { (_, insn) ->
        insn.opcode == Opcode.IGET_WIDE &&
            ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                it.name == "z0" && it.type == "J"
            } == true
    }
    val v0Reads = insns.withIndex().filter { (_, insn) ->
        insn.opcode == Opcode.IGET_WIDE &&
            ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                it.name == "v0" && it.type == "J"
            } == true
    }
    val colorResMoves = insns.withIndex().filter { (idx, insn) ->
        idx > 0 && insn.opcode == Opcode.MOVE_RESULT_WIDE &&
            insns[idx - 1].opcode == Opcode.INVOKE_STATIC &&
            ((insns[idx - 1] as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == "Landroidx/compose/ui/res/ColorResources_androidKt;" &&
                    it.name == "colorResource" &&
                    it.returnType == "J"
            } == true
    }
    if (z0Reads.size != 2 || v0Reads.size != 1 || colorResMoves.size != 1) {
        throw PatchException(
            "Unexpected color reads in ${method.definingClass}.${method.name}: z0=${z0Reads.size}, v0=${v0Reads.size}, colorRes=${colorResMoves.size}"
        )
    }

    val edits = mutableListOf<Pair<Int, String>>()
    fun resolveWideCall(reg: Int, fnName: String): String =
        """
            invoke-static/range { v$reg .. v${reg + 1} }, $MATERIAL_YOU_ENGINE_CLASS->$fnName(J)J
            move-result-wide v$reg
        """.trimIndent()

    edits += (z0Reads[0].index + 1) to resolveWideCall(
        (z0Reads[0].value as TwoRegisterInstruction).registerA,
        "resolveArtistPrimaryActionBgCompose",
    )
    edits += (colorResMoves[0].index + 1) to resolveWideCall(
        (colorResMoves[0].value as OneRegisterInstruction).registerA,
        "resolveArtistSecondaryActionBgCompose",
    )
    edits += (v0Reads[0].index + 1) to resolveWideCall(
        (v0Reads[0].value as TwoRegisterInstruction).registerA,
        "resolveArtistPrimaryActionFgCompose",
    )
    edits += (z0Reads[1].index + 1) to resolveWideCall(
        (z0Reads[1].value as TwoRegisterInstruction).registerA,
        "resolveArtistSecondaryActionFgCompose",
    )

    for ((idx, smali) in edits.sortedByDescending { it.first }) {
        method.addInstructions(idx, smali)
    }
}

private fun patchComposeProfileScreenContent(method: MutableMethod) {
    val v0Read = method.instructions.withIndex().singleOrNull { (_, insn) ->
        insn.opcode == Opcode.IGET_WIDE &&
            ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                it.name == "v0" && it.type == "J"
            } == true
    } ?: throw PatchException("Expected single v0:J read in ${method.definingClass}.${method.name}")

    val reg = (v0Read.value as TwoRegisterInstruction).registerA
    method.addInstructions(
        v0Read.index + 1,
        """
            invoke-static/range { v$reg .. v${reg + 1} }, $MATERIAL_YOU_ENGINE_CLASS->resolveSurfaceBaseCompose(J)J
            move-result-wide v$reg
        """,
    )
}

private fun patchComposeProfileTopBar(method: MutableMethod) {
    val insns = method.instructions.toList()
    val copyIdx = insns.indexOfFirst { insn ->
        insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == "Landroidx/compose/ui/graphics/Color;" &&
                    it.name.startsWith("copy-") &&
                    it.returnType == "J"
            } == true
    }
    if (copyIdx < 0) {
        throw PatchException("Missing Color.copy in ${method.definingClass}.${method.name}")
    }
    val reg = (insns[copyIdx] as RegisterRangeInstruction).startRegister
    method.addInstructions(
        copyIdx,
        """
            invoke-static/range { v$reg .. v${reg + 1} }, $MATERIAL_YOU_ENGINE_CLASS->resolveSurfaceBaseCompose(J)J
            move-result-wide v$reg
        """,
    )
}

private fun patchComposeProfilePageTheme(method: MutableMethod) {
    val insns = method.instructions.toList()

    val marketCopyIdx = insns.indexOfFirst { insn ->
        insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == "Lcom/squareup/ui/market/core/theme/MarketTheme;" &&
                    it.returnType == "Lcom/squareup/ui/market/core/theme/MarketTheme;" &&
                    it.parameterTypes.size == 11
            } == true
    }
    if (marketCopyIdx < 0) {
        throw PatchException("Missing MarketTheme.copy in ${method.definingClass}.${method.name}")
    }
    val maskReg = (insns[marketCopyIdx] as RegisterRangeInstruction).startRegister + 9
    val maskIdx = (marketCopyIdx - 1 downTo maxOf(0, marketCopyIdx - 15)).firstOrNull { idx ->
        val insn = insns[idx]
        insn is NarrowLiteralInstruction &&
            insn is OneRegisterInstruction &&
            insn.registerA == maskReg &&
            insn.narrowLiteral == 0xbc
    } ?: throw PatchException(
        "Missing MarketTheme.copy default mask 0xbc in v$maskReg before idx=$marketCopyIdx in ${method.definingClass}.${method.name}",
    )

    val hpeReadIdx = (0 until insns.size - 1).firstOrNull { idx ->
        val first = insns[idx]
        val second = insns[idx + 1]
        if (first.opcode != Opcode.IGET_OBJECT || second.opcode != Opcode.IGET_OBJECT) {
            return@firstOrNull false
        }
        val ref1 = (first as ReferenceInstruction).reference as? FieldReference ?: return@firstOrNull false
        val ref2 = (second as ReferenceInstruction).reference as? FieldReference ?: return@firstOrNull false
        val two1 = first as TwoRegisterInstruction
        val two2 = second as TwoRegisterInstruction
        ref1.type == "Ljava/lang/Integer;" &&
            ref2.type == "Ljava/lang/Integer;" &&
            ref1.definingClass == ref2.definingClass &&
            ref1.name != ref2.name &&
            two1.registerB == two2.registerB
    } ?: throw PatchException("Missing ProfilePageColors Integer reads in ${method.definingClass}.${method.name}")

    val firstRead = insns[hpeReadIdx] as TwoRegisterInstruction
    val secondRead = insns[hpeReadIdx + 1] as TwoRegisterInstruction
    val bgReg = firstRead.registerA
    val fgReg = secondRead.registerA
    val hpeReg = firstRead.registerB
    val scratchReg = 7
    if (bgReg > 15 || fgReg > 15 || bgReg == scratchReg || fgReg == scratchReg || hpeReg == scratchReg) {
        throw PatchException(
            "Unexpected registers in ${method.definingClass}.${method.name}: bg=v$bgReg fg=v$fgReg hpe=v$hpeReg",
        )
    }

    // Apply edits in descending instruction-index order so earlier indices stay valid.
    // Set bit 0 (0xbc -> 0xbd) so MarketTheme.copy keeps lightThemeColors intact in Light Mode.
    method.replaceInstruction(maskIdx, "const/16 v$maskReg, 0xbd")

    method.addInstructionsWithLabels(
        hpeReadIdx + 2,
        """
            invoke-static {}, $MATERIAL_YOU_ENGINE_CLASS->isLightMode()Z
            move-result v$scratchReg
            if-eqz v$scratchReg, :mt_keep_profile_page_colors
            const/4 v$bgReg, 0x0
            const/4 v$fgReg, 0x0
            :mt_keep_profile_page_colors
            nop
        """,
    )
}

private fun patchComposeProfileSecondaryAction(method: MutableMethod) {
    val insns = method.instructions.toList()
    val colorMoveIdx = insns.withIndex().singleOrNull { (idx, insn) ->
        idx > 0 && insn.opcode == Opcode.MOVE_RESULT_WIDE &&
            insns[idx - 1].opcode == Opcode.INVOKE_STATIC &&
            ((insns[idx - 1] as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == "Landroidx/compose/ui/res/ColorResources_androidKt;" &&
                    it.name == "colorResource" &&
                    it.returnType == "J"
            } == true
    }?.index ?: throw PatchException("Expected single colorResource call in ${method.definingClass}.${method.name}")

    val reg = (insns[colorMoveIdx] as OneRegisterInstruction).registerA
    method.addInstructions(
        colorMoveIdx + 1,
        """
            invoke-static/range { v$reg .. v${reg + 1} }, $MATERIAL_YOU_ENGINE_CLASS->resolveArtistSecondaryActionTextCompose(J)J
            move-result-wide v$reg
        """,
    )
}

private fun patchComposeProfileTabsIndicator(method: MutableMethod) {
    val insns = method.instructions.toList()

    val hpeReadIdx = (0 until insns.size - 1).firstOrNull { idx ->
        val first = insns[idx]
        val second = insns[idx + 1]
        if (first.opcode != Opcode.IGET_OBJECT || second.opcode != Opcode.IGET_OBJECT) {
            return@firstOrNull false
        }
        val ref1 = (first as ReferenceInstruction).reference as? FieldReference ?: return@firstOrNull false
        val ref2 = (second as ReferenceInstruction).reference as? FieldReference ?: return@firstOrNull false
        val two1 = first as TwoRegisterInstruction
        val two2 = second as TwoRegisterInstruction
        ref1.type == "Ljava/lang/Integer;" &&
            ref2.type == "Ljava/lang/Integer;" &&
            ref1.definingClass == ref2.definingClass &&
            ref1.name != ref2.name &&
            two1.registerB == two2.registerB
    } ?: throw PatchException("Missing ProfilePageColors Integer reads in ${method.definingClass}.${method.name}")

    val firstRead = insns[hpeReadIdx] as TwoRegisterInstruction
    val secondRead = insns[hpeReadIdx + 1] as TwoRegisterInstruction
    val fgReg = firstRead.registerA
    val bgReg = secondRead.registerA
    val hpeReg = firstRead.registerB
    val scratchReg = 6
    if (fgReg > 15 || bgReg > 15 || fgReg == scratchReg || bgReg == scratchReg || hpeReg == scratchReg) {
        throw PatchException(
            "Unexpected tab color registers in ${method.definingClass}.${method.name}: fg=v$fgReg bg=v$bgReg hpe=v$hpeReg",
        )
    }

    val makeColorIdx = insns.withIndex().firstOrNull { (idx, insn) ->
        idx > 0 && insn.opcode == Opcode.INVOKE_STATIC &&
            insns[idx - 1].opcode == Opcode.CONST_HIGH16 &&
            (insns[idx - 1] as NarrowLiteralInstruction).narrowLiteral == 0x3f800000 &&
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.parameterTypes == listOf("F", "I") && it.returnType.startsWith("L")
            } == true
    }?.index ?: throw PatchException("Missing MarketColor factory call in ${method.definingClass}.${method.name}")

    val makeInsn = insns[makeColorIdx] as FiveRegisterInstruction
    val makeRef = (makeInsn as ReferenceInstruction).reference as MethodReference
    val marketColorType = makeRef.returnType
    val makeColorSig = "${makeRef.definingClass}->${makeRef.name}(FI)$marketColorType"
    val rA = makeInsn.registerC
    val rB = makeInsn.registerD

    val styleCopyIdx = insns.indexOfFirst { insn ->
        insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.returnType == it.definingClass && it.parameterTypes.contains(marketColorType)
            } == true
    }
    if (styleCopyIdx < 0 || styleCopyIdx <= makeColorIdx || styleCopyIdx <= hpeReadIdx + 1) {
        throw PatchException("Missing tab style copy call in ${method.definingClass}.${method.name}")
    }
    val copyRange = insns[styleCopyIdx] as RegisterRangeInstruction
    val copyRef = (copyRange as ReferenceInstruction).reference as MethodReference
    val indParamPos = copyRef.parameterTypes.indexOf(marketColorType)
    val indReg = copyRange.startRegister + indParamPos
    val copyEndReg = copyRange.startRegister + copyRange.registerCount
    if (rA > 15 || rB > 15 || rA == rB || rA in copyRange.startRegister until copyEndReg || rB in copyRange.startRegister until copyEndReg) {
        throw PatchException(
            "Register overlap in ${method.definingClass}.${method.name}: rA=v$rA rB=v$rB range=v${copyRange.startRegister}..v${copyEndReg - 1}",
        )
    }

    // Apply edits in descending instruction-index order so earlier indices remain valid.
    method.addInstructionsWithLabels(
        styleCopyIdx,
        """
            invoke-static {}, $MATERIAL_YOU_CONFIG_CLASS->isMaterialYouEnabled()Z
            move-result v$rA
            if-eqz v$rA, :mt_keep_tab_ind
            invoke-static {}, $MATERIAL_YOU_ENGINE_CLASS->getArtistTabOverflowFadeArgb()I
            move-result v$rB
            const/high16 v$rA, 0x3f800000
            invoke-static { v$rA, v$rB }, $makeColorSig
            move-result-object v$rA
            move-object/from16 v$indReg, v$rA
            :mt_keep_tab_ind
            nop
        """,
    )

    method.addInstructionsWithLabels(
        hpeReadIdx + 2,
        """
            invoke-static {}, $MATERIAL_YOU_ENGINE_CLASS->isLightMode()Z
            move-result v$scratchReg
            if-eqz v$scratchReg, :mt_keep_profile_tab_colors
            const/4 v$fgReg, 0x0
            const/4 v$bgReg, 0x0
            :mt_keep_profile_tab_colors
            nop
        """,
    )
}

private fun replaceCollectionBridgeMethod(
    bridgeClass: MutableClass,
    methodName: String,
    registerCount: Int,
    smali: String,
) {
    val oldMethod = bridgeClass.methods.singleOrNull { it.name == methodName }
        ?: throw PatchException("Bridge method not found: $EXPRESSIVE_COLLECTION_BRIDGE_CLASS->$methodName")

    val newMethod = ImmutableMethod(
        bridgeClass.type,
        oldMethod.name,
        oldMethod.parameters.map { ImmutableMethodParameter(it.type, it.annotations, it.name) },
        oldMethod.returnType,
        oldMethod.accessFlags,
        oldMethod.annotations,
        oldMethod.hiddenApiRestrictions,
        MutableMethodImplementation(registerCount),
    ).toMutable()

    newMethod.addInstructionsWithLabels(0, smali.trimIndent())

    bridgeClass.methods.remove(oldMethod)
    bridgeClass.methods.add(newMethod)
}

private fun patchCollectionAppBarIcon(method: MutableMethod) {
    val (cloned, _) = method.addFreeRegisters(2)
    val regCount = cloned.implementation!!.registerCount
    val saveModReg = regCount - 2
    val saveClickReg = regCount - 1

    val insns = cloned.instructions.toList()
    val clickIdx = insns.indexOfFirst { insn ->
        insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == "Landroidx/compose/foundation/ClickableKt;" &&
                    it.name.startsWith("clickable")
            } == true
    }
    if (clickIdx < 0 || clickIdx + 1 >= insns.size) {
        throw PatchException("Missing ClickableKt.clickable in ${cloned.definingClass}.${cloned.name}")
    }
    if (insns[clickIdx + 1].opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("Expected move-result-object after clickable in ${cloned.definingClass}.${cloned.name}")
    }
    val clickRange = insns[clickIdx] as RegisterRangeInstruction
    val modReg = clickRange.startRegister
    val clickEndReg = clickRange.startRegister + clickRange.registerCount
    val clickResReg = (insns[clickIdx + 1] as OneRegisterInstruction).registerA

    val sizeIdx = (clickIdx + 2 until insns.size).firstOrNull { idx ->
        insns[idx].opcode == Opcode.INVOKE_STATIC &&
            ((insns[idx] as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == "Landroidx/compose/foundation/layout/SizeKt;" &&
                    it.name == "size-3ABfNKs"
            } == true
    } ?: throw PatchException("Missing SizeKt.size-3ABfNKs after clickable in ${cloned.definingClass}.${cloned.name}")
    if (sizeIdx + 1 >= insns.size || insns[sizeIdx + 1].opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("Expected move-result-object after size-3ABfNKs in ${cloned.definingClass}.${cloned.name}")
    }
    val iconModReg = (insns[sizeIdx + 1] as OneRegisterInstruction).registerA

    for (r in 8..11) {
        if (r in modReg until clickEndReg || r == clickResReg) {
            throw PatchException(
                "Scratch register v$r overlaps clickable range v$modReg..v${clickEndReg - 1} or clickRes v$clickResReg in ${cloned.definingClass}.${cloned.name}"
            )
        }
    }

    // Apply in descending instruction-index order so earlier indices remain valid.
    cloned.addInstructionsWithLabels(
        sizeIdx + 2,
        """
            move-object/from16 v$modReg, v$saveModReg
            invoke-static {}, $MATERIAL_YOU_CONFIG_CLASS->isExpressiveCollectionEnabled()Z
            move-result v8
            if-eqz v8, :mt_keep_icon_mod
            invoke-static {}, $MATERIAL_YOU_CONFIG_CLASS->isMaterialYouEnabled()Z
            move-result v8
            if-eqz v8, :mt_keep_icon_mod
            move-object/from16 v8, v$saveClickReg
            const/high16 v10, 0x41100000
            invoke-static { v8, v10 }, Landroidx/compose/foundation/layout/PaddingKt;->padding-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;
            move-result-object v$iconModReg
            :mt_keep_icon_mod
            nop
        """,
    )

    cloned.addInstructions(
        clickIdx + 2,
        "move-object/from16 v$saveClickReg, v$clickResReg",
    )

    cloned.addInstructionsWithLabels(
        clickIdx,
        """
            move-object/from16 v$saveModReg, v$modReg
            invoke-static {}, $MATERIAL_YOU_CONFIG_CLASS->isExpressiveCollectionEnabled()Z
            move-result v8
            if-eqz v8, :mt_skip_wrap_appbar_icon
            invoke-static {}, $MATERIAL_YOU_CONFIG_CLASS->isMaterialYouEnabled()Z
            move-result v8
            if-eqz v8, :mt_skip_wrap_appbar_icon
            move-object/from16 v8, v$modReg
            const/high16 v9, 0x40800000
            const/4 v10, 0x0
            invoke-static { v8, v9, v10 }, Landroidx/compose/foundation/layout/PaddingKt;->padding-VpY3zN4(Landroidx/compose/ui/Modifier;FF)Landroidx/compose/ui/Modifier;
            move-result-object v8
            const/high16 v9, 0x42200000
            invoke-static { v8, v9 }, Landroidx/compose/foundation/layout/SizeKt;->size-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;
            move-result-object v8
            invoke-static {}, Landroidx/compose/foundation/shape/RoundedCornerShapeKt;->getCircleShape()Landroidx/compose/foundation/shape/RoundedCornerShape;
            move-result-object v11
            invoke-static { v8, v11 }, Landroidx/compose/ui/draw/ClipKt;->clip(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/graphics/Shape;)Landroidx/compose/ui/Modifier;
            move-result-object v8
            invoke-static {}, $MATERIAL_YOU_ENGINE_CLASS->getSurfaceContainerHighCompose()J
            move-result-wide v9
            invoke-static/range { v8 .. v11 }, Landroidx/compose/foundation/BackgroundKt;->background-bw27NRU(Landroidx/compose/ui/Modifier;JLandroidx/compose/ui/graphics/Shape;)Landroidx/compose/ui/Modifier;
            move-result-object v8
            move-object/from16 v$modReg, v8
            :mt_skip_wrap_appbar_icon
            nop
        """,
    )
}
