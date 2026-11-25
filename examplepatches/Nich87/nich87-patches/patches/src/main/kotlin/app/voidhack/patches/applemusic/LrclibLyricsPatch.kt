package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val CONTROLLER = "Lapp/voidhack/extension/applemusic/lyrics/LrclibController;"
private const val LYRICS_REFLECTION = "Lapp/voidhack/extension/applemusic/lyrics/LrclibReflection;"
private const val PLAYBACK_ITEM = "Lcom/apple/android/music/model/PlaybackItem;"
private const val SONG_INFO_PTR = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoPtr;"
private const val LYRICS_VM = "Lcom/apple/android/music/player/viewmodel/PlayerLyricsViewModel;"
private const val LYRICS_FRAGMENT = "Lcom/apple/android/music/player/fragment/PlayerLyricsViewFragment;"

private object AppleMusicApplicationCreate : Fingerprint(
    definingClass = "Lcom/apple/android/music/AppleMusicApplication;",
    name = "onCreate",
    parameters = emptyList(),
    returnType = "V",
)

private val lrclibLyricsResources = resourcePatch {
    execute {
        listOf("values", "values-ja").forEach { directory ->
            checkNotNull(
                LyricsAvailableCheck::class.java.getResourceAsStream(
                    "/applemusic/lyrics/$directory/voidhack_lrclib_lyrics.xml",
                ),
            ).use { input ->
                document(input).use { translations ->
                    document("res/$directory/strings.xml").use { destination ->
                        val entries = translations.getElementsByTagName("string")
                        for (index in 0 until entries.length) {
                            destination.documentElement.appendChild(
                                destination.importNode(entries.item(index), true),
                            )
                        }
                    }
                }
            }
        }
    }
}

private object LyricsAvailableCheck : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(PLAYBACK_ITEM),
    filters = listOf(
        methodCall(definingClass = PLAYBACK_ITEM, name = "hasLyrics", returnType = "Z"),
        methodCall(definingClass = PLAYBACK_ITEM, name = "hasCustomLyrics", returnType = "Z"),
    ),
    custom = { _, classDef -> classDef.type.startsWith("Lcom/apple/android/music/player/") },
)

private object PlayerLyricsLoad : Fingerprint(
    definingClass = LYRICS_VM,
    name = "loadLyrics",
    parameters = listOf(PLAYBACK_ITEM),
    returnType = "V",
)

private object PlayerLyricsLoadCoroutine : Fingerprint(
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("loadLyrics(): Cannot cache lyrics: currentPlaybackItem ("),
    ),
    custom = { _, classDef ->
        classDef.type.startsWith("Lcom/apple/android/music/player/viewmodel/PlayerLyricsViewModel\$")
    },
)

private object LyricsFragmentRender : Fingerprint(
    definingClass = LYRICS_FRAGMENT,
    parameters = listOf(SONG_INFO_PTR),
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = PLAYBACK_ITEM, name = "hasCustomLyrics", returnType = "Z"),
        methodCall(
            definingClass = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoNative;",
            name = "getAdamId",
            returnType = "J",
        ),
    ),
)

private object LyricsFragmentControlsAnimator : Fingerprint(
    definingClass = LYRICS_FRAGMENT,
    parameters = listOf("I"),
    returnType = "Landroid/animation/Animator;",
)

private object LyricsFragmentHideControls : Fingerprint(
    definingClass = LYRICS_FRAGMENT,
    parameters = listOf("I", "Z"),
    returnType = "V",
)

private object LyricsFragmentShowControls : Fingerprint(
    definingClass = LYRICS_FRAGMENT,
    parameters = listOf("I"),
    returnType = "V",
    filters = listOf(
        opcode(Opcode.INVOKE_SUPER),
        fieldAccess(type = "Lcom/apple/android/music/common/views/VocalAttenuationControl;"),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setVisibility",
            returnType = "V",
        ),
    ),
)

private object LyricsFragmentOfflineCheck : Fingerprint(
    definingClass = LYRICS_FRAGMENT,
    parameters = emptyList(),
    returnType = "Z",
    filters = listOf(
        methodCall(definingClass = PLAYBACK_ITEM, name = "hasOfflineLyrics", returnType = "Z"),
    ),
)

private object LyricsPronunciationAvailability : Fingerprint(
    definingClass = LYRICS_FRAGMENT,
    parameters = listOf(SONG_INFO_PTR),
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = "Ljava/lang/String;", name = "equalsIgnoreCase", returnType = "Z"),
        methodCall(
            definingClass = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoNative;",
            name = "setPronunciation",
            returnType = "Z",
        ),
    ),
)

