/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import android.annotation.SuppressLint;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;

import java.util.ArrayDeque;
import java.util.List;

import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Explicit playlist starts own recommendations; neither restored playback nor native shuffle state owns them. */
@SuppressWarnings("unused")
public final class SmartShuffleManager {
    private static final Object LOCK = new Object();
    static final String ENABLED_KEY = "revanced_smart_shuffle";
    private static long revision;
    private static SmartShuffleStart pending;
    private static Session active;
    private static SmartShufflePolicy policy;
    private static long policyQueue = Long.MIN_VALUE;
    private static SmartShuffleNative.Snapshot latest;
    private static boolean snapshotPending;
    private static boolean snapshotAgain;
    private static boolean watchingNetwork;
    private static boolean online;

    private static final class Session {
        final String playlistId;
        final long queueGeneration;
        final ArrayDeque<SmartShuffleSource.Candidate> candidates = new ArrayDeque<>();
        long revision;
        SmartShuffleSource.Result source;
        boolean loading;
        SmartShuffleNative.Item[] inserted;
        boolean inserting;
        boolean failed;

        Session(String playlistId, long queueGeneration, long revision) {
            this.playlistId = playlistId;
            this.queueGeneration = queueGeneration;
            this.revision = revision;
        }
    }

    private record KeepContext(String playlistId, boolean editable, SmartShuffleSource.Candidate candidate) { }
    private record Insertion(Session session, long revision, long anchor,
                             SmartShuffleSource.Candidate candidate, SmartShufflePolicy policy) { }

    private SmartShuffleManager() { }

    /** Retain registry/import compatibility, but direct toggles must not remove the default OFF value. */
    static final class EnabledPreference extends BooleanSetting {
        EnabledPreference() {
            super(ENABLED_KEY, Boolean.FALSE);
            boolean present = preferences.preferences.contains(key);
            debug(() -> "Smart Shuffle preference initial present=" + present + " value=" + get()
                    + " default=" + defaultValue);
            if (!present) store(false);
        }

        void store(boolean enabled) {
            boolean previous = value;
            value = enabled;
            saveToPreferences();
            debug(() -> "Smart Shuffle preference stored previous=" + previous + " enabled=" + enabled
                    + " present=" + preferences.preferences.contains(key)
                    + " persisted=" + preferences.getBoolean(key, false) + " explicit=true");
        }
    }

    private static final class PreferenceHolder {
        static final EnabledPreference ENABLED = new EnabledPreference();
    }

    /** Logger's normal revanced_debug gate, without startup logging before a context is available. */
    static void debug(Logger.LogMessage message) {
        if (Utils.isContextSet()) Logger.printDebug(message);
    }

    /** Only identifiers/constant labels belong in logs, never endpoints, continuation tokens or request fields. */
    static String logId(String value) {
        if (value == null || value.isEmpty()) return "none";
        if (value.length() > 128) return "redacted";
        for (int index = 0; index < value.length(); index++) {
            char character = value.charAt(index);
            if (!(character >= 'a' && character <= 'z' || character >= 'A' && character <= 'Z'
                    || character >= '0' && character <= '9' || character == '-' || character == '_')) {
                return "redacted";
            }
        }
        return value;
    }

    public static boolean isEnabled() {
        if (!SmartShuffleNative.supported()) return false;
        watchNetwork();
        return PreferenceHolder.ENABLED.get();
    }

    public static void setEnabled(boolean enabled) {
        PreferenceHolder.ENABLED.store(enabled);
        if (!enabled) cancel("toggle-off");
        refreshPresentation();
    }

    /** Called only by the scoped header/song command hook, before the native playback command proceeds. */
    public static void activate(String playlistId, String trigger) {
        String source = SmartShuffleStart.normalize(playlistId);
        boolean enabled = isEnabled();
        debug(() -> "Smart Shuffle activation playlist=" + logId(source) + " trigger=" + logId(trigger)
                + " enabled=" + enabled);
        if (!enabled || source.isEmpty() || source.startsWith("RD")) return;
        synchronized (LOCK) {
            revision++;
            pending = online ? new SmartShuffleStart(source, revision) : null;
            active = null;
            long generation = revision;
            debug(() -> "Smart Shuffle activation armed=" + (pending != null) + " online=" + online
                    + " revision=" + generation + " playlist=" + logId(source));
        }
        SmartShuffleNative.cancelPending();
        SmartShuffleKeep.cancelPending();
        removeFutureSuggestions("new-activation");
    }

