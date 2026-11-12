/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.CodedOutputStream;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayabilityStatus;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Status;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.StreamingData;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.VideoDetails;

/**
 * Cuts a player response down to what an offline replay needs: the song's identity, the one stored audio format
 * (its url is empty: the replay puts its own local token there), its expiry, the loudness configuration and the
 * playback tracking. Everything else a response carries (streaming urls, SABR and ustreamer settings, other
 * formats, captions, ads, storyboards) is left out. Pure, so the host tests pin what is kept.
 */
final class OfflineResponseTrim {
    /**
     * What stock sends for a streaming response. Used only for a response built at download time, which has no
     * expiry of its own; the replay swaps the url for a local one, so the value merely satisfies the app's parser.
     */
    static final long DEFAULT_EXPIRES_SECONDS = 21_540;

    /** The playback tracking field of a player response; the generated message does not declare it. */
    private static final int PLAYBACK_TRACKING_FIELD = 9;
    private static final int PLAYBACK_TRACKING_TAG = (PLAYBACK_TRACKING_FIELD << 3) | 2;

    private OfflineResponseTrim() {}

    /**
     * The trimmed form of an online response, or null when it has no adaptive format with {@code itag}.
     * Unknown fields inside the kept messages survive, so the app's own parser still finds what it needs.
     */
    @Nullable
    static byte[] trim(byte[] responseBytes, int itag) throws IOException {
        PlayerResponse response = PlayerResponse.parseFrom(responseBytes);
        Format audio = null;
        for (Format format : response.getStreamingData().getAdaptiveFormatsList()) {
            if (format.getItag() == itag) {
                audio = format;
                break;
            }
        }
        if (audio == null) return null;

        StreamingData streaming = response.getStreamingData();
        long expires = streaming.hasExpiresInSeconds() ? streaming.getExpiresInSeconds() : DEFAULT_EXPIRES_SECONDS;
        PlayerConfig config = response.getPlayerConfig();
        PlayerConfig.Builder kept = PlayerConfig.newBuilder();
        if (config.hasAudioConfig()) kept.setAudioConfig(config.getAudioConfig());

        byte[] trimmed = assemble(response.getPlayabilityStatus(), response.getVideoDetails(), audio, expires, kept)
                .toByteArray();
        byte[] tracking = playbackTracking(responseBytes);
        if (tracking.length == 0) return trimmed;

        // Concatenated encodings merge on parse, so the tracking rides along without being declared.
        byte[] joined = new byte[trimmed.length + tracking.length];
        System.arraycopy(trimmed, 0, joined, 0, trimmed.length);
        System.arraycopy(tracking, 0, joined, trimmed.length, tracking.length);
        return joined;
    }

    /**
     * A minimal valid response from what a download resolved: the details of the song and the downloaded format.
     * It has no loudness and no tracking; an online response replaces it once the copy has played online.
     */
    static byte[] fromDownload(Format downloaded, VideoDetails details) {
        return assemble(PlayabilityStatus.getDefaultInstance(), details, downloaded, DEFAULT_EXPIRES_SECONDS,
                PlayerConfig.newBuilder()).toByteArray();
    }

    /**
     * The response stored with a video copy: the whole response the saving request returned (every field of it, the
     * known ones and the unknown ones, so the replay has the shape of the app's own online response: the player
     * selection of the app reads more than the streaming data, and a response cut down to the details, the pair and
     * two flags gave it no video track offline), with only what must change replaced:
     * <ul>
     *   <li>the streaming data holds the two adaptive formats of the copy without urls (the replay puts its own local
     *   tokens there), with their init and index ranges, lengths and mime strings exactly, which is what the player
     *   reads the files by, and no SABR, HLS or DASH url. There is no muxed format: the app hands a response that has
     *   one to its framework player when the ExoPlayer engine declines it (see {@link #forExoPlayer}), and that
     *   player cannot play what the replay serves;
     *   <li>the details are those of a music video ({@link #asMusicVideo});
     *   <li>the playability status keeps its fields and says OK;
     *   <li>the player configuration keeps its fields and gets the ExoPlayer flags ({@link #forExoPlayer}).
     * </ul>
     */
    static byte[] fromVideoDownload(PlayerResponse response, VideoCopyLogic.Selection selection) {
        return response.toBuilder()
                .setPlayabilityStatus(response.getPlayabilityStatus().toBuilder().setStatus(Status.OK).clearReason())
                .setVideoDetails(asMusicVideo(response.getVideoDetails()))
                .setStreamingData(StreamingData.newBuilder()
                        .setExpiresInSeconds(DEFAULT_EXPIRES_SECONDS)
                        .addAdaptiveFormats(withoutUrl(selection.video()))
                        .addAdaptiveFormats(withoutUrl(selection.audio())))
                .setPlayerConfig(forExoPlayer(response.getPlayerConfig()))
                .build().toByteArray();
    }

