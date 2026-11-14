package app.template.extension.trivia;

import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleEventObserver;
import androidx.lifecycle.LifecycleOwner;
import java.util.ArrayList;
import java.util.Collections;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import app.template.extension.artwork.ArtworkHooks;
import app.template.extension.settings.Prefs;
import com.google.android.material.tabs.TabLayout;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;
import java.util.WeakHashMap;

public final class ImdbTrivia {
    private static final Object TAB_TAG = new Object();
    private static final long CACHE_TTL_MS = 10 * 60 * 1000L;
    private static final Map<String, ImdbTriviaPage.Result> CACHE = new LinkedHashMap<>(4, 0.75f, true);
    private static final long PARTIAL_TTL_MS = 60_000L;
    private static final Map<String, ImdbTriviaPage.Result> PARTIAL = new LinkedHashMap<>(4, 0.75f, true);
    private static final Map<Fragment, Long> VIEW_CREATED = new WeakHashMap<>();
    private static final Map<Fragment, FilmPage> PAGES = new WeakHashMap<>();
    private static final Map<String, Request> ACTIVE = new LinkedHashMap<>();
    private static boolean available;
    private static boolean restoringSelection;

    private ImdbTrivia() {}

    public static void markAvailable() {
        available = true;
    }

    public static boolean available() {
        return available;
    }

    public static void appendTab(TabLayout tabs, int selected) {
        for (int i = 0; i < tabs.getTabCount(); i++) {
            if (isTrivia(tabs.getTabAt(i))) return;
        }
        if (Prefs.getBoolean(Prefs.KEY_IMDB_TRIVIA, true)) {
            boolean restore = selected == Integer.MAX_VALUE;
            restoringSelection = restore;
            try {
                tabs.addTab(tabs.newTab().setText("Trivia").setTag(TAB_TAG), restore);
            } finally {
                restoringSelection = false;
            }
        } else if (tabs.getSelectedTabPosition() < 0 && tabs.getTabCount() > 0) {
            tabs.selectTab(tabs.getTabAt(0));
        }
    }

    public static boolean isTrivia(TabLayout.Tab tab) {
        return tab != null && isTriviaTag(tab.getTag());
    }

    public static boolean isTriviaTag(Object tag) {
        return tag == TAB_TAG;
    }

    public static boolean shouldRestoreTab(Fragment details, Bundle saved) {
        VIEW_CREATED.put(details, SystemClock.elapsedRealtime());
        if (saved == null || !Prefs.getBoolean(Prefs.KEY_IMDB_TRIVIA, true)) return false;
        int container = containerId(details);
        return container != 0 && details.getChildFragmentManager().findFragmentById(container) instanceof TriviaSection;
    }

    private static int containerId(Fragment details) {
        return details.getResources().getIdentifier("extra_details_content", "id",
                details.requireContext().getPackageName());
    }

    public static void select(Fragment details, Object film) {
        long started = SystemClock.elapsedRealtime();
        String id = imdbId(film);
        int container = containerId(details);
        if (container == 0) return;
        Log.i(ImdbTriviaPage.TAG, "resolve id=" + id + " elapsedMs=" + (SystemClock.elapsedRealtime() - started));
        FragmentManager children = details.getChildFragmentManager();
        Fragment existing = restoringSelection ? children.findFragmentById(container) : null;
        if (existing instanceof TriviaSection && (film == null || ((TriviaSection) existing).isFor(id))) return;
        children.beginTransaction()
                .replace(container, TriviaSection.create(id, started))
                .commitAllowingStateLoss();
    }

    private static String imdbId(Object film) {
        String id = ArtworkHooks.imdbIdForFilm(film);
        return id != null && id.matches("tt[0-9]{5,15}") ? id : null;
    }

    public static void filmReady(Fragment details, Object film) {
        if (!Prefs.getBoolean(Prefs.KEY_IMDB_TRIVIA, true)) return;
        String id = imdbId(film);
        if (id != null) {
            FilmPage page = filmPage(details, id);
            if (page != null) page.afterDraw();
        }
    }

