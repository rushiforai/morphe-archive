/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.youtube.patches.notifications;

import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.AVATAR;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.CHANNEL;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.GROUP_KEY;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.INBOX;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.group;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.items;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.message;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.model;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.mutation;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.navigation;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.nonVideo;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.notificationId;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.response;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.single;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.thumbnail;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.unknown;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.video;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.withEntities;
import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import java.io.IOException;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.utils.ProtoNode;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 26)
public class InboxResponseFlattenerTest {
    @Before
    public void setUp() {
        ReflectionHelpers.setStaticField(Utils.class, "context", RuntimeEnvironment.getApplication());
    }

    @Test
    public void replacesGroupWithOriginalVideoModelsInOrderAndDoesNotMoveNonVideoItems() throws IOException {
        String firstVideo = "FirstVid001";
        String secondVideo = "ShortVid002";
        byte[] existing = single("SingleVid03", 2000, "Existing title");
        byte[] reply = nonVideo(9000);
        byte[] opaque = unknown("new_unrecognized_renderer.eml");
        byte[] continuation = message(1, message(6, new byte[]{0, 7, 13}));
        byte[] group = group(true,
                video(firstVideo, 3000, "First title", false, null),
                video(secondVideo, 1000, "Short title", true, null));
        byte[] input = response(INBOX, opaque, group, existing, reply, continuation);

        List<ProtoNode> flattened = items(InboxResponseFlattener.flatten(input));

        assertEquals(6, flattened.size());
        assertArrayEquals(opaque, raw(flattened.get(0)));
        assertVideo(model(flattened.get(1)), firstVideo, 3000, "First title", false);
        assertArrayEquals(existing, raw(flattened.get(2)));
        assertVideo(model(flattened.get(3)), secondVideo, 1000, "Short title", true);
        assertArrayEquals(reply, raw(flattened.get(4)));
        assertArrayEquals(continuation, raw(flattened.get(5)));
        assertNull(ProtoNode.field(model(flattened.get(1)), 15));
        assertNull(ProtoNode.field(model(flattened.get(3)), 15));
    }

    @Test
    public void usesPerVideoEntitiesAndMarksOnlyThePlayedVideoSeen() throws IOException {
        String playedVideo = "PlayedVid01";
        String unreadSibling = "UnreadVid02";
        String serverSeenVideo = "ServerVid03";
        String serverReadKey = "server-says-read";
        byte[] group = group(false,
                video(playedVideo, 5300, "Played", false, GROUP_KEY),
                video(unreadSibling, 5200, "Unplayed", false, null),
                video(serverSeenVideo, 5100, "Server seen", true, serverReadKey));
        byte[][] serverEntities = {
                mutation(GROUP_KEY, true), mutation(serverReadKey, false), mutation("unrelated-dot", true),
        };
        byte[] input = withEntities(INBOX, serverEntities, group, nonVideo(5000));

        byte[] before = InboxResponseFlattener.flatten(input);
        List<ProtoNode> beforeRows = items(before);
        String siblingKey = fieldText(ProtoNode.message(model(beforeRows.get(1)), 15), 1);
        assertEquals("EgQ1MjAwIIoCKAE%3D", siblingKey);
        assertEquals(GROUP_KEY, fieldText(ProtoNode.message(model(beforeRows.get(0)), 15), 1));
        assertEquals("keep unrelated entity key", fieldText(ProtoNode.message(model(beforeRows.get(0)), 15), 2));
        assertNotEquals(GROUP_KEY, siblingKey);
        assertEquals(Boolean.TRUE, entities(before).isUnseen(GROUP_KEY));
        assertEquals(Boolean.TRUE, entities(before).isUnseen(siblingKey));
        assertEquals(Boolean.FALSE, entities(before).isUnseen(serverReadKey));

        SeenVideos.recordPlayed(playedVideo, false);
        byte[] after = InboxResponseFlattener.flatten(input);

        List<ProtoNode> afterRows = items(after);
        assertEquals(Long.valueOf(1), ProtoNode.field(model(afterRows.get(0)), 1).getVarint());
        assertEquals(Long.valueOf(0), ProtoNode.field(model(afterRows.get(1)), 1).getVarint());
        assertEquals(Boolean.FALSE, entities(after).isUnseen(GROUP_KEY));
        assertEquals(Boolean.TRUE, entities(after).isUnseen(siblingKey));
        assertEquals(Boolean.FALSE, entities(after).isUnseen(serverReadKey));
        assertEquals(Boolean.TRUE, entities(after).isUnseen("unrelated-dot"));

        byte[][] readGroupEntities = {mutation(GROUP_KEY, false), mutation(serverReadKey, false)};
        byte[] readGroup = InboxResponseFlattener.flatten(withEntities(INBOX, readGroupEntities, group, nonVideo(5000)));
        assertEquals(Boolean.TRUE, entities(readGroup).isUnseen(siblingKey));
    }

