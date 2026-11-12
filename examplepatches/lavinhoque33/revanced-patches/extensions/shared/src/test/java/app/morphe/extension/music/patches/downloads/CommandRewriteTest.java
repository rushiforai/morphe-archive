/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.CodedOutputStream;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.util.Arrays;
import java.util.Collections;
import java.util.Set;

public class CommandRewriteTest {
    private static final String OMV = "dQw4w9WgXcQ";
    private static final String ATV = "lYBUbBu4W08";
    private static final String ALBUM = "OLAK5uy_nmDUsWOMoEcz0SsVqUwir0oxu-k1oUyXE";

    private interface Fill {
        void write(CodedOutputStream out) throws Exception;
    }

    private static byte[] build(Fill fill) {
        try {
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            CodedOutputStream out = CodedOutputStream.newInstance(bytes);
            fill.write(out);
            out.flush();
            return bytes.toByteArray();
        } catch (Exception ex) {
            throw new IllegalStateException(ex);
        }
    }

    /** The music config: an unknown field 1, the type (field 2) and a trailing unknown field 3. */
    private static byte[] musicConfig(int type) {
        return build(out -> {
            out.writeInt32(1, 0);
            out.writeInt32(CommandRewrite.MUSIC_VIDEO_TYPE_FIELD, type);
            out.writeString(3, "x");
        });
    }

    private static byte[] supportedConfig(int type) {
        byte[] music = musicConfig(type);
        return build(out -> out.writeByteArray(CommandRewrite.MUSIC_CONFIG_FIELD, music));
    }

    /** Mirrors watch=[1:s11,2:s41,3:v0,9:s32,13:s16,26:s68,28:s4,79857908:sN,136656028:sN] of an album row. */
    private static byte[] watch(String video, byte[] supported) {
        return build(out -> {
            out.writeString(1, video);
            out.writeString(2, ALBUM);
            out.writeInt32(3, 0);
            out.writeString(9, "01234567890123456789012345678901");
            out.writeString(13, "setVideoId123456");
            out.writeByteArray(26, new byte[68]);
            out.writeByteArray(28, new byte[]{1, 2, 3, 4});
            out.writeByteArray(79_857_908, new byte[1107]);
            if (supported != null) out.writeByteArray(CommandRewrite.SUPPORTED_CONFIG_FIELD, supported);
        });
    }

    private static byte[] command(byte[] watch) {
        return build(out -> {
            out.writeString(2, "x".repeat(45));
            out.writeByteArray(4, new byte[111]);
            out.writeByteArray(CommandRewrite.WATCH_ENDPOINT_FIELD, watch);
            out.writeByteArray(94_476_261, new byte[8]);
            out.writeByteArray(144_224_893, new byte[8]);
        });
    }

    private static CommandRewrite.Result retarget(byte[] command, String from, String to) {
        return CommandRewrite.retarget(command, from, to, false);
    }

    private static byte[] supportedOf(byte[] music) {
        return build(out -> out.writeByteArray(CommandRewrite.MUSIC_CONFIG_FIELD, music));
    }

    /** The config of an album row as the device showed it: {2:type, 4:2}. */
    private static byte[] albumMusic(int type) {
        return build(out -> {
            out.writeInt32(2, type);
            out.writeInt32(4, 2);
        });
    }

    private static byte[] omvRow() {
        return command(watch(OMV, supportedConfig(CommandRewrite.TYPE_OMV)));
    }

    private static byte[] field(byte[] message, int number) throws Exception {
        CodedInputStream in = CodedInputStream.newInstance(message);
        while (!in.isAtEnd()) {
            int tag = in.readTag();
            if (tag >>> 3 == number) return in.readByteArray();
            in.skipField(tag);
        }
        return null;
    }

    private static int type(byte[] command) throws Exception {
        byte[] watch = field(command, CommandRewrite.WATCH_ENDPOINT_FIELD);
        byte[] supported = field(watch, CommandRewrite.SUPPORTED_CONFIG_FIELD);
        byte[] music = field(supported, CommandRewrite.MUSIC_CONFIG_FIELD);
        CodedInputStream in = CodedInputStream.newInstance(music);
        while (!in.isAtEnd()) {
            int tag = in.readTag();
            if (tag >>> 3 == CommandRewrite.MUSIC_VIDEO_TYPE_FIELD) return in.readInt32();
            in.skipField(tag);
        }
        return -1;
    }

