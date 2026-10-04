package app.spicetify.extension.spotify.settings;

import android.util.Log;
import app.spicetify.extension.spotify.theme.ThemeException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.LongSupplier;
import org.json.JSONException;

/**
 * Loads the Spicetify Marketplace's theme list: from the cache file when it is fresh enough,
 * otherwise from GitHub. Each search page's manifests start as soon as the page arrives, and their
 * themes are listed at once. Then each listed theme's color.ini is read, the top ones first, and a
 * theme without a scheme Spotify can use drops out. Only a fully checked list is cached.
 */
final class MarketplaceLoader {
    private static final String TAG = "Spicetify";
    /** GitHub's search API returns at most 1,000 results, 100 per page. */
    private static final int MAX_PAGES = 10;
    private static final long DEFAULT_TIMEOUT_MILLIS = 60_000L;
    static final long MAX_AGE_MILLIS = 6 * 60 * 60 * 1000L;
    static final String RATE_LIMITED = "GitHub's rate limit was reached. Try again in a few minutes.";
    static final String REFRESH_FAILED = "Couldn't refresh the list.";

    /** Receives themes as they arrive, and why a load failed. */
    interface Listener {
        /** {@code themes} is the list so far, sorted; {@code done} marks the last call. */
        void onThemes(List<Marketplace.Theme> themes, boolean done);

        /** Why the load failed. It is the last call, and the list shown before it stays. */
        void onError(String message);
    }

    private final Marketplace.Fetcher fetcher;
    private final Executor tasks;
    private final File cache;
    private final LongSupplier clock;
    private final long manifestsTimeoutMillis;
    private final long checksTimeoutMillis;

    MarketplaceLoader(Marketplace.Fetcher fetcher, Executor tasks, File cache, LongSupplier clock) {
        this(fetcher, tasks, cache, clock, DEFAULT_TIMEOUT_MILLIS, DEFAULT_TIMEOUT_MILLIS);
    }

    /**
     * Lets a caller choose how long to wait for the manifests, and then for the color.ini checks;
     * the 4-argument constructor waits a minute for each.
     */
    MarketplaceLoader(Marketplace.Fetcher fetcher, Executor tasks, File cache, LongSupplier clock,
            long manifestsTimeoutMillis, long checksTimeoutMillis) {
        this.fetcher = fetcher;
        this.tasks = tasks;
        this.cache = cache;
        this.clock = clock;
        this.manifestsTimeoutMillis = manifestsTimeoutMillis;
        this.checksTimeoutMillis = checksTimeoutMillis;
    }

    /**
     * Loads the list and reports it to {@code listener}, blocking until it is done; call this from a
     * background thread. An expired cache is reported first, to show until the new list is done.
     * Never throws: any failure is reported through {@link Listener#onError} instead.
     */
    void load(boolean refresh, Listener listener) {
        try {
            Marketplace.Cached cached = readCache();
            if (!refresh && cached != null) {
                boolean fresh = clock.getAsLong() - cached.savedAt < MAX_AGE_MILLIS;
                listener.onThemes(cached.themes, fresh);
                if (fresh) return;
            }
            new Run(listener, cached, refresh).load();
        } catch (Throwable e) {
            Log.w(TAG, "Marketplace load failed", e);
            listener.onError("Couldn't load the Marketplace: " + describe(e));
        }
    }

    /** Null when there is no cache file yet, or it can't be read as a cache. */
    private Marketplace.Cached readCache() {
        try {
            return Marketplace.fromJson(readFile(cache));
        } catch (Exception e) {
            return null;
        }
    }

    /** One load from GitHub. */
    private final class Run {
        private final Listener listener;
        /** The cached list: shown in place of a list that fails to load, and kept on screen until this one is done. */
        private final Marketplace.Cached cached;
        /** A refresh or a Retry: one that comes up short is a failed refresh, so a list on screen stays. */
        private final boolean refresh;
        /** The themes the manifests list, until the checks take their copy. */
        private final List<Marketplace.Theme> themes = Collections.synchronizedList(new ArrayList<>());
        /**
         * The checks' copy of the list, taken when the manifests' time is up, which they drop themes
         * from. A manifest that answers later only reaches the first list, which nothing shows by then.
         */
        private volatile List<Marketplace.Theme> listed;
        /** The first failure that may have left the list short or unchecked, so it isn't cached. */
        private final AtomicReference<Exception> failure = new AtomicReference<>();
        /** Set with the last call: nothing reports after it. */
        private final AtomicBoolean finished = new AtomicBoolean();