    @Test
    public void playbackBeforeInboxArrivalCreatesASeenEntityEvenInAnEmptyMutationList() throws IOException {
        String playedShort = "PrePlayed01";
        String siblingVideo = "NotPlayed01";
        SeenVideos.recordPlayed(playedShort, true);
        byte[] group = group(true,
                video(playedShort, 4300, "Already played", true, null),
                video(siblingVideo, 4200, "Unplayed", false, null));
        byte[] input = withEntities(INBOX, new byte[0][], group, nonVideo(4000));

        byte[] flattened = InboxResponseFlattener.flatten(input);

        List<ProtoNode> rows = items(flattened);
        String playedKey = fieldText(ProtoNode.message(model(rows.get(0)), 15), 1);
        String siblingKey = fieldText(ProtoNode.message(model(rows.get(1)), 15), 1);
        assertEquals(Boolean.FALSE, entities(flattened).isUnseen(playedKey));
        assertEquals(Boolean.TRUE, entities(flattened).isUnseen(siblingKey));
    }

    @Test
    public void preservesMalformedGroupInFullAndCanStillReplaceAnotherGroup() throws IOException {
        byte[] unsupported = new byte[]{(byte) 0x80};
        byte[] malformed = group(true, video("Malformed01", 7000, "Known child", false, null), unsupported);
        byte[] valid = group(true, video("ValidVid001", 6000, "Valid", false, null));
        byte[] existing = nonVideo(2000);

        byte[] noUsableGroup = response(INBOX, malformed, existing);
        assertSame(noUsableGroup, InboxResponseFlattener.flatten(noUsableGroup));

        List<ProtoNode> flattened = items(InboxResponseFlattener.flatten(response(INBOX, malformed, valid, existing)));
        assertEquals(3, flattened.size());
        assertArrayEquals(malformed, raw(flattened.get(0)));
        assertVideo(model(flattened.get(1)), "ValidVid001", 6000, "Valid", false);
        assertArrayEquals(existing, raw(flattened.get(2)));
    }

    @Test
    public void hasNoEffectWithoutUsableSingleRowTemplate() throws IOException {
        byte[] group = group(true, video("NoTemplate1", 3000, "Unchanged", false, null));
        byte[] input = response(INBOX, group, unknown("unknown_notification.eml"));

        assertSame(input, InboxResponseFlattener.flatten(input));
    }

    private static void assertVideo(List<ProtoNode> row, String video, long id, String title, boolean shorts) {
        assertEquals(Long.valueOf(id), notificationId(row));
        assertEquals(title, fieldText(ProtoNode.message(row, 3), 1));
        assertEquals(CHANNEL, fieldText(ProtoNode.message(row, 3), 4));
        assertEquals(AVATAR, fieldText(ProtoNode.message(row, 2), 1));
        assertEquals(thumbnail(video), fieldText(ProtoNode.message(row, 4), 1));
        assertEquals(video, fieldText(navigation(row, shorts), 1));
        assertEquals("navigation extras", fieldText(navigation(row, shorts), 9));
        assertNull(ProtoNode.field(row, 31).getVarint());
        assertArrayEquals(new byte[]{0, (byte) 0xef, (byte) 0xcd, (byte) 0xab}, ProtoNode.field(row, 31).getPayload());
    }

    private static String fieldText(List<ProtoNode> message, int field) {
        return ProtoNode.field(message, field).getText();
    }

    private static byte[] raw(ProtoNode node) throws IOException {
        return ProtoNode.write(List.of(node));
    }

    private static SeenEntities entities(byte[] result) {
        return new SeenEntities(ProtoNode.parse(result));
    }
}