private object LyricsScriptMatch : Fingerprint(
    definingClass = "Lcom/apple/android/music/playback/util/LocaleUtil;",
    name = "matchToSystemLyricsScript",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Lcom/apple/android/mediaservices/javanative/common/StringVector\$StringVectorNative;"),
    returnType = "Ljava/lang/String;",
)

@Suppress("unused")
val lrclibLyricsPatch = bytecodePatch(
    name = "LRCLIB lyrics",
    description = "Loads synced and unsynced local LRC files (per-song or auto-matched folder) and fetches lyrics from LRCLIB with per-song overrides, timing offsets, and a source indicator. Optionally generates pronunciation guides on-device.",
) {

    dependsOn(
        lrclibLyricsResources,
        lrclibRomanizationResources,
        appleMusicOfficialPronunciation,
        staticLyricsPronunciationPatch,
        lyricsLineEditPatch,
        karaokePronunciationPatch,
        lyricsGuideSourceMenuPatch,
        lyricsScrollSyncPatch,
    )
    compatibleWith(appleMusicCompatibility)
    extendWith("extensions/extension.mpe")

    execute {
        AppleMusicApplicationCreate.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $CONTROLLER->captureContext(Landroid/content/Context;)V",
        )

        val availability = LyricsPronunciationAvailability.method
        val comparison = availability.instructions.withIndex().single { (_, instruction) ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ljava/lang/String;" && ref.name == "equalsIgnoreCase"
        }.index
        val comparisonResult = availability.instructions[comparison + 1]
        check(comparisonResult.opcode == Opcode.MOVE_RESULT)
        val sameLanguage = (comparisonResult as OneRegisterInstruction).registerA
        availability.addInstructions(
            comparison + 2,
            """
                invoke-static {p1, v$sameLanguage}, $LYRICS_REFLECTION->sameLyricsLanguage(Ljava/lang/Object;Z)Z
                move-result v$sameLanguage
            """,
        )

        val scriptMatch = LyricsScriptMatch.method
        scriptMatch.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0}, $LYRICS_REFLECTION->pronunciationScriptOverride(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :native_match
                return-object v0
            """,
            ExternalLabel("native_match", scriptMatch.instructions.first()),
        )

        // 1. Enable Now Playing lyrics button for tracks missing official lyrics (rename-and-wrap because p0 is clobbered).
        val availClass = LyricsAvailableCheck.classDef
        val availMethod = LyricsAvailableCheck.method
        val origAvailName = availMethod.name
        val origAvailAccess = availMethod.accessFlags
        val nativeAvailName = "voidhackNativeHasLyrics"
        availMethod.name = nativeAvailName

        val availWrapper = ImmutableMethod(
            availClass.type,
            origAvailName,
            availMethod.parameters,
            "Z",
            origAvailAccess,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable()
        availWrapper.addInstructions(
            0,
            """
                invoke-static {p0}, ${availClass.type}->$nativeAvailName($PLAYBACK_ITEM)Z
                move-result v0
                invoke-static {p0, v0}, $CONTROLLER->hasLyrics(Ljava/lang/Object;Z)Z
                move-result v0
                return v0
            """,
        )
        availClass.methods.add(availWrapper)

        // 2. Intercept PlayerLyricsViewModel.loadLyrics(PlaybackItem)V at index 0.
        PlayerLyricsLoad.method.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0, p1}, $CONTROLLER->onLoadLyrics(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :voidhack_continue_load
                return-void
                :voidhack_continue_load
                nop
            """,
        )

        // 3. Intercept both native emit sites inside PlayerLyricsViewModel$f.invokeSuspend(Object)Object.
        val coroutineMethod = PlayerLyricsLoadCoroutine.method
        val coroutineInstructions = coroutineMethod.instructions
        val emitIndices = coroutineInstructions.withIndex()
            .filter { (_, inst) ->
                val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == LYRICS_VM && ref.name == "access\$getMLyricsResult\$p"
            }
            .map { it.index }
            .sortedDescending()

        check(emitIndices.size >= 2) {
            "Expected at least 2 emit sites in PlayerLyricsViewModel coroutine, found ${emitIndices.size}"
        }

        for (emitStart in emitIndices) {
            val vmCall = coroutineMethod.instructions[emitStart] as FiveRegisterInstruction
            val vmReg = vmCall.registerC

            var pairInitIndex = -1
            var buildMapIndex = -1
            for (idx in emitStart + 1 until minOf(emitStart + 12, coroutineMethod.instructions.size)) {
                val ref = (coroutineMethod.instructions[idx] as? ReferenceInstruction)?.reference as? MethodReference
                    ?: continue
                if (ref.definingClass == "Lkotlin/Pair;" && ref.name == "<init>") {
                    pairInitIndex = idx
                } else if (ref.definingClass == LYRICS_VM && ref.name == "access\$buildTimeRangeToLyricsMap") {
                    buildMapIndex = idx
                    break
                }
            }
            check(pairInitIndex > emitStart && buildMapIndex > pairInitIndex) {
                "Could not locate Pair.<init> and access\$buildTimeRangeToLyricsMap after emit site $emitStart"
            }

            val pairInit = coroutineMethod.instructions[pairInitIndex] as FiveRegisterInstruction
            val firstReg = pairInit.registerD
            val secondReg = pairInit.registerE
            val targetAfterEmit = coroutineMethod.instructions[buildMapIndex + 1]
            val localCount = checkNotNull(coroutineMethod.implementation).registerCount - 2
            val scratchReg = (0 until localCount).first { it != vmReg && it != firstReg && it != secondReg }

            val fmtReg = { reg: Int ->
                if (reg < localCount) "v$reg" else "p${reg - localCount}"
            }

            coroutineMethod.addInstructionsWithLabels(
                emitStart,
                """
                    invoke-static {${fmtReg(vmReg)}, ${fmtReg(firstReg)}}, $CONTROLLER->prepareNativeLyrics(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object ${fmtReg(firstReg)}
                    check-cast ${fmtReg(firstReg)}, $SONG_INFO_PTR
                    invoke-static {${fmtReg(vmReg)}, ${fmtReg(firstReg)}, ${fmtReg(secondReg)}}, $CONTROLLER->onNativeLyricsResult(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)Z
                    move-result v$scratchReg
                    if-eqz v$scratchReg, :voidhack_emit_native
                    goto :voidhack_skip_emit
                    :voidhack_emit_native
                    nop
                """,
                ExternalLabel("voidhack_skip_emit", targetAfterEmit),
            )
        }

        // 4. Hook PlayerLyricsViewFragment.w2(SongInfoPtr)V:
        //    (a) Allow rendering LRCLIB SongInfoPtr even on non-numeric item IDs (e.g. uploaded tracks).
        //    (b) Rename-and-wrap to notify LrclibController.onLyricsRendered after rendering.
        val lyricsClass = LyricsFragmentRender.classDef
        val renderMethod = LyricsFragmentRender.method
        val hasCustomCallIdx = renderMethod.instructions.withIndex().first { (_, inst) ->
            val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == PLAYBACK_ITEM && ref.name == "hasCustomLyrics"
        }.index
        val moveResultIdx = hasCustomCallIdx + 1
        val hasCustomReg = (renderMethod.instructions[moveResultIdx] as OneRegisterInstruction).registerA
        renderMethod.addInstructions(
            moveResultIdx + 1,
            """
                invoke-static {v0, v1, v$hasCustomReg}, $CONTROLLER->shouldAllowRender(Ljava/lang/Object;Ljava/lang/Object;Z)Z
                move-result v$hasCustomReg
            """,
        )

        val origRenderName = renderMethod.name
        val origRenderAccess = renderMethod.accessFlags
        val nativeRenderName = "voidhackNativeRenderLyrics"
        renderMethod.name = nativeRenderName
        val renderWrapper = ImmutableMethod(
            lyricsClass.type,
            origRenderName,
            renderMethod.parameters,
            "V",
            origRenderAccess,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable()
        renderWrapper.addInstructions(
            0,
            """
                invoke-virtual {p0, p1}, $LYRICS_FRAGMENT->$nativeRenderName($SONG_INFO_PTR)V
                invoke-static {p0, p1}, $CONTROLLER->onLyricsRendered(Ljava/lang/Object;Ljava/lang/Object;)V
                return-void
            """,
        )
        lyricsClass.methods.add(renderWrapper)

        // 5. Sync lyrics source pill fade & visibility with native controls in PlayerLyricsViewFragment.
        val animMethod = LyricsFragmentControlsAnimator.method
        val origAnimName = animMethod.name
        val origAnimAccess = animMethod.accessFlags
        val nativeAnimName = "voidhackNativeControlsAnimator"
        animMethod.name = nativeAnimName
        val animWrapper = ImmutableMethod(
            lyricsClass.type,
            origAnimName,
            animMethod.parameters,
            "Landroid/animation/Animator;",
            origAnimAccess,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable()
        animWrapper.addInstructions(
            0,
            """
                invoke-virtual {p0, p1}, $LYRICS_FRAGMENT->$nativeAnimName(I)Landroid/animation/Animator;
                move-result-object v0
                invoke-static {p0, p1, v0}, $CONTROLLER->wrapControlsAnimator(Ljava/lang/Object;ILandroid/animation/Animator;)Landroid/animation/Animator;
                move-result-object v0
                return-object v0
            """,
        )
        lyricsClass.methods.add(animWrapper)

        LyricsFragmentHideControls.method.addInstruction(
            0,
            "invoke-static {p0, p1, p2}, $CONTROLLER->onControlsVisibilityChanged(Ljava/lang/Object;IZ)V",
        )
        LyricsFragmentShowControls.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-static {p0, p1, v0}, $CONTROLLER->onControlsVisibilityChanged(Ljava/lang/Object;IZ)V
            """,
        )

        // 6. Keep cached / pinned LRCLIB lyrics open offline (PlayerLyricsViewFragment.q2()Z).
        val offlineMethod = LyricsFragmentOfflineCheck.method
        val origOfflineName = offlineMethod.name
        val origOfflineAccess = offlineMethod.accessFlags
        val nativeOfflineName = "voidhackNativeHasOfflineLyrics"
        offlineMethod.name = nativeOfflineName
        val offlineWrapper = ImmutableMethod(
            lyricsClass.type,
            origOfflineName,
            offlineMethod.parameters,
            "Z",
            origOfflineAccess,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable()
        offlineWrapper.addInstructions(
            0,
            """
                invoke-virtual {p0}, $LYRICS_FRAGMENT->$nativeOfflineName()Z
                move-result v0
                invoke-static {p0, v0}, $CONTROLLER->hasOfflineCachedLyrics(Ljava/lang/Object;Z)Z
                move-result v0
                return v0
            """,
        )
        lyricsClass.methods.add(offlineWrapper)

        // 7. Keep player controls visible on PlayerLyricsViewFragment when lyrics are missing/loading/instrumental
        //    by guarding the direct superclass's controls visibility animator method N1(I[I)V,
        //    and attach LRC corner badge + long-press on player_lyrics & source pill via base onViewCreated.
        val midClassType = checkNotNull(lyricsClass.superclass) { "Missing superclass of PlayerLyricsViewFragment" }
        val midClass = mutableClassDefBy(midClassType)
        val setControlsVisibilityMethod = midClass.methods.single { method ->
            method.returnType == "V" &&
                method.parameters.map { it.type } == listOf("I", "[I")
        }
        setControlsVisibilityMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0, p1}, $CONTROLLER->shouldBlockControlsVisibilityChange(Ljava/lang/Object;I)Z
                move-result v0
                if-eqz v0, :voidhack_allow_controls_vis
                return-void
                :voidhack_allow_controls_vis
                nop
            """,
        )
        val basePlayerType = checkNotNull(midClass.superclass) { "Missing superclass of $midClassType" }
        val basePlayerClass = mutableClassDefBy(basePlayerType)
        val baseOnViewCreated = basePlayerClass.methods.first { method ->
            method.name == "onViewCreated" &&
                method.parameters.map { it.type } == listOf("Landroid/view/View;", "Landroid/os/Bundle;")
        }
        baseOnViewCreated.addInstruction(
            0,
            "invoke-static {p0, p1}, $CONTROLLER->onPlayerViewCreated(Ljava/lang/Object;Landroid/view/View;)V",
        )

        // 8. Add LRCLIB lyrics entry to Apple Music Settings.
        LibrarySettingsCreated.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $CONTROLLER->attachSettings(Ljava/lang/Object;)V",
        )
        LibrarySettingsItems.method.apply {
            checkNotNull(implementation).instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }.reversed().forEach { (index, instruction) ->
                    val register = (instruction as OneRegisterInstruction).registerA
                    addInstructions(
                        index,
                        """
                            invoke-static/range {v$register .. v$register}, $CONTROLLER->withSettings(Ljava/util/List;)Ljava/util/List;
                            move-result-object v$register
                        """,
                    )
                }
        }
    }
}