    @Test public void replacesTheVideoIdAndTheTypeOfAnOmvRow() throws Exception {
        CommandRewrite.Result result = retarget(omvRow(), OMV, ATV);

        assertNotNull(result);
        assertEquals("2->1", result.type());
        TapCommand tap = TapCommand.parse(result.command());
        assertEquals(ATV, tap.videoId);
        assertEquals(ALBUM, tap.playlistId);
        assertEquals(0, tap.index);
        assertEquals(CommandRewrite.TYPE_ATV, type(result.command()));
    }

    @Test public void onlyTheIdAndTheTypeChange() throws Exception {
        byte[] original = omvRow();
        byte[] rewritten = retarget(original, OMV, ATV).command();

        // The same row built with the song id and type from the start is the rewritten row, byte for byte.
        byte[] expected = command(watch(ATV, supportedConfig(CommandRewrite.TYPE_ATV)));
        assertArrayEquals(expected, rewritten);

        // The fields outside the watch endpoint and the unknown fields inside it are untouched.
        byte[] before = field(original, CommandRewrite.WATCH_ENDPOINT_FIELD);
        byte[] after = field(rewritten, CommandRewrite.WATCH_ENDPOINT_FIELD);
        assertArrayEquals(field(before, 79_857_908), field(after, 79_857_908));
        assertArrayEquals(field(before, 13), field(after, 13));
        assertArrayEquals(field(original, 4), field(rewritten, 4));
        assertArrayEquals(field(original, 144_224_893), field(rewritten, 144_224_893));
    }

    @Test public void theTypeIsSwitchedOnlyWhenItIsOmv() throws Exception {
        byte[] ugc = command(watch(OMV, supportedConfig(3)));
        CommandRewrite.Result result = retarget(ugc, OMV, ATV);

        assertEquals("untouched", result.type());
        assertEquals(ATV, TapCommand.parse(result.command()).videoId);
        assertEquals(3, type(result.command()));
    }

    @Test public void aRowWithoutAConfigKeepsItsShape() {
        byte[] row = command(watch(OMV, null));
        CommandRewrite.Result result = retarget(row, OMV, ATV);

        assertEquals("untouched", result.type());
        assertArrayEquals(command(watch(ATV, null)), result.command());
    }

    @Test public void aConfigOfAnotherShapeIsLeftUntouched() {
        // The supported config holds a string where a message is expected.
        byte[] odd = build(out -> out.writeString(CommandRewrite.MUSIC_CONFIG_FIELD, "\u0001"));
        CommandRewrite.Result result = retarget(command(watch(OMV, odd)), OMV, ATV);

        assertNotNull(result);
        assertEquals("untouched", result.type());
        assertEquals(ATV, TapCommand.parse(result.command()).videoId);
        assertArrayEquals(command(watch(ATV, odd)), result.command());
    }

    @Test public void aTypeThatIsNotAVarintIsLeftUntouched() {
        byte[] music = build(out -> out.writeString(CommandRewrite.MUSIC_VIDEO_TYPE_FIELD, "omv"));
        byte[] supported = build(out -> out.writeByteArray(CommandRewrite.MUSIC_CONFIG_FIELD, music));
        CommandRewrite.Result result = retarget(command(watch(OMV, supported)), OMV, ATV);

        assertEquals("untouched", result.type());
    }

    @Test public void nothingIsRewrittenWithoutThatWatchEndpoint() {
        assertNull(retarget(omvRow(), ATV, OMV));
        assertNull(retarget(build(out -> out.writeString(2, "no watch")), OMV, ATV));
        assertNull(retarget(new byte[]{(byte) 0xFF}, OMV, ATV));
        assertNull(retarget(omvRow(), OMV, "not-an-id"));
        assertNull(retarget(omvRow(), "short", ATV));
    }

    @Test public void theRewrittenCommandReadsBackAsAnAlbumRowOfTheSong() {
        DownloadedRegistry registry = new DownloadedRegistry();
        registry.add(ATV);
        registry.putSource(ALBUM, Arrays.asList(ATV, "other111111"));

        byte[] bytes = omvRow();
        TapCommand tap = TapCommand.parse(bytes);
        AudioFirstLogic.Arm arm = AudioFirstLogic.chooseArm(true, tap.ids,
                registry.sourceTracks(registry.findSource(bytes)), tap.index, tap.hasParams, registry::isDownloaded);
        assertEquals(new AudioFirstLogic.Arm("playlist-index", ATV), arm);
        assertTrue(AudioFirstLogic.namesTheRow(arm.rule(), arm.videoId(), tap.videoId, registry::isDownloaded));

        TapCommand after = TapCommand.parse(retarget(bytes, tap.videoId, arm.videoId()).command());
        assertEquals(ATV, after.videoId);
        assertTrue(after.ids.contains(ATV));
        assertFalse(after.ids.contains(OMV));
        assertEquals(registry.findSource(bytes), registry.findSource(retarget(bytes, OMV, ATV).command()));
    }

