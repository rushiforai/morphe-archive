package app.tikkamasalla.stremio.tuning;

/**
 * The silent frame-rate switch, without any Android or Stremio type: one playback at a time, main thread only.
 * The frame rate comes from the file header (early, so the switch runs during Stremio's own media probe) or from that
 * probe. The display mode is requested on the activity window, and Stremio's playback start is held until the display
 * reports the mode plus a settle time. Nothing is prepared before that, so Stremio's loading screen stays up. After a
 * close the mode is kept for a while, so the next episode does not re-sync the TV twice. Host is the build's glue.
 */
final class FrameRateCore {
    /** The display reports the mode when the source side is done; the TV locks on the new HDMI signal 1-3 s later. */
    static final long SETTLE_MS = 1500L;
    /** The mode request was ignored (no display change reported): start anyway. */
    static final long NO_CHANGE_MS = 3500L;
    /** Upper limit of a hold when the display changes late. */
    static final long MAX_HOLD_MS = 5000L;
    static final long REVERT_MS = 5000L;

    interface Host {
        long now();

        /** Null when the display cannot be read. */
        FrameRateModes.Mode currentMode();

        FrameRateModes.Mode[] modes();

        /** The window's preferred mode id; 0 = no preference. */
        int preferred();

        void setPreferred(int id);

        /** Display change callbacks (they call onDisplayChanged) on or off. */
        void listen(boolean on);

        void post(Runnable task, long delayMs);

        void cancel(Runnable task);

        /** The player left its idle state: a mode switch now would hit a running picture. */
        boolean started();

        /** The build's own playback start can be called later. */
        boolean canRelease();

        /** Calls the build's playback start. */
        void release();

        void event(String name, Object... keyValues);
    }

    final class Session {
        final Host host;
        final Object key;
        final long startedAt;
        float headerFps = -1f;
        boolean decided;
        int target = FrameRateModes.NONE;
        long requestedAt = -1L;
        long changedAt = -1L;
        boolean waiting;
        boolean listening;
        boolean released;
        long releasedAt = -1L;
        final Runnable check = new Runnable() {
            @Override
            public void run() {
                checkHold(Session.this);
            }
        };

        Session(Host host, Object key) {
            this.host = host;
            this.key = key;
            this.startedAt = host.now();
        }
    }

    private Session current;
    /** We set a preferred mode on the window, and it is still there. */
    private boolean owned;
    private int originalMode = FrameRateModes.NONE;
    private Host revertHost;
    private final Runnable revert = new Runnable() {
        @Override
        public void run() {
            Host host = revertHost;
            revertHost = null;
            if (host == null || !owned || current != null) return;
            owned = false;
            host.setPreferred(0);
            host.event("fr.revert", "why", "closed");
        }
    };

    Session session() {
        return current;
    }

    boolean owned() {
        return owned;
    }

    /** A stream is about to play. Cancels a pending revert: this playback decides about the mode now. */
    Session start(Host host, Object key) {
        drop(current);
        cancelRevert();
        current = new Session(host, key);
        host.event("fr.start", "owned", owned);
        return current;
    }

    /** The file header was read. A switch made here overlaps Stremio's media probe, which holds the playback anyway. */
    void onHeader(Session session, float fps, long ms) {
        session.headerFps = fps;
        session.host.event("fr.fps", "src", "header", "fps", fps, "ms", ms);
        if (session != current || session.released || session.waiting || session.decided) return;
        if (!FrameRateModes.usableFps(fps)) return;
        if (session.host.started()) {
            session.host.event("fr.skip", "why", "started");
            return;
        }
        apply(session, fps, false);
    }

    /**
     * Stremio's media probe finished: the point where it starts the playback.
     * True: this class starts it later. False: start it now (anything unexpected ends here, never a stuck screen).
     */
    boolean onProbe(Host host, Object key, float fps) {
        Session session = current;
        if (session == null || session.key != key) session = start(host, key);
        if (session.released) return false;
        session.host.event("fr.fps", "src", "probe", "fps", fps);
        if (session.host.started()) return finish(session, "started");
        if (!session.host.canRelease()) return finish(session, "nohook");
        if (!session.decided) apply(session, fps, true);
        if (session.target == FrameRateModes.NONE) return finish(session, "nochange");
        FrameRateModes.Mode mode = session.host.currentMode();
        if (session.changedAt < 0L && mode != null && mode.id == session.target) markChanged(session);
        if (delay(session) <= 0L) return finish(session, session.changedAt >= 0L ? "settled" : "timeout");
        session.waiting = true;
        schedule(session);
        return true;
    }

