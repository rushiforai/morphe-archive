/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * The page fragments the app showed, as far as the Downloads page is concerned: which one is started (on screen)
 * and which of them loaded the Downloads page. A page controller tells when its fragment starts and stops; the
 * fragment that is started when the Downloads page is loaded is a Downloads page, and stays one. Nothing is held
 * strongly, so a fragment that is gone is forgotten. Thread safe; contains no Android code.
 */
final class PageHosts {
    private final Set<Object> downloadsPages = Collections.newSetFromMap(new WeakHashMap<>());
    private WeakReference<Object> startedController = new WeakReference<>(null);
    private WeakReference<Object> startedHost = new WeakReference<>(null);
    /** The Downloads page was loaded before any fragment started: the next one to start is it. */
    private boolean loadedBeforeStart;

    synchronized void started(Object controller, Object host) {
        startedController = new WeakReference<>(controller);
        startedHost = new WeakReference<>(host);
        if (loadedBeforeStart) {
            downloadsPages.add(host);
            loadedBeforeStart = false;
        }
    }

    synchronized void stopped(Object controller) {
        if (startedController.get() != controller) return;

        startedController = new WeakReference<>(null);
        startedHost = new WeakReference<>(null);
    }

    /** The Downloads page was loaded (built or built again): the fragment on screen is a Downloads page. */
    synchronized void downloadsLoaded() {
        Object host = startedHost.get();
        if (host == null) {
            loadedBeforeStart = true;
        } else {
            downloadsPages.add(host);
        }
    }

    /** The Downloads page fragment that is on screen now, or null. */
    @Nullable
    synchronized Object startedDownloadsPage() {
        Object host = startedHost.get();
        return host != null && downloadsPages.contains(host) ? host : null;
    }
}
