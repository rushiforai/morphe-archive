/*
 * Copyright (C) 2026 anddea
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Original author(s) (based on contributions):
 * - Jav1x (https://github.com/Jav1x)
 * - anddea (https://github.com/anddea)
 *
 * Ported to morphe-patches: https://github.com/MorpheApp/morphe-patches
 * Modified by: Jav1x (https://github.com/Jav1x)
 *
 * Licensed under the GNU General Public License v3.0.
 *
 * ------------------------------------------------------------------------
 * GPLv3 Section 7 – Attribution Notice
 * ------------------------------------------------------------------------
 *
 * This file contains substantial original work by the author(s) listed above.
 *
 * In accordance with Section 7 of the GNU General Public License v3.0,
 * the following additional terms apply to this file:
 *
 * 1. Attribution (Section 7(b)): This specific copyright notice and the
 *    list of original authors above must be preserved in any copy or
 *    derivative work. You may add your own copyright notice below it,
 *    but you may not remove the original one.
 *
 * 2. Origin (Section 7(c)): Modified versions must be clearly marked as
 *    such (e.g., by adding a "Modified by" line or a new copyright notice).
 *    They must not be misrepresented as the original work.
 *
 * ------------------------------------------------------------------------
 * Version Control Acknowledgement (Non-binding Request)
 * ------------------------------------------------------------------------
 *
 * While not a legal requirement of the GPLv3, the original author(s)
 * respectfully request that ports or substantial modifications retain
 * historical authorship credit in version control systems (e.g., Git),
 * listing original author(s) appropriately and modifiers as committers
 * or co-authors.
 */


package app.morphe.extension.youtube.patches.yandexvot;

import android.media.AudioTrack;

import java.lang.ref.WeakReference;

import app.morphe.extension.shared.Utils;

/**
 * Scales the volume of the original video audio while a translation is playing.
 * <p>
 * The multiplier is set explicitly by {@link YandexVoiceOverTranslationPatch}, so the original
 * audio keeps its volume until the translation is actually playing, and is restored as soon as
 * the translation stops.
 */
@SuppressWarnings("unused")
public final class YandexVotOriginalVolumePatch {
    private static final long ENFORCE_INTERVAL_MS = 50;

    private static volatile float currentMultiplier = 1.0f;
    private static volatile float lastBaseVolume = 1.0f;
    private static volatile boolean enforceScheduled;
    private static volatile WeakReference<AudioTrack> lastAudioTrackRef = new WeakReference<>(null);

    /**
     * Guard flag, true while this class is calling {@link AudioTrack#setVolume(float)},
     * so the bytecode hook does not apply the multiplier a second time.
     */
    private static volatile boolean applyingNow;

    private static float clamp01(float value) {
        if (Float.isNaN(value) || value < 0f) return 0f;
        return Math.min(value, 1f);
    }

    /**
     * Injection point. Called before {@link AudioTrack#setVolume(float)} of the video player.
     *
     * @param audioTrack Audio track receiving the volume.
     * @param volume     Volume the player set, between 0 and 1.
     * @return The volume to actually use.
     */
    public static float applyVolumeMultiplier(AudioTrack audioTrack, float volume) {
        if (applyingNow) return volume;

        if (audioTrack != null) {
            lastAudioTrackRef = new WeakReference<>(audioTrack);
        }
        lastBaseVolume = clamp01(volume);

        return clamp01(lastBaseVolume * currentMultiplier);
    }

    /**
     * Sets the multiplier of the original audio and applies it to the current audio track,
     * without waiting for the player to set the volume again.
     *
     * @param multiplier Multiplier between 0 and 1.
     */
    public static void setAudioMultiplier(float multiplier) {
        final float clamped = clamp01(multiplier);
        if (clamped == currentMultiplier) return;

        currentMultiplier = clamped;
        applyToActiveTrack();

        if (clamped != 1.0f) scheduleEnforce();
    }

    /**
     * Restores the original audio to its normal volume.
     */
    public static void clearAudioMultiplier() {
        setAudioMultiplier(1.0f);
    }

    /**
     * The player sets the volume again on its own for various reasons, such as a new audio track,
     * which would restore the original volume while a translation is playing.
     * Reapply the multiplier as long as it is in use.
     */
    private static void scheduleEnforce() {
        if (enforceScheduled) return;
        enforceScheduled = true;
        Utils.runOnMainThreadDelayed(YandexVotOriginalVolumePatch::enforceTick, ENFORCE_INTERVAL_MS);
    }

    private static void enforceTick() {
        enforceScheduled = false;
        // Stop the loop once the original volume is restored.
        if (currentMultiplier == 1.0f) return;

        applyToActiveTrack();
        scheduleEnforce();
    }

    private static void applyToActiveTrack() {
        AudioTrack audioTrack = lastAudioTrackRef.get();
        if (audioTrack == null) return;

        applyingNow = true;
        try {
            audioTrack.setVolume(clamp01(lastBaseVolume * currentMultiplier));
        } catch (Exception ignored) {
            // Track is released.
        } finally {
            applyingNow = false;
        }
    }

    private YandexVotOriginalVolumePatch() {
    }
}