    private static FilmPage filmPage(Fragment details, String id) {
        View root = details.getView();
        if (!(root instanceof ViewGroup)) return null;
        FilmPage page = PAGES.get(details);
        if (page != null && page.root == root && Objects.equals(page.id, id)) return page;
        if (page != null) page.dispose();
        page = new FilmPage(details, (ViewGroup) root, id);
        PAGES.put(details, page);
        details.getViewLifecycleOwner().getLifecycle().addObserver(page);
        return page;
    }

    private static final class FilmPage implements LifecycleEventObserver {
        final Fragment details;
        final ViewGroup root;
        final String id;
        boolean started;
        boolean waitingForDraw;
        boolean drawn;
        boolean attempted;
        boolean disposed;
        ViewTreeObserver.OnPreDrawListener drawListener;
        Request request;

        FilmPage(Fragment details, ViewGroup root, String id) {
            this.details = details;
            this.root = root;
            this.id = id;
        }

        void afterDraw() {
            if (drawn || waitingForDraw) return;
            waitingForDraw = true;
            drawListener = () -> {
                removeDrawListener();
                root.post(() -> {
                    if (disposed) return;
                    drawn = true;
                    Long created = VIEW_CREATED.get(details);
                    if (created != null) Log.i(ImdbTriviaPage.TAG, "film_ready id=" + id + " elapsedMs="
                            + (SystemClock.elapsedRealtime() - created));
                    maybePreload();
                });
                return true;
            };
            root.getViewTreeObserver().addOnPreDrawListener(drawListener);
            root.invalidate();
        }

        void removeDrawListener() {
            if (drawListener != null && root.getViewTreeObserver().isAlive()) {
                root.getViewTreeObserver().removeOnPreDrawListener(drawListener);
            }
            drawListener = null;
        }

        void maybePreload() {
            if (!started || !drawn || attempted || !root.isAttachedToWindow()
                    || !Prefs.getBoolean(Prefs.KEY_IMDB_TRIVIA, true)
                    || cached(id) != null || partial(id) != null) return;
            // Allow one speculative WebView at a time.
            if (!ACTIVE.isEmpty() && !ACTIVE.containsKey(id)) return;
            attempted = true;
            attach(this).start(root, true);
        }

        @Override public void onStateChanged(LifecycleOwner owner, Lifecycle.Event event) {
            if (event == Lifecycle.Event.ON_START) {
                started = true;
                maybePreload();
            } else if (event == Lifecycle.Event.ON_STOP) {
                started = false;
                release();
            } else if (event == Lifecycle.Event.ON_DESTROY) {
                dispose();
            }
        }

        void release() {
            if (request != null) request.remove(this);
            request = null;
        }

        void dispose() {
            disposed = true;
            removeDrawListener();
            release();
            if (PAGES.get(details) == this) PAGES.remove(details);
            if (details.getView() == root) {
                details.getViewLifecycleOwner().getLifecycle().removeObserver(this);
            }
        }
    }

    @FunctionalInterface
    interface Subscriber {
        void onResult(ImdbTriviaPage.Result result);
    }

    // Requests and page lifecycles run on the main thread. Tab views only subscribe to results.
    static Runnable subscribe(Fragment details, String id, Subscriber listener) {
        FilmPage owner = filmPage(details, id);
        if (owner == null) {
            listener.onResult(new ImdbTriviaPage.Result(id, "unavailable", Collections.emptyList()));
            return () -> {};
        }
        owner.attempted = true;
        Request request = attach(owner);
        request.listeners.put(listener, owner);
        ImdbTriviaPage.Result preview = request.preview == null ? partial(id) : request.preview;
        if (preview != null) listener.onResult(preview);
        if (request.page == null) request.start(owner.root, false);
        else request.page.continueLoading();
        return () -> request.listeners.remove(listener);
    }

