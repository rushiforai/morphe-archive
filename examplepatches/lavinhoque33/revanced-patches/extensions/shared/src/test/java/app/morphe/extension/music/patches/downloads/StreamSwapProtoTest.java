/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import com.google.protobuf.CodedOutputStream;
import com.google.protobuf.ByteString;

import org.junit.Test;

import java.io.ByteArrayOutputStream;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.AudioConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ByteRange;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.MediaCommonConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.MediaUstreamerRequestConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlaybackRoutingConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.StreamingData;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.VideoDetails;

public class StreamSwapProtoTest {
    @Test public void rangeFieldsAreIndependent() throws Exception {
        Format source = Format.newBuilder().setItag(251).setLastModified(123).setContentLength(1000)
                .setInitRange(ByteRange.newBuilder().setStart(0).setEnd(99))
                .setIndexRange(ByteRange.newBuilder().setStart(100).setEnd(199)).build();
        Format copy = Format.parseFrom(source.toByteArray()).toBuilder().setUrl("http://127.0.0.1/rvx").build();
        assertEquals(source.getInitRange(), copy.getInitRange());
        assertEquals(source.getIndexRange(), copy.getIndexRange());
        assertEquals(source.getLastModified(), copy.getLastModified());
        assertEquals(source.getContentLength(), copy.getContentLength());
    }

    @Test public void strippingKeepsExpiryUnknownFieldsAndOnlineConfiguration() throws Exception {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        CodedOutputStream wire = CodedOutputStream.newInstance(output);
        wire.writeUInt64(1, 21600);
        wire.writeString(19000, "unrelated-streaming-config");
        wire.flush();
        Format audio = Format.newBuilder().setItag(251).setLastModified(42).setContentLength(1000)
                .setUrl("http://127.0.0.1/rvx")
                .setInitRange(ByteRange.newBuilder().setStart(0).setEnd(99))
                .setIndexRange(ByteRange.newBuilder().setStart(100).setEnd(199)).build();
        StreamingData streaming = StreamingData.parseFrom(output.toByteArray()).toBuilder()
                .setServerAbrStreamingUrl("https://example.invalid/sabr")
                .addFormats(Format.newBuilder().setItag(18)).addAdaptiveFormats(audio).build();
        MediaCommonConfig common = MediaCommonConfig.parseFrom(unknownField(19001, "unrelated-common-config"))
                .toBuilder().setEnableSabr(true).setMediaUstreamerRequestConfig(MediaUstreamerRequestConfig.newBuilder()
                        .setVideoPlaybackUstreamerConfig(ByteString.copyFromUtf8("ustreamer"))).build();
        PlayerConfig config = PlayerConfig.parseFrom(unknownField(19002, "unrelated-player-config"))
                .toBuilder().setMediaCommonConfig(common)
                .setAudioConfig(AudioConfig.newBuilder().setMuteOnStart(true)).build();
        PlayerResponse online = PlayerResponse.newBuilder().setStreamingData(streaming).setPlayerConfig(config)
                .setVideoDetails(VideoDetails.newBuilder().setVideoId("test").setTitle("Online title")).build();

        PlayerResponse swapped = PlayerResponse.parseFrom(StreamSwapLogic.replaceAudio(online, audio)
                .toByteArray());
        assertFalse(swapped.getStreamingData().hasServerAbrStreamingUrl());
        assertEquals(21600, swapped.getStreamingData().getExpiresInSeconds());
        assertFalse(swapped.getPlayerConfig().getMediaCommonConfig().hasMediaUstreamerRequestConfig());
        assertFalse(swapped.getPlayerConfig().getMediaCommonConfig().hasEnableSabr());
        assertEquals(online.getVideoDetails(), swapped.getVideoDetails());
        assertEquals(config.toBuilder().setMediaCommonConfig(common.toBuilder()
                .clearMediaUstreamerRequestConfig().clearEnableSabr()).build(), swapped.getPlayerConfig());
        assertEquals(0, swapped.getStreamingData().getFormatsCount());
        assertEquals(1, swapped.getStreamingData().getAdaptiveFormatsCount());
        assertEquals(audio, swapped.getStreamingData().getAdaptiveFormats(0));
        assertArrayEquals(output.toByteArray(), swapped.getStreamingData().toBuilder()
                .clearAdaptiveFormats().build().toByteArray());
        assertTrue(online.getStreamingData().hasServerAbrStreamingUrl());
        assertTrue(online.getPlayerConfig().getMediaCommonConfig().hasMediaUstreamerRequestConfig());
    }

