package dev.materialtidal.patches.tidal.layout.lyrics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.materialtidal.patches.shared.COMPATIBILITY_TIDAL
import dev.materialtidal.patches.shared.EXPRESSIVE_PLAYER_BRIDGE_CLASS
import dev.materialtidal.patches.shared.EXTENSION_PATH
import dev.materialtidal.patches.shared.MATERIAL_YOU_CONFIG_CLASS
import dev.materialtidal.patches.tidal.layout.player.expressivePlayerPatch

private val LYRICS_BLUR_STRENGTH_CHOICES = mapOf(
    "Balanced (Recommended)" to "balanced",
    "Subtle" to "subtle",
    "Strong" to "strong",
)

private fun blurStrengthToCode(value: String?): Int = when (value) {
    "subtle" -> 0
    "balanced" -> 1
    "strong" -> 2
    else -> throw PatchException("Invalid lyricsBlurStrength option value: $value")
}

@Suppress("unused")
val syllableLyricsPatch = patch(
    name = "Syllable-synced karaoke lyrics",
    description = "Upgrades full-screen lyrics with word-by-word karaoke sweep highlighting, gentle lift physics, depth-of-field blur on inactive lines, duet layout, and open community lyric providers with automatic fallback to TIDAL lyrics.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith(EXTENSION_PATH)

    dependsOn(expressivePlayerPatch)

    val progressiveBlurOption by booleanOption(
        key = "lyricsProgressiveBlur",
        default = true,
        title = "Progressive blur on inactive lines",
        description = "Applies smooth depth-of-field blur to inactive lyric lines, clearing as each line enters focus or while scrolling (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val blurStrengthOption by stringOption(
        key = "lyricsBlurStrength",
        default = "balanced",
        values = LYRICS_BLUR_STRENGTH_CHOICES,
        title = "Lyrics blur intensity",
        description = "Controls how strongly inactive lyric lines blur based on distance from the active line (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    execute {
        // 1. Enable syllable lyrics & progressive blur options on MaterialYouConfig.
        val configClass = mutableClassDefBy(MATERIAL_YOU_CONFIG_CLASS)
        configClass.methods.single { it.name == "isSyllableLyricsPatchInstalled" }
            .returnEarly(true)
        configClass.methods.single { it.name == "defaultSyllableLyricsEnabled" }
            .returnEarly(true)
        configClass.methods.single { it.name == "defaultLyricsProgressiveBlurEnabled" }
            .returnEarly(progressiveBlurOption ?: true)
        configClass.methods.single { it.name == "defaultLyricsBlurStrength" }
            .returnEarly(blurStrengthToCode(blurStrengthOption))

        // 2. Hook TIDAL's millisecond ProgressTracker (Lhue;) for frame-accurate playback clock.
        val audioSwitchMatch = LyricsAudioPlayerSwitchFingerprint.matchSingle()
        val audioSingletonMethod = LyricsAudioPlayerSingletonFingerprint.matchSingle().method
        val audioPlayerClass = audioSwitchMatch.classDef
        val progressTrackerField = audioPlayerClass.fields.single { it.name == "c" }
        val audioItdField = audioPlayerClass.fields.single { it.name == "l" }

        val progressTrackerClass = mutableClassDefBy(progressTrackerField.type)
        val progressUpdateMethod = progressTrackerClass.methods.single {
            !it.name.startsWith("<") &&
                it.parameterTypes.map { p -> p.toString() } == listOf("I", "I") &&
                it.returnType == "V" &&
                it.instructions.none { insn -> insn.opcode == Opcode.NEW_INSTANCE }
        }
        val progressStartMethod = progressTrackerClass.methods.single {
            !it.name.startsWith("<") &&
                it.parameterTypes.map { p -> p.toString() } == listOf("I", "I") &&
                it.returnType == "V" &&
                it.instructions.any { insn -> insn.opcode == Opcode.NEW_INSTANCE }
        }

        progressUpdateMethod.let { m ->
            val p1 = m.p0Register + 1
            val p2 = m.p0Register + 2
            m.addInstructions(
                0,
                invokeDualIntStatic(
                    p1,
                    p2,
                    "$EXPRESSIVE_PLAYER_BRIDGE_CLASS->onPlaybackProgressTickMs(II)V",
                ),
            )
        }
        progressStartMethod.let { m ->
            val p1 = m.p0Register + 1
            val p2 = m.p0Register + 2
            m.addInstructions(
                0,
                invokeDualIntStatic(
                    p1,
                    p2,
                    "$EXPRESSIVE_PLAYER_BRIDGE_CLASS->onPlaybackStartedMs(II)V",
                ),
            )
        }

        // 3. Hook API v2 track resource mapper to cache Track ID -> ISRC for instant lrc.red lookup.
        LyricsTracksResourceMapperFingerprint.matchSingle().method.let { m ->
            val p0 = m.p0Register
            if (p0 < 2) {
                throw PatchException("Expected >= 2 local registers before p0 in ${m.definingClass}.${m.name}")
            }
            m.addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, v$p0
                    if-eqz v0, :mt_isrc_skip
                    invoke-virtual { v0 }, Lcom/tidal/sdk/tidalapi/generated/models/TracksResourceObject;->getAttributes()Lcom/tidal/sdk/tidalapi/generated/models/TracksAttributes;
                    move-result-object v1
                    if-eqz v1, :mt_isrc_skip
                    invoke-virtual { v0 }, Lcom/tidal/sdk/tidalapi/generated/models/TracksResourceObject;->getId()Ljava/lang/String;
                    move-result-object v0
                    invoke-virtual { v1 }, Lcom/tidal/sdk/tidalapi/generated/models/TracksAttributes;->getIsrc()Ljava/lang/String;
                    move-result-object v1
                    invoke-static { v0, v1 }, $EXPRESSIVE_PLAYER_BRIDGE_CLASS->cacheTrackIsrc(Ljava/lang/String;Ljava/lang/String;)V
                    :mt_isrc_skip
                    nop
                """.trimIndent(),
            )
        }

        // 4. Populate ExpressivePlayerBridge.nativeGetCurrentTrackMeta() for trackId, album & exact duration.
        val itdClass = mutableClassDefBy(audioItdField.type)
        val itdGetPlayQueue = itdClass.methods.single { it.name == "getPlayQueue" }
        val playQueueType = itdGetPlayQueue.returnType
        val playQueueClass = mutableClassDefBy(playQueueType)
        val queueGetCurrentItem = playQueueClass.methods.single { it.name == "getCurrentItem" }
        val queueItemType = queueGetCurrentItem.returnType
        val queueItemClass = mutableClassDefBy(queueItemType)
        val itemGetMediaParent = queueItemClass.methods.single { it.name == "getMediaItemParent" }

        val invokeItdOp = if (AccessFlags.INTERFACE.isSet(itdClass.accessFlags)) "invoke-interface" else "invoke-virtual"
        val invokeQueueOp = if (AccessFlags.INTERFACE.isSet(playQueueClass.accessFlags)) "invoke-interface" else "invoke-virtual"
        val invokeItemOp = if (AccessFlags.INTERFACE.isSet(queueItemClass.accessFlags)) "invoke-interface" else "invoke-virtual"

        val bridgeClass = mutableClassDefBy(EXPRESSIVE_PLAYER_BRIDGE_CLASS)
        replaceBridgeMethod(
            bridgeClass,
            "nativeGetCurrentTrackMeta",
            """
                const/4 v0, 0x4
                new-array v0, v0, [Ljava/lang/String;
                invoke-static {}, $audioSingletonMethod
                move-result-object v1
                if-eqz v1, :done
                iget-object v1, v1, $audioItdField
                if-eqz v1, :done
                $invokeItdOp { v1 }, $itdGetPlayQueue
                move-result-object v1
                if-eqz v1, :done
                $invokeQueueOp { v1 }, $queueGetCurrentItem
                move-result-object v1
                if-eqz v1, :done
                $invokeItemOp { v1 }, $itemGetMediaParent
                move-result-object v1
                if-eqz v1, :done
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItemParent;->getDurationMs()I
                move-result v2
                if-lez v2, :check_media
                invoke-static { v2 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                move-result-object v2
                const/4 v3, 0x2
                aput-object v2, v0, v3
                :check_media
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItemParent;->getMediaItem()Lcom/aspiro/wamp/model/MediaItem;
                move-result-object v1
                if-eqz v1, :done
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getIdAsString()Ljava/lang/String;
                move-result-object v2
                const/4 v3, 0x0
                aput-object v2, v0, v3
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getTitle()Ljava/lang/String;
                move-result-object v2
                const/4 v3, 0x3
                aput-object v2, v0, v3
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getAlbum()Lcom/aspiro/wamp/model/Album;
                move-result-object v2
                if-eqz v2, :check_dur
                invoke-virtual { v2 }, Lcom/aspiro/wamp/model/Album;->getTitle()Ljava/lang/String;
                move-result-object v2
                const/4 v3, 0x1
                aput-object v2, v0, v3
                :check_dur
                const/4 v3, 0x2
                aget-object v2, v0, v3
                if-nez v2, :done
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getDuration()I
                move-result v2
                if-lez v2, :done
                mul-int/lit16 v2, v2, 0x3e8
                invoke-static { v2 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                move-result-object v2
                aput-object v2, v0, v3
                :done
                return-object v0
            """,
        )
    }
}

private fun invokeDualIntStatic(reg1: Int, reg2: Int, methodSig: String): String =
    if (reg2 <= 15) {
        "invoke-static { v$reg1, v$reg2 }, $methodSig"
    } else {
        "invoke-static/range { v$reg1 .. v$reg2 }, $methodSig"
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
