/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import android.net.Uri;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Loopback URLs are opaque engine-routing tokens, never HTTP endpoints; no listener or socket is needed. The raw
 * audio copy of a song and the two streams of a video copy (its video-only stream and its own audio) are announced
 * alike, one token each.
 */
final class StreamSwapSources {
    static final String KIND_RAW = "raw";
    /** The video-only stream of a video copy. */
    static final String KIND_VIDEO = "video";
    /** The audio stream of a video copy, the music video's own. */
    static final String KIND_VIDEO_AUDIO = "vaudio";

    /** What a token serves: a file of a kind (the raw audio copy or a stream of a video copy), itag and length. */
    record Served(String kind, File file, int itag, long length) {
        static Served of(RawAudioFiles.Entry raw) {
            return new Served(KIND_RAW, raw.file(), raw.itag(), raw.length());
        }

        static Served video(VideoCopyFiles.Entry copy) {
            return new Served(KIND_VIDEO, copy.video().file(), copy.video().itag(), copy.video().length());
        }

        static Served audio(VideoCopyFiles.Entry copy) {
            return new Served(KIND_VIDEO_AUDIO, copy.audio().file(), copy.audio().itag(), copy.audio().length());
        }
    }

    static final class Source {
        final String videoId;
        final Served served;
        /** Original https URL of the swapped format, null for SABR formats that have none. */
        final String online;
        final String key;
        final String token;
        final long fileModified;
        volatile boolean available = true;

        Source(String videoId, Served served, String online, String key, String token) {
            this.videoId = videoId;
            this.served = served;
            this.online = online;
            this.key = key;
            this.token = token;
            fileModified = served.file().lastModified();
        }

        String fallback() throws FileNotFoundException {
            if (online == null) {
                throw new FileNotFoundException("Local audio unavailable; reload player response: " + videoId);
            }
            return online;
        }
    }

    private static final String SESSION = UUID.randomUUID().toString();
    private static final AtomicLong sequence = new AtomicLong();
    private static final ConcurrentHashMap<String, Source> sources = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String, Source> latest = new ConcurrentHashMap<>();
    /** Tokens of one stream of a track stay valid for in-flight responses; older ones are dropped beyond this many. */
    static final int TOKENS_PER_VIDEO = 4;
    /** Issue order per stream (id and kind), guarded by the class monitor; the maps above stay readable without it. */
    private static final Map<String, ArrayDeque<Source>> issued = new HashMap<>();

    private StreamSwapSources() {}

    /** The format's own URL may be empty (SABR): the source then has no online fallback. */
    static Source issue(String videoId, RawAudioFiles.Entry raw, String formatUrl) {
        return issue(videoId, Served.of(raw), formatUrl);
    }

    /** The source of the video-only stream of a music video's copy, {@code videoId} being the music video's id. */
    static Source issueVideo(String videoId, VideoCopyFiles.Entry copy, String formatUrl) {
        return issue(videoId, Served.video(copy), formatUrl);
    }

    /** The source of the audio stream of a music video's copy. */
    static Source issueVideoAudio(String videoId, VideoCopyFiles.Entry copy, String formatUrl) {
        return issue(videoId, Served.audio(copy), formatUrl);
    }

    private static String streamKey(String videoId, String kind) {
        return videoId + "/" + kind;
    }

    private static synchronized Source issue(String videoId, Served served, String formatUrl) {
        String onlineUrl = StreamSwapLogic.onlineUrl(formatUrl);
        String streamKey = streamKey(videoId, served.kind());
        Source previous = latest.get(streamKey);
        if (previous != null && previous.available && previous.served.equals(served)
                && Objects.equals(previous.online, onlineUrl)) return previous;

        String key = SESSION + "-" + sequence.incrementAndGet();
        String uri = StreamSwapLogic.tokenUrl(videoId, served.itag(), served.kind(), key);
        Source source = new Source(videoId, served, onlineUrl, key, uri);
        sources.put(key, source);
        latest.put(streamKey, source);
        ArrayDeque<Source> history = issued.computeIfAbsent(streamKey, id -> new ArrayDeque<>());
        history.addLast(source);
        while (history.size() > TOKENS_PER_VIDEO) sources.remove(history.removeFirst().key);
        return source;
    }

    /** The issued source for a token key, or null once it was replaced by newer ones for the same track. */
    static Source lookup(String key) {
        return sources.get(key);
    }

    static Source find(Uri uri) {
        if (uri == null || !"http".equals(uri.getScheme()) || !"127.0.0.1".equals(uri.getHost())
                || uri.getPort() != 1 || !"/rvx".equals(uri.getPath())) return null;
        String token = uri.getQueryParameter("t");
        if (token == null) return null;
        Source source = lookup(token);
        if (source == null || !source.videoId.equals(uri.getQueryParameter("v"))
                || !Integer.toString(source.served.itag()).equals(uri.getQueryParameter("i"))
                || !source.served.kind().equals(uri.getQueryParameter("m"))) return null;
        return source;
    }

    static void invalidate(String videoId) {
        for (Source source : sources.values()) {
            if (source.videoId.equals(videoId)) source.available = false;
        }
        latest.values().removeIf(source -> source.videoId.equals(videoId));
    }

    /** Every stream copy was deleted: no issued source may serve from a file again. */
    static void invalidateAll() {
        for (Source source : sources.values()) source.available = false;
        latest.clear();
    }

    static void invalidateMissing() {
        for (Source source : sources.values()) {
            if (!source.served.file().isFile() || source.served.file().length() != source.served.length()) {
                source.available = false;
                latest.values().remove(source);
            }
        }
    }
}
