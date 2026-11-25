package dev.materialtidal.patches.tidal.layout.playlist

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.materialtidal.patches.shared.COMPATIBILITY_TIDAL
import dev.materialtidal.patches.shared.EXPRESSIVE_PLAYLIST_BRIDGE_CLASS
import dev.materialtidal.patches.shared.EXTENSION_PATH
import dev.materialtidal.patches.shared.MATERIAL_YOU_CONFIG_CLASS
import dev.materialtidal.patches.tidal.theme.materialyou.materialYouThemePatch

private val PLAYLIST_ACCENT_CHOICES = mapOf(
    "Cover + Monet (Recommended)" to "adaptive",
    "System Monet" to "monet",
)

private fun accentChoiceToCode(choice: String?): Int = when (choice) {
    "adaptive" -> 0
    "monet" -> 1
    else -> throw PatchException("Invalid playlistAccentMode option value: $choice")
}

private fun invokeStaticSingleRegVoid(reg: Int, methodSig: String): String =
    if (reg <= 15) {
        "invoke-static { v$reg }, $methodSig"
    } else {
        "invoke-static/range { v$reg .. v$reg }, $methodSig"
    }

/**
 * Safely saves {@code this} into an extra register allocated via {@link addFreeRegisters(1)}
 * at entry and invokes {@code bridgeMethodSig} right before every {@code return-void}.
 */
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
        cloned.addInstructions(
            retIdx + 1,
            "return-void",
        )
    }
}

