/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import androidx.annotation.Nullable;

import java.lang.reflect.Field;
import java.util.function.Supplier;

import app.hushtelegram.extension.shared.diagnostics.HookStatus;

/**
 * Who the call on now is with (#72), read from Telegram's VoIPService, which runs for private
 * calls, voice chats, conference calls and live streams alike: a person for a private call, a
 * group or channel for the rest. {@link CallRecorder} uses it to name the file and to follow Record
 * calls' scope.
 */
final class CallPeer {
    static final int UNKNOWN = 0;
    static final int PRIVATE = 1;
    static final int GROUP = 2;

    static final CallPeer NONE = new CallPeer(UNKNOWN, 0, null);

    /** How long a read stands, since the audio hooks ask about every ten-millisecond block. */
    static final long FRESH_MS = 1_000;

    private static final String SERVICE = "org.telegram.messenger.voip.VoIPService";

    final int kind;
    /** Telegram's dialog id: the user's id for a person, minus the chat's id for a group or channel. 0 when unknown. */
    final long dialog;
    /** The person's name or the group's title, null when there's none to read. */
    @Nullable final String name;

    CallPeer(int kind, long dialog, @Nullable String name) {
        this.kind = kind;
        this.dialog = dialog;
        this.name = name;
    }

    // Swapped by tests.
    static Supplier<CallPeer> reader = CallPeer::read;

    @Nullable private static volatile CallPeer last;
    private static volatile long readAt = Long.MIN_VALUE;

    /** The call on at [now], read again once the last read is {@link #FRESH_MS} old. */
    static CallPeer at(long now) {
        CallPeer known = last;
        if (known != null && now - readAt < FRESH_MS && now >= readAt) return known;
        CallPeer read;
        try {
            read = reader.get();
        } catch (Throwable failure) {
            HookStatus.threw(CallRecorder.FAMILY, "call peer read", failure);
            read = NONE;
        }
        if (read == null) read = NONE;
        last = read;
        readAt = now;
        return read;
    }

    static void forget() {
        last = null;
        readAt = Long.MIN_VALUE;
    }

    private static CallPeer read() {
        try {
            Class<?> type = Class.forName(SERVICE, false, CallPeer.class.getClassLoader());
            Object service = HostNames.method(type, "getSharedInstance").invoke(null);
            return service == null ? NONE : of(service);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError unreadable) {
            HookStatus.threw(CallRecorder.FAMILY, "call peer read", unreadable);
            return NONE;
        }
    }

    /**
     * The peer of [service], a VoIPService or a test's stand-in with the same fields. A group call,
     * conference or stream makes it a group even where there's no chat to name.
     */
    static CallPeer of(Object service) {
        Object chat = read(service, "chat");
        boolean group = chat != null || read(service, "groupCall") != null || read(service, "conference") != null
                || Boolean.TRUE.equals(read(service, "isRtmpStream"));
        if (group) {
            long id = chat == null ? 0 : number(read(chat, "id"));
            return new CallPeer(GROUP, id == 0 ? 0 : -id, chat == null ? null : text(read(chat, "title")));
        }
        Object user = read(service, "user");
        if (user == null) return NONE;
        String first = text(read(user, "first_name"));
        String last = text(read(user, "last_name"));
        String name = first == null ? last : last == null ? first : first + " " + last;
        return new CallPeer(PRIVATE, number(read(user, "id")), name);
    }

    /** A field by its source name, wherever it's declared, or null where this build has none. */
    @Nullable
    private static Object read(Object owner, String name) {
        for (Class<?> type = owner.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            try {
                Field field = HostNames.declaredField(type, name);
                field.setAccessible(true);
                return field.get(owner);
            } catch (NoSuchFieldException missing) {
                // Declared further up, if anywhere.
            } catch (IllegalAccessException | RuntimeException unreadable) {
                return null;
            }
        }
        return null;
    }

    private static long number(@Nullable Object value) {
        return value instanceof Number ? ((Number) value).longValue() : 0;
    }

    @Nullable
    private static String text(@Nullable Object value) {
        if (!(value instanceof String)) return null;
        String trimmed = ((String) value).trim();
        return trimmed.isEmpty() ? null : trimmed;
    }
}