        Run(Listener listener, Marketplace.Cached cached, boolean refresh) {
            this.listener = listener;
            this.cached = cached;
            this.refresh = refresh;
        }

        void load() throws InterruptedException {
            List<String> blacklist = readBlacklist();
            // Each search page's manifests start at once, so the top themes don't wait for the whole search.
            List<CountDownLatch> manifests = new ArrayList<>();
            Set<String> seen = new HashSet<>();
            long deadline = 0;
            int items = 0;
            int index = 0;
            for (int page = 1; page <= MAX_PAGES; page++) {
                Marketplace.Page result;
                try {
                    result = Marketplace.parseSearch(fetcher.get(Marketplace.SEARCH_URL + page));
                } catch (Exception e) {
                    Log.w(TAG, "Marketplace search failed", e);
                    failure.compareAndSet(null, e);
                    break;
                }
                if (result.count == 0) break;
                if (manifests.isEmpty()) deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(manifestsTimeoutMillis);
                List<Runnable> found = new ArrayList<>();
                for (Marketplace.Repo repo : result.repos) {
                    // A repository that moved to the next page between two requests is read once.
                    if (!seen.add(repo.owner + "/" + repo.name)) continue;
                    int repoIndex = index++;
                    if (!Marketplace.isBlacklisted(repo.url, blacklist)) found.add(() -> list(repo, repoIndex));
                }
                manifests.add(run(found));
                items += result.count;
                if (items >= result.total) break;
            }
            boolean answered = true;
            for (CountDownLatch latch : manifests) {
                answered &= latch.await(Math.max(0, deadline - System.nanoTime()), TimeUnit.NANOSECONDS);
            }
            List<Marketplace.Theme> sorted = Marketplace.sorted(themes);
            listed = Collections.synchronizedList(new ArrayList<>(sorted));
            // Then each listed theme's color.ini, the top ones first, with a deadline of their own.
            List<Runnable> checks = new ArrayList<>();
            for (Marketplace.Theme theme : sorted) checks.add(() -> check(theme));
            boolean checked = run(checks).await(checksTimeoutMillis, TimeUnit.MILLISECONDS);
            finish(answered && checked);
        }

        /**
         * Marketplace treats a blacklist it can't read as an empty one. A failure other than a 404
         * means the list may show blacklisted repositories, so it isn't cached.
         */
        private List<String> readBlacklist() {
            try {
                return Marketplace.parseBlacklist(fetcher.get(Marketplace.BLACKLIST_URL));
            } catch (Exception e) {
                if (!(e instanceof FileNotFoundException)) failure.compareAndSet(null, e);
                Log.w(TAG, "Marketplace blacklist could not be read; nothing is filtered", e);
                return Collections.emptyList();
            }
        }

        /** Runs each task on the loader's executor, and returns a latch that counts them down. */
        private CountDownLatch run(List<Runnable> work) {
            CountDownLatch latch = new CountDownLatch(work.size());
            for (Runnable task : work) {
                tasks.execute(() -> {
                    try {
                        task.run();
                    } catch (Throwable e) {
                        // Anything that escapes a pool thread ends Spotify's process.
                        Log.w(TAG, "Marketplace task failed", e);
                    } finally {
                        latch.countDown();
                    }
                });
            }
            return latch;
        }

        /**
         * Lists a repository's themes as soon as its manifest arrives. A missing manifest, one over
         * the size cap, or one Marketplace can't use lists nothing; another I/O failure may leave the
         * list short.
         */
        private void list(Marketplace.Repo repo, int index) {
            if (listed != null) return; // The manifests' time is up; don't download for nothing.
            try {
                List<Marketplace.Theme> found = Marketplace.parseManifest(fetcher.get(Marketplace.manifestUrl(repo)), repo, index);
                if (found.isEmpty()) return;
                themes.addAll(found);
                if (listed == null) update(); // Once the checks have their copy, there's nothing new to show.
            } catch (FileNotFoundException | Marketplace.TooLargeException | JSONException ignored) {
                // No manifest at that URL, one over the size cap, or not one Marketplace can use.
            } catch (IOException e) {
                failure.compareAndSet(null, e);
                Log.w(TAG, "Marketplace manifest failed: " + repo.url, e);
            } catch (Exception | StackOverflowError e) {
                // StackOverflowError: JSON nested deeper than the parser's stack.
                Log.w(TAG, "Marketplace manifest failed: " + repo.url, e);
            }
        }

