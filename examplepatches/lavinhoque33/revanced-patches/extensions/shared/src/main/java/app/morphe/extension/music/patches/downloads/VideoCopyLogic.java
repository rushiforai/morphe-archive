/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 * Modified by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.util.List;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;

/**
 * What the video copy of a song is and when it can be taken: the adaptive pair of the song's music video, a 360p
 * video-only stream and the video's own selected-quality audio, which the app's own player plays and switches
 * between in place. Never the muxed progressive format, which only a framework player could open. Contains no
 * Android code.
 */
final class VideoCopyLogic {
    /** The video-only formats a copy may hold, in the order they are preferred: avc1, vp9 and av1 at 360p. */
    private static final int[] VIDEO_ITAGS = {134, 243, 396};
    /** Room that must stay free on the device after the copy is written. */
    static final long MIN_FREE_BYTES_AFTER = 200L * 1024 * 1024;

    /**
     * The format of what a copy stores, recorded in its commit. Raise it whenever the stored response or the way
     * the files are served changes, so a copy of an earlier format counts as no copy and the next save replaces it.
     * A commit without the field is the first adaptive pair (a minimal response with a muxed format and no player
     * configuration, which the app's framework player took offline); 2 stores the response of
     * {@link OfflineResponseTrim#fromVideoDownload} cut down to the details, the pair and two flags, which the app's
     * player selection did not select a video track from offline; 3 stores that response whole (every field the
     * saving request returned), with only the streaming data, the details' type and the ExoPlayer flags replaced.
     */
    static final int COPY_FORMAT = 3;

    private VideoCopyLogic() {}

    /** Whether a commit records the format this build stores; a commit without the field is the oldest format. */
    static boolean currentFormat(int recorded) {
        return recorded == COPY_FORMAT;
    }

    /** One stored stream: the format's itag and mime string verbatim, the file's length, the format's lmt. */
    record Stream(int itag, String mime, long length, long modified) {
        static Stream of(Format format) {
            return new Stream(format.getItag(), format.getMimeType(), format.getContentLength(),
                    format.getLastModified());
        }
    }

    /** A finished video download: both streams, the duration of the copy and the response stored with them. */
    record Download(Stream video, Stream audio, long durationMs, byte[] response) {}

    /** What a response offers for a copy: the two streams to save. */
    record Selection(Format video, Format audio) {
        long bytes() {
            return video.getContentLength() + audio.getContentLength();
        }
    }

    /** The two stored formats of a copy, read from its stored response. */
    record Stored(Format video, Format audio) {}

    static boolean supportedVideo(int itag, @Nullable String mime) {
        if (mime == null) return false;

        return switch (itag) {
            case 134, 396 -> mime.startsWith("video/mp4");
            case 243 -> mime.startsWith("video/webm");
            default -> false;
        };
    }

    /** A video-only format that can be downloaded: a plain url, a length, and the ranges the player reads. */
    private static boolean usable(Format format) {
        return !format.getUrl().isBlank() && format.getContentLength() > 0 && format.getLastModified() > 0
                && validRange(format.hasInitRange(), format.getInitRange().getStart(),
                format.getInitRange().getEnd(), format.getContentLength())
                && validRange(format.hasIndexRange(), format.getIndexRange().getStart(),
                format.getIndexRange().getEnd(), format.getContentLength());
    }

    private static boolean validRange(boolean present, long start, long end, long length) {
        return present && start >= 0 && end >= start && end < length;
    }

    /**
     * The streams to save out of a response: the preferred 360p video-only format that has everything a download
     * needs, and the selected-quality audio, or null when either is missing. The muxed format of the response is neither
     * downloaded nor kept, see {@link OfflineResponseTrim#fromVideoDownload}.
     */
    @Nullable
    static Selection select(PlayerResponse response, DownloadQuality quality) {
        List<Format> adaptive = response.getStreamingData().getAdaptiveFormatsList();
        Format video = null;
        for (int itag : VIDEO_ITAGS) {
            for (Format format : adaptive) {
                if (format.getItag() == itag && supportedVideo(itag, format.getMimeType()) && usable(format)) {
                    video = format;
                    break;
                }
            }
            if (video != null) break;
        }
        Format audio = DownloadFormats.bestAudio(response, true, quality);
        if (video == null || audio == null) return null;

        return new Selection(video, audio);
    }

    /** The stored formats of a copy: its two adaptive formats by itag. */
    @Nullable
    static Stored stored(PlayerResponse response, int videoItag, int audioItag) {
        Format storedVideo = null;
        Format storedAudio = null;
        for (Format format : response.getStreamingData().getAdaptiveFormatsList()) {
            if (format.getItag() == videoItag) storedVideo = format;
            else if (format.getItag() == audioItag) storedAudio = format;
        }
        if (storedVideo == null || storedAudio == null) return null;

        return new Stored(storedVideo, storedAudio);
    }

    /**
     * The online url a stored format may fall back to when its file goes missing: the online response's format with
     * the same itag, only when it is the same stream (same length and modification time), else null.
     */
    @Nullable
    static String fallbackUrl(Format stored, @Nullable Format online) {
        if (online == null || online.getItag() != stored.getItag()
                || !online.getMimeType().equals(stored.getMimeType())
                || online.getContentLength() != stored.getContentLength()
                || online.getLastModified() != stored.getLastModified()) return null;

        return StreamSwapLogic.onlineUrl(online.getUrl());
    }

    /** The online format of the same itag in a response, or null. */
    @Nullable
    static Format adaptiveOf(PlayerResponse response, int itag) {
        for (Format format : response.getStreamingData().getAdaptiveFormatsList()) {
            if (format.getItag() == itag) return format;
        }
        return null;
    }

    /** How much the online response's length may differ from the stored copy's: the same cut, not another one. */
    static final long SAME_CUT_TOLERANCE_SECONDS = 3;

    /** The online response describes the same cut: its length is unknown, or within the tolerance. */
    static boolean sameLength(long onlineLengthSeconds, long copyDurationMs) {
        if (onlineLengthSeconds <= 0 || copyDurationMs <= 0) return true;

        return Math.abs(onlineLengthSeconds - copyDurationMs / 1000) <= SAME_CUT_TOLERANCE_SECONDS;
    }

    /**
     * The string of the text a finished stream-only playlist download shows. Nothing was downloaded, audio or video,
     * only when no track and no video was saved now; the text names the videos only when the list has some.
     */
    static String completionKey(int audioDownloaded, int videosSaved, int videos) {
        boolean nothingNew = audioDownloaded == 0 && videosSaved == 0;
        String prefix = nothingNew
                ? "morphe_music_playlist_stream_already_saved" : "morphe_music_playlist_stream_complete";
        return videos > 0 ? prefix + "_videos" : prefix;
    }

    static boolean hasRoomFor(long freeBytes, long length) {
        return freeBytes - length >= MIN_FREE_BYTES_AFTER;
    }

    /**
     * The format a played copy is announced with: the stored one, with the local url of its file and its real length,
     * and the duration of the copy when the stored format has none. Every other field, the mime and codecs string
     * above all, stays as the server wrote it.
     */
    static Format local(Format stored, String url, long length, long durationMs) {
        Format.Builder local = stored.toBuilder().setUrl(url).clearSignatureCipher().setContentLength(length);
        if (local.getApproxDurationMs() <= 0 && durationMs > 0) local.setApproxDurationMs(durationMs);
        return local.build();
    }
}