    @Test public void strippingDoesNotCreateMissingPlayerConfiguration() {
        Format audio = Format.newBuilder().setItag(251).setUrl("http://127.0.0.1/rvx").build();
        PlayerResponse online = PlayerResponse.newBuilder().setStreamingData(StreamingData.newBuilder()
                .setServerAbrStreamingUrl("https://example.invalid/sabr").addAdaptiveFormats(audio)).build();
        PlayerResponse swapped = StreamSwapLogic.replaceAudio(online, audio);
        assertFalse(swapped.hasPlayerConfig());
        assertFalse(swapped.getStreamingData().hasServerAbrStreamingUrl());
        assertTrue(online.getStreamingData().hasServerAbrStreamingUrl());
    }

    @Test public void strippingRemovesOpaqueUstreamerFieldsAndEmptyContainerOnly() throws Exception {
        MediaUstreamerRequestConfig ustreamer = MediaUstreamerRequestConfig.parseFrom(
                unknownField(19003, "opaque-onesie-routing")).toBuilder()
                .setVideoPlaybackUstreamerConfig(ByteString.copyFromUtf8("ustreamer")).build();
        PlayerConfig config = PlayerConfig.newBuilder().setAudioConfig(AudioConfig.newBuilder().setMuteOnStart(true))
                .setPlaybackRoutingConfig(PlaybackRoutingConfig.newBuilder().setPreferredEngine(3))
                .setMediaCommonConfig(MediaCommonConfig.newBuilder().setMediaUstreamerRequestConfig(ustreamer)).build();
        Format audio = Format.newBuilder().setItag(251).setUrl("http://127.0.0.1/rvx").build();
        PlayerResponse online = PlayerResponse.newBuilder().setPlayerConfig(config)
                .setStreamingData(StreamingData.newBuilder().addAdaptiveFormats(audio)).build();
        PlayerResponse swapped = StreamSwapLogic.replaceAudio(online, audio);
        assertFalse(swapped.getPlayerConfig().hasMediaCommonConfig());
        assertFalse(swapped.getPlayerConfig().hasPlaybackRoutingConfig());
        assertEquals(config.toBuilder().clearMediaCommonConfig().clearPlaybackRoutingConfig().build(),
                swapped.getPlayerConfig());
        assertEquals(config.getAudioConfig(), swapped.getPlayerConfig().getAudioConfig());
        assertTrue(online.getPlayerConfig().hasMediaCommonConfig());
    }

    @Test public void strippingClearsOnlyForcedEnginePreference() throws Exception {
        PlaybackRoutingConfig routing = PlaybackRoutingConfig.parseFrom(unknownField(3, "keep-route-option"))
                .toBuilder().setPreferredEngine(3).build();
        PlayerConfig config = PlayerConfig.newBuilder().setPlaybackRoutingConfig(routing).build();
        Format audio = Format.newBuilder().setItag(251).setUrl("http://127.0.0.1/rvx").build();
        PlayerResponse online = PlayerResponse.newBuilder().setPlayerConfig(config)
                .setStreamingData(StreamingData.newBuilder().addAdaptiveFormats(audio)).build();
        PlayerResponse swapped = StreamSwapLogic.replaceAudio(online, audio);
        assertEquals(routing.toBuilder().clearPreferredEngine().build(),
                swapped.getPlayerConfig().getPlaybackRoutingConfig());
        assertFalse(swapped.getPlayerConfig().getPlaybackRoutingConfig().hasPreferredEngine());
        assertEquals(3, online.getPlayerConfig().getPlaybackRoutingConfig().getPreferredEngine());
    }

    @Test public void strippingKeepsNonForcedEnginePreference() {
        PlayerConfig config = PlayerConfig.newBuilder()
                .setPlaybackRoutingConfig(PlaybackRoutingConfig.newBuilder().setPreferredEngine(2)).build();
        Format audio = Format.newBuilder().setItag(251).setUrl("http://127.0.0.1/rvx").build();
        PlayerResponse online = PlayerResponse.newBuilder().setPlayerConfig(config)
                .setStreamingData(StreamingData.newBuilder().addAdaptiveFormats(audio)).build();
        assertEquals(config, StreamSwapLogic.replaceAudio(online, audio).getPlayerConfig());
    }

    @Test public void strippingClearsSabrHintWithoutUstreamerRequest() {
        Format audio = Format.newBuilder().setItag(251).setUrl("http://127.0.0.1/rvx").build();
        PlayerResponse online = PlayerResponse.newBuilder()
                .setPlayerConfig(PlayerConfig.newBuilder().setMediaCommonConfig(
                        MediaCommonConfig.newBuilder().setEnableSabr(true)))
                .setStreamingData(StreamingData.newBuilder().addAdaptiveFormats(audio)).build();
        assertFalse(StreamSwapLogic.replaceAudio(online, audio).getPlayerConfig()
                .hasMediaCommonConfig());
    }

    private static byte[] unknownField(int number, String value) throws Exception {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        CodedOutputStream wire = CodedOutputStream.newInstance(output);
        wire.writeString(number, value);
        wire.flush();
        return output.toByteArray();
    }
}