        /**
         * Drops a listed theme whose color.ini is missing, too large, or gives Spotify no color. One
         * that couldn't be read for another reason stays, since a tap tries it again, unchecked.
         */
        private void check(Marketplace.Theme theme) {
            if (finished.get()) return;
            try {
                if (!Marketplace.schemes(theme.title, fetcher.get(theme.schemesUrl)).isEmpty()) return;
            } catch (FileNotFoundException | Marketplace.TooLargeException | ThemeException unusable) {
                // Dropped below.
            } catch (IOException | RuntimeException e) {
                failure.compareAndSet(null, e);
                Log.w(TAG, "Marketplace color.ini failed: " + theme.schemesUrl, e);
                return;
            }
            listed.remove(theme);
            update();
        }

        /**
         * Shows the list so far, when no older list is on screen: an expired or refreshed one stays
         * until this one is done.
         */
        private void update() {
            if (cached != null) return;
            synchronized (finished) {
                if (finished.get()) return; // The last call already went out; don't follow it.
                List<Marketplace.Theme> checking = listed;
                try {
                    listener.onThemes(Marketplace.sorted(checking != null ? checking : themes), false);
                } catch (RuntimeException e) {
                    Log.w(TAG, "Marketplace listener failed", e);
                }
            }
        }

        /**
         * Reports the list, and caches it when every manifest answered and every theme was checked.
         * A list that may be short or unchecked is a failed refresh: the list shown before stays, the
         * cached one when there is one, with why. A first load without a cache shows what arrived, or,
         * when nothing did, says why.
         */
        private void finish(boolean answered) {
            Exception why = failure.get();
            boolean complete = answered && why == null;
            String rateLimited = why instanceof Marketplace.RateLimitException ? RATE_LIMITED : null;
            synchronized (finished) {
                finished.set(true);
                // Taken after the last call is claimed, so a late check can't drop a theme from it.
                List<Marketplace.Theme> list = Marketplace.sorted(listed);
                if (complete && !list.isEmpty()) writeCache(list);
                if (complete || (!refresh && cached == null && !list.isEmpty())) {
                    listener.onThemes(list, true);
                } else if (cached != null || (refresh && !list.isEmpty())) {
                    if (cached != null) listener.onThemes(cached.themes, false);
                    listener.onError(rateLimited != null ? rateLimited : REFRESH_FAILED);
                } else {
                    listener.onError(rateLimited != null ? rateLimited : "Couldn't load the Marketplace: "
                            + (why != null ? describe(why) : "GitHub took too long to answer."));
                }
            }
        }
    }

    /** Writes to a temporary file and renames it, so a crash never leaves half a cache. */
    private void writeCache(List<Marketplace.Theme> themes) {
        File tmp = new File(cache.getPath() + ".tmp");
        try {
            writeFile(tmp, Marketplace.toJson(themes, clock.getAsLong()));
            if (!tmp.renameTo(cache)) throw new IOException("Could not replace " + cache);
        } catch (Exception e) {
            Log.w(TAG, "Marketplace cache could not be written", e);
        }
    }

    private static String readFile(File file) throws IOException {
        byte[] bytes = new byte[(int) file.length()];
        try (FileInputStream input = new FileInputStream(file)) {
            int offset = 0;
            for (int read; offset < bytes.length && (read = input.read(bytes, offset, bytes.length - offset)) > 0; ) {
                offset += read;
            }
        }
        return new String(bytes, StandardCharsets.UTF_8);
    }

    private static void writeFile(File file, String content) throws IOException {
        try (FileOutputStream output = new FileOutputStream(file)) {
            output.write(content.getBytes(StandardCharsets.UTF_8));
        }
    }

    /** {@code e.getMessage()}, or the exception's class name when there's no message to show. */
    static String describe(Throwable e) {
        String message = e.getMessage();
        return message != null ? message : e.getClass().getSimpleName();
    }
}