    /**
     * What the app's player selection reads of a response before it lets the ExoPlayer engine play it. Music
     * 9.40.51 asks the engines in turn: {@code Lyvb.S} (ExoPlayer) answers false at once without
     * {@code playerConfig.exoPlayerConfig.useExoPlayer} (the app's own responses carry it, a response fetched by
     * another client does not), and then its framework player ({@code Lyqw.S}) takes any response that has a
     * muxed format. {@code audioConfig.exoAudioGate} (read by {@code Lwdx.aR}) opens the itag check of the
     * ExoPlayer engine for a video format as well. The fetched configuration is kept with the two flags set.
     */
    static PlayerConfig forExoPlayer(PlayerConfig fetched) {
        return fetched.toBuilder()
                .setAudioConfig(fetched.getAudioConfig().toBuilder().setExoAudioGate(true))
                .setExoPlayerConfig(fetched.getExoPlayerConfig().toBuilder().setUseExoPlayer(true))
                .build();
    }

    /**
     * The details of a music video as the Song/Video pill reads them: type OMV and not live content. The pill stays
     * dim for an audio-track type (ATV, a privately owned track) or live content, and a response fetched for the
     * saving, not for the app's own playback, is not guaranteed to say OMV for the video's id.
     */
    static VideoDetails asMusicVideo(VideoDetails details) {
        return details.toBuilder().setMusicVideoType(CommandRewrite.TYPE_OMV).clearIsLiveContent().build();
    }

    /**
     * What the Song/Video pill and the player selection read of a stored response, for the log: the music video
     * type, the live flag, the muxed and adaptive format counts, the formats with a video mime (the pill is
     * offered only for a type that is not an audio track and a response with at least one) and the two flags of
     * {@link #forExoPlayer}.
     */
    static String gateFacts(byte[] response) {
        try {
            PlayerResponse parsed = PlayerResponse.parseFrom(response);
            VideoDetails details = parsed.getVideoDetails();
            StreamingData streaming = parsed.getStreamingData();
            PlayerConfig config = parsed.getPlayerConfig();
            int video = 0;
            for (Format format : streaming.getFormatsList()) {
                if (format.getMimeType().startsWith("video")) video++;
            }
            for (Format format : streaming.getAdaptiveFormatsList()) {
                if (format.getMimeType().startsWith("video")) video++;
            }
            return "type=" + (details.hasMusicVideoType() ? details.getMusicVideoType() : "none")
                    + " live=" + details.getIsLiveContent() + " muxed=" + streaming.getFormatsCount()
                    + " adaptive=" + streaming.getAdaptiveFormatsCount() + " videoMimes=" + video
                    + " exo=" + config.getExoPlayerConfig().getUseExoPlayer()
                    + " gate=" + config.getAudioConfig().getExoAudioGate()
                    + " config=" + config.getSerializedSize() + "B";
        } catch (IOException ex) {
            return "unreadable";
        }
    }

    private static Format withoutUrl(Format format) {
        return format.toBuilder().clearUrl().clearSignatureCipher().build();
    }

    private static PlayerResponse assemble(PlayabilityStatus playability, VideoDetails details, Format audio,
                                           long expiresInSeconds, PlayerConfig.Builder config) {
        Format local = audio.toBuilder().clearUrl().clearSignatureCipher().build();
        PlayerResponse.Builder response = PlayerResponse.newBuilder()
                .setPlayabilityStatus(playability.toBuilder().setStatus(Status.OK).clearReason())
                .setVideoDetails(details)
                .setStreamingData(StreamingData.newBuilder()
                        .setExpiresInSeconds(expiresInSeconds)
                        .addAdaptiveFormats(local));
        PlayerConfig built = config.build();
        if (built.getSerializedSize() > 0) response.setPlayerConfig(built);
        return response.build();
    }

    /** The encoded playback tracking fields of a response, or an empty array when it has none. */
    private static byte[] playbackTracking(byte[] responseBytes) throws IOException {
        CodedInputStream input = CodedInputStream.newInstance(responseBytes);
        ByteArrayOutputStream kept = new ByteArrayOutputStream();
        CodedOutputStream output = CodedOutputStream.newInstance(kept);
        for (int tag = input.readTag(); tag != 0; tag = input.readTag()) {
            if (tag == PLAYBACK_TRACKING_TAG) {
                output.writeBytes(PLAYBACK_TRACKING_FIELD, input.readBytes());
            } else if (!input.skipField(tag)) {
                break;
            }
        }
        output.flush();
        return kept.toByteArray();
    }
}
