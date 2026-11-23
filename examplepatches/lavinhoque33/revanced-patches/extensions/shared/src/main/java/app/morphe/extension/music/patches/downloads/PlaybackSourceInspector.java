/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-22.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.extension.music.patches.downloads;

/** Observed media input for the selected native playback, not a claim about the audio output device. */
@SuppressWarnings("unused") // Native hooks.
public final class PlaybackSourceInspector {
    public enum Source { UNCONFIRMED, CACHED_AUDIO, CACHED_VIDEO_AUDIO, CACHED_VIDEO }

    public record Snapshot(Source audio, Source video, int audioItag, int videoItag) {}

    /** Implemented on the native playback object; the inspector never retains its nonce or a URI. */
    public interface Playback {
        String rvxPlaybackNonce();
    }

    /** The native format-event receiver is allocated once per clip and shared by all its publishers. */
    public interface EventPlayback extends Playback {
        Object rvxPlaybackEvents();
    }

    /** Identity (not value equality) stands for one issued stream generation. Contains no media identifier. */
    public static final class LocalFormat {
        private final Source source;
        private final int itag;
        private boolean fellBack;

        LocalFormat(Source source, int itag) {
            this.source = source;
            this.itag = itag;
        }
    }

    /** Stored only on the fresh file reader until it actually returns bytes. */
    public static final class Read {
        private final Attempt attempt;
        private final LocalFormat format;

        private Read(Attempt attempt, LocalFormat format) {
            this.attempt = attempt;
            this.format = format;
        }

        public void returned(int byteCount) {
            if (byteCount > 0) {
                synchronized (LOCK) {
                    if (attempt.pending != this) return;

                    attempt.pending = null;
                    attempt.confirmed = format;
                    publish();
                }
            }
        }
    }

    private static final class Attempt {
        private LocalFormat confirmed;
        private Read pending;

        private void invalidate(LocalFormat format) {
            format.fellBack = true;
            if (confirmed == format) confirmed = null;
            if (pending != null && pending.format == format) pending = null;
        }

        private void select(LocalFormat format) {
            if (confirmed != format) confirmed = null;
            if (pending != null && pending.format != format) pending = null;
        }
    }

    private static final class Session {
        private final Object coordinator;
        private final Playback playback;
        private final Object events;
        private final boolean uniqueNonce;
        private final Attempt raw = new Attempt();
        private final Attempt videoAudio = new Attempt();
        private final Attempt video = new Attempt();
        private boolean publishedFormats;
        private LocalFormat selectedAudio;
        private LocalFormat selectedVideo;
        private int selectedAudioItag = -1;
        private int selectedVideoItag = -1;

        private Session(Object coordinator, Playback playback) {
            this.coordinator = coordinator;
            this.playback = playback;
            events = playback instanceof EventPlayback eventPlayback ? eventPlayback.rvxPlaybackEvents() : null;

            String nonce = playback.rvxPlaybackNonce();
            uniqueNonce = nonce != null && !nonce.isEmpty() && NonceHistory.rememberFresh(nonce);
        }

        private Attempt attempt(LocalFormat format) {
            return switch (format.source) {
                case CACHED_AUDIO -> raw;
                case CACHED_VIDEO_AUDIO -> videoAudio;
                case CACHED_VIDEO -> video;
                default -> throw new IllegalArgumentException();
            };
        }

        private boolean permits(LocalFormat candidate) {
            LocalFormat selected = candidate.source == Source.CACHED_VIDEO ? selectedVideo : selectedAudio;
            return selected == null || selected == candidate || selected.source != candidate.source;
        }

        private LocalFormat confirmed(LocalFormat selected) {
            return selected != null && attempt(selected).confirmed == selected ? selected : null;
        }

        private void clear() {
            raw.pending = null;
            videoAudio.pending = null;
            video.pending = null;
        }
    }

    private static final Object LOCK = new Object();
    /**
     * Fixed, process-local history of nonce hashes. Never evict bits: a stale nonce must not regain eligibility.
     * False positives withhold evidence; they cannot give an old clip ownership of the new clip's reads.
     * Called under LOCK, and initialized lazily on the first nonempty nonce.
     */
    private static final class NonceHistory {
        private static final long[] words = new long[8192];

