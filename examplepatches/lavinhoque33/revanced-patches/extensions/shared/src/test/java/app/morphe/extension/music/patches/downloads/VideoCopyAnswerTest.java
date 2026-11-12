/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

import org.junit.Test;

import java.util.List;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ThumbnailEntry;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ThumbnailList;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.VideoDetails;

public class VideoCopyAnswerTest {
    private static byte[] bytes(int... values) {
        byte[] result = new byte[values.length];
        for (int index = 0; index < values.length; index++) result[index] = (byte) values[index];
        return result;
    }

    /** The response the saving client returned and the copy stored: per-video fields and the client's own. */
    private static byte[] saved() {
        return new ProtoWriter().message(1, bytes(10)).message(2, bytes(20)).message(4, bytes(40))
                .message(9, bytes(90)).message(10, bytes(100)).message(11, bytes(110)).message(15, bytes(150))
                .message(16, bytes(160)).message(21, bytes(210)).message(22, bytes(220)).message(69, bytes(69))
                .toByteArray();
    }

    /** The app's online response of another video, as {@link LiveTemplate} keeps it: no per-video fields. */
    private static byte[] template() {
        return new ProtoWriter().message(1, bytes(11)).message(2, bytes(21)).message(15, bytes(151))
                .message(16, bytes(161)).message(21, bytes(211)).message(22, bytes(221)).message(69, bytes(70))
                .message(71, bytes(71)).toByteArray();
    }

    @Test public void withTheTemplateTheAppGenericFieldsAreTheTemplatesAndThePerVideoFieldsTheCopys() throws Exception {
        VideoCopyAnswer.Answer answer = VideoCopyAnswer.of(saved(), null, template());

        assertEquals(VideoCopyAnswer.TEMPLATE, answer.base());
        byte[] bytes = answer.bytes();
        for (int generic : new int[]{1, 2, 15, 16, 21, 22, 69, 71}) {
            assertArrayEquals("field " + generic, ProtoFields.one(template(), generic), ProtoFields.one(bytes, generic));
            assertEquals("field " + generic, 1, ProtoFields.all(bytes, generic).size());
        }
        for (int own : new int[]{4, 9, 10, 11}) {
            assertArrayEquals("field " + own, ProtoFields.one(saved(), own), ProtoFields.one(bytes, own));
            assertEquals("field " + own, 1, ProtoFields.all(bytes, own).size());
        }
        assertEquals(List.of(1, 2, 15, 16, 21, 22, 69, 71, 4, 9, 10, 11), ProtoFields.numbers(bytes));
    }

    @Test public void aFieldOnlyTheSavedResponseHasIsKept() throws Exception {
        byte[] withExtra = new ProtoWriter().message(4, bytes(40)).message(33, bytes(33)).toByteArray();

        byte[] bytes = VideoCopyAnswer.of(withExtra, null, template()).bytes();

        assertArrayEquals(bytes(33), ProtoFields.one(bytes, 33));
    }

    @Test public void theOnlineResponseOfTheVideoKeepsItsTrackingAndCaptionsAndTakesOnlyTheCopysPairAndDetails()
            throws Exception {
        byte[] live = new ProtoWriter().message(1, bytes(12)).message(2, bytes(22)).message(4, bytes(41))
                .message(9, bytes(91)).message(10, bytes(101)).message(11, bytes(111)).message(15, bytes(152))
                .message(71, bytes(72)).toByteArray();

        VideoCopyAnswer.Answer answer = VideoCopyAnswer.of(saved(), live, template());

        assertEquals(VideoCopyAnswer.LIVE, answer.base());
        byte[] bytes = answer.bytes();
        assertArrayEquals(bytes(40), ProtoFields.one(bytes, 4));
        assertArrayEquals(bytes(110), ProtoFields.one(bytes, 11));
        for (int online : new int[]{1, 2, 9, 10, 15, 71}) {
            assertArrayEquals("field " + online, ProtoFields.one(live, online), ProtoFields.one(bytes, online));
        }
        assertEquals(List.of(1, 2, 9, 10, 15, 71, 4, 11, 16, 21, 22, 69), ProtoFields.numbers(bytes));
    }

    @Test public void withNeitherTheSavedResponseIsTheAnswer() throws Exception {
        VideoCopyAnswer.Answer answer = VideoCopyAnswer.of(saved(), null, null);

        assertEquals(VideoCopyAnswer.SAVED, answer.base());
        assertArrayEquals(saved(), answer.bytes());
    }

    private static byte[] responseWithThumbnail(String title, String url) {
        VideoDetails.Builder details = VideoDetails.newBuilder().setTitle(title);
        if (url != null) {
            details.setThumbnail(ThumbnailList.newBuilder().addThumbnails(ThumbnailEntry.newBuilder().setUrl(url)));
        }
        return PlayerResponse.newBuilder().setVideoDetails(details).build().toByteArray();
    }

    @Test public void theAnswerShowsTheSongsThumbnailsAndKeepsTheRestOfTheVideoDetails() throws Exception {
        byte[] answer = responseWithThumbnail("Video", "https://video/thumb");

        VideoDetails details = PlayerResponse.parseFrom(VideoCopyAnswer.withSongArtwork(answer,
                responseWithThumbnail("Song", "https://album/cover"))).getVideoDetails();

        assertEquals("Video", details.getTitle());
        assertEquals(1, details.getThumbnail().getThumbnailsCount());
        assertEquals("https://album/cover", details.getThumbnail().getThumbnails(0).getUrl());
    }

    @Test public void aSongWithoutThumbnailsLeavesTheAnswerAsItIs() throws Exception {
        byte[] answer = responseWithThumbnail("Video", "https://video/thumb");

        assertSame(answer, VideoCopyAnswer.withSongArtwork(answer, responseWithThumbnail("Song", null)));
    }
}
