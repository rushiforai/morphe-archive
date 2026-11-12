/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.net.URI;
import java.net.URISyntaxException;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.StreamingData;

/** Pure admission and proto transformation used by playback and the host tests. */
final class StreamSwapLogic {
    private StreamSwapLogic() {}

    static String gate(boolean mainThread) {
        return mainThread ? "main thread" : null;
    }

    static boolean supportedAudio(int itag, String mime) {
        return switch (itag) {
            case 249, 250, 251, 774 -> "audio/webm; codecs=\"opus\"".equals(mime);
            case 139 -> "audio/mp4; codecs=\"mp4a.40.5\"".equals(mime);
            case 140, 141 -> "audio/mp4; codecs=\"mp4a.40.2\"".equals(mime);
            default -> false;
        };
    }

    static String mismatch(RawAudioFiles.Entry raw, Format audio, PlayerResponse online) {
        if (!supportedAudio(audio.getItag(), audio.getMimeType())) return "unsupported audio";
        if (raw.itag() != audio.getItag()) return "itag differs";
        if (!raw.mime().equals(audio.getMimeType())) return "mime differs";
        if (raw.length() <= 0 || raw.length() != audio.getContentLength()) return "contentLength differs";
        if (raw.modified() <= 0 || raw.modified() != audio.getLastModified()) return "lmt differs or missing";
        if (online.getVideoDetails().getLengthSeconds() <= 0 || online.getStreamingData().hasHlsManifestUrl()) {
            return "live or segmented stream";
        }
        if (!validRange(audio.hasInitRange(), audio.getInitRange().getStart(),
                audio.getInitRange().getEnd(), raw.length())
                || !validRange(audio.hasIndexRange(), audio.getIndexRange().getStart(),
                audio.getIndexRange().getEnd(), raw.length())) return "missing or invalid ranges";
        return null;
    }

    /**
     * A download's own descriptor, not a different online codec or byte layout. Online metadata and features stay
     * live; only this format is substituted. Older copies without saved data still require an exact live match.
     */
    @Nullable
    static Format savedAudio(String videoId, RawAudioFiles.Entry raw, PlayerResponse online,
                             @Nullable PlayerResponse saved) {
        if (saved == null || !videoId.equals(saved.getVideoDetails().getVideoId())
                || !videoId.equals(online.getVideoDetails().getVideoId())
                || online.getVideoDetails().getLengthSeconds() <= 0
                || online.getStreamingData().hasHlsManifestUrl()
                || !VideoCopyLogic.sameLength(online.getVideoDetails().getLengthSeconds(),
                saved.getVideoDetails().getLengthSeconds() * 1000L)) return null;

        Format audio = VideoCopyLogic.adaptiveOf(saved, raw.itag());
        return audio != null && mismatch(raw, audio, saved) == null ? audio : null;
    }

    private static boolean validRange(boolean present, long start, long end, long length) {
        return present && start >= 0 && end >= start && end < length;
    }

    /**
     * The online fallback of a swapped format, or null. SABR responses (Music 9.40.51) have an empty Format.url: their
     * routing URL is StreamingData field 15, which the swap strips. Only a complete https URL can resume playback.
     */
    static String onlineUrl(String url) {
        if (url == null || url.isEmpty()) return null;
        try {
            URI uri = new URI(url);
            return "https".equals(uri.getScheme()) && uri.getHost() != null ? url : null;
        } catch (URISyntaxException ex) {
            return null;
        }
    }

    /** The loopback url a served stream is announced with; the data source finds the file by its token. */
    static String tokenUrl(String videoId, int itag, String kind, String key) {
        return "http://127.0.0.1:1/rvx?v=" + videoId + "&i=" + itag + "&m=" + kind + "&t=" + key;
    }

    /** Stock's exact host predicate, not a general loopback-address test. */
    static boolean isGuardedHost(String host) {
        return "127.0.0.1".equals(host) || "localhost".equals(host);
    }

    /** Only called after strict original-stream identity matching. */
    static PlayerResponse replaceAudio(PlayerResponse online, Format audio) {
        var streaming = online.getStreamingData().toBuilder().clearFormats().clearAdaptiveFormats()
                .addAdaptiveFormats(audio);
        streaming.clearServerAbrStreamingUrl();
        return withoutServerAbr(online, streaming);
    }

    /**
     * The response of a music video that has a video copy: its adaptive formats are exactly the copy's two streams,
     * played from their files, and it has no muxed formats. Any muxed format would make the app's player selection
     * hand the response to its framework player whenever the ExoPlayer engine declines it, and that player cannot
     * play the loopback tokens; the Video switch needs only the video mime of the adaptive format. No SABR route
     * and no HLS manifest remains that the player could prefer to the pair.
     */
    static PlayerResponse replacePair(PlayerResponse online, Format video, Format audio) {
        var streaming = online.getStreamingData().toBuilder().clearFormats().clearAdaptiveFormats()
                .addAdaptiveFormats(video).addAdaptiveFormats(audio).clearHlsManifestUrl();
        streaming.clearServerAbrStreamingUrl();
        return withoutServerAbr(online, streaming);
    }

    /** The response with this streaming data and no request hint that forces the player onto SABR. */
    private static PlayerResponse withoutServerAbr(PlayerResponse online, StreamingData.Builder streaming) {
        var replacement = online.toBuilder().setStreamingData(streaming);
        if (!online.hasPlayerConfig()) return replacement.build();

        return replacement.setPlayerConfig(withoutServerAbr(online.getPlayerConfig())).build();
    }

    /** The player configuration without the request hints that force the player onto SABR; the rest is kept. */
    static PlayerConfig withoutServerAbr(PlayerConfig config) {
        var common = config.getMediaCommonConfig();
        var routing = config.getPlaybackRoutingConfig();
        boolean stripCommon = common.hasMediaUstreamerRequestConfig() || common.hasEnableSabr();
        boolean stripForced = routing.getPreferredEngine() == 3;
        if (!stripCommon && !stripForced) return config;

        var player = config.toBuilder();
        if (stripCommon) {
            // Include opaque request hints; keep every unrelated field in the surrounding configuration.
            var withoutUstreamer = common.toBuilder().clearMediaUstreamerRequestConfig().clearEnableSabr().build();
            if (withoutUstreamer.getSerializedSize() == 0) {
                player.clearMediaCommonConfig();
            } else {
                player.setMediaCommonConfig(withoutUstreamer);
            }
        }
        if (stripForced) {
            var withoutForcedMode = routing.toBuilder().clearPreferredEngine().build();
            if (withoutForcedMode.getSerializedSize() == 0) {
                player.clearPlaybackRoutingConfig();
            } else {
                player.setPlaybackRoutingConfig(withoutForcedMode);
            }
        }
        return player.build();
    }

}
