/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/1856
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * modified by lavinhoque33, 2026-10-17: ported to the RVX fork. Morphe's SCROBBLING preference screen
 * is rebuilt with the fork's RVX settings XML (own top level screen), seek bars use the fork's inline
 * SliderPreference, and the video information dependency is dropped because the fork has no Morphe
 * "Play album songs" patch whose substitutions it was used for.
 */

package app.morphe.patches.music.interaction.scrobbling

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.ResourceUtils
import app.morphe.patches.music.utils.settings.ResourceUtils.addPreferenceCategory
import app.morphe.patches.music.utils.settings.ResourceUtils.editPreferenceCategory
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.shared.misc.media.MediaSessionSetMetadataFingerprint
import app.morphe.patches.shared.misc.media.MediaSessionSetPlaybackStateFingerprint
import app.morphe.patches.shared.misc.media.hookMediaSessionArgument
import app.morphe.patches.shared.misc.settings.preference.InputType
import app.morphe.util.adoptChild
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.w3c.dom.Element

private const val EXTENSION_CLASS = "Lapp/morphe/extension/music/patches/scrobbling/ScrobblePatch;"

private const val SLIDER_PREFERENCE =
    "app.morphe.extension.shared.settings.preference.SliderPreference"
private const val LISTENBRAINZ_TOKEN_PREFERENCE =
    "app.morphe.extension.music.settings.preference.ListenBrainzTokenPreference"
private const val LASTFM_TOKEN_PREFERENCE =
    "app.morphe.extension.music.settings.preference.LastFMTokenPreference"

private const val LISTENBRAINZ_ENABLED = "morphe_music_listenbrainz_enabled"
private const val LASTFM_ENABLED = "morphe_music_lastfm_enabled"

/**
 * Builds the Scrobbling screen: ListenBrainz, Last.fm and Metadata categories, plus the about text.
 *
 * Settings with a single parent switch also get an XML dependency on it, like the other RVX Music
 * screens. The metadata settings depend on either service being enabled, which only the extension
 * [app.morphe.extension.shared.settings.Setting.Availability] can express, so they rely on it alone.
 */