    private static Request attach(FilmPage owner) {
        Request request = ACTIVE.get(owner.id);
        if (request == null) {
            request = new Request(owner.id);
            ACTIVE.put(owner.id, request);
        }
        owner.request = request;
        request.owners.add(owner);
        return request;
    }

    private static final class Request implements ImdbTriviaPage.Listener {
        final String id;
        final java.util.Set<FilmPage> owners = new java.util.LinkedHashSet<>();
        final Map<Subscriber, FilmPage> listeners = new LinkedHashMap<>();
        ImdbTriviaPage page;
        ImdbTriviaPage.Result preview;
        ViewGroup host;

        Request(String id) { this.id = id; }

        void start(ViewGroup host, boolean preload) {
            if (page != null) return;
            this.host = host;
            try {
                page = new ImdbTriviaPage(host, id, this, preload);
                Log.i(ImdbTriviaPage.TAG, "webview_started id=" + id + " preload=" + preload);
                page.start();
            } catch (RuntimeException error) {
                Log.w(ImdbTriviaPage.TAG, "Could not start Android WebView", error);
                if (page != null) page.close();
                done(new ImdbTriviaPage.Result(id, "webview_error", Collections.emptyList()));
            }
        }

        void remove(FilmPage owner) {
            owners.remove(owner);
            listeners.values().removeAll(Collections.singleton(owner));
            if (owners.isEmpty()) {
                cancel();
            } else if (page != null && host == owner.root) {
                host = owners.iterator().next().root;
                page.moveTo(host);
            }
        }

        void cancel() {
            if (page != null) {
                page.close();
                Log.i(ImdbTriviaPage.TAG, "webview_cancelled id=" + id);
            }
            detach();
        }

        void detach() {
            if (ACTIVE.get(id) == this) ACTIVE.remove(id);
            for (FilmPage owner : owners) owner.request = null;
            owners.clear();
            page = null;
            host = null;
        }

        @Override public void preview(ImdbTriviaPage.Result result) {
            preview = result;
            ArrayList<ImdbTriviaPage.Item> first = new ArrayList<>(result.items);
            first.sort((a, b) -> Boolean.compare(a.spoiler, b.spoiler));
            if (first.size() > ImdbTriviaPage.PREVIEW_SIZE) {
                first.subList(ImdbTriviaPage.PREVIEW_SIZE, first.size()).clear();
            }
            PARTIAL.put(id, new ImdbTriviaPage.Result(id, "loading", first));
            if (PARTIAL.size() > 4) PARTIAL.remove(PARTIAL.keySet().iterator().next());
            for (Subscriber listener : new ArrayList<>(listeners.keySet())) listener.onResult(result);
        }

        @Override public void done(ImdbTriviaPage.Result result) {
            detach();
            remember(result);
            for (Subscriber listener : new ArrayList<>(listeners.keySet())) listener.onResult(result);
            listeners.clear();
        }
    }

    public static void clearCache() {
        CACHE.clear();
        PARTIAL.clear();
        for (Request request : new ArrayList<>(ACTIVE.values())) {
            request.listeners.clear();
            request.cancel();
        }
    }

    private static ImdbTriviaPage.Result partial(String id) {
        ImdbTriviaPage.Result result = PARTIAL.get(id);
        if (result != null && SystemClock.elapsedRealtime() - result.fetchedAt > PARTIAL_TTL_MS) {
            PARTIAL.remove(id);
            return null;
        }
        return result;
    }

    static ImdbTriviaPage.Result cached(String imdbId) {
        ImdbTriviaPage.Result result = CACHE.get(imdbId);
        if (result != null && SystemClock.elapsedRealtime() - result.fetchedAt > CACHE_TTL_MS) {
            CACHE.remove(imdbId);
            return null;
        }
        return result;
    }

    static void remember(ImdbTriviaPage.Result result) {
        if (!"observed".equals(result.status) && !"empty".equals(result.status)) return;
        PARTIAL.remove(result.imdbId);
        CACHE.put(result.imdbId, result);
        if (CACHE.size() > 4) CACHE.remove(CACHE.keySet().iterator().next());
    }
}
