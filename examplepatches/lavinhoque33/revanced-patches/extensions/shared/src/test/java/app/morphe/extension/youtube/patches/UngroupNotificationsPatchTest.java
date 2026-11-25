/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.youtube.patches;

import static app.morphe.extension.youtube.patches.UngroupNotificationsPatch.ungroupNotifications;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.INBOX;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.group;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.items;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.nonVideo;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.response;
import static app.morphe.extension.youtube.patches.notifications.InboxProtoFixture.video;
import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.fail;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.junit.Test;

public class UngroupNotificationsPatchTest {
    @Test
    public void disabledNeverTouchesTheBody() throws IOException {
        byte[] inbox = inbox(INBOX);
        Iterable<?> parts = () -> {
            fail("The disabled hook must not request an iterator");
            return null;
        };

        assertSame(inbox, ungroupNotifications(inbox, false));
        assertSame(parts, ungroupNotifications(parts, false));
    }

    @Test
    public void unrelatedAndOversizedContextsDoNotRewriteEvenWhenTheMarkerOccursLately() throws IOException {
        byte[] player = inbox("GetPlayer");
        assertSame(player, ungroupNotifications(player, true));

        byte[] malformedLength = {10, (byte) 0xff, (byte) 0xff, (byte) 0xff, (byte) 0x7f};
        assertSame(malformedLength, ungroupNotifications(malformedLength, true));

        byte[] inbox = inbox(INBOX);
        byte[] truncatedContext = Arrays.copyOf(inbox, 35);
        assertSame(truncatedContext, ungroupNotifications(truncatedContext, true));
    }

    @Test
    public void probesOnlyTheUnrelatedContextAndReplaysOneShotPrefixAndTail() throws IOException {
        byte[] player = inbox("GetPlayer");
        List<ByteBuffer> parts = parts(player);
        OneShot<ByteBuffer> source = new OneShot<>(parts);

        Iterable<?> unchanged = ungroupNotifications(source, true);

        assertEquals(parts.size() - 1, source.readCount);
        assertSameParts(parts, unchanged);
        assertCursors(parts);
    }

    @Test
    public void rewritesInboxWithContextVarintAndMarkerAcrossBufferBoundaries() throws IOException {
        byte[] inbox = inbox(INBOX);
        List<ByteBuffer> parts = parts(inbox);
        OneShot<ByteBuffer> source = new OneShot<>(parts);

        Iterable<?> rewritten = ungroupNotifications(source, true);

        Iterator<?> result = rewritten.iterator();
        ByteBuffer body = ((ByteBuffer) result.next()).duplicate();
        byte[] transformed = new byte[body.remaining()];
        body.get(transformed);
        assertFalse(result.hasNext());
        assertNotSame(inbox, ungroupNotifications(inbox, true));
        assertArrayEquals(ungroupNotifications(inbox, true), transformed);
        assertEquals(3, items(transformed).size());
        assertCursors(parts);
    }

    @Test
    public void replaysOneShotAfterFullReadAndAfterNonBufferPart() throws IOException {
        byte[] noTemplate = response(INBOX, group(true, video("NoTemplate2", 4000, "Unchanged", false, null)));
        List<ByteBuffer> inboxParts = parts(noTemplate);
        assertSameParts(inboxParts, ungroupNotifications(new OneShot<>(inboxParts), true));
        assertCursors(inboxParts);

        List<Object> mixed = new ArrayList<>(inboxParts);
        mixed.add(mixed.size() - 1, new Object());
        assertSameParts(mixed, ungroupNotifications(new OneShot<>(mixed), true));
        assertSame(inboxParts, ungroupNotifications(inboxParts, true));
        assertCursors(inboxParts);
    }

    private static byte[] inbox(String request) throws IOException {
        return response(request,
                group(true, video("Spanning001", 4000, "First video", false, null),
                        video("Spanning002", 3000, "GetNotificationsInbox", false, null)),
                nonVideo(2000));
    }

    private static List<ByteBuffer> parts(byte[] body) {
        // Includes a split two-byte length varint, an empty buffer, and a marker split across buffers.
        return List.of(part(body, 0, 2, false), part(body, 2, 2, false), part(body, 2, 15, true),
                part(body, 15, 180, false), part(body, 180, body.length, true));
    }

    private static ByteBuffer part(byte[] body, int start, int end, boolean direct) {
        int length = end - start;
        ByteBuffer bytes = direct ? ByteBuffer.allocateDirect(length + 2) : ByteBuffer.allocate(length + 2);
        bytes.position(1);
        bytes.put(body, start, length);
        bytes.limit(length + 1);
        bytes.position(1);
        bytes.mark();
        return direct ? bytes : bytes.asReadOnlyBuffer();
    }

    private static void assertCursors(List<ByteBuffer> parts) {
        for (ByteBuffer part : parts) {
            assertEquals(1, part.position());
            assertEquals(part.capacity() - 1, part.limit());
            part.reset();
            assertEquals(1, part.position());
        }
    }

    private static void assertSameParts(List<?> expected, Iterable<?> actual) {
        Iterator<?> iterator = actual.iterator();
        for (Object part : expected) {
            assertSame(part, iterator.next());
        }
        assertFalse(iterator.hasNext());
    }

    private static final class OneShot<T> implements Iterable<T> {
        private final List<T> parts;
        private boolean requested;
        int readCount;

        OneShot(List<T> parts) {
            this.parts = parts;
        }

        @Override
        public Iterator<T> iterator() {
            if (requested) {
                throw new IllegalStateException("The response body was opened twice");
            }
            requested = true;
            Iterator<T> iterator = parts.iterator();
            return new Iterator<T>() {
                @Override
                public boolean hasNext() {
                    return iterator.hasNext();
                }

                @Override
                public T next() {
                    readCount++;
                    return iterator.next();
                }
            };
        }
    }
}
