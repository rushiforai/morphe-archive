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
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
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
    "Cover Pastel & Blur (Recommended)" to 0,
    "Dark Tonal Blur" to 1,
    "Heavy Cover Blur" to 2,
)

@Suppress("unused")
val expressivePlayerPatch = patch(
    name = "M3 full player",
    description = "Redesigns the Now Playing screen with a blurred cover-art backdrop, adaptive Monet colors, animated squiggly seekbar, expressive transport controls, responsive tablet two-pane layout, full-screen lyrics, and a refreshed Play Queue.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith(EXTENSION_PATH)

    val playerStyleOption by intOption(
        key = "playerColorStyle",
        default = 0,
        values = PLAYER_STYLE_CHOICES,
        title = "Player backdrop style",
        description = "Controls how the blurred album-art background and tonal accents are rendered (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val coverSwipeOption by booleanOption(
        key = "playerCoverSwipeToSkip",
        default = true,
        title = "Swipe cover art to skip tracks",
        description = "Swipe the album cover horizontally with spring tilt physics to skip to the next or previous track (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val squigglySeekbarOption by booleanOption(
        key = "playerSquigglySeekbar",
        default = true,
        title = "Squiggly sine-wave seekbar",
        description = "Animates the active progress line as a Material 3 wave while playing; automatically replaced when 'Song waveform seekbar' is active (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val expressivePlayQueueOption by booleanOption(
        key = "expressivePlayQueue",
        default = true,
        title = "Expressive Play Queue",
        description = "Redesigns the Play Queue and Suggested Tracks view with cover-adaptive backdrops, pill tabs, a spotlight active track card, and rounded rows (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val tabletDesktopLayoutOption by booleanOption(
        key = "tabletDesktopLayout",
        default = true,
        title = "Desktop-style tablet layout",
        description = "Uses a two-pane layout with side-by-side Play Queue & Lyrics, a three-zone bottom playback dock, and volume slider on tablets and wide screens (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    execute {
        // 1. Configure MaterialYouConfig player options.
        val configClass = mutableClassDefBy(MATERIAL_YOU_CONFIG_CLASS)
        configClass.methods.single { it.name == "isExpressivePlayerPatchInstalled" }
            .returnEarly(true)
        configClass.methods.single { it.name == "defaultPlayerColorStyle" }
            .returnEarly(playerStyleOption ?: 0)
        configClass.methods.single { it.name == "defaultPlayerCoverSwipeEnabled" }
            .returnEarly(coverSwipeOption ?: true)
        configClass.methods.single { it.name == "defaultPlayerSquigglySeekbarEnabled" }
            .returnEarly(squigglySeekbarOption ?: true)
        configClass.methods.single { it.name == "defaultExpressivePlayQueueEnabled" }
            .returnEarly(expressivePlayQueueOption ?: true)
        configClass.methods.single { it.name == "defaultPlayerTabletDesktopLayoutEnabled" }
            .returnEarly(tabletDesktopLayoutOption ?: true)

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

        replaceBridgeMethod(
            bridgeClass,
            "nativeClearQueue",
            """
                invoke-static {}, Lcom/aspiro/wamp/player/a${'$'}c;->a()Lcom/aspiro/wamp/player/a;
                move-result-object v0
                if-eqz v0, :done
                iget-object v0, v0, Lcom/aspiro/wamp/player/a;->l:Litd;
                if-eqz v0, :done
                sget-object v1, Lwd6;->j:Ljava/util/Set;
                invoke-interface { v0 }, Litd;->getState()Lcom/aspiro/wamp/enums/MusicServiceState;
                move-result-object v2
                invoke-interface { v1, v2 }, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
                move-result v1
                invoke-interface { v0 }, Litd;->getPlayQueue()Lhpd;
                move-result-object v0
                if-eqz v0, :done
                if-eqz v1, :clear_all
                invoke-interface { v0 }, Lhpd;->clearAllExceptCurrentItem()V
                goto :done
                :clear_all
                const/4 v1, 0x1
                invoke-interface { v0, v1 }, Lhpd;->clear(Z)V
                :done
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeSaveQueueAsPlaylist",
            """
                new-instance v0, Lzf;
                invoke-direct { v0 }, Lzf;-><init>()V
                const-string v1, "playQueue"
                new-instance v2, Lcom/aspiro/wamp/eventtracking/model/ContextualMetadata;
                invoke-direct { v2, v1 }, Lcom/aspiro/wamp/eventtracking/model/ContextualMetadata;-><init>(Ljava/lang/String;)V
                new-instance v3, Lcom/aspiro/wamp/eventtracking/model/ContentMetadata;
                const-string v4, ""
                invoke-direct { v3, v1, v4 }, Lcom/aspiro/wamp/eventtracking/model/ContentMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;)V
                new-instance v4, Lci;
                const/4 v5, 0x0
                invoke-direct { v4, v0, v2, v3, v5 }, Lci;-><init>(Lwh;Lcom/aspiro/wamp/eventtracking/model/ContextualMetadata;Lcom/aspiro/wamp/eventtracking/model/ContentMetadata;Lcom/aspiro/wamp/playqueue/source/model/Source;)V
                invoke-virtual { v4, v5 }, Lci;->b(Lcom/tidal/android/navigation/NavigationInfo;)V
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeShowSleepTimer",
            """
                instance-of v0, p0, Lzlc;
                if-eqz v0, :done
                instance-of v0, p1, Landroidx/fragment/app/FragmentActivity;
                if-eqz v0, :done
                check-cast p0, Lzlc;
                check-cast p1, Landroidx/fragment/app/FragmentActivity;
                iget-object v0, p0, Lzlc;->c:Lms3;
                if-eqz v0, :done
                const-string v1, "playQueue"
                const-string v2, ""
                new-instance v3, Lcom/aspiro/wamp/eventtracking/model/ContentMetadata;
                invoke-direct { v3, v1, v2 }, Lcom/aspiro/wamp/eventtracking/model/ContentMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;)V
                new-instance v2, Lcom/aspiro/wamp/eventtracking/model/ContextualMetadata;
                invoke-direct { v2, v1 }, Lcom/aspiro/wamp/eventtracking/model/ContextualMetadata;-><init>(Ljava/lang/String;)V
                invoke-interface { v0, p1, v3, v2 }, Lms3;->k(Landroidx/fragment/app/FragmentActivity;Lcom/aspiro/wamp/eventtracking/model/ContentMetadata;Lcom/aspiro/wamp/eventtracking/model/ContextualMetadata;)V
                :done
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetQueueShuffleState",
            """
                invoke-static {}, Lcom/aspiro/wamp/player/a${'$'}c;->a()Lcom/aspiro/wamp/player/a;
                move-result-object v0
                if-eqz v0, :unknown
                iget-object v0, v0, Lcom/aspiro/wamp/player/a;->l:Litd;
                if-eqz v0, :unknown
                invoke-interface { v0 }, Litd;->getPlayQueue()Lhpd;
                move-result-object v0
                if-eqz v0, :unknown
                invoke-interface { v0 }, Lhpd;->isShuffled()Z
                move-result v0
                return v0
                :unknown
                const/4 v0, -0x1
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetQueueRepeatMode",
            """
                invoke-static {}, Lcom/aspiro/wamp/player/a${'$'}c;->a()Lcom/aspiro/wamp/player/a;
                move-result-object v0
                if-eqz v0, :none
                iget-object v0, v0, Lcom/aspiro/wamp/player/a;->l:Litd;
                if-eqz v0, :none
                invoke-interface { v0 }, Litd;->getPlayQueue()Lhpd;
                move-result-object v0
                if-eqz v0, :none
                invoke-interface { v0 }, Lhpd;->getRepeatMode()Lcom/aspiro/wamp/enums/RepeatMode;
                move-result-object v0
                if-eqz v0, :none
                invoke-virtual { v0 }, Lcom/aspiro/wamp/enums/RepeatMode;->name()Ljava/lang/String;
                move-result-object v0
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeToggleQueueShuffleDirect",
            """
                invoke-static {}, Lcom/aspiro/wamp/player/a${'$'}c;->a()Lcom/aspiro/wamp/player/a;
                move-result-object v0
                if-eqz v0, :done
                iget-object v0, v0, Lcom/aspiro/wamp/player/a;->l:Litd;
                if-eqz v0, :done
                invoke-interface { v0 }, Litd;->getPlayQueue()Lhpd;
                move-result-object v0
                if-eqz v0, :done
                invoke-interface { v0 }, Lhpd;->toggleShuffle()V
                :done
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeCycleQueueRepeatDirect",
            """
                invoke-static {}, Lcom/aspiro/wamp/player/a${'$'}c;->a()Lcom/aspiro/wamp/player/a;
                move-result-object v0
                if-eqz v0, :done
                iget-object v0, v0, Lcom/aspiro/wamp/player/a;->l:Litd;
                if-eqz v0, :done
                invoke-interface { v0 }, Litd;->getPlayQueue()Lhpd;
                move-result-object v0
                if-eqz v0, :done
                invoke-interface { v0 }, Lhpd;->cycleRepeat()Lcom/aspiro/wamp/enums/RepeatMode;
                :done
                return-void
            """,
        )

        val itdIsInterface = AccessFlags.INTERFACE.isSet(mutableClassDefBy("Litd;").accessFlags)
        val queueIsInterface = AccessFlags.INTERFACE.isSet(mutableClassDefBy("Lhpd;").accessFlags)
        val itemIsInterface = AccessFlags.INTERFACE.isSet(mutableClassDefBy("Luqd;").accessFlags)
        val invokeItdOp = if (itdIsInterface) "invoke-interface" else "invoke-virtual"
        val invokeQueueOp = if (queueIsInterface) "invoke-interface" else "invoke-virtual"
        val invokeItemOp = if (itemIsInterface) "invoke-interface" else "invoke-virtual"

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetPlayQueueSnapshot",
            """
                invoke-static {}, Lcom/aspiro/wamp/player/a${'$'}c;->a()Lcom/aspiro/wamp/player/a;
                move-result-object v0
                if-eqz v0, :none
                iget-object v0, v0, Lcom/aspiro/wamp/player/a;->l:Litd;
                if-eqz v0, :none
                $invokeItdOp { v0 }, Litd;->getPlayQueue()Lhpd;
                move-result-object v0
                if-eqz v0, :none
                $invokeQueueOp { v0 }, Lhpd;->getItems()Ljava/util/List;
                move-result-object v1
                if-eqz v1, :none
                $invokeQueueOp { v0 }, Lhpd;->getCurrentItemPosition()I
                move-result v2
                invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object v2
                const/4 v3, 0x2
                new-array v3, v3, [Ljava/lang/Object;
                const/4 v4, 0x0
                aput-object v1, v3, v4
                const/4 v4, 0x1
                aput-object v2, v3, v4
                return-object v3
                :none
                const/4 v0, 0x0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeExtractQueueItemStrings",
            """
                const/4 v0, 0x6
                new-array v0, v0, [Ljava/lang/String;
                instance-of v1, p0, Luqd;
                if-eqz v1, :done
                check-cast p0, Luqd;

                $invokeItemOp { p0 }, Luqd;->getUid()Ljava/lang/String;
                move-result-object v1
                const/4 v2, 0x0
                aput-object v1, v0, v2

                const/4 v5, 0x0
                $invokeItemOp { p0 }, Luqd;->isActive()Z
                move-result v1
                if-eqz v1, :not_active
                or-int/lit8 v5, v5, 0x2
                :not_active

                $invokeItemOp { p0 }, Luqd;->getMediaItem()Lcom/aspiro/wamp/model/MediaItem;
                move-result-object v1
                if-eqz v1, :write_flags

                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getDisplayTitle()Ljava/lang/String;
                move-result-object v2
                if-eqz v2, :fallback_title
                invoke-virtual { v2 }, Ljava/lang/String;->isEmpty()Z
                move-result v3
                if-eqz v3, :has_title
                :fallback_title
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getTitle()Ljava/lang/String;
                move-result-object v2
                :has_title
                const/4 v3, 0x1
                aput-object v2, v0, v3

                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getArtistNames()Ljava/lang/String;
                move-result-object v2
                const/4 v3, 0x2
                aput-object v2, v0, v3

                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getAlbum()Lcom/aspiro/wamp/model/Album;
                move-result-object v2
                if-eqz v2, :check_video_img
                invoke-virtual { v2 }, Lcom/aspiro/wamp/model/Album;->getCover()Ljava/lang/String;
                move-result-object v2
                goto :store_cover
                :check_video_img
                instance-of v3, v1, Lcom/aspiro/wamp/model/Video;
                if-eqz v3, :no_cover
                move-object v2, v1
                check-cast v2, Lcom/aspiro/wamp/model/Video;
                invoke-virtual { v2 }, Lcom/aspiro/wamp/model/Video;->getImageId()Ljava/lang/String;
                move-result-object v2
                goto :store_cover
                :no_cover
                const/4 v2, 0x0
                :store_cover
                const/4 v3, 0x3
                aput-object v2, v0, v3

                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getDuration()I
                move-result v2
                invoke-static { v2 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                move-result-object v2
                const/4 v3, 0x4
                aput-object v2, v0, v3

                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->isExplicit()Z
                move-result v2
                if-eqz v2, :write_flags
                or-int/lit8 v5, v5, 0x1

                :write_flags
                invoke-static { v5 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                move-result-object v1
                const/4 v2, 0x5
                aput-object v1, v0, v2

                :done
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativePlayQueuePosition",
            """
                invoke-static {}, Lcom/aspiro/wamp/player/a${'$'}c;->a()Lcom/aspiro/wamp/player/a;
                move-result-object v0
                if-eqz v0, :done
                iget-object v0, v0, Lcom/aspiro/wamp/player/a;->l:Litd;
                if-eqz v0, :done
                const/4 v1, 0x1
                const/4 v2, 0x1
                $invokeItdOp { v0, p0, v1, v2 }, Litd;->onActionPlayPosition(IZZ)V
                :done
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeRemoveQueueItem",
            """
                invoke-static {}, Lcom/aspiro/wamp/player/a${'$'}c;->a()Lcom/aspiro/wamp/player/a;
                move-result-object v0
                if-eqz v0, :done
                iget-object v0, v0, Lcom/aspiro/wamp/player/a;->l:Litd;
                if-eqz v0, :done
                $invokeItdOp { v0 }, Litd;->getPlayQueue()Lhpd;
                move-result-object v0
                if-eqz v0, :done
                $invokeQueueOp { v0, p0 }, Lhpd;->removeIfNotCurrent(I)V
                :done
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetAudioStreamSpec",
            """
                invoke-static {}, Lcom/aspiro/wamp/player/a${'$'}c;->a()Lcom/aspiro/wamp/player/a;
                move-result-object v0
                if-eqz v0, :none
                iget-object v0, v0, Lcom/aspiro/wamp/player/a;->l:Litd;
                if-eqz v0, :none
                new-instance v1, Ljava/lang/StringBuilder;
                invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V

                $invokeItdOp { v0 }, Litd;->getCurrentBitDepth()Ljava/lang/Integer;
                move-result-object v2
                if-eqz v2, :sep1
                invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
                :sep1
                const-string v2, "|"
                invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                $invokeItdOp { v0 }, Litd;->getCurrentSampleRate()Ljava/lang/Integer;
                move-result-object v2
                if-eqz v2, :sep2
                invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
                :sep2
                const-string v2, "|"
                invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                $invokeItdOp { v0 }, Litd;->getCurrentCodec()Ljava/lang/String;
                move-result-object v2
                if-eqz v2, :ret
                invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                :ret
                invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v0
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
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
            "Landroidx/recyclerview/widget/ItemTouchHelper\$Callback;",
            "$EXPRESSIVE_PLAYER_BRIDGE_CLASS->onPlayQueueSwipeCallbackInit(Ljava/lang/Object;)V",
        )
        hookPlayQueueTouchCallbackDrag(
            PlayQueueTouchCallbackOnMoveFingerprint.matchSingle().method,
            PlayQueueTouchCallbackClearViewFingerprint.matchSingle().method,
            mutableClassDefBy(PlayQueueTouchCallbackInitFingerprint.matchSingle().classDef.type),
        )
        hookAfterConstructorVoid(
            NavigatorInitFingerprint.matchSingle().method,
            "Ljava/lang/Object;",
            "$EXPRESSIVE_PLAYER_BRIDGE_CLASS->registerNavigator(Ljava/lang/Object;)V",
        )
        hookAfterConstructorVoid(
            SleepTimerControllerInitFingerprint.matchSingle().method,
            "Ljava/lang/Object;",
            "$EXPRESSIVE_PLAYER_BRIDGE_CLASS->registerSleepTimerController(Ljava/lang/Object;)V",
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
    superClass: String,
    bridgeMethodSig: String,
) {
    val (cloned, _) = method.addFreeRegisters(1)
    val saveReg = cloned.implementation!!.registerCount - 1
    val thisAfterPrologue = cloned.p0Register - 1

    val superInitIdx = cloned.instructions.indexOfFirst { insn ->
        insn.opcode == Opcode.INVOKE_DIRECT &&
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == superClass && it.name == "<init>"
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
    registerCount: Int = 12,
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
        MutableMethodImplementation(registerCount),
    ).toMutable()

    newMethod.addInstructionsWithLabels(0, smali.trimIndent())

    bridgeClass.methods.remove(oldMethod)
    bridgeClass.methods.add(newMethod)
}

private fun hookPlayQueueTouchCallbackDrag(
    onMoveMethod: MutableMethod,
    clearViewMethod: MutableMethod,
    mutableCb: MutableClass,
) {
    // 1. Replace async ListAdapter.submitList inside onMove with synchronous notifyItemMoved.
    run {
        val (cloned, added) = onMoveMethod.addFreeRegisters(4)
        val regCount = cloned.implementation!!.registerCount
        val r0 = regCount - 4
        val r1 = regCount - 3
        val saveSrc = regCount - 2
        val saveTgt = regCount - 1
        val srcAfterPrologue = cloned.p0Register - 2
        val tgtAfterPrologue = cloned.p0Register - 1

        cloned.addInstructions(
            added,
            """
                move-object/from16 v$saveSrc, v$srcAfterPrologue
                move-object/from16 v$saveTgt, v$tgtAfterPrologue
            """.trimIndent(),
        )

        val submitIdx = cloned.instructions.indexOfFirst { insn ->
            insn.opcode == Opcode.INVOKE_VIRTUAL &&
                ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                    it.definingClass == "Landroidx/recyclerview/widget/ListAdapter;" && it.name == "submitList"
                } == true
        }
        if (submitIdx < 0) {
            throw PatchException("Could not find ListAdapter.submitList in ${cloned.definingClass}.${cloned.name}")
        }
        val five = cloned.getInstruction(submitIdx) as FiveRegisterInstruction
        val adapterReg = five.registerC
        val listReg = five.registerD

        cloned.replaceInstruction(
            submitIdx,
            "move-object/from16 v$r0, v$adapterReg",
        )
        cloned.addInstructions(
            submitIdx + 1,
            """
                move-object/from16 v$r1, v$listReg
                invoke-static/range { v$r0 .. v$saveTgt }, $EXPRESSIVE_PLAYER_BRIDGE_CLASS->onPlayQueueSyncMove(Landroidx/recyclerview/widget/ListAdapter;Ljava/util/List;Landroidx/recyclerview/widget/RecyclerView${'$'}ViewHolder;Landroidx/recyclerview/widget/RecyclerView${'$'}ViewHolder;)V
            """.trimIndent(),
        )
    }

    // 2. Hook clearView so drag drop clears UIUtil state & settles card lift smoothly.
    run {
        val (cloned, added) = clearViewMethod.addFreeRegisters(2)
        val regCount = cloned.implementation!!.registerCount
        val saveRv = regCount - 2
        val saveVh = regCount - 1
        val rvAfterPrologue = cloned.p0Register - 1
        val vhAfterPrologue = cloned.p0Register

        cloned.addInstructions(
            added,
            """
                move-object/from16 v$saveRv, v$rvAfterPrologue
                move-object/from16 v$saveVh, v$vhAfterPrologue
            """.trimIndent(),
        )

        val retIdx = cloned.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        if (retIdx <= added) {
            throw PatchException("No return-void found after prologue in ${cloned.definingClass}.${cloned.name}")
        }
        cloned.replaceInstruction(
            retIdx,
            "invoke-static/range { v$saveRv .. v$saveVh }, $EXPRESSIVE_PLAYER_BRIDGE_CLASS->onPlayQueueDragClearView(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView${'$'}ViewHolder;)V",
        )
        cloned.addInstructions(retIdx + 1, "return-void")
    }

    // 3. Add onSelectedChanged override to lift dragged row & suppress header churn during drag.
    if (mutableCb.methods.none { it.name == "onSelectedChanged" }) {
        val onSelMethod = ImmutableMethod(
            mutableCb.type,
            "onSelectedChanged",
            listOf(
                ImmutableMethodParameter("Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;", null, null),
                ImmutableMethodParameter("I", null, null),
            ),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable()
        onSelMethod.addInstructionsWithLabels(
            0,
            """
                invoke-super { p0, p1, p2 }, Landroidx/recyclerview/widget/ItemTouchHelper${'$'}Callback;->onSelectedChanged(Landroidx/recyclerview/widget/RecyclerView${'$'}ViewHolder;I)V
                invoke-static { p1, p2 }, $EXPRESSIVE_PLAYER_BRIDGE_CLASS->onPlayQueueSelectedChanged(Landroidx/recyclerview/widget/RecyclerView${'$'}ViewHolder;I)V
                return-void
            """.trimIndent(),
        )
        mutableCb.methods.add(onSelMethod)
    }

    // 4. Lower the swap threshold so rows trade places earlier while dragging (feels responsive).
    if (mutableCb.methods.none { it.name == "getMoveThreshold" }) {
        val thresholdMethod = ImmutableMethod(
            mutableCb.type,
            "getMoveThreshold",
            listOf(
                ImmutableMethodParameter("Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;", null, null),
            ),
            "F",
            AccessFlags.PUBLIC.value,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable()
        thresholdMethod.addInstructionsWithLabels(
            0,
            """
                const v0, 0x3eb33333    # 0.35f
                return v0
            """.trimIndent(),
        )
        mutableCb.methods.add(thresholdMethod)
    }
}
