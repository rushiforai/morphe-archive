package app.ayham.patches.music.features

import app.ayham.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXmlOrNull
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.util.logging.Logger

private const val FEATURES = "Lapp/ayham/extension/music/features/Features;"
private const val AUTOMIX = "app.ayham.extension.music.automix"
private const val SEEK_ACCESS = "Lapp/ayham/extension/music/features/SeekAccess;"

private const val LYRICS_GUARD = "Lapp/ayham/extension/music/features/LyricsGuard;"
private const val MORPHE_LYRICS_MATCH = "Lapp/morphe/extension/music/patches/lyrics/LyricsMatch;"
private const val MORPHE_LYRICS_CACHE = "Lapp/morphe/extension/music/patches/lyrics/storage/LyricsCache;"
private const val MORPHE_LYRICS_MODEL = "Lapp/morphe/extension/music/patches/lyrics/model/Lyrics;"
private const val MORPHE_CROSSFADE = "Lapp/morphe/extension/music/patches/CrossfadePatch;"
private const val MORPHE_EXO_ACCESS = "Lapp/morphe/extension/music/patches/CrossfadePatch\$ExoPlayerAccess;"

internal object MusicActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/youtube/music/activities/MusicActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * The player and everything around it: the BitChord screen (fullscreen and animated covers, canvas,
 * artist colours and pages, lyric line, best part, stats), automix with its transition editor and mix
 * files, lossless addons (with Dolby Atmos), the equalizer, and the "Fork settings" screen in Morphe's settings.
 * Everything that touches Morphe's own classes runs in finalize, which comes after every
 * patch's execute, so Morphe's extension classes and its ExoPlayer bridge are already there.
 * Each hook is optional: if its target is missing it logs and skips, the build never fails.
 */
