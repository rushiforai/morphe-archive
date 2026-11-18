package io.github.sabopura.morphe.extension.twitch.player;

import java.lang.ref.WeakReference;

/**
 * The sleep timer's "when this video ends": whose video it waits for. Another video on that
 * player, or the player going away, forgets the wait; the same video loaded again (a reload, a
 * retry) keeps it.
 */
final class EndSleep {
    private WeakReference<Object> player = new WeakReference<>(null);
    private String content = "";

    synchronized void set(Object forPlayer, String itsContent) {
        player = new WeakReference<>(forPlayer);
        content = itsContent;
    }

    synchronized void clear() {
        player.clear();
    }

    synchronized void loading(Object loader, String loaded) {
        if (player.get() == loader && !content.equals(loaded)) clear();
    }

    synchronized void released(Object gone) {
        if (player.get() == gone) clear();
    }

    synchronized Object player() {
        return player.get();
    }

    synchronized boolean waiting() {
        return player.get() != null;
    }

    /** A video ended and Twitch is about to move on: true once, when the timer waited for that. */
    synchronized boolean reached() {
        boolean waited = waiting();
        clear();
        return waited;
    }
}
