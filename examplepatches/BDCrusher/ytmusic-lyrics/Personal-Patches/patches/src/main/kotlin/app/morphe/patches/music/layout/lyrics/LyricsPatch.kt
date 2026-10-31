/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2269
 * https://github.com/MorpheApp/morphe-patches/pull/3033
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.music.layout.lyrics

import app.bdcrusher.ytmusic.nativeentry.installNativeLyricsHooks
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patches.all.misc.resources.addResourcesPatch
import app.morphe.patches.music.misc.extension.sharedExtensionPatch
import app.morphe.patches.music.misc.litho.filter.lithoFilterPatch
import app.morphe.patches.music.misc.settings.PreferenceScreen
import app.morphe.patches.music.misc.settings.settingsPatch
import app.morphe.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.shared.hookMediaSessionArgument
import app.morphe.patches.music.video.information.musicVideoInformationPatch
import app.morphe.patches.shared.MediaSessionSetMetadataFingerprint
import app.morphe.patches.shared.MediaSessionSetPlaybackStateFingerprint
import app.morphe.patches.shared.misc.litho.filter.addLithoFilter
import app.morphe.patches.shared.misc.settings.preference.InputType
import app.morphe.patches.shared.misc.settings.preference.ListPreference
import app.morphe.patches.shared.misc.settings.preference.NonInteractivePreference
import app.morphe.patches.shared.misc.settings.preference.PreferenceCategory
import app.morphe.patches.shared.misc.settings.preference.PreferenceScreenPreference.Sorting
import app.morphe.patches.shared.misc.settings.preference.SwitchPreference
import app.morphe.patches.shared.misc.settings.preference.TextPreference
import app.morphe.patches.shared.misc.settings.preference.screenInfoPreferenceCategory
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import java.util.logging.Logger

private const val EXTENSION_CLASS = "Lapp/morphe/extension/music/patches/lyrics/LyricsPatch;"
private const val PANEL_INSTALLER_CLASS = "Lapp/morphe/extension/music/patches/lyrics/ui/LyricsPanelInstaller;"
private const val LOCKSCREEN_CLASS = "Lapp/morphe/extension/music/patches/lyrics/session/LockScreenLyrics;"
private const val MINIPLAYER_LYRICS_CLASS = "Lapp/morphe/extension/music/patches/lyrics/session/MiniplayerLyrics;"

private const val LYRICS_PANEL_FILTER =
    "Lapp/morphe/extension/music/patches/components/LyricsPanelFilter;"

private object BetterLyricsAssets