val playerFeaturesPatch = patch(
    name = "BitChord player and automix",
    description = "BitChord's now-playing screen (fullscreen and animated covers, canvas, artist colours, lyric line, best part, stats), automix with a transition editor and mix files, lossless addons with Dolby Atmos, and an equalizer. Settings: Morphe settings > Fork settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    extendWith("extensions/extension.mpe")

    val log = Logger.getLogger("PlayerFeatures")

    execute {
        MusicActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $FEATURES->onActivityCreate(Landroid/app/Activity;)V",
        )
    }

    finalize {
        // Item 2a: Morphe's crossfade reads its length here; the trigger point is length + buffer.
        mutableClassDefByOrNull(MORPHE_CROSSFADE)?.let { crossfade ->
            crossfade.methods.firstOrNull {
                it.name == "getCrossfadeDurationMs" && it.returnType == "I" && it.parameterTypes.isEmpty() &&
                        AccessFlags.STATIC.isSet(it.accessFlags)
            }
                ?.let { method ->
                    val returns = method.instructions.withIndex()
                        .filter { it.value.opcode == Opcode.RETURN }
                        .map { it.index to (it.value as OneRegisterInstruction).registerA }
                    // at the label, so a branch that jumps straight to the return runs the hook too
                    returns.reversed().forEach { (index, register) ->
                        method.addInstructionsAtControlFlowLabel(
                            index,
                            """
                                invoke-static/range { v$register .. v$register }, $FEATURES->overrideCrossfadeDurationMs(I)I
                                move-result v$register
                            """,
                        )
                    }
                    log.info("Features: hooked getCrossfadeDurationMs (${returns.size} returns)")
                } ?: log.warning("Features: getCrossfadeDurationMs not found")

            // Automix: a pause (or the first step of a skip) stops a running mix.
            crossfade.methods.firstOrNull {
                it.name == "onPauseVideo" && it.parameterTypes.isEmpty() && AccessFlags.STATIC.isSet(it.accessFlags)
            }?.let { method ->
                method.addInstruction(0, "invoke-static {}, Lapp/ayham/extension/music/automix/Automix;->onPauseVideo()V")
                log.info("Features: hooked onPauseVideo")
            } ?: log.warning("Features: onPauseVideo not found")

            // Item 2b: the incoming player, right when Morphe starts fading it in.
            crossfade.methods.firstOrNull {
                it.name == "onPendingPlayerReady" && AccessFlags.STATIC.isSet(it.accessFlags) &&
                        it.parameterTypes.map(CharSequence::toString) == listOf(MORPHE_EXO_ACCESS)
            }?.let { method ->
                method.addInstruction(
                    0,
                    "invoke-static/range { p0 .. p0 }, $FEATURES->onIncomingPlayerReady(Ljava/lang/Object;)V",
                )
                log.info("Features: hooked onPendingPlayerReady")
            } ?: log.warning("Features: onPendingPlayerReady not found")
        } ?: log.warning("Features: Morphe crossfade class not in app, crossfade hooks skipped")

        // Item 3: seek on YT's ExoPlayer. Morphe already adds speed (patch_setPlaybackParameters).
        var exoImplType: String? = null
        classDefForEach { classDef ->
            if (MORPHE_EXO_ACCESS in classDef.interfaces) exoImplType = classDef.type
        }
        // Settings: our own rows in Morphe's settings screen (both the icon and plain variants).
        listOf("morphe_prefs.xml", "morphe_prefs_icons.xml", "morphe_prefs_icons_bold.xml").forEach { name ->
            resourceXmlOrNull("res/xml/$name")?.use { xml ->
                val root = xml.elements("PreferenceScreen").first()
                // All our settings in a screen of their own (Morphe opens nested screens itself); the
                // keys stay the same, so nothing set before is lost.
                root.insertChild(0, "PreferenceScreen") {
                setAttribute("android:key", "ayham_screen")
                setAttribute("android:title", "Fork settings")
                setAttribute("android:summary", "Player screen, artwork and canvas, lyrics, playback, downloads, automix and addons")
                // One switch per feature, stored by Morphe's settings screen in its own prefs file, in
                // groups (the keys are the same as before the groups, so nothing set is lost).
                listOf(
                    Triple("ayham_features", "Player screen", listOf(
                        Triple("ayham_ui", "BitChord player screen", "The now-playing screen laid out like BitChord: info lines, title, lyric line, seek bar, big controls, volume and output. YT's own buttons and menus stay underneath, so Morphe's settings still apply to them."),
                        Triple("ayham_fullArt", "Fullscreen cover art", "On the BitChord screen in portrait, the cover fills the top of the screen and fades into the colours below while a song plays (or its animated cover shows); paused, it goes back to a card. Also in the player's … menu."),
                        Triple("ayham_stats", "Stats lines", "The audio format (codec, bitrate, channels, itag) and automix's status for this and the next song."),
                        Triple("ayham_bestPartButton", "Best part button", "A button under the seek bar jumps to the song's best part (the part people replay most, or the one you set by holding it) early in the song. Off: only the mark on the bar and the menu's Play from the best part stay."),
                    )),
                    Triple("ayham_cat_art", "Artwork and canvas", listOf(
                        Triple("ayham_canvas", "Animated covers", "The album's motion art from Apple Music plays muted over YT's art, where the album has one. Off: Apple is never asked. Also in the player's … menu."),
                        Triple("ayham_canvasSpotify", "Canvas", "A full-screen video behind the player where the song has one (its Spotify canvas, or a loop of its music video). Off: neither is looked up. Also in the player's … menu."),
                        Triple("ayham_artistArt", "Artist colours", "The player takes the artist's colours and photo from their Apple Music page."),
                    )),
                    Triple("ayham_cat_lyrics", "Lyrics", listOf(
                        Triple("ayham_lyricLine", "Lyric line", "The current synced lyric line under the title (Morphe's lyrics; needs its third-party lyrics on). Tap it to open the lyrics."),
                        Triple("ayham_lyricsRealTiming", "Lyrics by real timing", "The lyric line changes exactly on each line's start, with no lead for its slide. The line follows Morphe's lyrics offsets (its Lyrics offset setting and each song's offset in its lyrics panel)."),
                    )),
                    Triple("ayham_cat_playback", "Playback", listOf(
                        Triple("ayham_eq", "Equalizer", "A preset on YT's audio output and on automix's mixes. A change applies at once."),
                    )),
                    Triple("ayham_cat_downloads", "Downloads", listOf(
                        Triple("ayham_native", "Download popup", "Every download asks: the lossless file from your addons or YouTube's, and whether its lyrics, animated art and canvas are saved for offline. Off: YouTube's download only. Smart downloads are always YouTube's alone."),
                    )),
                ).forEach { (catKey, catTitle, switches) ->
                appendChild("PreferenceCategory") {
                    setAttribute("android:key", catKey)
                    setAttribute("android:title", catTitle)
                    switches.forEach { (key, title, summary) ->
                        appendChild("SwitchPreference") {
                            setAttribute("android:key", key)
                            setAttribute("android:title", title)
                            setAttribute("android:summary", summary)
                            setAttribute("android:defaultValue", if (key == "ayham_eq" || key == "ayham_lyricsRealTiming") "false" else "true")
                        }
                        // canvas.md §13: the sources in the order tried, mobile data, the qualities and the mode
                        if (key == "ayham_canvasSpotify") {
                            appendChild("app.ayham.extension.music.features.CanvasSourcesPreference") {
                                setAttribute("android:key", "ayham_canvas_sources")
                            }
                            // canvas.md §13 rule 9: the listener's own Spotify sign-in, asked first (§4 rule 0)
                            appendChild("app.ayham.extension.music.features.SpotifySignInPreference") {
                                setAttribute("android:key", "ayham_spotify_signin")
                                setAttribute("android:dependency", "ayham_canvasSpotify")
                            }
                            appendChild("SwitchPreference") {
                                setAttribute("android:key", "ayham_canvas_mobile")
                                setAttribute("android:title", "Off on mobile data")
                                setAttribute("android:summary", "On mobile data no canvas or animated cover is looked up or played.")
                                setAttribute("android:defaultValue", "false")
                            }
                            listOf(
                                Triple("ayham_canvas_apple_quality", "Animated cover quality", "720"),
                                Triple("ayham_canvas_yt_quality", "Music video canvas quality", "480"),
                                Triple("ayham_canvas_yt_mode", "Music video canvas mode", "clips"),
                            ).forEach { (k, t, d) ->
                                appendChild("$AUTOMIX.AutomixVersionPreference") {
                                    setAttribute("android:key", k)
                                    setAttribute("android:title", t)
                                    setAttribute("android:summary", "%s")
                                    setAttribute("android:defaultValue", d)
                                    setAttribute("android:dependency", if (k == "ayham_canvas_apple_quality") "ayham_canvas" else "ayham_canvasSpotify")
                                }
                            }
                        }
                        // canvas.md §13 rule 8: Apple's artist image and video on YT's artist pages, off by default
                        if (key == "ayham_artistArt") {
                            appendChild("SwitchPreference") {
                                setAttribute("android:key", "ayham_artist_images")
                                setAttribute("android:title", "Artist images")
                                setAttribute("android:summary", "An artist's page shows their Apple Music picture at the top, where Apple has the artist under that exact name.")
                                setAttribute("android:defaultValue", "false")
                            }
                            listOf(
                                Triple("ayham_artist_videos", "Artist videos", "follow"),
                                Triple("ayham_artist_video_quality", "Artist video quality", "720"),
                            ).forEach { (k, t, d) ->
                                appendChild("$AUTOMIX.AutomixVersionPreference") {
                                    setAttribute("android:key", k)
                                    setAttribute("android:title", t)
                                    setAttribute("android:summary", "%s")
                                    setAttribute("android:defaultValue", d)
                                }
                            }
                        }
                        if (key == "ayham_canvas") appendChild("app.ayham.extension.music.features.ClearCanvasCachePreference") {
                            setAttribute("android:key", "ayham_clear_canvas_cache")
                            setAttribute("android:dependency", "ayham_canvas")
                        }
                        // the download popup saves these with each downloaded song; a row empties one kind
                        if (key == "ayham_native") listOf("lyrics", "art", "canvas").forEach { kind ->
                            appendChild("app.ayham.extension.music.features.ClearOfflinePreference") {
                                setAttribute("android:key", "ayham_clear_dl_$kind")
                            }
                        }
                        if (key == "ayham_native") appendChild("app.ayham.extension.music.features.ExportDownloadsPreference") {
                            setAttribute("android:key", "ayham_export_downloads")
                        }
                        if (key == "ayham_eq") appendChild("$AUTOMIX.AutomixVersionPreference") {
                            setAttribute("android:key", "ayham_eq_preset")
                            setAttribute("android:title", "Equalizer preset")
                            setAttribute("android:summary", "%s")
                            setAttribute("android:defaultValue", "bass")
                            setAttribute("android:dependency", "ayham_eq")
                        }
                    }
                }
                }
                // Automix, as in the YT Music Extension's popup.
                appendChild("PreferenceCategory") {
                    setAttribute("android:key", "ayham_automix")
                    setAttribute("android:title", "Automix")
                    appendChild("SwitchPreference") {
                        setAttribute("android:key", "ayham_automix_enabled")
                        setAttribute("android:title", "Automix")
                        setAttribute("android:summary", "BitChord's automix: the playing and the next song are analysed on your device (tempo, downbeats, intro, outro, where it is sung). When a song ends on its own it loops an instrumental bar into the next song, or blends on a phrase with the next song matched to its tempo, or uses a filter mix, or leaves a pair it can't beatmatch to Morphe's crossfade.")
                        setAttribute("android:defaultValue", "true")
                    }
                    appendChild("$AUTOMIX.AutomixVersionPreference") {
                        setAttribute("android:key", "ayham_automix_version")
                        setAttribute("android:title", "Automix version")
                        setAttribute("android:summary", "%s. Classic: BitChord's automix with the phone's ideas: a blend point where the two songs don't sing over each other, a quick bass swap at the middle, the old song's highs fading while the new one opens up, blends that end where the music ends, the next song never more than a quarter in. Automix v2 (test): Classic with Orchard's rules: up to 4%% apart one song is sped up, 4-8%% both glide to meet; further apart, or with clashing bass styles, a beatless bridge or a straight hand-over; a blend both songs would sing over becomes a drop-in or a muffle, and keys are always checked.")
                        setAttribute("android:defaultValue", "2")
                        setAttribute("android:dependency", "ayham_automix_enabled")
                    }
                    appendChild("SwitchPreference") {
                        setAttribute("android:key", "ayham_automix_key_aware")
                        setAttribute("android:title", "Shorter blend when keys clash")
                        setAttribute("android:summary", "Classic only (Automix v2 always checks keys). Two songs in keys that don't go together get a short blend (2 bars, about 4-6 s) so the out-of-tune moment is brief. Keys that go together (the same, relative major/minor, a neighbour on the Camelot wheel) keep the normal length.")
                        setAttribute("android:defaultValue", "false")
                    }
                    appendChild("$AUTOMIX.AutomixVersionPreference") {
                        setAttribute("android:key", "ayham_automix_bars")
                        setAttribute("android:title", "Blend length")
                        setAttribute("android:summary", "%s")
                        setAttribute("android:defaultValue", "auto")
                        setAttribute("android:dependency", "ayham_automix_enabled")
                    }
                    appendChild("$AUTOMIX.AnalysedSongsPreference") {
                        setAttribute("android:key", "ayham_automix_saved")
                    }
                    appendChild("$AUTOMIX.MixFilesPreference") {
                        setAttribute("android:key", "ayham_automix_mix_files")
                    }
                }
                // Addons: songs played from the user's own addons, fitted to YouTube's audio.
                appendChild("PreferenceCategory") {
                    setAttribute("android:key", "ayham_addons_category")
                    setAttribute("android:title", "Addons")
                    appendChild("SwitchPreference") {
                        setAttribute("android:key", "ayham_addons")
                        setAttribute("android:title", "Play from addons")
                        setAttribute("android:summary", "Songs play from your addons when one has them (lossless where it can): the file is fetched ahead, lined up with YouTube's audio and matched to its loudness. YouTube plays the song until the addon's audio is ready and takes over again if the file fails.")
                        setAttribute("android:defaultValue", "false")
                    }
                    appendChild("app.ayham.extension.music.addons.AddonLinksPreference") {
                        setAttribute("android:key", "ayham_addon_links_ui")
                        setAttribute("android:dependency", "ayham_addons")
                    }
                    appendChild("SwitchPreference") {
                        setAttribute("android:key", "ayham_addon_mobile")
                        setAttribute("android:title", "Off on mobile data")
                        setAttribute("android:summary", "On mobile data songs play YouTube's audio: no addon is asked or streamed, and addon downloads wait for Wi-Fi.")
                        setAttribute("android:defaultValue", "false")
                        setAttribute("android:dependency", "ayham_addons")
                    }
                    appendChild("$AUTOMIX.AutomixVersionPreference") {
                        setAttribute("android:key", "ayham_addon_slack")
                        setAttribute("android:title", "Length match")
                        setAttribute("android:summary", "%s. How far an addon's file may be from YouTube's length.")
                        setAttribute("android:defaultValue", "5")
                        setAttribute("android:dependency", "ayham_addons")
                    }
                    appendChild("SwitchPreference") {
                        setAttribute("android:key", "ayham_addon_atmos")
                        setAttribute("android:title", "Dolby Atmos")
                        setAttribute("android:summary", "Where an addon has a song in Dolby Atmos, that version plays (on phones with a Dolby decoder), lined up with YouTube's audio like the others. Atmos is its own mix, so it can sound different from YouTube's. Also an Atmos choice in the download popup. Off: stereo only (songs downloaded in Atmos still play in Atmos).")
                        setAttribute("android:defaultValue", "false")
                        setAttribute("android:dependency", "ayham_addons")
                    }
                }
                }
                log.info("Features: settings row added to $name")
            } ?: log.warning("Features: $name not found")
        }

        // Stats for nerds: capture every player instance at the end of its constructors.
        exoImplType?.let { implType ->
            mutableClassDefBy(implType).methods.filter { it.name == "<init>" }.forEach { ctor ->
                val returns = ctor.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
                returns.reversed().forEach { index ->
                    ctor.addInstructionsAtControlFlowLabel(
                        index,
                        "invoke-static/range { p0 .. p0 }, Lapp/ayham/extension/music/features/PlayerTap;->capturePlayer(Ljava/lang/Object;)V",
                    )
                }
                log.info("Features: stats capture in $implType <init> (${returns.size} returns)")
            }
        }

        exoImplType?.let { implType ->
            // BasePlayer.seekTo(long): this.getCurrentMediaItemIndex(); seekTo(index, position, false).
            var seekRef: String? = null
            var type: String? = implType
            while (type != null && seekRef == null) {
                val classDef = classDefByOrNull(type) ?: break
                classDef.methods.firstOrNull { method ->
                    val insns = method.implementation?.instructions?.toList() ?: return@firstOrNull false
                    method.returnType == "V" &&
                            method.parameterTypes.map(CharSequence::toString) == listOf("J") &&
                            AccessFlags.FINAL.isSet(method.accessFlags) &&
                            insns.size == 5 &&
                            insns[0].opcode == Opcode.INVOKE_VIRTUAL &&
                            ((insns[0] as ReferenceInstruction).reference as MethodReference).let {
                                it.returnType == "I" && it.parameterTypes.isEmpty()
                            } &&
                            insns[3].opcode == Opcode.INVOKE_VIRTUAL &&
                            ((insns[3] as ReferenceInstruction).reference as MethodReference).let {
                                it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("I", "J", "Z")
                            }
                }?.let { seekRef = "${classDef.type}->${it.name}(J)V" }
                type = classDef.superclass
            }

            if (seekRef == null) {
                log.warning("Features: seekTo(long) not found in the hierarchy of $implType")
            } else {
                mutableClassDefBy(implType).apply {
                    interfaces.add(SEEK_ACCESS)
                    methods.add(
                        ImmutableMethod(
                            this.type,
                            "ayham_seekTo",
                            listOf(ImmutableMethodParameter("J", null, null)),
                            "V",
                            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                            null,
                            null,
                            MutableMethodImplementation(3),
                        ).toMutable().apply {
                            addInstructions(
                                0,
                                """
                                    invoke-virtual { p0, p1, p2 }, $seekRef
                                    return-void
                                """,
                            )
                        },
                    )
                }
                log.info("Features: added ayham_seekTo to $implType -> $seekRef")
            }

            // Automix: a gate at the start of ExoPlayer.setVolume(float), found as the
            // method Morphe's patch_setVolume bridge calls, so our mix can hold YT's players silent.
            val bridge = classDefByOrNull(implType)?.methods?.firstOrNull {
                it.name == "patch_setVolume" && it.parameterTypes.map(CharSequence::toString) == listOf("F")
            }
            val volumeRef = bridge?.implementation?.instructions?.firstNotNullOfOrNull { insn ->
                ((insn as? ReferenceInstruction)?.reference as? MethodReference)
                    ?.takeIf { it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("F") }
            }
            var gated = false
            var owner: String? = volumeRef?.definingClass
            while (volumeRef != null && owner != null && !gated) {
                val classDef = mutableClassDefByOrNull(owner) ?: break
                classDef.methods.firstOrNull { m ->
                    m.name == volumeRef.name && m.returnType == "V" &&
                            m.parameterTypes.map(CharSequence::toString) == listOf("F") && m.implementation != null
                }?.let { method ->
                    method.addInstructions(
                        0,
                        """
                            invoke-static/range { p0 .. p1 }, Lapp/ayham/extension/music/automix/Automix;->gate(Ljava/lang/Object;F)F
                            move-result p1
                        """,
                    )
                    gated = true
                    log.info("Features: volume gate in ${classDef.type}->${method.name}(F)V")
                }
                owner = classDef.superclass
            }
            if (!gated) log.warning("Features: setVolume not found (bridge=$bridge, ref=$volumeRef), no volume gate")
        } ?: log.warning("Features: no class implements Morphe's ExoPlayerAccess, seek skipped")

        // Lyrics: refuse wrong-language matches, and let a missed song be looked up once more.
        mutableClassDefByOrNull(MORPHE_LYRICS_MATCH)?.methods?.firstOrNull {
            it.name == "isValidLyrics" && it.parameterTypes.size == 2 && it.returnType == "Z" &&
                AccessFlags.STATIC.isSet(it.accessFlags)
        }?.takeIf { (it.implementation?.registerCount ?: 0) > 2 }?.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p0 .. p1 }, $LYRICS_GUARD->refuses(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :check
                const/4 v0, 0x0
                return v0
                :check
                nop
            """,
        )?.also { log.info("Features: hooked Morphe isValidLyrics") }
            ?: log.warning("Features: Morphe isValidLyrics not found")

        mutableClassDefByOrNull(MORPHE_LYRICS_CACHE)?.methods?.firstOrNull {
            it.name == "get" && it.parameterTypes.size == 3 && it.returnType == MORPHE_LYRICS_MODEL &&
                AccessFlags.STATIC.isSet(it.accessFlags)
        }?.takeIf { (it.implementation?.registerCount ?: 0) > 3 }?.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p0 .. p2 }, $LYRICS_GUARD->aroundCacheGet(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/Object;
                move-result-object v0
                if-eqz v0, :original
                # p1 (the source) is free here: the original code is skipped (const/16: p1 may be past v15)
                const/16 p1, 0x0
                aget-object v0, v0, p1
                check-cast v0, $MORPHE_LYRICS_MODEL
                return-object v0
                :original
                nop
            """,
        )?.also { log.info("Features: hooked Morphe LyricsCache.get") }
            ?: log.warning("Features: Morphe LyricsCache.get not found")
    }
}