private val scrobblingResourcePatch = resourcePatch {
    dependsOn(settingsPatch)

    execute {
        fun Element.addSwitch(
            key: String,
            defaultValue: String,
            dependencyKey: String = "",
            titleKey: String = "${key}_title",
            summaryKey: String? = null,
        ) = adoptChild(ResourceUtils.SWITCH_PREFERENCE_TAG_NAME) {
            setAttribute("android:key", key)
            setAttribute("android:title", "@string/$titleKey")
            summaryKey?.let { setAttribute("android:summary", "@string/$it") }
            setAttribute("android:defaultValue", defaultValue)
            if (dependencyKey.isNotEmpty()) setAttribute("android:dependency", dependencyKey)
        }

        // The account preferences own their dialogs and summaries. Their keys deliberately differ from
        // the token settings, otherwise the settings fragment tries to sync them like a plain preference.
        fun Element.addAccount(key: String, tag: String, titleKey: String, dependencyKey: String) =
            adoptChild(tag) {
                setAttribute("android:key", key)
                setAttribute("android:title", "@string/$titleKey")
                setAttribute("android:selectable", "true")
                setAttribute("android:dependency", dependencyKey)
            }

        fun Element.addSlider(key: String, titleKey: String, summaryKey: String, dependencyKey: String) =
            adoptChild(SLIDER_PREFERENCE) {
                setAttribute("android:key", key)
                setAttribute("android:title", "@string/$titleKey")
                setAttribute("android:summary", "@string/$summaryKey")
                setAttribute("android:selectable", "true")
                setAttribute("android:dependency", dependencyKey)
            }

        fun Element.addServiceSettings(prefix: String, enabledKey: String) {
            addSlider(
                "${prefix}_min_song_duration",
                "morphe_music_scrobbling_min_song_duration_title",
                "morphe_music_scrobbling_min_song_duration_summary",
                enabledKey,
            )
            addSlider(
                "${prefix}_delay_percent",
                "morphe_music_scrobbling_delay_percent_title",
                "morphe_music_scrobbling_delay_percent_summary",
                enabledKey,
            )
            addSlider(
                "${prefix}_delay_seconds",
                "morphe_music_scrobbling_delay_seconds_title",
                "morphe_music_scrobbling_delay_seconds_summary",
                enabledKey,
            )
        }

        fun Element.addCategory(key: String, titleKey: String, block: Element.() -> Unit) =
            adoptChild(ResourceUtils.PREFERENCE_CATEGORY_TAG_NAME) {
                setAttribute("android:key", key)
                setAttribute("android:title", "@string/$titleKey")
                block()
            }

        addPreferenceCategory(CategoryType.SCROBBLING.value)
        editPreferenceCategory(CategoryType.SCROBBLING.value) {
            addCategory("morphe_music_listenbrainz", "morphe_music_listenbrainz_title") {
                addSwitch(LISTENBRAINZ_ENABLED, "false", titleKey = "morphe_music_scrobbling_enabled_title")
                addAccount(
                    "morphe_music_listenbrainz_account",
                    LISTENBRAINZ_TOKEN_PREFERENCE,
                    "morphe_music_listenbrainz_token_title",
                    LISTENBRAINZ_ENABLED,
                )
                addSwitch(
                    "morphe_music_listenbrainz_now_playing",
                    "false",
                    LISTENBRAINZ_ENABLED,
                    titleKey = "morphe_music_scrobbling_now_playing_title",
                )
                addServiceSettings("morphe_music_listenbrainz", LISTENBRAINZ_ENABLED)
            }

            addCategory("morphe_music_lastfm", "morphe_music_lastfm_title") {
                addSwitch(LASTFM_ENABLED, "false", titleKey = "morphe_music_scrobbling_enabled_title")
                addAccount(
                    "morphe_music_lastfm_account",
                    LASTFM_TOKEN_PREFERENCE,
                    "morphe_music_lastfm_token_title",
                    LASTFM_ENABLED,
                )
                addSwitch(
                    "morphe_music_lastfm_now_playing",
                    "false",
                    LASTFM_ENABLED,
                    titleKey = "morphe_music_scrobbling_now_playing_title",
                )
                addSwitch(
                    "morphe_music_lastfm_love_on_like",
                    "false",
                    LASTFM_ENABLED,
                    summaryKey = "morphe_music_lastfm_love_on_like_summary",
                )
                addServiceSettings("morphe_music_lastfm", LASTFM_ENABLED)
            }

            addCategory(
                "morphe_settings_music_scrobbling_metadata",
                "morphe_settings_music_scrobbling_metadata_title",
            ) {
                addSwitch(
                    "morphe_music_scrobbling_metadata_cleanup",
                    "true",
                    summaryKey = "morphe_music_scrobbling_metadata_cleanup_summary",
                )
                adoptChild(ResourceUtils.TEXT_PREFERENCE_TAG_NAME) {
                    setAttribute("android:key", "morphe_music_scrobbling_custom_regex")
                    setAttribute("android:title", "@string/morphe_music_scrobbling_custom_regex_title")
                    setAttribute("android:summary", "@string/morphe_music_scrobbling_custom_regex_summary")
                    setAttribute("android:inputType", InputType.TEXT.type)
                }
                addSwitch(
                    "morphe_music_scrobbling_parse_title",
                    "false",
                    summaryKey = "morphe_music_scrobbling_parse_title_summary",
                )
                addSwitch(
                    "morphe_music_scrobbling_guess_album",
                    "false",
                    summaryKey = "morphe_music_scrobbling_guess_album_summary",
                )
            }

            // Morphe shows the about text in an untitled info category; RVX Music categories carry a
            // title, so the existing "About" string is reused like the Return YouTube Dislike screen does.
            addCategory("morphe_music_scrobbling_about_category", "morphe_music_crossfade_about_title") {
                adoptChild("Preference") {
                    setAttribute("android:key", "morphe_music_scrobbling_about")
                    setAttribute("android:summary", "@string/morphe_music_scrobbling_about_summary")
                    setAttribute("android:selectable", "false")
                }
            }
        }
    }
}

@Suppress("unused")
val scrobblingPatch = bytecodePatch(
    name = "Scrobbling",
    description = "Adds options to add played tracks to Last.fm and ListenBrainz."
) {
    dependsOn(
        scrobblingResourcePatch,
        sharedExtensionPatch,
        settingsPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
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
