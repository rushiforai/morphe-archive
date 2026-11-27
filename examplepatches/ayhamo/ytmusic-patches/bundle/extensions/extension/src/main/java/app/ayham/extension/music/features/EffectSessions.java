package app.ayham.extension.music.features;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Our own audio sessions as the system's equalizers see them (Samsung's SoundAlive and the like only
 * act on sessions announced with OPEN_AUDIO_EFFECT_CONTROL_SESSION, and drop them on CLOSE). YT's
 * players announce theirs; automix's decks, the stream decks and the addon player are ours, so we
 * announce them. Each session has an owner (a deck, a player); an owner holds one session at a time.
 *
 * <p>The bookkeeping only: what to open and close. A missing close is made up: an owner that comes
 * back with another session closes its old one first, and a session another owner takes over is
 * closed for the old one.
 */
final class EffectSessions {
    /** One broadcast to send: OPEN or CLOSE of a session. */
    static final class Event {
        final boolean open;
        final int session;

        Event(boolean open, int session) {
            this.open = open;
            this.session = session;
        }

        @Override
        public boolean equals(Object o) {
            return o instanceof Event && ((Event) o).open == open && ((Event) o).session == session;
        }

        @Override
        public int hashCode() {
            return session * 2 + (open ? 1 : 0);
        }

        @Override
        public String toString() {
            return (open ? "open " : "close ") + session;
        }
    }

    private final Map<Object, Integer> byOwner = new HashMap<>();
    private final Map<Integer, Object> bySession = new HashMap<>();

    /** [owner] plays on [session] now. */
    synchronized List<Event> open(Object owner, int session) {
        List<Event> out = new ArrayList<>();
        if (session <= 0) return out;
        Integer had = byOwner.get(owner);
        if (had != null && had == session) return out;
        if (had != null) {
            // the owner's session changed with no close for the old one
            bySession.remove(had);
            out.add(new Event(false, had));
        }
        Object other = bySession.get(session);
        if (other != null) {
            // the id came back to another owner: the old one's close was missed
            byOwner.remove(other);
            out.add(new Event(false, session));
        }
        byOwner.put(owner, session);
        bySession.put(session, owner);
        out.add(new Event(true, session));
        return out;
    }

    /** [owner] stopped: its session closed (nothing when it had none). */
    synchronized List<Event> close(Object owner) {
        List<Event> out = new ArrayList<>();
        Integer had = byOwner.remove(owner);
        if (had != null) {
            bySession.remove(had);
            out.add(new Event(false, had));
        }
        return out;
    }

    /** A session we announced (its broadcast is ours, not YT's). */
    synchronized boolean ours(int session) {
        return bySession.containsKey(session);
    }

    synchronized int sessionOf(Object owner) {
        Integer s = byOwner.get(owner);
        return s == null ? 0 : s;
    }
}
