/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

/** Follow only observed native copy edges; equal video IDs never imply equal playback requests. */
@SuppressWarnings("unused")
public final class PlaybackRequestIdentity {
    public interface Request {
        Object rvxRequestOrigin();
        void rvxRequestOrigin(Object request);
    }

    private PlaybackRequestIdentity() { }

    private static Object original(Object request) {
        if (request instanceof Request identity) {
            Object origin = identity.rvxRequestOrigin();
            if (origin != null) return origin;
        }
        return request;
    }

    public static boolean same(Object first, Object second) {
        return original(first) == original(second);
    }

    public static Object inherit(Object copy, Object source) {
        if (copy != source && copy instanceof Request identity) {
            identity.rvxRequestOrigin(original(source));
        }
        return copy;
    }
}
