/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-23.
 */
package app.morphe.extension.music.patches;

import android.util.Log;

import java.util.List;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.settings.BaseSettings;

/** Selects encoded audio variants; never changes gain or the underlying format objects. */
@SuppressWarnings("unused") // Native hooks.
public final class MusicDrcSelection {
    private static final String TAG = "RVXMusicDRC";
    private static final int MAX_TRACE_PER_STAGE = 48;
    static final int ORIGINAL = 1;
    static final int DRC = 2;
    static final int SAME_TRACK_PAIR = 4;

    private static final class PlaybackPreference {
        private static final boolean PREFER_ORIGINAL = Settings.PREFER_ORIGINAL_AUDIO_STREAM.get();
    }

    private static final class Trace {
        private static final AtomicInteger offers = new AtomicInteger();
        private static final AtomicInteger selected = new AtomicInteger();
        private static final AtomicInteger reader = new AtomicInteger();
    }

    /** Implemented by the stock format model; these are fields of the server format, not preferences. */
    public interface Format {
        boolean rvxIsDrc();
        String rvxMimeType();
        String rvxAudioTrackId();
    }

    private MusicDrcSelection() {}

    public static boolean requestDrc(boolean original) {
        return !PlaybackPreference.PREFER_ORIGINAL && original;
    }

    /** 9.45 runs the stock filter in two paths, one before and one after final compatibility checks. */
    public static boolean useStockDrcGate(boolean original) {
        return !PlaybackPreference.PREFER_ORIGINAL && original;
    }

    public static boolean capabilityDrc(boolean stock, Format compatibleAudioFormat) {
        return PlaybackPreference.PREFER_ORIGINAL ? compatibleAudioFormat.rvxIsDrc() : stock;
    }

    public static void selectEligibleFormats(List<Format> candidates) {
        useStockFilter(candidates, false);
    }

    /** If the option owns this decision, skip the stock filter (which can empty a DRC-only list). */
    public static boolean useStockFilter(List<Format> candidates, boolean stockEnabled) {
        boolean preferOriginal = PlaybackPreference.PREFER_ORIGINAL;
        boolean trace = BaseSettings.DEBUG.get() && takeTrace(Trace.offers);
        if (!preferOriginal && !trace) return stockEnabled;

        int offered = selectOriginal(candidates, preferOriginal);
        if (trace) {
            Log.d(TAG, "stage=eligible-offers original=" + ((offered & ORIGINAL) != 0)
                    + " drc=" + ((offered & DRC) != 0) + " sameTrackPair=" + ((offered & SAME_TRACK_PAIR) != 0)
                    + " preferOriginal=" + preferOriginal + " disableNormalization=" + normalizationDisabled());
        }
        return !preferOriginal && stockEnabled;
    }

    static int selectOriginal(List<Format> candidates, boolean preferOriginal) {
        int offered = 0;
        for (int index = 0, count = candidates.size(); index < count; index++) {
            Format candidate = candidates.get(index);
            if (!isAudio(candidate)) continue;

            if (candidate.rvxIsDrc()) {
                offered |= DRC;
                if ((offered & SAME_TRACK_PAIR) == 0 && hasOriginalForTrack(candidates, candidate)) {
                    offered |= SAME_TRACK_PAIR;
                }
            } else {
                offered |= ORIGINAL;
            }
            if (offered == (ORIGINAL | DRC | SAME_TRACK_PAIR)) break;
        }
        if (preferOriginal && (offered & SAME_TRACK_PAIR) != 0) {
            candidates.removeIf(format -> format.rvxIsDrc() && isAudio(format)
                    && hasOriginalForTrack(candidates, format));
        }
        return offered;
    }

    private static boolean hasOriginalForTrack(List<Format> candidates, Format compressed) {
        String track = compressed.rvxAudioTrackId();
        for (int index = 0, count = candidates.size(); index < count; index++) {
            Format alternative = candidates.get(index);
            if (!alternative.rvxIsDrc() && isAudio(alternative)
                    && Objects.equals(track, alternative.rvxAudioTrackId())) return true;
        }
        return false;
    }

    private static boolean isAudio(Format format) {
        return format.rvxMimeType().startsWith("audio/");
    }

    /** Trace the actual format used to build a plain playback chunk, not a candidate or its itag. */
    public static void traceReaderFormat(Format format) {
        if (!BaseSettings.DEBUG.get() || Trace.reader.get() >= MAX_TRACE_PER_STAGE
                || !isAudio(format) || !takeTrace(Trace.reader)) return;

        traceFormat("plain-reader-format", format);
    }

    /** The source inspector calls this only for an active playhead's selected native audio format. */
    public static void traceActiveFormat(Format format) {
        if (!BaseSettings.DEBUG.get() || Trace.selected.get() >= MAX_TRACE_PER_STAGE
                || !isAudio(format) || !takeTrace(Trace.selected)) return;

        traceFormat("active-audio-format", format);
    }

    private static void traceFormat(String stage, Format format) {
        Log.d(TAG, "stage=" + stage + " isDrc=" + format.rvxIsDrc()
                + " preferOriginal=" + PlaybackPreference.PREFER_ORIGINAL
                + " disableNormalization=" + normalizationDisabled());
    }

    private static boolean normalizationDisabled() {
        // This is the existing normalization switch, despite its historical key name.
        return BaseSettings.DISABLE_DRC_AUDIO.get();
    }

    private static boolean takeTrace(AtomicInteger counter) {
        return counter.getAndUpdate(value -> Math.min(value + 1, MAX_TRACE_PER_STAGE)) < MAX_TRACE_PER_STAGE;
    }
}