@Suppress("unused")
val lyricsPatch = bytecodePatch(
    name = "Third-party lyrics",
    description = "BDCrusher’s personal Better Lyrics renderer, sources, background vocals and singer placement. Replaces the native Third-party lyrics panel."
) {
    category("Full Collection")
    dependsOn(app.bdcrusher.ytmusic.nativeentry.fullEditionGuard)
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        addResourcesPatch,
        lithoFilterPatch,
        musicVideoInformationPatch,
        // The copy and romanize buttons need their icons whether the patches
        // that own these resources are applied.
        resourcePatch {
            execute {
                val assets = listOf("index.html", "host.css", "renderer.js", "variables.css",
                    "lyrics.css", "image-highlights.css", "instrumental.css", "Satoshi-Variable.woff2", "NOTICE.txt", "providers.json",
                    "bd_lyrics_syllable.xml", "bd_lyrics_word.xml", "bd_lyrics_line.xml", "bd_lyrics_unsynced.xml")
                assets.forEach { name ->
                    val destination = this["assets/bdcrusher-lyrics/$name"]
                    destination.parentFile.mkdirs()
                    val stream = BetterLyricsAssets::class.java.classLoader!!.getResourceAsStream("bdcrusher-lyrics/$name")
                        ?: throw IllegalStateException("Missing bundled lyric asset: $name")
                    stream.use { input -> destination.outputStream().use { output -> input.copyTo(output) } }
                }
                copyResources(
                    "copyvideolinkbutton",
                    ResourceGroup("drawable", "morphe_yt_copy_bold.xml")
                )
                copyResources(
                    "romanisationbutton",
                    ResourceGroup("drawable", "morphe_yt_romanize.xml")
                )
            }
        }
    )

    compatibleWith(Compatibility(
        packageName = "com.google.android.apps.youtube.music",
        name = "YouTube Music",
        apkFileType = COMPATIBILITY_YOUTUBE_MUSIC.apkFileType,
        appIconColor = COMPATIBILITY_YOUTUBE_MUSIC.appIconColor,
        signatures = COMPATIBILITY_YOUTUBE_MUSIC.signatures,
        targets = listOf(AppTarget(version="9.43.51",versionCodes=mapOf(SupportedAbi.ARM64_V8A to 94351240),minSdk=26,isExperimental=true), AppTarget(
            version = "9.42.52",
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 94252240),
            minSdk = 26,
            isExperimental = true
        ))
    ))

    execute {
        installNativeLyricsHooks()
        PreferenceScreen.LYRICS.addPreferences(
            SwitchPreference("morphe_music_lyrics_enabled", summary = true),
        )

        // The panel content is built by Elements, so there is no view to hook. The timed
        // lyrics component is the earliest signal that the opened panel is the lyrics one.
        addLithoFilter(LYRICS_PANEL_FILTER)

        // Some accounts get the panel without a heading, and then nothing in the view tree
        // tells the lyrics panel from the other panels sharing the same container. The panel
        // the app itself put in the container is what tells them apart. Panels with a
        // heading do not need this, so a miss here leaves the rest of the patch working.
        val log = Logger.getLogger(this::class.java.name)
        runCatching {
            EngagementPanelControllerFingerprint.classDef.apply {
                val controllerType = type

                // Only instance fields the controller reassigns can hold the panel it shows,
                // and leaving the primitive ones out keeps flags from matching as a type.
                val panelFieldTypes = fields.filter { field ->
                    field.type.startsWith("L") &&
                        !AccessFlags.STATIC.isSet(field.accessFlags) &&
                        !AccessFlags.FINAL.isSet(field.accessFlags)
                }.mapTo(mutableSetOf()) { it.type }

                // The only method taking that type along with a flag is the one that assigns it.
                val setCurrentPanel = methods.single { method ->
                    method.returnType == "V" &&
                        method.parameterTypes.size == 2 &&
                        method.parameterTypes[1].toString() == "Z" &&
                        method.parameterTypes[0].toString() in panelFieldTypes
                }
                val panelType = setCurrentPanel.parameterTypes.first().toString()

                setCurrentPanel.apply {
                    // Hooked after the assignment, because the argument is cleared to null
                    // before it when the panel is being closed rather than shown. The panel
                    // is also handed to other objects here, so the owner is checked too.
                    val assignIndex = indexOfFirstInstructionOrThrow {
                        opcode == Opcode.IPUT_OBJECT &&
                            getReference<FieldReference>()?.let { field ->
                                field.type == panelType && field.definingClass == controllerType
                            } == true
                    }
                    addInstruction(
                        assignIndex + 1,
                        "invoke-static { p1 }, " +
                            "$PANEL_INSTALLER_CLASS->onEngagementPanelChanged(Ljava/lang/Object;)V"
                    )
                }
            }
        }.onFailure {
            log.warning(
                "Engagement panel controller not found, a lyrics panel shown without a " +
                    "heading will not be used: ${it.message}"
            )
        }

        MediaSessionSetMetadataFingerprint.hookMediaSessionArgument(
            "$EXTENSION_CLASS->onSetMetadata(Landroid/media/MediaMetadata;)V"
        )

        MediaSessionSetMetadataFingerprint.let {
            it.clearMatch()
            val method = it.method
            val index = it.instructionMatches.last().index
            val instruction = method.getInstruction<FiveRegisterInstruction>(index)
            val sessionRegister = instruction.registerC
            val metadataRegister = instruction.registerD
            method.addInstruction(
                index,
                "invoke-static { v$sessionRegister, v$metadataRegister }, " +
                    "$LOCKSCREEN_CLASS->onMediaSessionSetMetadata(Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;)V"
            )
            method.addInstruction(
                index,
                "invoke-static { v$sessionRegister, v$metadataRegister }, " +
                    "$MINIPLAYER_LYRICS_CLASS->onMediaSessionSetMetadata(Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;)V"
            )
        }

        MediaSessionSetPlaybackStateFingerprint.hookMediaSessionArgument(
            "$EXTENSION_CLASS->onSetPlaybackState(Landroid/media/session/PlaybackState;)V"
        )
    }
}
