package dev.materialtidal.patches.tidal.layout.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.intOption
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
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.materialtidal.patches.shared.COMPATIBILITY_TIDAL
import dev.materialtidal.patches.shared.EXPRESSIVE_FACTORY_CLASS
import dev.materialtidal.patches.shared.EXPRESSIVE_PLAYER_BRIDGE_CLASS
import dev.materialtidal.patches.shared.EXTENSION_PATH
import dev.materialtidal.patches.shared.MATERIAL_YOU_CONFIG_CLASS

private val PLAYER_STYLE_CHOICES = mapOf(
    "Cover Pastel & Blurred Art (Screenshot)" to 0,
    "Dark Tonal Blurred Cover" to 1,
    "Pure Heavy Cover Blur" to 2,
)

@Suppress("unused")
val expressivePlayerPatch = patch(
    name = "Material 3 Expressive full player",
    description = "Replaces TIDAL's Now Playing screen with a Material 3 Expressive player featuring a heavily blurred cover backdrop, connected split pills, squiggly animated seekbar, morphing transport shapes, full-screen animated lyrics, and an expressive Play Queue.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith(EXTENSION_PATH)

    val playerStyleOption by intOption(
        key = "playerColorStyle",
        default = 0,
        values = PLAYER_STYLE_CHOICES,
        title = "Player blurred background style",
        description = "How the heavily blurred cover backdrop and tonal accents are rendered.",
        required = true,
    )

    val coverSwipeOption by booleanOption(
        key = "playerCoverSwipeToSkip",
        default = true,
        title = "Swipe cover art to skip tracks",
        description = "Swipe the album artwork horizontally with spring tilt physics to skip to next or previous track.",
        required = true,
    )

    val squigglySeekbarOption by booleanOption(
        key = "playerSquigglySeekbar",
        default = true,
        title = "Expressive wavy seekbar",
        description = "Animate the active playback track with a Material 3 Expressive sine wave while playing.",
        required = true,
    )

    val expressivePlayQueueOption by booleanOption(
        key = "expressivePlayQueue",
        default = true,
        title = "Expressive Material 3 Play Queue",
        description = "Redesigns the Play Queue and Suggested Tracks modal with cover-adaptive tonal scrims, segmented pill tabs, spotlight active card, and expressive track cards.",
        required = true,
    )

    execute {
        // 1. Configure MaterialYouConfig player options.
        val configClass = mutableClassDefBy(MATERIAL_YOU_CONFIG_CLASS)
        configClass.methods.single { it.name == "getPlayerColorStyle" }
            .returnEarly(playerStyleOption ?: 0)
        configClass.methods.single { it.name == "isPlayerCoverSwipeEnabled" }
            .returnEarly(coverSwipeOption ?: true)
        configClass.methods.single { it.name == "isPlayerSquigglySeekbarEnabled" }
            .returnEarly(squigglySeekbarOption ?: true)
        configClass.methods.single { it.name == "isExpressivePlayQueueEnabled" }
            .returnEarly(expressivePlayQueueOption ?: true)

        // 2. Enable player-market-ui Compose pipeline in flag holder + MainActivity.FullPlayer.
        val flagMatch = PlayerMarketUiFlagClinitFingerprint.matchSingle()
        flagMatch.method.let { m ->
            val zeroIdx = m.instructions.indexOfFirst { insn ->
                insn is NarrowLiteralInstruction && insn.narrowLiteral == 0
            }
            if (zeroIdx < 0) {
                throw PatchException("Could not find false literal in player-market-ui <clinit>")
            }
            val reg = (m.getInstruction(zeroIdx) as OneRegisterInstruction).registerA
            m.replaceInstruction(zeroIdx, "const/4 v$reg, 0x1")
        }

        val fullPlayerMatch = MainActivityFullPlayerFingerprint.matchSingle()
        fullPlayerMatch.let { match ->
            val m = match.method
            val boolCallIdx = match.instructionMatches.last().index
            val moveInsn = m.getInstruction(boolCallIdx + 1)
            if (moveInsn.opcode != Opcode.MOVE_RESULT) {
                throw PatchException("Expected move-result after Boolean.booleanValue in ${m.name}, got ${moveInsn.opcode}")
            }
            val reg = (moveInsn as OneRegisterInstruction).registerA
            m.addInstructions(boolCallIdx + 2, "const/4 v$reg, 0x1")
        }

        // 3. Discover TIDAL obfuscated PlayerScreenContent types.
        val contentMatch = PlayerScreenContentFingerprint.matchSingle()
        val params = contentMatch.method.parameterTypes
        val contentStateType = params[0].toString()
        val progressStateType = params[1].toString()
        val function1Type = params[3].toString()

        val contentFields = mutableClassDefBy(contentStateType).fields
        fun fieldType(name: String): String =
            contentFields.firstOrNull { it.name == name }?.type
                ?: throw PatchException("Missing field '$name' on $contentStateType")

        val mediaStateType = fieldType("a")
        val playbackControlType = fieldType("b")
        val broadcastStateType = fieldType("d")
        val favoriteStateType = fieldType("e")
        val playbackBadgeType = fieldType("f")
        val lyricsStateType = fieldType("j")
        val sourceLabelType = fieldType("n")

        val secondaryBtnType = mutableClassDefBy(playbackControlType).fields
            .firstOrNull { it.name == "c" }?.type
            ?: throw PatchException("Missing field 'c' on $playbackControlType")

        val lyricsSubType = mutableClassDefBy("Lcom/tidal/android/feature/playerscreen/ui/b${'$'}c;").fields
            .firstOrNull { it.name == "b" }?.type
            ?: throw PatchException("Missing field 'b' on b\$c")

        // Ensure ExpressiveViewFactory implements TIDAL's Function1 (Lbn7;).
        val factoryClass = mutableClassDefBy(EXPRESSIVE_FACTORY_CLASS)
        if (!factoryClass.interfaces.contains(function1Type)) {
            factoryClass.interfaces.add(function1Type)
        }

        // 4. Populate ExpressivePlayerBridge native* stubs.
        val bridgeClass = mutableClassDefBy(EXPRESSIVE_PLAYER_BRIDGE_CLASS)

        replaceBridgeMethod(
            bridgeClass,
            "nativeMountPlayerAndroidView",
            """
                check-cast p0, $function1Type
                check-cast p1, $function1Type
                check-cast p2, Landroidx/compose/runtime/Composer;
                sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier${'$'}Companion;
                const/4 v1, 0x0
                const/4 v2, 0x1
                const/4 v3, 0x0
                invoke-static { v0, v1, v2, v3 }, Landroidx/compose/foundation/layout/SizeKt;->fillMaxSize${'$'}default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;
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

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetPlayerStrings",
            """
                const/16 v0, 0x9
                new-array v0, v0, [Ljava/lang/String;
                check-cast p0, $contentStateType

                # [0..2] MediaViewState: title, subtitle, albumCover
                iget-object v1, p0, $contentStateType->a:$mediaStateType
                if-eqz v1, :no_media
                iget-object v2, v1, $mediaStateType->a:Ljava/lang/String;
                const/4 v3, 0x0
                aput-object v2, v0, v3
                iget-object v2, v1, $mediaStateType->b:Ljava/lang/String;
                const/4 v3, 0x1
                aput-object v2, v0, v3
                iget-object v2, v1, $mediaStateType->e:Ljava/lang/String;
                const/4 v3, 0x2
                aput-object v2, v0, v3
                :no_media

                # [3..4] PlaybackControlState: playState, repeatMode
                iget-object v1, p0, $contentStateType->b:$playbackControlType
                if-eqz v1, :no_ctrl
                iget-object v2, v1, $playbackControlType->a:Lcom/tidal/android/feature/playerscreen/ui/PlayerScreenContract${'$'}PlayState;
                if-eqz v2, :no_play
                invoke-virtual { v2 }, Lcom/tidal/android/feature/playerscreen/ui/PlayerScreenContract${'$'}PlayState;->name()Ljava/lang/String;
                move-result-object v2
                const/4 v3, 0x3
                aput-object v2, v0, v3
                :no_play
                iget-object v2, v1, $playbackControlType->c:$secondaryBtnType
                instance-of v3, v2, Lyyd${'$'}c;
                if-eqz v3, :no_ctrl
                check-cast v2, Lyyd${'$'}c;
                iget-object v2, v2, Lyyd${'$'}c;->a:Lcom/aspiro/wamp/enums/RepeatMode;
                if-eqz v2, :no_ctrl
                invoke-virtual { v2 }, Lcom/aspiro/wamp/enums/RepeatMode;->name()Ljava/lang/String;
                move-result-object v2
                const/4 v3, 0x4
                aput-object v2, v0, v3
                :no_ctrl

                # [5] PlaybackBadgeState
                iget-object v1, p0, $contentStateType->f:$playbackBadgeType
                instance-of v2, v1, Luyd${'$'}a;
                if-eqz v2, :check_atmos
                check-cast v1, Luyd${'$'}a;
                iget-object v2, v1, Luyd${'$'}a;->a:Ljava/lang/String;
                const/4 v3, 0x5
                aput-object v2, v0, v3
                goto :check_progress
                :check_atmos
                instance-of v2, v1, Luyd${'$'}b;
                if-eqz v2, :check_preview
                const-string v2, "DOLBY ATMOS"
                const/4 v3, 0x5
                aput-object v2, v0, v3
                goto :check_progress
                :check_preview
                instance-of v2, v1, Luyd${'$'}c;
                if-eqz v2, :check_progress
                const-string v2, "PREVIEW"
                const/4 v3, 0x5
                aput-object v2, v0, v3

                :check_progress
                # [6..7] PlaybackProgressState: progressTime, durationTime
                if-eqz p1, :no_prog
                check-cast p1, $progressStateType
                iget-object v2, p1, $progressStateType->b:Ljava/lang/String;
                const/4 v3, 0x6
                aput-object v2, v0, v3
                iget-object v2, p1, $progressStateType->c:Ljava/lang/String;
                const/4 v3, 0x7
                aput-object v2, v0, v3
                :no_prog

                # [8] SourceLabel
                iget-object v1, p0, $contentStateType->n:$sourceLabelType
                if-eqz v1, :done
                iget-object v2, v1, $sourceLabelType->a:Ljava/lang/String;
                const/16 v3, 0x8
                aput-object v2, v0, v3
                :done
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetPlayerFlags",
            """
                check-cast p0, $contentStateType
                const/4 v0, 0x0

                # bit 0: isExplicit
                iget-object v1, p0, $contentStateType->a:$mediaStateType
                if-eqz v1, :no_explicit
                iget-boolean v2, v1, $mediaStateType->f:Z
                if-eqz v2, :no_explicit
                or-int/lit8 v0, v0, 0x1
                :no_explicit

                # bit 1 (isShuffleOn) & bit 2 (isNextEnabled)
                iget-object v1, p0, $contentStateType->b:$playbackControlType
                if-eqz v1, :no_ctrl
                iget-boolean v2, v1, $playbackControlType->b:Z
                if-eqz v2, :no_shuf
                or-int/lit8 v0, v0, 0x2
                :no_shuf
                iget-boolean v2, v1, $playbackControlType->d:Z
                if-eqz v2, :no_ctrl
                or-int/lit8 v0, v0, 0x4
                :no_ctrl

                # bit 3: isFavorite
                iget-object v1, p0, $contentStateType->e:$favoriteStateType
                if-eqz v1, :no_fav
                iget-boolean v2, v1, $favoriteStateType->a:Z
                if-eqz v2, :no_fav
                or-int/lit8 v0, v0, 0x8
                :no_fav

                # bit 4: showRemoveFavoriteDialog
                iget-boolean v1, p0, $contentStateType->h:Z
                if-eqz v1, :no_rem_dlg
                or-int/lit8 v0, v0, 0x10
                :no_rem_dlg

                # bit 5: showLyricsButton
                iget-boolean v1, p0, $contentStateType->i:Z
                if-eqz v1, :no_lyr_btn
                or-int/lit8 v0, v0, 0x20
                :no_lyr_btn

                # bit 6: isBroadcastConnected
                iget-object v1, p0, $contentStateType->d:$broadcastStateType
                instance-of v2, v1, Lcom/tidal/android/feature/playerscreen/ui/a${'$'}a;
                if-nez v2, :cast_on
                instance-of v2, v1, Lcom/tidal/android/feature/playerscreen/ui/a${'$'}b;
                if-eqz v2, :no_cast
                :cast_on
                or-int/lit8 v0, v0, 0x40
                :no_cast

                # bits 7..9: isLyricsVisible, isLyricsLoading, isLyricsSynced
                iget-object v1, p0, $contentStateType->j:$lyricsStateType
                if-eqz v1, :done
                instance-of v2, v1, Lcom/tidal/android/feature/playerscreen/ui/b${'$'}a;
                if-nez v2, :done
                or-int/lit16 v0, v0, 0x80
                instance-of v2, v1, Lcom/tidal/android/feature/playerscreen/ui/b${'$'}b;
                if-eqz v2, :check_synced
                or-int/lit16 v0, v0, 0x100
                goto :done
                :check_synced
                instance-of v2, v1, Lcom/tidal/android/feature/playerscreen/ui/b${'$'}c;
                if-eqz v2, :done
                or-int/lit16 v0, v0, 0x200
                :done
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetPlayerProgress",
            """
                check-cast p0, $progressStateType
                iget v0, p0, $progressStateType->a:F
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetLyricsList",
            """
                check-cast p0, $contentStateType
                iget-object v0, p0, $contentStateType->j:$lyricsStateType
                instance-of v1, v0, Lcom/tidal/android/feature/playerscreen/ui/b${'$'}c;
                if-eqz v1, :check_unsynced
                check-cast v0, Lcom/tidal/android/feature/playerscreen/ui/b${'$'}c;
                iget-object v0, v0, Lcom/tidal/android/feature/playerscreen/ui/b${'$'}c;->b:$lyricsSubType
                check-cast v0, Ljava/util/List;
                return-object v0
                :check_unsynced
                instance-of v1, v0, Lcom/tidal/android/feature/playerscreen/ui/b${'$'}d;
                if-eqz v1, :none
                check-cast v0, Lcom/tidal/android/feature/playerscreen/ui/b${'$'}d;
                iget-object v0, v0, Lcom/tidal/android/feature/playerscreen/ui/b${'$'}d;->b:$lyricsSubType
                check-cast v0, Ljava/util/List;
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetSyncedHighlightIndex",
            """
                check-cast p0, $contentStateType
                iget-object v0, p0, $contentStateType->j:$lyricsStateType
                instance-of v1, v0, Lcom/tidal/android/feature/playerscreen/ui/b${'$'}c;
                if-eqz v1, :none
                check-cast v0, Lcom/tidal/android/feature/playerscreen/ui/b${'$'}c;
                iget v0, v0, Lcom/tidal/android/feature/playerscreen/ui/b${'$'}c;->c:I
                return v0
                :none
                const/4 v0, -0x1
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetSyncedLyricText",
            """
                instance-of v0, p0, Lsyd;
                if-eqz v0, :check_str
                check-cast p0, Lsyd;
                iget-object v0, p0, Lsyd;->a:Ljava/lang/String;
                return-object v0
                :check_str
                instance-of v0, p0, Ljava/lang/String;
                if-eqz v0, :empty
                check-cast p0, Ljava/lang/String;
                return-object p0
                :empty
                const-string v0, ""
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetSyncedLyricTimeMs",
            """
                instance-of v0, p0, Lsyd;
                if-eqz v0, :zero
                check-cast p0, Lsyd;
                iget-wide v0, p0, Lsyd;->b:J
                return-wide v0
                :zero
                const-wide/16 v0, 0x0
                return-wide v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeDispatchSimpleEvent",
            """
                check-cast p0, $function1Type
                const/4 v1, 0x0
                if-ne p1, v1, :c1
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}r;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}r;
                goto :dispatch
                :c1
                const/4 v1, 0x1
                if-ne p1, v1, :c2
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}q;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}q;
                goto :dispatch
                :c2
                const/4 v1, 0x2
                if-ne p1, v1, :c3
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}t;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}t;
                goto :dispatch
                :c3
                const/4 v1, 0x3
                if-ne p1, v1, :c4
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}g0;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}g0;
                goto :dispatch
                :c4
                const/4 v1, 0x4
                if-ne p1, v1, :c5
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}y;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}y;
                goto :dispatch
                :c5
                const/4 v1, 0x5
                if-ne p1, v1, :c6
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}j;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}j;
                goto :dispatch
                :c6
                const/4 v1, 0x6
                if-ne p1, v1, :c7
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}w;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}w;
                goto :dispatch
                :c7
                const/4 v1, 0x7
                if-ne p1, v1, :c8
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}u;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}u;
                goto :dispatch
                :c8
                const/16 v1, 0x8
                if-ne p1, v1, :c9
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}e;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}e;
                goto :dispatch
                :c9
                const/16 v1, 0x9
                if-ne p1, v1, :c10
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}n;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}n;
                goto :dispatch
                :c10
                const/16 v1, 0xa
                if-ne p1, v1, :c11
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}f;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}f;
                goto :dispatch
                :c11
                const/16 v1, 0xb
                if-ne p1, v1, :c12
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}s;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}s;
                goto :dispatch
                :c12
                const/16 v1, 0xc
                if-ne p1, v1, :c13
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}i0;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}i0;
                goto :dispatch
                :c13
                const/16 v1, 0xd
                if-ne p1, v1, :c14
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}c;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}c;
                goto :dispatch
                :c14
                const/16 v1, 0xe
                if-ne p1, v1, :c15
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}h0;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}h0;
                goto :dispatch
                :c15
                const/16 v1, 0xf
                if-ne p1, v1, :done
                sget-object v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}b0;->a:Lcom/tidal/android/feature/playerscreen/ui/e${'$'}b0;
                :dispatch
                invoke-interface { p0, v0 }, $function1Type->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                :done
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeDispatchSeekDragging",
            """
                check-cast p0, $function1Type
                new-instance v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}a0;
                invoke-direct { v0, p1 }, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}a0;-><init>(F)V
                invoke-interface { p0, v0 }, $function1Type->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeDispatchLyricLineClicked",
            """
                check-cast p0, $function1Type
                new-instance v0, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}m;
                invoke-direct { v0, p1, p2 }, Lcom/tidal/android/feature/playerscreen/ui/e${'$'}m;-><init>(J)V
                invoke-interface { p0, v0 }, $function1Type->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                return-void
            """,
        )

        // 5. Redirect PlayerScreenKt.c (PlayerScreenContent) to ExpressivePlayerBridge.
        contentMatch.method.let { m ->
            val p0 = m.p0Register
            val p6 = p0 + 6
            m.addInstructions(
                0,
                """
                    invoke-static/range { v$p0 .. v$p6 }, $EXPRESSIVE_PLAYER_BRIDGE_CLASS->renderPlayerScreen(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
                    return-void
                """,
            )
        }

        // 6. Play Queue & Suggested Tracks Expressive redesign hooks.
        hookAfterViewCreatedLastReturn(
            PlayQueueDialogOnViewCreatedFingerprint.matchSingle().method,
            "$EXPRESSIVE_PLAYER_BRIDGE_CLASS->onPlayQueueViewCreated(Ljava/lang/Object;Landroid/view/View;)V",
        )
        PlayQueueDialogOnDestroyViewFingerprint.matchSingle().method.let { m ->
            m.addInstructions(
                0,
                invokeStaticSingleRegVoid(
                    m.p0Register,
                    "$EXPRESSIVE_PLAYER_BRIDGE_CLASS->onPlayQueueDestroyView(Ljava/lang/Object;)V",
                ),
            )
        }
        hookAfterDelegateBindLastReturn(
            PlayQueueHeaderDelegateBindFingerprint.matchSingle().method,
            "$EXPRESSIVE_PLAYER_BRIDGE_CLASS->onPlayQueueHeaderBound(Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;)V",
        )
        hookAfterDelegateBindLastReturn(
            PlayQueueItemDelegateBindFingerprint.matchSingle().method,
            "$EXPRESSIVE_PLAYER_BRIDGE_CLASS->onPlayQueueItemBound(Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;)V",
        )
        hookAfterViewCreatedLastReturn(
            PlayQueueSuggestionsOnViewCreatedFingerprint.matchSingle().method,
            "$EXPRESSIVE_PLAYER_BRIDGE_CLASS->onPlayQueueSuggestionsViewCreated(Ljava/lang/Object;Landroid/view/View;)V",
        )
        hookAfterConstructorVoid(
            PlayQueueTouchCallbackInitFingerprint.matchSingle().method,
            "$EXPRESSIVE_PLAYER_BRIDGE_CLASS->onPlayQueueSwipeCallbackInit(Ljava/lang/Object;)V",
        )
    }
}