    /** Display callback. */
    void onDisplayChanged(Session session) {
        if (session != current || session.released || session.target == FrameRateModes.NONE || session.changedAt >= 0L) return;
        FrameRateModes.Mode mode = session.host.currentMode();
        if (mode == null || mode.id != session.target) return;
        markChanged(session);
        if (session.waiting) schedule(session);
    }

    /**
     * The player closed (Stremio would clear the mode now). True: keep the mode for REVERT_MS, skip Stremio's reset.
     * A close that arrives after the next playback began belongs to the old player: the window is the new one's.
     */
    boolean onClose(Host host, Object key) {
        Session session = current;
        if (session != null && session.key != key) return owned;
        if (session != null) {
            drop(session);
            current = null;
        }
        if (!owned) return false;
        cancelRevert();
        revertHost = host;
        host.post(revert, REVERT_MS);
        return true;
    }

    private void apply(Session session, float fps, boolean last) {
        Host host = session.host;
        FrameRateModes.Mode mode = host.currentMode();
        if (mode == null) return;
        int pick = FrameRateModes.pick(host.modes(), mode, fps);
        if (pick == FrameRateModes.NONE) {
            if (!last) return;
            // Nothing fits, or the frame rate is unknown: this video has no business on the last video's mode.
            session.decided = true;
            if (owned) {
                if (mode.id == originalMode) {
                    owned = false;
                    host.setPreferred(0);
                } else {
                    request(session, originalMode, 0);
                }
            }
            host.event("fr.nofit", "fps", fps, "hz", mode.hz);
            return;
        }
        session.decided = true;
        if (pick == mode.id) {
            int preferred = host.preferred();
            if (preferred != 0 && preferred != pick) host.setPreferred(pick);
            host.event("fr.stay", "fps", fps, "hz", mode.hz);
            return;
        }
        if (!owned) originalMode = mode.id;
        owned = true;
        request(session, pick, pick);
        host.event("fr.req", "fps", fps, "from", mode.hz, "to", hzOf(host.modes(), pick), "src", last ? "probe" : "header");
    }

    private static float hzOf(FrameRateModes.Mode[] modes, int id) {
        if (modes != null) {
            for (FrameRateModes.Mode mode : modes) {
                if (mode != null && mode.id == id) return mode.hz;
            }
        }
        return -1f;
    }

    private void request(Session session, int target, int preferred) {
        if (preferred == 0) owned = false;
        session.target = target;
        session.requestedAt = session.host.now();
        session.changedAt = -1L;
        if (!session.listening) {
            session.listening = true;
            session.host.listen(true);
        }
        session.host.setPreferred(preferred);
    }

    private void markChanged(Session session) {
        session.changedAt = session.host.now();
        session.host.event("fr.changed", "ms", session.changedAt - session.requestedAt);
        stopListening(session);
    }

    private long delay(Session session) {
        long now = session.host.now();
        if (session.changedAt >= 0L) {
            return Math.min(session.changedAt + SETTLE_MS, session.requestedAt + MAX_HOLD_MS) - now;
        }
        return session.requestedAt + NO_CHANGE_MS - now;
    }

    private void schedule(Session session) {
        session.host.cancel(session.check);
        session.host.post(session.check, Math.max(0L, delay(session)));
    }

    private void checkHold(Session session) {
        if (session != current || session.released || !session.waiting) return;
        if (delay(session) > 0L) {
            schedule(session);
            return;
        }
        finish(session, session.changedAt >= 0L ? "settled" : "timeout");
        session.host.release();
    }

    /** Always false, for onProbe's returns. */
    private boolean finish(Session session, String why) {
        session.released = true;
        session.waiting = false;
        session.host.cancel(session.check);
        stopListening(session);
        long now = session.host.now();
        session.releasedAt = now;
        session.host.event("fr.release", "why", why, "total_ms", now - session.startedAt,
                "hold_ms", session.requestedAt >= 0L ? now - session.requestedAt : 0L);
        return false;
    }

    private void stopListening(Session session) {
        if (!session.listening) return;
        session.listening = false;
        session.host.listen(false);
    }

    private void drop(Session session) {
        if (session == null) return;
        session.released = true;
        session.waiting = false;
        session.host.cancel(session.check);
        stopListening(session);
    }

    private void cancelRevert() {
        Host host = revertHost;
        if (host == null) return;
        revertHost = null;
        host.cancel(revert);
    }
}
