/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import com.google.protobuf.ByteString;
import com.google.protobuf.CodedInputStream;
import com.google.protobuf.CodedOutputStream;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Set;
import java.util.TreeSet;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.AudioConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ByteRange;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.CaptionTrack;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.CaptionTrackList;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Captions;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ExoPlayerConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.MediaCommonConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.MediaUstreamerRequestConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayabilityStatus;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Status;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.StreamingData;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ThumbnailEntry;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ThumbnailList;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.VideoDetails;

public class OfflineResponseTrimTest {
    private static final byte[] TRACKING = {10, 3, 'u', 'r', 'l'};

    private static VideoDetails details() {
        return VideoDetails.newBuilder().setVideoId("abcdefghijk").setTitle("Song").setLengthSeconds(200)
                .setOwnerChannelName("Artist - Topic")
                .setThumbnail(ThumbnailList.newBuilder().addThumbnails(
                        ThumbnailEntry.newBuilder().setUrl("https://t/1").setWidth(544).setHeight(544))).build();
    }

    private static Format audio(int itag) {
        return Format.newBuilder().setItag(itag).setMimeType("audio/webm; codecs=\"opus\"")
                .setUrl("https://rr/stream").setSignatureCipher("s=1&url=2").setContentLength(5000)
                .setLastModified(77).setBitrate(130000)
                .setInitRange(ByteRange.newBuilder().setStart(0).setEnd(99))
                .setIndexRange(ByteRange.newBuilder().setStart(100).setEnd(199)).build();
    }

    /** A player response of the kind the app receives, with everything the trim is meant to drop. */
    private static byte[] online(boolean withExpiry) throws IOException {
        StreamingData.Builder streaming = StreamingData.newBuilder()
                .addFormats(Format.newBuilder().setItag(18).setUrl("https://muxed"))
                .addAdaptiveFormats(audio(140)).addAdaptiveFormats(audio(251))
                .addAdaptiveFormats(Format.newBuilder().setItag(248).setUrl("https://video"))
                .setHlsManifestUrl("https://hls").setServerAbrStreamingUrl("https://sabr");
        if (withExpiry) streaming.setExpiresInSeconds(21540);
        PlayerConfig config = PlayerConfig.newBuilder()
                .setAudioConfig(AudioConfig.parseFrom(loudness()).toBuilder().setMuteOnStart(false))
                .setMediaCommonConfig(MediaCommonConfig.newBuilder().setEnableSabr(true)
                        .setMediaUstreamerRequestConfig(MediaUstreamerRequestConfig.newBuilder()
                                .setVideoPlaybackUstreamerConfig(ByteString.copyFrom(new byte[]{1, 2}))))
                .build();
        PlayerResponse response = PlayerResponse.newBuilder()
                .setPlayabilityStatus(PlayabilityStatus.newBuilder().setStatus(Status.LOGIN_REQUIRED).setReason("no"))
                .setStreamingData(streaming).setVideoDetails(details()).setPlayerConfig(config)
                .setCaptions(Captions.newBuilder().setPlayerCaptionsTracklistRenderer(CaptionTrackList.newBuilder()
                        .addCaptionTracks(CaptionTrack.newBuilder().setBaseUrl("https://cc"))))
                .build();
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        CodedOutputStream wire = CodedOutputStream.newInstance(bytes);
        wire.writeRawBytes(response.toByteArray());
        wire.writeBytes(9, ByteString.copyFrom(TRACKING));
        wire.writeString(7, "adPlacements");
        wire.flush();
        return bytes.toByteArray();
    }

