/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.pinedrama.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;
import app.morphe.extension.pinedrama.captions.TrackPreference;
import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.L10n;
import app.morphe.extension.pinedrama.settings.SettingsStatus;
import app.morphe.extension.pinedrama.settings.preference.ChoicePreference;
import app.morphe.extension.pinedrama.settings.preference.SectionHeadingPreference;
import app.morphe.extension.pinedrama.settings.preference.TogglePreference;
import app.morphe.extension.pinedrama.settings.preference.InputTextPreference;
import app.morphe.extension.pinedrama.settings.preference.NumberInputPreference;
import app.morphe.extension.pinedrama.speed.PlaybackSpeedPatch;

@SuppressWarnings("deprecation")
public final class PlaybackPreferenceCategory extends ConditionalPreferenceCategory {
    public PlaybackPreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle("Playback");
    }

    /** Whether this page has anything on it. The row into it asks the same question. */
    public static boolean isAvailable() {
        return SettingsStatus.playbackQualityEnabled || SettingsStatus.sdrPlaybackEnabled
                || SettingsStatus.h264PlaybackEnabled || SettingsStatus.playbackSpeedEnabled
                || SettingsStatus.autoAdvanceEnabled || SettingsStatus.videoFitEnabled
                || SettingsStatus.fullScreenHoldEnabled || SettingsStatus.keepPulledSoundsEnabled
                || SettingsStatus.landscapeEpisodesEnabled || SettingsStatus.subtitleDubPreferenceEnabled
                || SettingsStatus.backgroundPlayEnabled
                || SettingsStatus.showSeekbarEnabled || SettingsStatus.seekbarThumbnailEnabled || SettingsStatus.resumeVideoAfterScrollEnabled;
    }

    @Override
    public boolean getSettingsStatus() {
        return isAvailable();
    }

    @Override public void addPreferences(Context context) {
        if (SettingsStatus.autoAdvanceEnabled) {
            addPreference(new SectionHeadingPreference(context, "Auto-advance"));
            addPreference(new TogglePreference(context, "Auto-advance videos",
                    "Move to the next video when the current one ends. Pauses and open dialogs "
                            + "stop it. Restart PineDrama to apply this.",
                    Settings.AUTO_ADVANCE));
            addPreference(new NumberInputPreference(context, "Auto-advance session limit",
                    "Zero means no limit. Counts the videos HushPine advanced past for you, "
                            + "not the ones you swiped yourself, and starts again when the feed "
                            + "is rebuilt or you change this number.",
                    Settings.AUTO_ADVANCE_LIMIT, "%1$s video", "%1$s videos").zeroMeansOff());
            addPreference(new TogglePreference(context, "Hide PineDrama's Auto scroll button",
                    "Takes PineDrama's own Auto scroll action out of the video panel and the Auto "
                            + "scroll switch beside videos on tablets and unfolded foldables. "
                            + "Works with Auto-advance off too.",
                    Settings.AUTO_ADVANCE_HIDE_PANEL_ACTION));
            addPreference(new TogglePreference(context, "Auto-advance in search results",
                    "Also turns on PineDrama's own Auto scroll for videos opened from search. "
                            + "Restart PineDrama to apply this.",
                    Settings.AUTO_ADVANCE_SEARCH));
        }
        if (SettingsStatus.landscapeEpisodesEnabled) {
            addPreference(new SectionHeadingPreference(context, "Dramas"));
            addPreference(new TogglePreference(context, "Episodes in full screen",
                    "Swipe up for the next episode and down for the previous one without leaving "
                            + "full screen. The next episode starts when one ends, instead of "
                            + "the same one looping.",
                    Settings.LANDSCAPE_EPISODES));
        }
        if (SettingsStatus.subtitleDubPreferenceEnabled) {
            addPreference(new SectionHeadingPreference(context, "Subtitles"));
            addPreference(new InputTextPreference(context, "Subtitle priority",
                    "Language codes in the order you want them, separated by commas, like en, "
                            + "original. original means the video's own subtitle. Used when a "
                            + "video starts playing.",
                    Settings.SUBTITLE_PRIORITY)
                    .withCheck(TrackPreference::priorityProblem)
                    .withNameKeyboard());
            addPreference(new TogglePreference(context, "Force subtitle",
                    "Always use the first subtitle on your list that a video has, even with "
                            + "captions off. A video with none of them plays as usual. Turning "
                            + "captions off yourself lasts until the app restarts.",
                    Settings.FORCE_SUBTITLE));
            addPreference(new TogglePreference(context, "Force original subtitle",
                    "Always use the video's own subtitle, never a translated one, even with "
                            + "captions off. A video without one plays as usual.",
                    Settings.FORCE_ORIGINAL_SUBTITLE));
            addPreference(new SectionHeadingPreference(context, "Dubs"));
            addPreference(new InputTextPreference(context, "Dub priority",
                    "Language codes in the order you want them, separated by commas, like en, "
                            + "original. original means the video's own audio. Used when a "
                            + "video starts playing.",
                    Settings.DUB_PRIORITY)
                    .withCheck(TrackPreference::priorityProblem)
                    .withNameKeyboard());
            addPreference(new TogglePreference(context, "Force dub",
                    "Always use the first dub on your list that a video has, even with dubbing "
                            + "off. A video with none of them plays as usual.",
                    Settings.FORCE_DUB));
            addPreference(new TogglePreference(context, "Force original dub",
                    "Always play the video's own audio, never an AI dub.",
                    Settings.FORCE_ORIGINAL_DUB));
        }
        // None of these is auto-advance, and under its heading they read as parts of it: each keeps
        // you on the video you're on, paused behind the comments, held or stopped at its end, or
        // picked up where you left it.
        if (SettingsStatus.fullScreenHoldEnabled || SettingsStatus.resumeVideoAfterScrollEnabled) {
            addPreference(new SectionHeadingPreference(context, "Staying on a video"));
        }
        if (SettingsStatus.fullScreenHoldEnabled) {
            addPreference(new TogglePreference(context, "Stay on the video in full screen",
                    "When a video ends in full screen, stay on it instead of moving to the next "
                            + "one. Swiping still moves on.",
                    Settings.FULL_SCREEN_HOLD));
        }
        if (SettingsStatus.resumeVideoAfterScrollEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Resume videos after scrolling",
                    "Continue supported videos from where you stopped when you scroll back to them.",
                    Settings.RESUME_VIDEO_AFTER_SCROLL
            ));
        }
        // How the player itself behaves: the bar, the frame, the sound and what happens when you
        // leave. The bar rows were on App and the frame rows under Quality, which they aren't.
        if (SettingsStatus.showSeekbarEnabled || SettingsStatus.seekbarThumbnailEnabled
                || SettingsStatus.videoFitEnabled
                || SettingsStatus.keepPulledSoundsEnabled || SettingsStatus.backgroundPlayEnabled) {
            addPreference(new SectionHeadingPreference(context, "Player"));
        }
        if (SettingsStatus.showSeekbarEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Show the progress bar",
                    "Show PineDrama's own progress bar on videos where it's normally hidden.",
                    Settings.SHOW_SEEKBAR
            ));
        }
        if (SettingsStatus.showSeekbarEnabled && SettingsStatus.seekbarExtrasEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Show the time beside the progress bar",
                    "Show the time played and the video's length at the end of the progress bar "
                            + "while it's on screen.",
                    Settings.SEEKBAR_TIME
            ));
            addPreference(new ChoicePreference(context, "Where the time goes",
                    Settings.SEEKBAR_TIME_PLACEMENT,
                    new String[]{"Beside the bar", "Above the bar"},
                    new String[]{"beside", "above"})
                    .withNote("Above moves the caption and the buttons up a little so the time fits "
                            + "over the right end of the bar. When something else is in the way, the "
                            + "time goes beside the bar."));
            addPreference(new TogglePreference(
                    context,
                    "Full-width progress bar",
                    "Run the progress bar from one screen edge to the other, without the gap "
                            + "PineDrama leaves at each end.",
                    Settings.SEEKBAR_FULL_WIDTH
            ));
            addPreference(new TogglePreference(
                    context,
                    "Bigger progress bar handle",
                    "Draw a larger handle and a slightly thicker line on the progress bar, so it's "
                            + "easier to see where you are.",
                    Settings.SEEKBAR_BIG_HANDLE
            ));
        }
        if (SettingsStatus.showSeekbarEnabled && SettingsStatus.storySeekbarEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Seek bar on video stories",
                    "Add a thin line along the bottom of a video story that you can drag to go "
                            + "back or skip ahead. The time shows while you drag, and a tap on it "
                            + "still moves between stories.",
                    Settings.STORY_SEEKBAR
            ));
        }
        if (SettingsStatus.showSeekbarEnabled && SettingsStatus.soundSeekbarEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Seek bar on sound previews",
                    "Add a line along the bottom of a sound's cover while its preview plays, with "
                            + "the time played and the preview's length. Tap or drag it to move "
                            + "through the preview.",
                    Settings.SOUND_SEEKBAR
            ));
        }
        if (SettingsStatus.seekbarThumbnailEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Show the progress bar thumbnail",
                    "Show a video preview thumbnail while dragging the progress bar.",
                    Settings.SHOW_SEEKBAR_THUMBNAIL
            ));
        }
        if (SettingsStatus.videoFitEnabled) {
            TogglePreference fit = new TogglePreference(context, "Fit the video to the screen",
                    "Show the whole video instead of cropping it to the window. Nothing changes "
                            + "on a tall phone, where it already fits. On a folding phone opened "
                            + "up, a squarer screen or a split view the sides or the ends stop "
                            + "being cut off. Photo slideshows get the same treatment on a squarer screen.",
                    Settings.FIT_VIDEO_TO_SCREEN);
            TogglePreference fill = new TogglePreference(context, "Fill the screen with the video",
                    "Crop the video until it covers the whole window. On a tall phone the black "
                            + "strip PineDrama leaves under a video goes and so does a little of each side.",
                    Settings.FILL_VIDEO_TO_SCREEN);
            // One or the other: the whole video inside the window and the window covered can't
            // both hold, so turning either on turns the other off.
            fit.setOnPreferenceChangeListener((preference, value) -> {
                if (Boolean.TRUE.equals(value)) {
                    Settings.FILL_VIDEO_TO_SCREEN.save(false);
                    fill.setChecked(false);
                }
                return true;
            });
            fill.setOnPreferenceChangeListener((preference, value) -> {
                if (Boolean.TRUE.equals(value)) {
                    Settings.FIT_VIDEO_TO_SCREEN.save(false);
                    fit.setChecked(false);
                }
                return true;
            });
            addPreference(fit);
            addPreference(fill);
        }
        if (SettingsStatus.keepPulledSoundsEnabled) {
            addPreference(new TogglePreference(context, "Play sounds PineDrama pulled",
                    "Play the audio on videos PineDrama silenced because their sound was pulled for "
                            + "copyright or in your region. PineDrama may still say the sound isn't "
                            + "available.",
                    Settings.KEEP_PULLED_SOUNDS));
        }
        if (SettingsStatus.backgroundPlayEnabled) {
            addPreference(new TogglePreference(context, "Keep playing in the background",
                    "The video you're watching keeps playing to its end after you leave "
                            + "PineDrama or turn the screen off, with PineDrama's own media notification "
                            + "to pause it. PineDrama's background play switch stays on while this is "
                            + "on. Restart PineDrama to apply this.",
                    Settings.BACKGROUND_PLAY));
            addPreference(new TogglePreference(context, "Replay in the background",
                    "When a video ends while PineDrama plays in the background, it starts over "
                            + "instead of waiting for you to press Play in the notification. A "
                            + "call or another app's sound still pauses it.",
                    Settings.BACKGROUND_REPLAY));
        }

        if (SettingsStatus.playbackSpeedEnabled) {
            addPreference(new SectionHeadingPreference(context, "Speed"));
            addPreference(new TogglePreference(context, "Remember the last speed",
                    "Keep the speed you chose for the next video. Off, each new video "
                            + "starts at 1x and a manual choice lasts for that video only.",
                    Settings.REMEMBER_SPEED));
            addPreference(new TogglePreference(context, "Use a default playback speed",
                    "Start each new video at your default. A manual choice lasts until the video changes.",
                    Settings.DEFAULT_SPEED_ENABLED));
            addPreference(new ChoicePreference(context, "Default playback speed", Settings.DEFAULT_SPEED,
                    new String[]{"0.5x", "0.75x", "1x", "1.25x", "1.5x", "1.75x", "2x", "2.5x", "3x"},
                    new String[]{"0.5", "0.75", "1", "1.25", "1.5", "1.75", "2", "2.5", "3"}));
            String slowest = PlaybackSpeedPatch.speedLabel(PlaybackSpeedPatch.MIN_SPEED);
            String fastest = PlaybackSpeedPatch.speedLabel(PlaybackSpeedPatch.MAX_SPEED);
            InputTextPreference speeds = new InputTextPreference(context, "Speed menu choices",
                    L10n.f(context, "Up to %1$d speeds from %2$s to %3$s, separated by commas. Example: 0.5, 1, 1.5, 2, 2.5, 3. Leave empty for PineDrama's list. Restart PineDrama to apply this.",
                            PlaybackSpeedPatch.MAX_MENU_SPEEDS, slowest, fastest),
                    Settings.CUSTOM_SPEEDS);
            speeds.withNameKeyboard();
            speeds.withCheck(value -> {
                if (value == null || value.isEmpty()) return null;
                try { PlaybackSpeedPatch.parseMenuSpeeds(value); return null; }
                catch (IllegalArgumentException error) {
                    return L10n.f(context, "Enter up to %1$d comma-separated speeds from %2$s to %3$s",
                            PlaybackSpeedPatch.MAX_MENU_SPEEDS, slowest, fastest);
                }
            });
            speeds.setOnPreferenceChangeListener((preference, value) -> {
                if (value == null || value.toString().isEmpty()) return true;
                try { PlaybackSpeedPatch.parseMenuSpeeds(value.toString()); return true; }
                catch (IllegalArgumentException error) { return false; }
            });
            addPreference(speeds);
            addPreference(new ChoicePreference(context, "Speed while you hold the video", Settings.HOLD_SPEED,
                    new String[]{"1.25x", "1.5x", "1.75x", "2x", "2.5x", "3x"},
                    new String[]{"1.25", "1.5", "1.75", "2", "2.5", "3"}));
            if (SettingsStatus.holdSpeedSlideEnabled) {
                addPreference(new TogglePreference(context, "Slide to change the hold speed",
                        "While you hold a video, slide left or right to step through the speed menu's speeds, "
                                + "and a bubble shows the one you're on. Your next hold starts there. "
                                + "Letting go goes back to normal. A pull-down lock keeps the speed you slid to.",
                        Settings.HOLD_SPEED_SLIDE));
            }
        }
        if (SettingsStatus.playbackQualityEnabled || SettingsStatus.sdrPlaybackEnabled
                || SettingsStatus.h264PlaybackEnabled) {
            addPreference(new SectionHeadingPreference(context, "Quality"));
        }
        if (SettingsStatus.playbackQualityEnabled) {
            addPreference(new ChoicePreference(context, "Video playback quality", Settings.PLAYBACK_QUALITY,
                    new String[]{"Automatic", "Highest", "Lowest", "1080p", "720p", "540p", "480p", "360p"},
                    new String[]{"auto", "highest", "lowest", "1080", "720", "540", "480", "360"}));
            addPreference(new ChoicePreference(context, "On mobile data", Settings.PLAYBACK_QUALITY_METERED,
                    new String[]{"No limit", "Highest", "Lowest", "1080p", "720p", "540p", "480p", "360p"},
                    new String[]{"off", "highest", "lowest", "1080", "720", "540", "480", "360"}));
        }
        if (SettingsStatus.sdrPlaybackEnabled) {
            addPreference(new TogglePreference(context, "Play SDR instead of HDR",
                    "HDR videos light the screen extra bright. This plays the standard (SDR) "
                            + "version instead, so the screen doesn't jump to full brightness. "
                            + "Videos with no standard version still play in HDR.",
                    Settings.PLAY_SDR));
        }
        if (SettingsStatus.h264PlaybackEnabled) {
            addPreference(new TogglePreference(context, "Prefer H.264 video",
                    "Picks the older H.264 video format when PineDrama also offers a newer one "
                            + "(HEVC or ByteVC2). It helps phones that stutter or run hot. "
                            + "Videos without an H.264 version still play.",
                    Settings.PREFER_H264));
        }
    }
}
