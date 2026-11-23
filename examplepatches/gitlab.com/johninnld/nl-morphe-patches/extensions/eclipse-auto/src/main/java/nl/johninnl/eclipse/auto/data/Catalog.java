package nl.johninnl.eclipse.auto.data;

import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;
import org.json.JSONException;

/**
 * The single entry point screens use for server-fed content: the Home and Discover feeds, the live
 * stations and the radio catalogue. It owns the request, the cache and the states of design section
 * 4. Every asynchronous result carries the revision of the request that asked for it and is dropped
 * when a newer request has started or the catalogue has been closed (a screen's onDestroy), and it
 * is always delivered on the main thread through the {@link Poster}.
 */
public final class Catalog {
    /** Where a feed stands. */
    public enum Phase {
        /** Nothing to show yet: the first request is running. */
        LOADING,
        /** There is content (possibly from the cache); {@link State#refreshFailed} says the latest refresh did not work. */
        READY,
        /** No token, or the server refused it (401). Not retried until the driver asks. */
        SIGNED_OUT,
        /** The server answered 503: compose is switched off, so Home is Library-backed, without an error. */
        DISABLED,
        /** The request failed and there is nothing cached. */
        OFFLINE
    }

    /** A feed's current state. */
    public static final class State<T> {
        public final Phase phase;
        public final T value;
        public final boolean refreshFailed;

        State(Phase phase, T value, boolean refreshFailed) {
            this.phase = phase;
            this.value = value;
            this.refreshFailed = refreshFailed;
        }

        boolean sameAs(State<T> other) {
            return other != null && phase == other.phase && value == other.value && refreshFailed == other.refreshFailed;
        }
    }

    /** Hands a task to the main thread. */
    public interface Poster {
        void post(Runnable task);
    }

    private interface Parser<T> {
        T parse(String json) throws JSONException;
    }

    /** After a failure, a request that is not an explicit retry waits this long. */
    static final long MIN_RETRY_MS = 30000L;

    private final AppPort app;
    private final ComposeClient client;
    private final ComposeCache cache;
    private final Executor background;
    private final Poster main;
    private final ComposeCache.Clock clock;
    private final Runnable onChange;
    private boolean closed;
    private List<Model.LiveStation> live = Collections.emptyList();
    private int liveRevision;
    private boolean radioRequested;
    private boolean replayRequested;

    private final Feed<ComposeFeed.Home> home = new Feed<>("home", new Parser<ComposeFeed.Home>() {
        @Override public ComposeFeed.Home parse(String json) throws JSONException { return ComposeParser.parseHome(json); }
    });
    private final Feed<ComposeFeed.Discover> discover = new Feed<>("discover", new Parser<ComposeFeed.Discover>() {
        @Override public ComposeFeed.Discover parse(String json) throws JSONException { return ComposeParser.parseDiscover(json); }
    });

    public Catalog(AppPort app, ComposeClient client, ComposeCache cache, Executor background, Poster main,
                   ComposeCache.Clock clock, Runnable onChange) {
        this.app = app;
        this.client = client;
        this.cache = cache;
        this.background = background;
        this.main = main;
        this.clock = clock;
        this.onChange = onChange;
    }

    public State<ComposeFeed.Home> home() { return home.state; }

    public State<ComposeFeed.Discover> discover() { return discover.state; }

    public void requestHome(boolean force) { home.request(force); }

    public void requestDiscover(boolean force) { discover.request(force); }

    public List<Model.LiveStation> liveStations() { return live; }

    /** The phone's Home layout, read fresh each time so a change on the phone shows without a restart. */
    public HomeLayout layout() { return HomeLayout.parse(app.homeLayoutJson()); }

    /**
     * Load what Home adds to the feed: the live stations, the app's radio categories' stations (so
     * the Radio block is not empty on a cold start) and the app's replay summary (so the Replay card
     * is not stuck on "Building your replay…"). The radio and replay loads happen once per
     * catalogue; live stations are fetched on every call.
     */
    public void requestRadio() {
        if (closed) return;
        final int revision = ++liveRevision;
        app.liveStations(new Async<List<Model.LiveStation>>() {
            @Override public void done(List<Model.LiveStation> stations, Throwable failure) {
                if (closed || revision != liveRevision || failure != null || stations == null) return;
                live = stations;
                changed();
            }
        });
        if (!radioRequested) {
            radioRequested = true;
            app.loadRadioStations(new Async<Boolean>() {
                @Override public void done(Boolean ok, Throwable failure) { if (!closed) changed(); }
            });
        }
        if (!replayRequested) {
            replayRequested = true;
            app.refreshReplay(new Async<Boolean>() {
                @Override public void done(Boolean ok, Throwable failure) { if (!closed) changed(); }
            });
        }
    }