    /** Restored sessions have no armed Pending and can therefore never activate recommendations. */
    public static void onPlaybackStarted(String videoId) {
        synchronized (LOCK) {
            if (pending != null && pending.revision == revision) pending.playbackStarted(videoId);
            if (pending == null && active == null && policy == null) return;
        }
        requestSnapshot();
    }

    public static void onQueueChanged() {
        synchronized (LOCK) {
            if (pending == null && active == null && policy == null) return;
        }
        requestSnapshot();
    }

    public static void onAccountChanged() {
        cancel("account-changed");
        synchronized (LOCK) {
            policy = null;
        }
        refreshPresentation();
    }

    /** Navigation/toggle-off invalidates asynchronous ownership, but never stops the current song. */
    public static void cancel() {
        cancel("navigation");
    }

    private static void cancel(String reason) {
        synchronized (LOCK) {
            revision++;
            long generation = revision;
            debug(() -> "Smart Shuffle cancel reason=" + reason + " revision=" + generation
                    + " pending=" + (pending != null) + " active=" + (active != null));
            pending = null;
            active = null;
        }
        SmartShuffleNative.cancelPending();
        SmartShuffleKeep.cancelPending();
        removeFutureSuggestions(reason);
    }

    public static boolean isSuggested(long occurrenceId) {
        synchronized (LOCK) {
            return policy != null && latest != null && policyQueue == latest.generation()
                    && policy.isSuggested(occurrenceId);
        }
    }

    public static void keep(long occurrenceId) {
        SmartShufflePolicy owner;
        KeepContext context;
        long expectedRevision;
        synchronized (LOCK) {
            if (!networkAvailable() || policy == null) {
                debug(() -> "Smart Shuffle Keep rejected occurrence=" + occurrenceId + " reason=offline-or-no-session");
                return;
            }
            SmartShufflePolicy.Suggestion suggestion = policy.suggestion(occurrenceId);
            if (suggestion == null || !(suggestion.attachment() instanceof KeepContext keep)) {
                debug(() -> "Smart Shuffle Keep rejected occurrence=" + occurrenceId + " reason=not-suggested");
                return;
            }
            owner = policy;
            context = keep;
            expectedRevision = revision;
        }
        debug(() -> "Smart Shuffle Keep request occurrence=" + occurrenceId
                + " video=" + logId(context.candidate().videoId()) + " playlist=" + logId(context.playlistId())
                + " source=" + (context.editable() ? "owned-playlist" : "picker"));
        Utils.runOnBackgroundThread(() -> SmartShuffleSource.keep(Utils.getContext(), context.playlistId(),
                context.editable(), context.candidate(), occurrenceId, confirmed -> {
                    if (!confirmed) {
                        debug(() -> "Smart Shuffle Keep result occurrence=" + occurrenceId + " confirmed=false");
                        return;
                    }
                    boolean changed;
                    synchronized (LOCK) {
                        changed = revision == expectedRevision && policy == owner && owner.clear(occurrenceId);
                    }
                    debug(() -> "Smart Shuffle Keep result occurrence=" + occurrenceId
                            + " confirmed=true markerCleared=" + changed + " stale=" + !changed);
                    if (changed) refreshPresentation();
                }));
    }

    public static void dismiss(long occurrenceId) {
        SmartShufflePolicy owner;
        long generation;
        synchronized (LOCK) {
            if (policy == null || latest == null || !policy.isSuggested(occurrenceId)) {
                debug(() -> "Smart Shuffle Dismiss rejected occurrence=" + occurrenceId + " reason=not-suggested");
                return;
            }
            owner = policy;
            generation = policyQueue;
        }
        debug(() -> "Smart Shuffle Dismiss request occurrence=" + occurrenceId + " generation=" + generation);
        SmartShuffleNative.remove(generation, occurrenceId, false, removed -> {
            boolean changed;
            synchronized (LOCK) {
                changed = removed && policy == owner && owner.clear(occurrenceId);
            }
            debug(() -> "Smart Shuffle Dismiss result occurrence=" + occurrenceId + " generation=" + generation
                    + " removed=" + removed + " markerCleared=" + changed);
            if (changed) refreshPresentation();
            requestSnapshot();
        });
    }

    private static void requestSnapshot() {
        synchronized (LOCK) {
            if (snapshotPending) {
                snapshotAgain = true;
                return;
            }
            snapshotPending = true;
        }
        SmartShuffleNative.snapshot(SmartShuffleManager::receivedSnapshot);
    }

