/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4896
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.youtube.patches;

import androidx.annotation.Nullable;

import com.google.protobuf.WireFormat;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.function.IntSupplier;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.youtube.patches.notifications.InboxResponseFlattener;
import app.morphe.extension.youtube.patches.notifications.PlayedVideoTracker;
import app.morphe.extension.youtube.settings.Settings;

@SuppressWarnings("unused")
public final class UngroupNotificationsPatch {
    private static final byte[] INBOX_REQUEST = "GetNotificationsInbox".getBytes(StandardCharsets.US_ASCII);
    private static final int RESPONSE_CONTEXT_TAG = 1 << 3 | WireFormat.WIRETYPE_LENGTH_DELIMITED;
    private static final int MAX_RESPONSE_CONTEXT_LENGTH = 64 * 1024;
    private static final int MAX_CONTEXT_PARTS = MAX_RESPONSE_CONTEXT_LENGTH + 6;

    /** Injection point for regular and background playback. */
    public static void onVideoLoaded(String videoId) {
        try {
            if (enabled()) {
                PlayedVideoTracker.onVideoLoaded(videoId);
            }
        } catch (RuntimeException | LinkageError ex) {
            Logger.printDebug(() -> "Could not track notification playback");
        }
    }

    /** Injection point for a network response delivered as an array. */
    @Nullable
    public static byte[] ungroupNotifications(@Nullable byte[] body) {
        return ungroupNotifications(body, enabled());
    }

    @Nullable
    static byte[] ungroupNotifications(@Nullable byte[] body, boolean enabled) {
        if (!enabled || body == null || body.length == 0 || body[0] != RESPONSE_CONTEXT_TAG) {
            return body;
        }

        if (!isInboxResponse(new IntSupplier() {
            private int index = 1;

            @Override
            public int getAsInt() {
                return index < body.length ? body[index++] & 0xff : -1;
            }
        })) {
            return body;
        }
        return flatten(body);
    }

    /** Injection point for a network response delivered in buffers. */
    @Nullable
    public static Iterable<?> ungroupNotifications(@Nullable Iterable<?> parts) {
        return ungroupNotifications(parts, enabled());
    }

    @Nullable
    static Iterable<?> ungroupNotifications(@Nullable Iterable<?> parts, boolean enabled) {
        if (!enabled || parts == null) {
            return parts;
        }

        return rewriteParts(parts);
    }

    private static <T> Iterable<?> rewriteParts(Iterable<T> parts) {
        ResponseParts<T> response;
        try {
            response = new ResponseParts<>(parts.iterator());
        } catch (RuntimeException ex) {
            return parts;
        }

        try {
            if (response.getAsInt() == RESPONSE_CONTEXT_TAG && isInboxResponse(response)) {
                byte[] body = response.body();
                if (body != null) {
                    byte[] flattened = flatten(body);
                    if (flattened != body) {
                        return List.of(ByteBuffer.wrap(flattened));
                    }
                }
            }
        } catch (RuntimeException ex) {
            Logger.printDebug(() -> "Could not read notification inbox response parts");
        }
        // A general Iterable can hand out the very same iterator (or permit only one call).
        return parts instanceof Collection<?> ? parts : response.replay(parts);
    }

    private static boolean enabled() {
        try {
            return Settings.UNGROUP_NOTIFICATIONS.get();
        } catch (RuntimeException | LinkageError ex) {
            return false;
        }
    }

    private static byte[] flatten(byte[] body) {
        try {
            return InboxResponseFlattener.flatten(body);
        } catch (IOException | RuntimeException | LinkageError ex) {
            Logger.printDebug(() -> "Could not ungroup notification inbox response");
            return body;
        }
    }

    /** Reads only the length and bytes of the first field, after its tag has been checked. */
    private static boolean isInboxResponse(IntSupplier bytes) {
        int length = 0;
        for (int shift = 0; ; shift += 7) {
            int next = bytes.getAsInt();
            if (next < 0 || shift > 14) {
                return false;
            }
            length |= (next & 0x7f) << shift;
            if ((next & 0x80) == 0) {
                break;
            }
        }
        if (length < INBOX_REQUEST.length || length > MAX_RESPONSE_CONTEXT_LENGTH) {
            return false;
        }

        int matched = 0;
        boolean found = false;
        for (int remaining = length; remaining > 0; remaining--) {
            int next = bytes.getAsInt();
            if (next < 0) {
                return false;
            }
            if (!found) {
                // The initial 'G' occurs only at the start of this marker.
                matched = next == INBOX_REQUEST[matched] ? matched + 1 : next == INBOX_REQUEST[0] ? 1 : 0;
                found = matched == INBOX_REQUEST.length;
            }
        }
        return found;
    }

    private static final class ResponseParts<T> implements IntSupplier {
        private final Iterator<T> remaining;
        private final List<T> prefix = new ArrayList<>();
        @Nullable
        private ByteBuffer current;
        private int index;
        private int size;

        ResponseParts(Iterator<T> remaining) {
            this.remaining = remaining;
        }

        @Override
        public int getAsInt() {
            while (current == null || index == current.limit()) {
                if (prefix.size() == MAX_CONTEXT_PARTS || !remaining.hasNext() || !readPart()) {
                    return -1;
                }
                index = current.position();
            }
            return current.get(index++) & 0xff;
        }

        private boolean readPart() {
            T part = remaining.next();
            prefix.add(part);
            if (!(part instanceof ByteBuffer buffer) || buffer.remaining() > Integer.MAX_VALUE - size) {
                return false;
            }
            current = buffer;
            size += buffer.remaining();
            return true;
        }

        @Nullable
        byte[] body() {
            while (remaining.hasNext()) {
                if (!readPart()) {
                    return null;
                }
            }
            if (prefix.size() == 1 && current != null && current.hasArray()
                    && current.position() + current.arrayOffset() == 0 && current.array().length == size) {
                return current.array();
            }

            byte[] body = new byte[size];
            int offset = 0;
            for (Object part : prefix) {
                ByteBuffer buffer = ((ByteBuffer) part).duplicate();
                int length = buffer.remaining();
                buffer.get(body, offset, length);
                offset += length;
            }
            return body;
        }

        Iterable<T> replay(Iterable<T> original) {
            return new Iterable<T>() {
                private boolean replayed;

                @Override
                public synchronized Iterator<T> iterator() {
                    if (replayed) {
                        return original.iterator();
                    }
                    replayed = true;
                    Iterator<T> consumed = prefix.iterator();
                    return new Iterator<T>() {
                        @Override
                        public boolean hasNext() {
                            return consumed.hasNext() || remaining.hasNext();
                        }

                        @Override
                        public T next() {
                            return consumed.hasNext() ? consumed.next() : remaining.next();
                        }
                    };
                }
            };
        }
    }
}
