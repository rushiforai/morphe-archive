/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/1856
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.music.interaction.scrobbling

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.music.shared.MediaSessionSetMetadataFingerprint
import app.tada.patches.music.shared.hookMediaSessionArgument
import app.tada.patches.music.video.information.musicVideoInformationPatch
import app.tada.patches.shared.layout.returnyoutubedislike.DislikeFingerprint
import app.tada.patches.shared.layout.returnyoutubedislike.EndpointServiceNameFingerprint
import app.tada.patches.shared.layout.returnyoutubedislike.likeEndpointParserFingerprint
import app.tada.patches.shared.layout.returnyoutubedislike.requestParameterCheckFingerprint
import app.tada.patches.shared.MediaSessionSetPlaybackStateFingerprint
import app.tada.patches.shared.misc.settings.preference.NonInteractivePreference
import app.tada.patches.shared.misc.settings.preference.PreferenceCategory
import app.tada.patches.shared.misc.settings.preference.PreferenceScreenPreference.Sorting
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.shared.misc.settings.preference.TextPreference
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS = "Lapp/morphe/extension/music/patches/scrobbling/ScrobblePatch;"

@Suppress("unused")
val scrobblingPatch = bytecodePatch(
    name = "Scrobbling",
    description = "Adds options to add played tracks to Last.fm and ListenBrainz."
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        // The video id tells whether the album patch is playing the song of the track instead.
        musicVideoInformationPatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        PreferenceScreen.SCROBBLING.addPreferences(
            PreferenceCategory(
                key = "tada_music_listenbrainz",
                preferences = setOf(
                    SwitchPreference(
                        key = "tada_music_listenbrainz_enabled",
                        titleKey = "tada_music_scrobbling_enabled_title"
                    ),
                    NonInteractivePreference(
                        key = "tada_music_listenbrainz_token",
                        titleKey = "tada_music_listenbrainz_token_title",
                        summaryKey = null,
                        tag = "app.morphe.extension.music.settings.preference.ListenBrainzTokenPreference",
                        selectable = true
                    ),
                    SwitchPreference(
                        key = "tada_music_listenbrainz_now_playing",
                        titleKey = "tada_music_scrobbling_now_playing_title"
                    ),
                    NonInteractivePreference(
                        key = "tada_music_listenbrainz_min_song_duration",
                        titleKey = "tada_music_scrobbling_min_song_duration_title",
                        summaryKey = "tada_music_scrobbling_min_song_duration_summary",
                        tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference",
                        selectable = true
                    ),
                    NonInteractivePreference(
                        key = "tada_music_listenbrainz_delay_percent",
                        titleKey = "tada_music_scrobbling_delay_percent_title",
                        summaryKey = "tada_music_scrobbling_delay_percent_summary",
                        tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference",
                        selectable = true
                    ),
                    NonInteractivePreference(
                        key = "tada_music_listenbrainz_delay_seconds",
                        titleKey = "tada_music_scrobbling_delay_seconds_title",
                        summaryKey = "tada_music_scrobbling_delay_seconds_summary",
                        tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference",
                        selectable = true
                    )
                ),
                sorting = Sorting.UNSORTED
            ),
            PreferenceCategory(
                key = "tada_music_lastfm",
                preferences = setOf(
                    SwitchPreference(
                        key = "tada_music_lastfm_enabled",
                        titleKey = "tada_music_scrobbling_enabled_title"
                    ),
                    NonInteractivePreference(
                        key = "tada_music_lastfm_session_key",
                        titleKey = "tada_music_lastfm_token_title",
                        summaryKey = null,
                        tag = "app.morphe.extension.music.settings.preference.LastFMTokenPreference",
                        selectable = true
                    ),
                    SwitchPreference(
                        key = "tada_music_lastfm_now_playing",
                        titleKey = "tada_music_scrobbling_now_playing_title"
                    ),
                    SwitchPreference("tada_music_lastfm_love_on_like", summary = true),
                    NonInteractivePreference(
                        key = "tada_music_lastfm_min_song_duration",
                        titleKey = "tada_music_scrobbling_min_song_duration_title",
                        summaryKey = "tada_music_scrobbling_min_song_duration_summary",
                        tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference",
                        selectable = true
                    ),
                    NonInteractivePreference(
                        key = "tada_music_lastfm_delay_percent",
                        titleKey = "tada_music_scrobbling_delay_percent_title",
                        summaryKey = "tada_music_scrobbling_delay_percent_summary",
                        tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference",
                        selectable = true
                    ),
                    NonInteractivePreference(
                        key = "tada_music_lastfm_delay_seconds",
                        titleKey = "tada_music_scrobbling_delay_seconds_title",
                        summaryKey = "tada_music_scrobbling_delay_seconds_summary",
                        tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference",
                        selectable = true
                    )
                ),
                sorting = Sorting.UNSORTED
            ),
            PreferenceCategory(
                key = "tada_settings_music_scrobbling_metadata",
                preferences = setOf(
                    SwitchPreference("tada_music_scrobbling_metadata_cleanup"),
                    TextPreference("tada_music_scrobbling_custom_regex"),
                    SwitchPreference("tada_music_scrobbling_parse_title", summary = true),
                    SwitchPreference("tada_music_scrobbling_guess_album", summary = true)
                )
            ),
            NonInteractivePreference(
                key = "tada_music_scrobbling_about",
                titleKey = "tada_music_scrobbling_about_title",
                summaryKey = "tada_music_scrobbling_about_summary"
            )
        )

        MediaSessionSetPlaybackStateFingerprint.hookMediaSessionArgument(
            "$EXTENSION_CLASS->onSetPlaybackState(Landroid/media/session/PlaybackState;)V"
        )

        MediaSessionSetMetadataFingerprint.hookMediaSessionArgument(
            "$EXTENSION_CLASS->onSetMetadata(Landroid/media/MediaMetadata;)V"
        )

        // Hook like/dislike/remove like button clicks.
        val endPointServiceNameField = EndpointServiceNameFingerprint
            .instructionMatches.last().instruction.getReference<FieldReference>()!!
        val likeEndpointParserClass = DislikeFingerprint.classDef.superclass!!
        val videoIdField = requestParameterCheckFingerprint(likeEndpointParserClass)
            .instructionMatches.last().instruction.getReference<FieldReference>()!!

        likeEndpointParserFingerprint(likeEndpointParserClass).let {
            it.method.apply {
                val matchIndex = it.instructionMatches[1].index
                val insertIndex = matchIndex + 1
                val likeEndpointTargetClassRegister =
                    getInstruction<TwoRegisterInstruction>(matchIndex).registerA
                val registerProvider = getFreeRegisterProvider(
                    insertIndex, 2,
                    likeEndpointTargetClassRegister
                )
                val endPointServiceNameRegister = registerProvider.getFreeRegister()
                val videoIdRegister = registerProvider.getFreeRegister()

                addInstructions(
                    insertIndex,
                    """
                        iget-object v$endPointServiceNameRegister, p0, $endPointServiceNameField
                        iget-object v$videoIdRegister, v$likeEndpointTargetClassRegister, $videoIdField
                        invoke-static { v$endPointServiceNameRegister, v$videoIdRegister }, $EXTENSION_CLASS->onLikeClicked(Ljava/lang/String;Ljava/lang/String;)V
                    """
                )
            }
        }
    }
}