    private static void receivedSnapshot(SmartShuffleNative.Snapshot snapshot) {
        boolean repaint = false;
        boolean cancelNative = false;
        boolean again;
        Session load = null;
        Insertion insertion = null;
        synchronized (LOCK) {
            snapshotPending = false;
            again = snapshotAgain;
            snapshotAgain = false;
            if (snapshot != null) {
                latest = snapshot;
                if (policy != null && policyQueue != snapshot.generation()) {
                    debug(() -> "Smart Shuffle stale policy generation=" + policyQueue
                            + " queueGeneration=" + snapshot.generation());
                    policy = null;
                    repaint = true;
                }
                if (active != null && !ownsQueue(active, snapshot)) {
                    Session stale = active;
                    debug(() -> "Smart Shuffle stale session generation=" + stale.queueGeneration
                            + " queueGeneration=" + snapshot.generation()
                            + " playlist=" + logId(stale.playlistId));
                    active = null;
                    revision++;
                    cancelNative = true;
                }
                if (pending != null && ready(pending, snapshot) && online && isEnabled()) {
                    active = new Session(pending.playlistId, snapshot.generation(), revision);
                    pending = null;
                    Session started = active;
                    debug(() -> "Smart Shuffle session playlist=" + logId(started.playlistId)
                            + " generation=" + started.queueGeneration + " revision=" + started.revision);
                    policy = null;
                    repaint = true;
                }
                if (policy != null) repaint |= policy.retain(snapshot.items());
                if (active != null && online && isEnabled() && !active.failed) {
                    logInsertedPositions(active, snapshot);
                    if (active.source == null && !active.loading) {
                        load = active;
                        load.loading = true;
                    } else if (policy != null && !active.loading && !active.inserting) {
                        long anchor = policy.nextAnchor(snapshot.items(), snapshot.currentIndex());
                        if (anchor != SmartShufflePolicy.NO_ANCHOR) {
                            SmartShuffleSource.Candidate candidate = nextCandidate(active);
                            if (candidate != null) {
                                active.inserting = true;
                                insertion = new Insertion(active, revision, anchor, candidate, policy);
                            } else if (!active.source.exhausted()) {
                                load = active;
                                load.loading = true;
                            }
                        }
                    }
                }
            }
        }
        if (cancelNative) {
            SmartShuffleNative.cancelPending();
            SmartShuffleKeep.cancelPending();
        }
        if (repaint) refreshPresentation();
        if (load != null) loadSource(load);
        if (insertion != null) insert(insertion);
        if (again) requestSnapshot();
    }

    private static boolean ready(SmartShuffleStart start, SmartShuffleNative.Snapshot snapshot) {
        int current = snapshot.currentIndex();
        return current >= 0 && current < snapshot.items().length
                && start.matches(revision, snapshot.playlistId(), snapshot.items()[current].videoId());
    }

    private static boolean ownsQueue(Session session, SmartShuffleNative.Snapshot snapshot) {
        return session.queueGeneration == snapshot.generation()
                && session.playlistId.equals(SmartShuffleStart.normalize(snapshot.playlistId()));
    }

    private static SmartShuffleSource.Candidate nextCandidate(Session session) {
        while (!session.candidates.isEmpty()) {
            SmartShuffleSource.Candidate candidate = session.candidates.removeFirst();
            if (policy.reserve(candidate.videoId())) return candidate;
        }
        return null;
    }

    private static boolean matches(Session session, long expectedRevision) {
        synchronized (LOCK) {
            return active == session && session.revision == expectedRevision && latest != null
                    && SmartShufflePolicy.accepts(expectedRevision, revision, session.queueGeneration,
                            latest.generation(), online && isEnabled() && networkAvailable());
        }
    }

    private static void loadSource(Session session) {
        long expectedRevision;
        SmartShuffleSource.Result previous;
        synchronized (LOCK) {
            expectedRevision = session.revision;
            previous = session.source;
        }
        debug(() -> "Smart Shuffle lookup start playlist=" + logId(session.playlistId)
                + " generation=" + session.queueGeneration + " revision=" + expectedRevision
                + " more=" + (previous != null));
        Utils.runOnBackgroundThread(() -> {
            try {
                SmartShuffleSource.Result result = previous == null
                        ? SmartShuffleSource.load(Utils.getContext(), session.playlistId,
                                () -> !matches(session, expectedRevision))
                        : SmartShuffleSource.loadMore(Utils.getContext(), previous,
                                () -> !matches(session, expectedRevision));
                synchronized (LOCK) {
                    if (!matches(session, expectedRevision)) {
                        debug(() -> "Smart Shuffle lookup stale playlist=" + logId(session.playlistId)
                                + " revision=" + expectedRevision);
                        return;
                    }
                    session.source = result;
                    session.candidates.addAll(result.candidates());
                    debug(() -> "Smart Shuffle lookup result playlist=" + logId(session.playlistId)
                            + " generation=" + session.queueGeneration + " candidates=" + result.candidates().size()
                            + " originals=" + result.originals().size() + " exhausted=" + result.exhausted());
                    session.loading = false;
                    if (policy == null || policyQueue != session.queueGeneration) {
                        policy = new SmartShufflePolicy(result.originals());
                        policyQueue = session.queueGeneration;
                    }
                }
                requestSnapshot();
            } catch (Exception ex) {
                synchronized (LOCK) {
                    if (!matches(session, expectedRevision)) {
                        debug(() -> "Smart Shuffle lookup cancelled-or-stale playlist=" + logId(session.playlistId)
                                + " revision=" + expectedRevision);
                        return;
                    }
                    session.loading = false;
                    session.failed = true;
                }
                debug(() -> "Smart Shuffle lookup failed playlist=" + logId(session.playlistId)
                        + " error=" + ex.getClass().getSimpleName());
            }
        });
    }