    /** Drop every pending result: the screen that owned this catalogue is gone. */
    public void close() {
        closed = true;
        liveRevision++;
        home.revision++;
        discover.revision++;
    }

    private void changed() {
        if (!closed) onChange.run();
    }

    /** One feed's request, cache and state machine. */
    private final class Feed<T> {
        final String name;
        final Parser<T> parser;
        State<T> state = new State<>(Phase.LOADING, null, false);
        /** Written on the main thread, read by the background load to abandon work that has been superseded. */
        volatile int revision;
        boolean inFlight;
        long loadedAt = -1;
        long failedAt = -1;
        String loadedFor;

        Feed(String name, Parser<T> parser) {
            this.name = name;
            this.parser = parser;
        }

        /** Main thread. {@code force} is an explicit retry or pull; otherwise fresh and recently failed feeds are left alone. */
        void request(boolean force) {
            if (closed) return;
            final Model.ComposeAuth auth = app.composeAuth();
            if (!auth.signedIn()) {
                publish(revision, new State<T>(Phase.SIGNED_OUT, null, false), -1);
                return;
            }
            long now = clock.now();
            boolean sameAccount = auth.accountKey.equals(loadedFor);
            if (!force) {
                if (inFlight) return;
                if (state.phase == Phase.READY && !state.refreshFailed && sameAccount && loadedAt >= 0
                    && now - loadedAt < ComposeCache.freshMs(name)) return;
                if (failedAt >= 0 && now - failedAt < MIN_RETRY_MS && state.phase != Phase.LOADING && sameAccount) return;
            }
            final int rev = ++revision;
            inFlight = true;
            final T previous = sameAccount ? state.value : null;
            background.execute(new Runnable() {
                @Override public void run() { load(auth, rev, force, previous); }
            });
        }

        /** Background thread. */
        void load(Model.ComposeAuth auth, int rev, boolean force, T previous) {
            if (rev != revision) return;
            T cachedValue = null;
            ComposeCache.Lookup cached = cache.lookup(name, auth.accountKey);
            if (cached != null) cachedValue = parseQuietly(cached.body);
            if (cachedValue != null) {
                publish(rev, new State<T>(Phase.READY, cachedValue, false), cached.fresh ? clock.now() : -1, auth.accountKey);
                if (cached.fresh && !force) {
                    finish(rev, false);
                    return;
                }
            }
            ComposeClient.Response response = client.fetch(name, auth);
            // A newer request (or the screen closing) has taken over: this answer must not reach the cache or the state.
            if (rev != revision) return;
            switch (response.status) {
                case OK: {
                    T parsed = parseQuietly(response.body);
                    if (parsed != null) {
                        cache.put(name, auth.accountKey, response.body);
                        publish(rev, new State<T>(Phase.READY, parsed, false), clock.now(), auth.accountKey);
                        finish(rev, false);
                        return;
                    }
                    break;
                }
                case UNAUTHORIZED:
                    publish(rev, new State<T>(Phase.SIGNED_OUT, null, false), -1, auth.accountKey);
                    finish(rev, true);
                    return;
                case DISABLED:
                    publish(rev, new State<T>(Phase.DISABLED, null, false), -1, auth.accountKey);
                    finish(rev, true);
                    return;
                default:
                    break;
            }
            T keep = cachedValue != null ? cachedValue : previous;
            publish(rev, keep != null ? new State<T>(Phase.READY, keep, true) : new State<T>(Phase.OFFLINE, null, false), -1, auth.accountKey);
            finish(rev, true);
        }

        private T parseQuietly(String body) {
            try {
                return body == null ? null : parser.parse(body);
            } catch (JSONException | RuntimeException unreadable) {
                return null;
            }
        }

        private void publish(int rev, State<T> next, long at) { publish(rev, next, at, loadedFor); }

        private void publish(final int rev, final State<T> next, final long at, final String account) {
            main.post(new Runnable() {
                @Override public void run() {
                    if (closed || rev != revision) return;
                    loadedAt = at;
                    loadedFor = account;
                    if (state.sameAs(next)) return;
                    state = next;
                    changed();
                }
            });
        }

        private void finish(final int rev, final boolean failed) {
            main.post(new Runnable() {
                @Override public void run() {
                    if (closed || rev != revision) return;
                    inFlight = false;
                    failedAt = failed ? clock.now() : -1;
                }
            });
        }
    }
}
