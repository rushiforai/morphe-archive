/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3295
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 *
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.extension.music.patches.video;

import static app.morphe.extension.shared.utils.StringRef.str;
import static app.morphe.extension.shared.utils.Utils.showToastShort;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.patches.ExoPlayerInterface;
import app.morphe.extension.shared.settings.preference.SeekBarPreference;
import app.morphe.extension.shared.utils.Logger;

@SuppressWarnings("unused")
public class PlaybackSpeedPatch {

    private static final float DEFAULT_PLAYBACK_SPEED = 1.0f;

    /**
     * Speed and pitch last applied to each player.
     * More than one player can be alive at the same time, such as when crossfading.
     */
    private static final Map<ExoPlayerInterface, float[]> players =
            Collections.synchronizedMap(new WeakHashMap<>());

    /**
     * @return The speed of the playback speed setting, where 1.0 means the app speed is kept.
     */
    private static float getSettingSpeed() {
        return SeekBarPreference.clampToRange(Settings.PLAYBACK_SPEED) / 100f;
    }

    public static float getPlaybackSpeed(final float playbackSpeed) {
        try {
            return Settings.DEFAULT_PLAYBACK_SPEED.get();
        } catch (Exception ex) {
            Logger.printException(() -> "Failed to getPlaybackSpeed", ex);
        }
        return playbackSpeed;
    }

    public static void userSelectedPlaybackSpeed(final float playbackSpeed) {
        if (!Settings.REMEMBER_PLAYBACK_SPEED_LAST_SELECTED.get())
            return;

        Settings.DEFAULT_PLAYBACK_SPEED.save(playbackSpeed);

        if (!Settings.REMEMBER_PLAYBACK_SPEED_LAST_SELECTED_TOAST.get())
            return;

        showToastShort(str("revanced_remember_playback_speed_toast", playbackSpeed + "x"));
    }

    /**
     * Injection point.
     */
    public static void initializeExoPlayer(ExoPlayerInterface player) {
        try {
            // A new player starts with the default playback parameters.
            players.put(player, new float[]{DEFAULT_PLAYBACK_SPEED, DEFAULT_PLAYBACK_SPEED});
        } catch (Exception ex) {
            Logger.printException(() -> "initializeExoPlayer failure", ex);
        }
    }

    /**
     * Injection point. Called for every PlaybackParameters passed to ExoPlayer.setPlaybackParameters.
     *
     * @param speed Playback speed the app is setting.
     */
    public static float overridePlaybackSpeed(final float speed) {
        try {
            final float settingSpeed = getSettingSpeed();
            // At the default speed keep what the app sets, such as the podcast playback speed.
            return settingSpeed == DEFAULT_PLAYBACK_SPEED
                    ? speed
                    : settingSpeed;
        } catch (Exception ex) {
            Logger.printException(() -> "Failed to overridePlaybackSpeed", ex);
        }
        return speed;
    }

    /**
     * Injection point. Called for every PlaybackParameters passed to ExoPlayer.setPlaybackParameters.
     *
     * @param speed Playback speed the app is setting.
     * @param pitch Playback pitch the app is setting.
     */
    public static float overridePlaybackPitch(final float speed, final float pitch) {
        try {
            if (!Settings.PLAYBACK_SPEED_CHANGE_PITCH.get()) {
                return pitch;
            }

            final float overriddenSpeed = overridePlaybackSpeed(speed);
            Logger.printDebug(() -> "Playback pitch follows speed: " + overriddenSpeed + " (app pitch: " + pitch + ")");
            return overriddenSpeed;
        } catch (Exception ex) {
            Logger.printException(() -> "Failed to overridePlaybackPitch", ex);
        }
        return pitch;
    }

    /**
     * Injection point.
     * Called on the main thread about every second while a track is playing.
     * Applies a changed speed or pitch setting without waiting for the next track.
     */
    public static void setVideoTime(long time) {
        try {
            final float speed = getSettingSpeed();
            final float pitch = Settings.PLAYBACK_SPEED_CHANGE_PITCH.get()
                    ? speed
                    : DEFAULT_PLAYBACK_SPEED;

            List<Map.Entry<ExoPlayerInterface, float[]>> entries;
            synchronized (players) {
                entries = new ArrayList<>(players.entrySet());
            }

            for (Map.Entry<ExoPlayerInterface, float[]> entry : entries) {
                ExoPlayerInterface player = entry.getKey();
                float[] applied = entry.getValue();
                if (player == null || (applied[0] == speed && applied[1] == pitch)) {
                    continue;
                }

                // Set before applying, so a failure is not retried every second.
                applied[0] = speed;
                applied[1] = pitch;

                Logger.printDebug(() -> "Changing playback speed to: " + speed + " pitch: " + pitch);
                player.patch_setPlaybackParameters(speed, pitch);
            }
        } catch (Exception ex) {
            Logger.printException(() -> "setVideoTime failure", ex);
        }
    }
}