    private static void insert(Insertion insertion) {
        Session session = insertion.session();
        if (!matches(session, insertion.revision())) {
            debug(() -> "Smart Shuffle insertion stale before-request generation=" + session.queueGeneration
                    + " revision=" + insertion.revision());
            return;
        }
        synchronized (LOCK) {
            debug(() -> "Smart Shuffle insertion request generation=" + session.queueGeneration
                    + " position=" + (positionOf(latest, insertion.anchor()) + 1)
                    + " anchorOccurrence=" + insertion.anchor()
                    + " video=" + logId(insertion.candidate().videoId()));
        }
        SmartShuffleNative.insert(session.queueGeneration, insertion.anchor(),
                List.of(insertion.candidate().videoId()), (items, error) -> {
                    boolean accepted;
                    synchronized (LOCK) {
                        accepted = matches(session, insertion.revision()) && policy == insertion.policy();
                        if (accepted) {
                            session.inserting = false;
                            if (error == null && items != null) {
                                KeepContext context = new KeepContext(session.playlistId, session.source.editable(),
                                        insertion.candidate());
                                for (SmartShuffleNative.Item item : items) {
                                    policy.committed(insertion.anchor(), item, context);
                                }
                                session.inserted = items;
                            }
                        }
                    }
                    debug(() -> "Smart Shuffle insertion result generation=" + session.queueGeneration
                            + " anchorOccurrence=" + insertion.anchor()
                            + " video=" + logId(insertion.candidate().videoId()) + " accepted=" + accepted
                            + " count=" + (items == null ? 0 : items.length)
                            + " error=" + (error == null ? "none" : error.getClass().getSimpleName()));
                    if (!accepted && items != null) cleanupStaleInsertion(insertion, items);
                    if (accepted && error != null) {
                        debug(() -> "Smart Shuffle insertion not-committed generation=" + session.queueGeneration);
                    }
                    if (accepted) {
                        refreshPresentation();
                        requestSnapshot();
                    }
                });
    }

    private static int positionOf(SmartShuffleNative.Snapshot snapshot, long occurrenceId) {
        if (snapshot == null) return -1;
        for (int index = 0; index < snapshot.items().length; index++) {
            if (snapshot.items()[index].occurrenceId() == occurrenceId) return index;
        }
        return -1;
    }

    private static void logInsertedPositions(Session session, SmartShuffleNative.Snapshot snapshot) {
        if (session.inserted == null) return;
        for (SmartShuffleNative.Item item : session.inserted) {
            debug(() -> "Smart Shuffle insertion committed generation=" + snapshot.generation()
                    + " position=" + positionOf(snapshot, item.occurrenceId())
                    + " occurrence=" + item.occurrenceId() + " video=" + logId(item.videoId()));
        }
        session.inserted = null;
    }

    private static void cleanupStaleInsertion(Insertion insertion, SmartShuffleNative.Item[] items) {
        for (SmartShuffleNative.Item item : items) {
            SmartShuffleNative.remove(insertion.session().queueGeneration, item.occurrenceId(), true, removed -> {
                debug(() -> "Smart Shuffle stale insertion cleanup generation=" + insertion.session().queueGeneration
                        + " occurrence=" + item.occurrenceId() + " video=" + logId(item.videoId())
                        + " removed=" + removed);
                if (removed) return;
                // Cancellation may race the native playhead. The current occurrence keeps playing and its marker.
                SmartShuffleNative.snapshot(snapshot -> {
                    if (snapshot == null || snapshot.generation() != insertion.session().queueGeneration) return;
                    int current = snapshot.currentIndex();
                    if (current < 0 || current >= snapshot.items().length
                            || snapshot.items()[current].occurrenceId() != item.occurrenceId()) return;
                    synchronized (LOCK) {
                        if (latest != null && latest.generation() != snapshot.generation()) return;
                        latest = snapshot;
                        if (policy == null) {
                            policy = insertion.policy();
                            policyQueue = snapshot.generation();
                        }
                        if (policy != insertion.policy()) return;
                        policy.committed(insertion.anchor(), item, new KeepContext(insertion.session().playlistId,
                                insertion.session().source.editable(), insertion.candidate()));
                    }
                    debug(() -> "Smart Shuffle stale insertion retained-current occurrence=" + item.occurrenceId()
                            + " video=" + logId(item.videoId()));
                    refreshPresentation();
                });
            });
        }
    }