    @Test public void onlyAnExactRowIdIsRetargeted() {
        Set<String> copies = Collections.singleton(ATV);
        assertTrue(AudioFirstLogic.namesTheRow("playlist-index", ATV, OMV, copies::contains));
        assertTrue(AudioFirstLogic.namesTheRow("id", ATV, OMV, copies::contains));
        // The header rule cannot name the row's song.
        assertFalse(AudioFirstLogic.namesTheRow("playlist-source", ATV, OMV, copies::contains));
        // A row that already carries the song, or an id with a copy of its own, is as the app built it.
        assertFalse(AudioFirstLogic.namesTheRow("playlist-index", ATV, ATV, copies::contains));
        assertFalse(AudioFirstLogic.namesTheRow("id", ATV, OMV, Set.of(ATV, OMV)::contains));
        assertFalse(AudioFirstLogic.namesTheRow("id", ATV, null, copies::contains));
    }

    @Test public void theVideoModeDoesNotDeclineTheRetargetedSongWhileItIsArmed() {
        long now = 1_000;
        assertFalse(AudioFirstLogic.declineForVideo(AudioFirstLogic.OMV_PREFERRED, ATV, ATV, now, now + 500,
                AudioFirstLogic.ARM_TTL_MILLIS, false));
        assertTrue(AudioFirstLogic.declineForVideo(AudioFirstLogic.OMV_PREFERRED, OMV, ATV, now, now + 500,
                AudioFirstLogic.ARM_TTL_MILLIS, false));
    }

    @Test public void theAudioHintIsInsertedInFieldOrderAndNothingElseMoves() {
        byte[] row = command(watch(OMV, supportedOf(albumMusic(2))));
        CommandRewrite.Result result = CommandRewrite.retarget(row, OMV, ATV, true);

        assertEquals("2->1", result.type());
        assertEquals("added", result.hint());
        byte[] expectedMusic = build(out -> {
            out.writeInt32(2, 1);
            out.writeInt32(3, 1);
            out.writeInt32(4, 2);
        });
        assertArrayEquals(command(watch(ATV, supportedOf(expectedMusic))), result.command());
    }

    @Test public void theAudioHintIsAppendedWhenNoLaterFieldFollows() {
        byte[] music = build(out -> out.writeInt32(2, 2));
        CommandRewrite.Result result = CommandRewrite.retarget(command(watch(OMV, supportedOf(music))), OMV, ATV, true);

        byte[] expected = build(out -> {
            out.writeInt32(2, 1);
            out.writeInt32(3, 1);
        });
        assertEquals("added", result.hint());
        assertArrayEquals(command(watch(ATV, supportedOf(expected))), result.command());
    }

    @Test public void aVideoPreferredHintIsReplacedAndAnAudioOneKept() {
        byte[] video = build(out -> {
            out.writeInt32(2, 2);
            out.writeInt32(3, 2);
        });
        CommandRewrite.Result replaced = CommandRewrite.retarget(command(watch(OMV, supportedOf(video))), OMV, ATV,
                true);
        assertEquals("replaced", replaced.hint());

        byte[] expected = build(out -> {
            out.writeInt32(2, 1);
            out.writeInt32(3, 1);
        });
        assertArrayEquals(command(watch(ATV, supportedOf(expected))), replaced.command());

        CommandRewrite.Result again = CommandRewrite.retarget(replaced.command(), ATV, ATV, true);
        assertEquals("present", again.hint());
        assertEquals("untouched", again.type());
        assertArrayEquals(replaced.command(), again.command());
    }

    @Test public void noHintIsAddedUnlessAsked() {
        byte[] row = command(watch(OMV, supportedOf(albumMusic(2))));
        CommandRewrite.Result result = retarget(row, OMV, ATV);

        assertEquals("none", result.hint());
        byte[] expected = build(out -> {
            out.writeInt32(2, 1);
            out.writeInt32(4, 2);
        });
        assertArrayEquals(command(watch(ATV, supportedOf(expected))), result.command());
    }

    @Test public void aHintOfAnotherWireTypeLeavesTheConfigUntouched() {
        byte[] music = build(out -> {
            out.writeInt32(2, 2);
            out.writeString(3, "x");
        });
        CommandRewrite.Result result = CommandRewrite.retarget(command(watch(OMV, supportedOf(music))), OMV, ATV, true);

        assertEquals("none", result.hint());
        assertEquals("untouched", result.type());
        assertArrayEquals(command(watch(ATV, supportedOf(music))), result.command());
    }

