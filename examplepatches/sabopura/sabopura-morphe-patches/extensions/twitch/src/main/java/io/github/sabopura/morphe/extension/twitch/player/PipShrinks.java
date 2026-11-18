package io.github.sabopura.morphe.extension.twitch.player;

import java.util.Map;
import java.util.WeakHashMap;

/** Which player screens are in picture-in-picture, and whether another screen asked one to shrink meanwhile. */
final class PipShrinks {
    // Weak keys: a player screen closed during picture-in-picture never hears that it ended.
    private final Map<Object, Boolean> askedDuringPip = new WeakHashMap<>();

    synchronized void asked(Object player) {
        if (player != null && askedDuringPip.containsKey(player)) askedDuringPip.put(player, Boolean.TRUE);
    }

    /** True once, when picture-in-picture ends for a player that was asked to shrink during it. */
    synchronized boolean changed(Object player, boolean pip) {
        if (player == null) return false;
        if (pip) {
            askedDuringPip.putIfAbsent(player, Boolean.FALSE);
            return false;
        }
        return Boolean.TRUE.equals(askedDuringPip.remove(player));
    }
}