    private static void removeFutureSuggestions(String reason) {
        SmartShufflePolicy owner;
        long generation;
        synchronized (LOCK) {
            owner = policy;
            generation = policyQueue;
        }
        if (owner == null) return;
        SmartShuffleNative.snapshot(snapshot -> {
            List<Long> future;
            synchronized (LOCK) {
                if (snapshot == null || generation != snapshot.generation()) {
                    debug(() -> "Smart Shuffle removal stale generation=" + generation + " reason=" + reason);
                    return;
                }
                future = owner.unplayed(snapshot.items(), snapshot.currentIndex());
                debug(() -> "Smart Shuffle removal request reason=" + reason + " generation=" + generation
                        + " count=" + future.size());
            }
            for (long occurrenceId : future) {
                SmartShuffleNative.remove(snapshot.generation(), occurrenceId, true, removed -> {
                    boolean changed;
                    synchronized (LOCK) {
                        changed = removed && policy == owner && owner.removedOffline(occurrenceId);
                    }
                    debug(() -> "Smart Shuffle removal result reason=" + reason + " generation=" + generation
                            + " occurrence=" + occurrenceId + " removed=" + removed + " markerCleared=" + changed);
                    if (changed) refreshPresentation();
                });
            }
        });
    }

    @SuppressLint("MissingPermission")
    private static void watchNetwork() {
        synchronized (LOCK) {
            if (watchingNetwork) return;
            Context context = Utils.getContext();
            if (context == null || !(context.getSystemService(Context.CONNECTIVITY_SERVICE)
                    instanceof ConnectivityManager connectivity)) return;
            online = networkAvailable();
            connectivity.registerDefaultNetworkCallback(new NetworkObserver(connectivity));
            watchingNetwork = true;
        }
    }

    /** Callback state is authoritative: onLost can precede ConnectivityManager clearing its active network. */
    private static void networkChanged(String callback, boolean reachable) {
        debug(() -> "Smart Shuffle network callback=" + callback + " reachable=" + reachable);
        synchronized (LOCK) {
            if (online == reachable) return;
            online = reachable;
            revision++;
            long generation = revision;
            debug(() -> "Smart Shuffle network online=" + reachable + " revision=" + generation);
            pending = null;
            if (active != null) {
                active.revision = revision;
                active.loading = false;
                active.inserting = false;
                active.failed = false;
            }
        }
        SmartShuffleNative.cancelPending();
        if (!reachable) removeFutureSuggestions("offline");
        else requestSnapshot();
    }

    @SuppressLint("MissingPermission")
    static final class NetworkObserver extends ConnectivityManager.NetworkCallback {
        private final ConnectivityManager connectivity;

        NetworkObserver(ConnectivityManager connectivity) {
            this.connectivity = connectivity;
        }

        @Override public void onAvailable(Network network) {
            networkChanged("onAvailable", validated(connectivity.getNetworkCapabilities(network)));
        }

        @Override public void onLost(Network network) {
            networkChanged("onLost", false);
        }

        @Override public void onCapabilitiesChanged(Network network, NetworkCapabilities capabilities) {
            networkChanged("onCapabilitiesChanged", validated(capabilities));
        }
    }

    @SuppressLint("MissingPermission")
    private static boolean networkAvailable() {
        Context context = Utils.getContext();
        if (context == null || !(context.getSystemService(Context.CONNECTIVITY_SERVICE)
                instanceof ConnectivityManager connectivity)) return false;
        Network network = connectivity.getActiveNetwork();
        if (network == null) return false;
        NetworkCapabilities capabilities = connectivity.getNetworkCapabilities(network);
        return validated(capabilities);
    }

    private static boolean validated(NetworkCapabilities capabilities) {
        return capabilities != null && capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                && capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED);
    }

    private static void refreshPresentation() {
        Utils.runOnMainThread(() -> {
            SmartShuffleUi.refresh();
            SmartShuffleAuto.refresh();
        });
    }
}