    @Test public void aRowWithoutAMusicConfigGetsNoHint() {
        CommandRewrite.Result result = CommandRewrite.retarget(command(watch(OMV, null)), OMV, ATV, true);

        assertEquals("none", result.hint());
        assertArrayEquals(command(watch(ATV, null)), result.command());
    }

    /** A panel renderer: a title, its video id, the watch command, a thumbnail url holding the id, and a menu. */
    private static byte[] renderer(String video, byte[] command) {
        return build(out -> {
            out.writeByteArray(1, new byte[]{9, 9, 9});
            out.writeString(7, video);
            out.writeByteArray(6, command);
            out.writeString(8, "https://i.ytimg.com/vi/" + video + "/hq.jpg");
            out.writeByteArray(10, new byte[40]);
        });
    }

    @Test public void aRendererIsRetargetedInItsIdAndItsCommandOnly() throws Exception {
        byte[] original = renderer(OMV, omvRow());

        CommandRewrite.RendererResult result = CommandRewrite.retargetRenderer(original, OMV, ATV, false);

        assertNotNull(result);
        assertTrue(result.complete());
        assertEquals(1, result.ids());
        assertEquals(1, result.commands());
        assertEquals(ATV, new String(field(result.renderer(), 7), "ISO-8859-1"));
        assertArrayEquals(field(original, 10), field(result.renderer(), 10));
        assertEquals("https://i.ytimg.com/vi/" + OMV + "/hq.jpg",
                new String(field(result.renderer(), 8), "ISO-8859-1"));
        TapCommand row = TapCommand.parse(result.renderer());
        assertEquals(ATV, row.videoId);
        assertEquals(CommandRewrite.TYPE_ATV, type(field(result.renderer(), 6)));
    }

    @Test public void aRendererWithoutItsCommandIsNotComplete() {
        byte[] noCommand = build(out -> out.writeString(7, OMV));

        CommandRewrite.RendererResult result = CommandRewrite.retargetRenderer(noCommand, OMV, ATV, true);

        assertNotNull(result);
        assertFalse(result.complete());
    }

    @Test public void aRendererOfAnotherSongIsNotRetargeted() {
        CommandRewrite.RendererResult result = CommandRewrite.retargetRenderer(
                renderer(ATV, command(watch(ATV, supportedConfig(CommandRewrite.TYPE_ATV)))), OMV, ATV, true);

        assertNotNull(result);
        assertEquals(0, result.ids());
        assertEquals(0, result.commands());
    }

    @Test public void aMalformedRendererOrAnIdThatIsNotOneIsRefused() {
        assertNull(CommandRewrite.retargetRenderer(new byte[]{0x3A, 0x7F, 1}, OMV, ATV, true));
        assertNull(CommandRewrite.retargetRenderer(renderer(OMV, omvRow()), OMV, "short", true));
    }

    private static byte[] atvRow() {
        return command(watch(ATV, supportedConfig(CommandRewrite.TYPE_ATV)));
    }

    @Test public void aSongRowStartsAsItsMusicVideoWithTheAudioHint() throws Exception {
        // The device's Downloads-view album row (S57): the song id, the album, the song type, no hint yet.
        byte[] row = command(watch(ATV, supportedOf(albumMusic(CommandRewrite.TYPE_ATV))));
        CommandRewrite.Result result = CommandRewrite.retarget(row, ATV, OMV, true, CommandRewrite.TYPE_OMV);

        assertNotNull(result);
        assertEquals("1->2", result.type());
        assertEquals("added", result.hint());
        TapCommand tap = TapCommand.parse(result.command());
        assertEquals(OMV, tap.videoId);
        assertEquals(ALBUM, tap.playlistId);
        assertEquals(CommandRewrite.TYPE_OMV, type(result.command()));
    }

    @Test public void theSongToVideoRetargetIsTheReverseOfTheVideoToSongOne() {
        byte[] omv = omvRow();
        byte[] back = CommandRewrite.retarget(
                CommandRewrite.retarget(omv, OMV, ATV, false).command(), ATV, OMV, false,
                CommandRewrite.TYPE_OMV).command();

        assertArrayEquals(omv, back);
    }

    @Test public void aRowThatIsAlreadyTheVideoKeepsItsTypeAndAnotherIdIsNotRetargeted() throws Exception {
        CommandRewrite.Result same = CommandRewrite.retarget(omvRow(), OMV, "abcdefghijk", false,
                CommandRewrite.TYPE_OMV);

        assertNotNull(same);
        assertEquals("untouched", same.type());
        assertEquals(CommandRewrite.TYPE_OMV, type(same.command()));
        assertNull(CommandRewrite.retarget(atvRow(), "abcdefghijk", OMV, false, CommandRewrite.TYPE_OMV));
    }
}
