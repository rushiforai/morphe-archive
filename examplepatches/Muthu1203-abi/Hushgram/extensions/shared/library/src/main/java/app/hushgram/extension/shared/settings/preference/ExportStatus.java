/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.shared.settings.preference;

import androidx.annotation.Nullable;

import java.util.UUID;
import java.util.concurrent.CopyOnWriteArrayList;

import app.hushgram.extension.shared.Utils;

/** Process-only feedback for configuration, clipboard and diagnostic-file exports. */
public final class ExportStatus {
    public static final ExportStatus CONFIGURATION = new ExportStatus();
    public static final ExportStatus DIAGNOSTICS = new ExportStatus();

    /** Messages are fixed localized UI text, never a URI, file path or report body. */
    public static final class State {
        public final String token, message;
        public final boolean active, choosing;

        private State(String token, String message, boolean active, boolean choosing) {
            this.token = token;
            this.message = message;
            this.active = active;
            this.choosing = choosing;
        }
    }

    @Nullable private volatile State current;
    private final CopyOnWriteArrayList<Runnable> watchers = new CopyOnWriteArrayList<>();

    private ExportStatus() { }

    @Nullable public State state() { return current; }

    public boolean active() {
        State state = current;
        return state != null && state.active;
    }

    /** A duplicate tap leaves the active operation and its feedback untouched. */
    @Nullable public synchronized String begin(String message, boolean choosing) {
        if (active()) return null;
        String token = UUID.randomUUID().toString();
        publish(new State(token, message, true, choosing));
        return token;
    }

    /** Claims a picker result once before its worker is submitted. */
    public synchronized boolean start(String token, String message) {
        if (current == null || !current.active || !current.choosing || !current.token.equals(token)) return false;
        publish(new State(token, message, true, false));
        return true;
    }

    public synchronized boolean finish(String token, String message) {
        if (current == null || !current.active || !current.token.equals(token)) return false;
        publish(new State(token, message, false, false));
        return true;
    }

    public void watch(Runnable watcher) { watchers.addIfAbsent(watcher); }
    public void unwatch(Runnable watcher) { watchers.remove(watcher); }

    private void publish(State state) {
        current = state;
        for (Runnable watcher : watchers) Utils.runOnMainThread(() -> {
            // A closed page is released; a rebound page always reads the latest state.
            if (watchers.contains(watcher)) watcher.run();
        });
    }
}