private fun invokeStaticSingleRegVoid(reg: Int, methodSig: String): String =
    if (reg <= 15) {
        "invoke-static { v$reg }, $methodSig"
    } else {
        "invoke-static/range { v$reg .. v$reg }, $methodSig"
    }

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

private fun hookAfterConstructorVoid(
    method: MutableMethod,
    bridgeMethodSig: String,
) {
    val (cloned, _) = method.addFreeRegisters(1)
    val saveReg = cloned.implementation!!.registerCount - 1
    val thisAfterPrologue = cloned.p0Register - 1

    val superInitIdx = cloned.instructions.indexOfFirst { insn ->
        insn.opcode == Opcode.INVOKE_DIRECT &&
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == cloned.definingClass.let { _ -> "Landroidx/recyclerview/widget/ItemTouchHelper\$Callback;" } &&
                    it.name == "<init>"
            } == true
    }
    if (superInitIdx < 0) {
        throw PatchException("No super.<init> call found in ${cloned.definingClass}.${cloned.name}")
    }
    val moveIdx = superInitIdx + 1
    cloned.addInstructions(
        moveIdx,
        "move-object/from16 v$saveReg, v$thisAfterPrologue",
    )

    val retIndices = cloned.instructions.withIndex()
        .filter { it.index > moveIdx && it.value.opcode == Opcode.RETURN_VOID }
        .map { it.index }
        .sortedDescending()
    if (retIndices.isEmpty()) {
        throw PatchException("No return-void found after super.<init> in ${cloned.definingClass}.${cloned.name}")
    }
    for (retIdx in retIndices) {
        cloned.replaceInstruction(
            retIdx,
            "invoke-static/range { v$saveReg .. v$saveReg }, $bridgeMethodSig",
        )
        cloned.addInstructions(retIdx + 1, "return-void")
    }
}

private fun replaceBridgeMethod(
    bridgeClass: MutableClass,
    methodName: String,
    smali: String,
) {
    val oldMethod = bridgeClass.methods.singleOrNull { it.name == methodName }
        ?: throw PatchException("Bridge method not found: $EXPRESSIVE_PLAYER_BRIDGE_CLASS->$methodName")

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