    /** An audio config field the generated message does not declare, kept as an unknown field. */
    private static byte[] loudness() throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        CodedOutputStream wire = CodedOutputStream.newInstance(bytes);
        wire.writeFloat(1, -7.5f);
        wire.flush();
        return bytes.toByteArray();
    }

    private static Set<Integer> topLevelFields(byte[] message) throws IOException {
        Set<Integer> fields = new TreeSet<>();
        CodedInputStream input = CodedInputStream.newInstance(message);
        for (int tag = input.readTag(); tag != 0; tag = input.readTag()) {
            fields.add(tag >>> 3);
            input.skipField(tag);
        }
        return fields;
    }

    @Test public void keepsOnlyTheStoredAudioFormatWithoutItsUrl() throws Exception {
        PlayerResponse trimmed = PlayerResponse.parseFrom(OfflineResponseTrim.trim(online(true), 251));
        StreamingData streaming = trimmed.getStreamingData();
        assertEquals(1, streaming.getAdaptiveFormatsCount());
        assertEquals(0, streaming.getFormatsCount());
        Format kept = streaming.getAdaptiveFormats(0);
        assertEquals(251, kept.getItag());
        assertEquals("", kept.getUrl());
        assertEquals("", kept.getSignatureCipher());
        assertEquals(audio(251).toBuilder().clearUrl().clearSignatureCipher().build(), kept);
        assertFalse(streaming.hasHlsManifestUrl());
        assertFalse(streaming.hasServerAbrStreamingUrl());
        assertEquals(21540, streaming.getExpiresInSeconds());
    }

    @Test public void aResponseWithoutExpiryGetsTheDefault() throws Exception {
        PlayerResponse trimmed = PlayerResponse.parseFrom(OfflineResponseTrim.trim(online(false), 251));
        assertEquals(OfflineResponseTrim.DEFAULT_EXPIRES_SECONDS, trimmed.getStreamingData().getExpiresInSeconds());
    }

    @Test public void forcesPlayabilityOkAndKeepsEveryVideoDetail() throws Exception {
        PlayerResponse trimmed = PlayerResponse.parseFrom(OfflineResponseTrim.trim(online(true), 251));
        assertEquals(Status.OK, trimmed.getPlayabilityStatus().getStatus());
        assertTrue(trimmed.getPlayabilityStatus().hasStatus());
        assertEquals("", trimmed.getPlayabilityStatus().getReason());
        assertEquals(details(), trimmed.getVideoDetails());
    }

    @Test public void keepsLoudnessAndDropsSabrCaptionsAndTheRest() throws Exception {
        byte[] trimmedBytes = OfflineResponseTrim.trim(online(true), 251);
        PlayerResponse trimmed = PlayerResponse.parseFrom(trimmedBytes);
        assertArrayEquals(loudness(), trimmed.getPlayerConfig().getAudioConfig().toBuilder().clearMuteOnStart()
                .build().toByteArray());
        assertFalse(trimmed.getPlayerConfig().hasMediaCommonConfig());
        assertFalse(trimmed.hasCaptions());
        assertEquals(new TreeSet<>(Set.of(2, 4, 9, 11, 15)), topLevelFields(trimmedBytes));
    }

    @Test public void keepsPlaybackTrackingBytes() throws Exception {
        byte[] trimmedBytes = OfflineResponseTrim.trim(online(true), 251);
        CodedInputStream input = CodedInputStream.newInstance(trimmedBytes);
        byte[] tracking = null;
        for (int tag = input.readTag(); tag != 0; tag = input.readTag()) {
            if (tag >>> 3 == 9) tracking = input.readBytes().toByteArray();
            else input.skipField(tag);
        }
        assertArrayEquals(TRACKING, tracking);
    }

    @Test public void aResponseWithoutTheItagHasNothingToStore() throws Exception {
        assertNull(OfflineResponseTrim.trim(online(true), 250));
    }

    @Test public void theTrimmedResponseIsSmall() throws Exception {
        assertTrue(OfflineResponseTrim.trim(online(true), 251).length < OfflineCopyFiles.MAX_RESPONSE_BYTES);
    }

    @Test public void aDownloadResponseIsMinimalAndValid() throws Exception {
        Format downloaded = audio(251);
        PlayerResponse built = PlayerResponse.parseFrom(OfflineResponseTrim.fromDownload(downloaded, details()));
        assertEquals(Status.OK, built.getPlayabilityStatus().getStatus());
        assertEquals(details(), built.getVideoDetails());
        assertEquals(OfflineResponseTrim.DEFAULT_EXPIRES_SECONDS, built.getStreamingData().getExpiresInSeconds());
        assertEquals(1, built.getStreamingData().getAdaptiveFormatsCount());
        assertEquals(downloaded.toBuilder().clearUrl().clearSignatureCipher().build(),
                built.getStreamingData().getAdaptiveFormats(0));
        assertFalse(built.hasPlayerConfig());
        assertEquals(new TreeSet<>(Set.of(2, 4, 11)), topLevelFields(built.toByteArray()));
    }

    @Test public void aVideoCopysResponseKeepsTheTwoAdaptiveFormatsWithoutUrlsAndNoMuxedOne() throws Exception {
        Format video = Format.newBuilder().setItag(134).setMimeType("video/mp4; codecs=\"avc1.4D401E\"")
                .setUrl("https://example.invalid/v").setSignatureCipher("cipher").setBitrate(450863)
                .setContentLength(8_390_921).setLastModified(7)
                .setInitRange(ByteRange.newBuilder().setStart(0).setEnd(740))
                .setIndexRange(ByteRange.newBuilder().setStart(741).setEnd(1228)).build();
        Format audio = Format.newBuilder().setItag(251).setMimeType("audio/webm; codecs=\"opus\"")
                .setUrl("https://example.invalid/a").setContentLength(3_433_755).build();
        VideoDetails details = VideoDetails.newBuilder().setVideoId("clip").setLengthSeconds(213).build();
        PlayerResponse online = PlayerResponse.newBuilder().setVideoDetails(details)
                .setPlayerConfig(PlayerConfig.newBuilder().setAudioConfig(AudioConfig.newBuilder()
                        .setMuteOnStart(false))).build();

        PlayerResponse stored = PlayerResponse.parseFrom(OfflineResponseTrim.fromVideoDownload(online,
                new VideoCopyLogic.Selection(video, audio)));

        assertEquals(Status.OK, stored.getPlayabilityStatus().getStatus());
        assertEquals("clip", stored.getVideoDetails().getVideoId());
        assertEquals(2, stored.getStreamingData().getAdaptiveFormatsCount());
        Format keptVideo = stored.getStreamingData().getAdaptiveFormats(0);
        assertEquals(134, keptVideo.getItag());
        assertEquals("", keptVideo.getUrl());
        assertEquals("", keptVideo.getSignatureCipher());
        assertEquals(video.getMimeType(), keptVideo.getMimeType());
        assertEquals(8_390_921, keptVideo.getContentLength());
        assertEquals(1228, keptVideo.getIndexRange().getEnd());
        assertEquals(251, stored.getStreamingData().getAdaptiveFormats(1).getItag());
        assertEquals("", stored.getStreamingData().getAdaptiveFormats(1).getUrl());
        assertEquals(0, stored.getStreamingData().getFormatsCount());
        assertTrue(stored.getPlayerConfig().hasAudioConfig());
        assertEquals(OfflineResponseTrim.DEFAULT_EXPIRES_SECONDS, stored.getStreamingData().getExpiresInSeconds());
    }

    @Test public void aVideoCopyIsStoredAsAMusicVideoWhateverTheFetchSaid() throws Exception {
        Format video = Format.newBuilder().setItag(134).setUrl("u").build();
        Format audio = Format.newBuilder().setItag(251).setUrl("u").build();
        VideoCopyLogic.Selection selection = new VideoCopyLogic.Selection(video, audio);

        for (VideoDetails fetched : new VideoDetails[]{
                VideoDetails.newBuilder().setVideoId("clip").setMusicVideoType(1).setIsLiveContent(true).build(),
                VideoDetails.newBuilder().setVideoId("clip").build()}) {
            VideoDetails stored = PlayerResponse.parseFrom(OfflineResponseTrim.fromVideoDownload(
                    PlayerResponse.newBuilder().setVideoDetails(fetched).build(), selection)).getVideoDetails();

            assertEquals(2, stored.getMusicVideoType());
            assertFalse(stored.getIsLiveContent());
            assertEquals("clip", stored.getVideoId());
        }
    }

    @Test public void theMusicVideoTypeIsTheAppsOwnFieldFortyAndLiveFortyThree() throws Exception {
        byte[] wire = VideoDetails.newBuilder().setMusicVideoType(2).setIsLiveContent(true).build().toByteArray();
        assertEquals(new TreeSet<>(Set.of(40, 43)), topLevelFields(wire));
    }

    @Test public void theGateFactsNameTheTypeTheLiveFlagAndTheVideoMimes() throws Exception {
        Format video = Format.newBuilder().setItag(134).setMimeType("video/mp4; codecs=\"avc1\"").build();
        Format audio = Format.newBuilder().setItag(251).setMimeType("audio/webm").build();
        byte[] stored = OfflineResponseTrim.fromVideoDownload(PlayerResponse.getDefaultInstance(),
                new VideoCopyLogic.Selection(video, audio));

        assertEquals("type=2 live=false muxed=0 adaptive=2 videoMimes=1 exo=true gate=true config=16B",
                OfflineResponseTrim.gateFacts(stored));
        assertEquals("type=none live=false muxed=0 adaptive=0 videoMimes=0 exo=false gate=false config=0B",
                OfflineResponseTrim.gateFacts(new byte[0]));
        assertEquals("unreadable", OfflineResponseTrim.gateFacts(new byte[]{(byte) 0xff}));
    }

    @Test public void aVideoCopysResponseHasNoMuxedFormatAndBothEngineFlagsWhateverTheFetchHad() throws Exception {
        Format video = Format.newBuilder().setItag(134).setUrl("u").build();
        Format audio = Format.newBuilder().setItag(251).setUrl("u").build();
        PlayerResponse fetched = PlayerResponse.newBuilder().setStreamingData(StreamingData.newBuilder()
                .addFormats(Format.newBuilder().setItag(18).setMimeType("video/mp4"))).build();

        PlayerResponse stored = PlayerResponse.parseFrom(OfflineResponseTrim.fromVideoDownload(
                fetched, new VideoCopyLogic.Selection(video, audio)));

        assertEquals(0, stored.getStreamingData().getFormatsCount());
        assertTrue(stored.getPlayerConfig().getExoPlayerConfig().getUseExoPlayer());
        assertTrue(stored.getPlayerConfig().getAudioConfig().getExoAudioGate());
        assertEquals(new TreeSet<>(Set.of(55405814, 57825011)),
                topLevelFields(stored.getPlayerConfig().toByteArray()));
    }

    @Test public void theEngineFlagsAreTheFieldsTheAppReads() throws Exception {
        assertEquals(new TreeSet<>(Set.of(1)), topLevelFields(
                ExoPlayerConfig.newBuilder().setUseExoPlayer(true).build().toByteArray()));
        assertEquals(new TreeSet<>(Set.of(4, 5)), topLevelFields(
                AudioConfig.newBuilder().setMuteOnStart(true).setExoAudioGate(true).build().toByteArray()));
        assertEquals(new TreeSet<>(Set.of(57825011)), topLevelFields(PlayerConfig.newBuilder()
                .setExoPlayerConfig(ExoPlayerConfig.newBuilder().setUseExoPlayer(true)).build().toByteArray()));
    }

    @Test public void aVideoCopysResponseKeepsTheFetchedLoudnessConfigurationAndStaysSmall() throws Exception {
        Format video = Format.newBuilder().setItag(134).setUrl("u").build();
        Format audio = Format.newBuilder().setItag(251).setUrl("u").build();
        PlayerConfig fetched = PlayerConfig.newBuilder().setAudioConfig(AudioConfig.newBuilder().setMuteOnStart(true))
                .build();

        byte[] stored = OfflineResponseTrim.fromVideoDownload(PlayerResponse.newBuilder().setPlayerConfig(fetched)
                .build(), new VideoCopyLogic.Selection(video, audio));

        assertTrue(PlayerResponse.parseFrom(stored).getPlayerConfig().getAudioConfig().getMuteOnStart());
        assertTrue(stored.length < 100);
    }

    @Test public void aVideoCopysResponseKeepsEveryFieldTheFetchReturnedKnownOrUnknown() throws Exception {
        Format video = Format.newBuilder().setItag(134).setUrl("u").build();
        Format audio = Format.newBuilder().setItag(251).setUrl("u").build();
        byte[] unknown = new ProtoWriter().message(1, new byte[]{8, 1}).message(9, new byte[]{4})
                .message(16, new byte[]{5, 6}).message(21, new byte[]{7}).message(69, new byte[]{8})
                .message(71, new byte[]{9}).toByteArray();
        PlayerResponse fetched = PlayerResponse.newBuilder()
                .setPlayabilityStatus(PlayabilityStatus.newBuilder().setStatus(Status.LOGIN_REQUIRED).setReason("no"))
                .setVideoDetails(VideoDetails.newBuilder().setVideoId("clip").setTitle("Title"))
                .setStreamingData(StreamingData.newBuilder().setServerAbrStreamingUrl("https://sabr.invalid/"))
                .setPlayerConfig(PlayerConfig.newBuilder()
                        .setAudioConfig(AudioConfig.newBuilder().setMuteOnStart(true)))
                .mergeFrom(unknown).build();

        byte[] stored = OfflineResponseTrim.fromVideoDownload(fetched, new VideoCopyLogic.Selection(video, audio));

        for (int field : new int[]{1, 9, 16, 21, 69, 71}) {
            assertArrayEquals("field " + field, ProtoFields.one(unknown, field), ProtoFields.one(stored, field));
        }
        PlayerResponse parsed = PlayerResponse.parseFrom(stored);
        assertEquals(Status.OK, parsed.getPlayabilityStatus().getStatus());
        assertEquals("", parsed.getPlayabilityStatus().getReason());
        assertEquals("Title", parsed.getVideoDetails().getTitle());
        assertFalse(parsed.getStreamingData().hasServerAbrStreamingUrl());
        assertEquals(2, parsed.getStreamingData().getAdaptiveFormatsCount());
    }
}