@Suppress("unused")
val expressivePlaylistPatch = patch(
    name = "M3 playlist screen",
    description = "Redesigns Playlist pages with a full-bleed fading hero cover, cover-adaptive or Monet colors, pill Play/Shuffle controls, compact expressive action buttons (or full hide), scroll-morphing toolbar, and polished track rows.",
    default = true,
) {
    dependsOn(materialYouThemePatch)

    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith(EXTENSION_PATH)

    val playlistAccentModeOption by stringOption(
        key = "playlistAccentMode",
        default = "adaptive",
        values = PLAYLIST_ACCENT_CHOICES,
        title = "Playlist accent palette",
        description = "Extract accent colors dynamically from each playlist cover or always follow your system Monet wallpaper (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val playlistHeroCoverFadeOption by booleanOption(
        key = "playlistHeroCoverFade",
        default = true,
        title = "Full-bleed fading hero cover",
        description = "Display playlist artwork edge-to-edge at the top with a smooth downward fade into the background (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val playlistTrackRowPolishOption by booleanOption(
        key = "playlistTrackRowPolish",
        default = true,
        title = "Expressive track rows",
        description = "Round track artwork corners and add pill touch ripples while keeping TIDAL's active-track indicator (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val hidePlaylistActionButtonsOption by booleanOption(
        key = "hidePlaylistActionButtons",
        default = false,
        title = "Hide playlist action buttons",
        description = "Hide the secondary playlist action bar (Favorite, Edit, Download, Privacy, Share; also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    execute {
        // 1. Configure MaterialYouConfig playlist options.
        val configClass = mutableClassDefBy(MATERIAL_YOU_CONFIG_CLASS)
        configClass.methods.single { it.name == "isExpressivePlaylistPatchInstalled" }.returnEarly(true)
        configClass.methods.single { it.name == "isExpressivePlaylistEnabled" }.returnEarly(true)
        configClass.methods.single { it.name == "defaultPlaylistAccentMode" }
            .returnEarly(accentChoiceToCode(playlistAccentModeOption))
        configClass.methods.single { it.name == "defaultPlaylistHeroCoverFadeEnabled" }
            .returnEarly(playlistHeroCoverFadeOption ?: true)
        configClass.methods.single { it.name == "defaultPlaylistTrackRowPolishEnabled" }
            .returnEarly(playlistTrackRowPolishOption ?: true)
        configClass.methods.single { it.name == "defaultHidePlaylistActionButtonsEnabled" }
            .returnEarly(hidePlaylistActionButtonsOption ?: false)

        // 2. Dynamically resolve PlaylistFragment's view-binding field (Le6e;) and CoordinatorLayout field.
        val viewCreatedMatch = PlaylistFragmentOnViewCreatedFingerprint.matchSingle()
        val fragmentClass = viewCreatedMatch.classDef
        val coordType = "Landroidx/coordinatorlayout/widget/CoordinatorLayout;"
        var resolvedBindingField: com.android.tools.smali.dexlib2.iface.Field? = null
        var resolvedCoordField: com.android.tools.smali.dexlib2.iface.Field? = null
        for (field in fragmentClass.fields) {
            if (!field.type.startsWith("L") || field.type.startsWith("Ljava/") || field.type.startsWith("Lcom/aspiro/")) {
                continue
            }
            val candidateClass = mutableClassDefBy(field.type)
            val cField = candidateClass.fields.firstOrNull { it.type == coordType }
            if (cField != null) {
                resolvedBindingField = field
                resolvedCoordField = cField
                break
            }
        }
        val bindingField = resolvedBindingField
            ?: throw PatchException("Could not resolve PlaylistFragment view-binding field")
        val coordField = resolvedCoordField!!
        val bindingClass = mutableClassDefBy(bindingField.type)

        // 3. PlaylistFragment.onViewCreated -> notify bridge with (fragment, coordinatorLayout).
        viewCreatedMatch.method.let { m ->
            val p0 = m.p0Register
            if (p0 < 2) {
                throw PatchException("Unexpected p0=$p0 in PlaylistFragment.onViewCreated")
            }
            val retIndices = m.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .sortedDescending()
            if (retIndices.isEmpty()) {
                throw PatchException("No return-void found in PlaylistFragment.onViewCreated")
            }
            for (retIdx in retIndices) {
                m.addInstructionsWithLabels(
                    retIdx,
                    """
                        iget-object v0, v$p0, ${fragmentClass.type}->${bindingField.name}:${bindingField.type}
                        if-eqz v0, :mt_skip_playlist_init
                        iget-object v1, v0, ${bindingClass.type}->${coordField.name}:${coordField.type}
                        invoke-static { v$p0, v1 }, $EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->onPlaylistViewCreated(Ljava/lang/Object;Landroid/view/View;)V
                        :mt_skip_playlist_init
                        nop
                    """.trimIndent(),
                )
            }
        }

        // 4. PlaylistFragment.onDestroyView -> release controller cleanly.
        PlaylistFragmentOnDestroyViewFingerprint.matchSingle().method.let { m ->
            val p0 = m.p0Register
            m.addInstructions(
                0,
                invokeStaticSingleRegVoid(
                    p0,
                    "$EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->onPlaylistDestroyView(Ljava/lang/Object;)V",
                ),
            )
        }

        // 5. PlaylistFragment button state callbacks (U, N, M) -> resync Expressive pills & connected tiles.
        hookAfterInstanceVoid(
            PlaylistFragmentUpdateButtonsFingerprint.matchSingle().method,
            "$EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->onPlaylistButtonsUpdated(Ljava/lang/Object;)V",
        )
        hookAfterInstanceVoid(
            PlaylistFragmentDisablePlayButtonsFingerprint.matchSingle().method,
            "$EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->onPlaylistButtonsUpdated(Ljava/lang/Object;)V",
        )
        hookAfterInstanceVoid(
            PlaylistFragmentDisableEditButtonFingerprint.matchSingle().method,
            "$EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->onPlaylistButtonsUpdated(Ljava/lang/Object;)V",
        )

        // 6. PlaylistFragment header & menu callbacks (S, T, onCreateOptionsMenu).
        hookAfterInstanceVoid(
            PlaylistFragmentUpdateCreatorsFingerprint.matchSingle().method,
            "$EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->onPlaylistHeaderDataUpdated(Ljava/lang/Object;)V",
        )
        hookAfterInstanceVoid(
            PlaylistFragmentShowEmptyFingerprint.matchSingle().method,
            "$EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->onPlaylistHeaderDataUpdated(Ljava/lang/Object;)V",
        )
        hookAfterInstanceVoid(
            PlaylistFragmentOnCreateOptionsMenuFingerprint.matchSingle().method,
            "$EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->onPlaylistMenuCreated(Ljava/lang/Object;)V",
        )

        // 7. PlaylistPresenter.f (load artwork) -> skip legacy blurred artworkBackground decode in hero fade mode.
        PlaylistPresenterLoadArtworkFingerprint.matchSingle().method.let { m ->
            val len8Idx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.parameterTypes.size == 9 &&
                            it.parameterTypes[0] == "Landroid/widget/ImageView;" &&
                            it.returnType == "V"
                    } == true
            }
            if (len8Idx < 0) {
                throw PatchException("Could not find ImageLoader call in PlaylistPresenter.f")
            }
            val rangeInsn = m.getInstruction(len8Idx) as RegisterRangeInstruction
            val deadBoolReg = rangeInsn.startRegister + 3 // param 3: boolean hasSquareImage

            val fragIget = m.instructions.take(len8Idx).firstOrNull { insn ->
                insn.opcode == Opcode.IGET_OBJECT &&
                    ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.type == fragmentClass.type
            } ?: throw PatchException("Could not locate PlaylistFragment register in PlaylistPresenter.f")
            val fragReg = (fragIget as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerA

            if (fragReg > 15 || deadBoolReg > 15) {
                throw PatchException("Unexpected high registers in PlaylistPresenter.f (frag=$fragReg, bool=$deadBoolReg)")
            }

            m.addInstructionsWithLabels(
                len8Idx + 1,
                """
                    invoke-static { v$fragReg }, $EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->onPlaylistArtworkLoading(Ljava/lang/Object;)Z
                    move-result v$deadBoolReg
                    if-eqz v$deadBoolReg, :mt_load_legacy_bg
                    return-void
                    :mt_load_legacy_bg
                    nop
                """.trimIndent(),
            )
        }

        // 8. PlaylistPresenter.g (update header) -> notify bridge right after PlaylistFragment.U()V.
        PlaylistPresenterUpdateHeaderFingerprint.matchSingle().method.let { m ->
            val callIdx = m.instructions.indexOfLast { insn ->
                insn.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == fragmentClass.type &&
                            it.parameterTypes.isEmpty() &&
                            it.returnType == "V"
                    } == true
            }
            if (callIdx < 0) {
                throw PatchException("Could not find PlaylistFragment call in PlaylistPresenter.g")
            }
            val fragReg = (m.getInstruction(callIdx) as FiveRegisterInstruction).registerC
            val retIdx = callIdx + 1
            if (retIdx >= m.instructions.size || m.getInstruction(retIdx).opcode != Opcode.RETURN_VOID) {
                throw PatchException("Expected return-void right after PlaylistFragment call in PlaylistPresenter.g")
            }
            m.addInstructions(
                retIdx,
                invokeStaticSingleRegVoid(
                    fragReg,
                    "$EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->onPlaylistHeaderDataUpdated(Ljava/lang/Object;)V",
                ),
            )
        }

        // 9. Lnii;.onOffsetChanged -> parallax hero cover, solidify toolbar & reveal toolbar title.
        PlaylistOffsetChangedFingerprint.matchSingle().method.let { m ->
            val listenerClass = mutableClassDefBy("Lcom/aspiro/wamp/playlist/ui/fragment/PlaylistFragment\$a;")
            val fragField = listenerClass.fields.singleOrNull { it.type == fragmentClass.type }
                ?: throw PatchException("Missing PlaylistFragment field on ${listenerClass.type}")
            val titleField = listenerClass.fields.singleOrNull { it.type == "Landroid/view/View;" }
                ?: throw PatchException("Missing title View field on ${listenerClass.type}")

            val p0 = m.p0Register
            val p1 = p0 + 1
            val p2 = p0 + 2
            if (p0 < 3 || p2 > 15) {
                throw PatchException("Unexpected registers in onOffsetChanged (p0=$p0)")
            }

            m.addInstructionsWithLabels(
                0,
                """
                    instance-of v0, v$p0, ${listenerClass.type}
                    if-eqz v0, :mt_orig_offset
                    move-object v2, v$p0
                    check-cast v2, ${listenerClass.type}
                    iget-object v0, v2, ${listenerClass.type}->${fragField.name}:${fragField.type}
                    iget-object v1, v2, ${listenerClass.type}->${titleField.name}:${titleField.type}
                    invoke-static { v0, v1, v$p1, v$p2 }, $EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->onPlaylistOffsetChanged(Ljava/lang/Object;Landroid/view/View;Landroid/view/View;I)Z
                    move-result v0
                    if-eqz v0, :mt_orig_offset
                    return-void
                    :mt_orig_offset
                    nop
                """.trimIndent(),
            )
        }

        // 10. SecondaryActionButton & DownloadSecondaryActionButton state hooks.
        hookAfterInstanceVoid(
            SecondaryActionButtonRefreshFingerprint.matchSingle().method,
            "$EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->onSecondaryButtonStateUpdated(Landroid/view/View;)V",
        )

        DownloadSecondaryActionButtonPaintFingerprint.matchSingle().method.let { m ->
            val retIdx = m.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            if (retIdx < 0) {
                throw PatchException("Missing return-object in DownloadSecondaryActionButton circle Paint factory")
            }
            val paintReg = (m.getInstruction(retIdx) as OneRegisterInstruction).registerA
            m.addInstructions(
                retIdx,
                invokeStaticSingleRegVoid(
                    paintReg,
                    "$EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->tintDownloadCirclePaint(Landroid/graphics/Paint;)V",
                ),
            )
        }

        DownloadSecondaryActionButtonOnDrawFingerprint.matchSingle().method.let { m ->
            val drawIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroid/graphics/Canvas;" &&
                            it.name == "drawCircle"
                    } == true
            }
            if (drawIdx < 0) {
                throw PatchException("Missing Canvas.drawCircle in DownloadSecondaryActionButton.onDraw")
            }
            val paintReg = (m.getInstruction(drawIdx) as FiveRegisterInstruction).registerG
            m.addInstructions(
                drawIdx,
                invokeStaticSingleRegVoid(
                    paintReg,
                    "$EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->tintDownloadCirclePaint(Landroid/graphics/Paint;)V",
                ),
            )
        }

        hookAfterInstanceVoid(
            DownloadSecondaryActionButtonSetPercentageFingerprint.matchSingle().method,
            "$EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->onDownloadButtonStateUpdated(Landroid/view/View;)V",
        )
        hookAfterInstanceVoid(
            DownloadSecondaryActionButtonSetDownloadingFingerprint.matchSingle().method,
            "$EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->onDownloadButtonStateUpdated(Landroid/view/View;)V",
        )

        // 11. Playlist track rows (Lj9e;.c) -> rounded 12dp cover, 68dp row, M3 active pill & ripple.
        PlaylistTrackRowBindFingerprint.matchSingle().method.let { m ->
            val retIdx = m.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (retIdx < 0) {
                throw PatchException("Missing return-void in PlaylistTrackRowBindFingerprint method")
            }
            val vmReg = m.p0Register + 1
            val vhReg = m.p0Register + 2
            val regs = m.getFreeRegisterProvider(retIdx, 2, vmReg, vhReg)
            val rView = regs.getFreeRegister()
            val rActive = regs.getFreeRegister()
            val movVh = if (vhReg < 16) "move-object v$rView, v$vhReg" else "move-object/from16 v$rView, v$vhReg"
            val movVm = if (vmReg < 16) "move-object v$rActive, v$vmReg" else "move-object/from16 v$rActive, v$vmReg"

            m.addInstructions(
                retIdx,
                """
                    $movVh
                    $movVm
                    iget-object v$rView, v$rView, Landroidx/recyclerview/widget/RecyclerView${'$'}ViewHolder;->itemView:Landroid/view/View;
                    invoke-virtual { v$rActive }, Lcom/aspiro/wamp/playlist/viewmodel/item/TrackViewModel;->isActive()Z
                    move-result v$rActive
                    invoke-static { v$rView, v$rActive }, $EXPRESSIVE_PLAYLIST_BRIDGE_CLASS->stylePlaylistTrackRow(Landroid/view/View;Z)V
                """.trimIndent(),
            )
        }
    }
}