        private static boolean rememberFresh(String nonce) {
            long hash = 0xcbf29ce484222325L;
            for (int index = 0; index < nonce.length(); index++) {
                hash = (hash ^ nonce.charAt(index)) * 0x100000001b3L;
            }

            // Double hashing gives four probes within the fixed power-of-two bit table.
            int slot = (int) hash;
            int stride = (int) (hash >>> 32) | 1;
            int mask = words.length * Long.SIZE - 1;
            boolean fresh = false;
            for (int probe = 0; probe < 4; probe++, slot += stride) {
                int bit = slot & mask;
                int index = bit / Long.SIZE;
                long flag = 1L << (bit % Long.SIZE);
                fresh |= (words[index] & flag) == 0;
                words[index] |= flag;
            }
            return fresh;
        }
    }

    private static final Snapshot UNKNOWN = new Snapshot(Source.UNCONFIRMED, Source.UNCONFIRMED, -1, -1);
    private static volatile Snapshot current = UNKNOWN;
    private static Session active;

    private PlaybackSourceInspector() {}

    public static Snapshot snapshot() {
        return current;
    }

    /** Enabled only when the native ownership, format and file-reader hooks are all present. */
    public static boolean supported() {
        return false;
    }

    public static void selectPlayback(Object coordinator, Playback playback) {
        synchronized (LOCK) {
            if (playback == null && (active == null || active.coordinator != coordinator)) return;
            if (active != null && active.coordinator == coordinator && active.playback == playback) return;

            if (active != null) active.clear();
            active = playback == null ? null : new Session(coordinator, playback);
            current = UNKNOWN;
        }
    }

    public static void selectFormats(Playback playback, LocalFormat audio, LocalFormat video, int audioItag,
                                     int videoItag) {
        synchronized (LOCK) {
            if (active == null || active.playback != playback || active.publishedFormats) return;
            updateFormats(audio, video, audioItag, videoItag);
        }
    }

    public static void selectPublishedFormats(Object events, LocalFormat audio, LocalFormat video, int audioItag,
                                              int videoItag) {
        synchronized (LOCK) {
            if (events == null || active == null || active.events != events) return;

            active.publishedFormats = true;
            updateFormats(audio, video, audioItag, videoItag);
        }
    }

    private static void updateFormats(LocalFormat audio, LocalFormat video, int audioItag, int videoItag) {
        if (audio != null && (audio.source == Source.CACHED_VIDEO || audio.itag != audioItag)) audio = null;
        if (video != null && (video.source != Source.CACHED_VIDEO || video.itag != videoItag)) video = null;
        if (audio != null) active.attempt(audio).select(audio);
        if (video != null) active.attempt(video).select(video);

        active.selectedAudio = audio;
        active.selectedVideo = video;
        active.selectedAudioItag = audioItag > 0 ? audioItag : -1;
        active.selectedVideoItag = videoItag > 0 ? videoItag : -1;
        publish();
    }

    static Read openLocal(String nonce, LocalFormat format) {
        synchronized (LOCK) {
            if (!matchesActive(nonce) || !active.permits(format)) return null;

            Attempt attempt = active.attempt(format);
            if (attempt.confirmed == format || format.fellBack) return null;

            return attempt.pending = new Read(attempt, format);
        }
    }

    static void openFallback(String nonce, LocalFormat format) {
        synchronized (LOCK) {
            if (!matchesActive(nonce) || !active.permits(format)) return;

            active.attempt(format).invalidate(format);
            publish();
        }
    }

    private static boolean matchesActive(String nonce) {
        return nonce != null && active != null && active.uniqueNonce
                && nonce.equals(active.playback.rvxPlaybackNonce());
    }

    private static void publish() {
        LocalFormat audio = active.confirmed(active.selectedAudio);
        LocalFormat video = active.confirmed(active.selectedVideo);
        Source audioSource = audio == null ? Source.UNCONFIRMED : audio.source;
        Source videoSource = video == null ? Source.UNCONFIRMED : video.source;
        int audioItag = active.selectedAudioItag;
        int videoItag = active.selectedVideoItag;

        Snapshot before = current;
        if (before.audio() != audioSource || before.video() != videoSource
                || before.audioItag() != audioItag || before.videoItag() != videoItag) {
            current = audioItag == -1 && videoItag == -1 ? UNKNOWN
                    : new Snapshot(audioSource, videoSource, audioItag, videoItag);
        }
    }
}
