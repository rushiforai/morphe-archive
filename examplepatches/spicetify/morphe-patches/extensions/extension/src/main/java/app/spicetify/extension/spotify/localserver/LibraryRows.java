package app.spicetify.extension.spotify.localserver;

import android.content.Context;
import android.net.Uri;
import android.util.Log;
import android.widget.Toast;
import app.spicetify.extension.spotify.settings.ServerMusicActivity;
import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.core.Observer;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * Appends the scanned server albums and artists after Spotify's own Your Library rows.
 * Spotify pages the list by position; rows past the server's total are served from the catalog.
 * The native classes named here are checked against the stock DEX before patching.
 */
public final class LibraryRows {
    private static final String TAG = "SpicetifyLibrary";
    static final String URI_PREFIX = "spicetify:server:";
    private static final Map<String, Integer> serverTotals = new ConcurrentHashMap<>();
    private static final ThreadLocal<Object> requests = new ThreadLocal<>();
    private static final Executor updates = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "spicetify-library-updates");
        thread.setDaemon(true);
        return thread;
    });
    private static volatile Object changes;
    private static volatile Object[] lastEntries = new Object[3];
    private static volatile Native natives;
    private static volatile boolean failed;

    enum Kind { ALBUM, ARTIST }

    /** One catalog entry shown in Your Library, before it becomes a native row. */
    static final class Entry {
        final Kind kind;
        final String id, title, subtitle, image;

        Entry(Kind kind, String id, String title, String subtitle, String image) {
            this.kind = kind;
            this.id = id;
            this.title = title;
            this.subtitle = subtitle;
            this.image = image;
        }

        String uri() {
            return URI_PREFIX + (kind == Kind.ALBUM ? "album:" : "artist:") + Uri.encode(id);
        }
    }

    /** Which of our entries a request should include. */
    enum Filter { ALL, ALBUMS, ARTISTS, NONE }

    private LibraryRows() {}

    /**
     * Runs at the start of Spotify's request builder. Answers a request filtered by our chip without asking
     * Spotify's servers; otherwise records the window for {@link #page} on the same thread and returns null.
     */
    public static Observable<?> begin(Object request) {
        requests.set(request);
        if (request == null) return null;
        boolean ours = false;
        try {
            Native n = natives();
            Request window = n.request(request);
            ours = n.chipSelected(window.filters) && !window.folder;
            if (!ours) return null;
            if (failed) throw new IllegalStateException("Server rows are off");
            Object[] last = {serverOnly(n, window)};
            Observable<Object> updates = changes();
            requests.remove();
            return updates.map(ignored -> {
                if (failed) return last[0];
                try {
                    return last[0] = serverOnly(n, window);
                } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
                    disable(error);
                    return last[0];
                }
            });
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            disable(error);
            // Spotify cannot send our chip to its servers, so a request for it must never reach them.
            return ours ? Observable.never() : null;
        }
    }

    private static Object serverOnly(Native n, Request window) throws ReflectiveOperationException {
        return n.serverOnly(window, entries(ServerIndex.catalog(), ServerConfig.snapshot().jellyfinConnection(), Filter.ALL));
    }

    /**
     * Re-emits every open Your Library window, for example after a scan finishes. Emits on its own thread,
     * so callers holding locks never run Spotify's list pipeline.
     */
    @SuppressWarnings("unchecked")
    static void changed() {
        Object subject = changes;
        if (subject != null) updates.execute(() -> ((Observer<Object>) subject).onNext(Boolean.TRUE));
    }

    /**
     * A stream that emits whenever the catalog changes. Spotify's build renames RxJava's subject factories,
     * so the factory is found by its signature.
     */
    @SuppressWarnings("unchecked")
    private static Observable<Object> changes() throws ReflectiveOperationException {
        Object subject = changes;
        if (subject == null) {
            synchronized (LibraryRows.class) {
                subject = changes;
                if (subject == null) {
                    Class<?> type = Class.forName("io.reactivex.rxjava3.subjects.BehaviorSubject");
                    for (Method factory : type.getMethods()) {
                        if (Modifier.isStatic(factory.getModifiers()) && factory.getReturnType() == type
                                && factory.getParameterCount() == 1 && factory.getParameterTypes()[0] == Object.class) {
                            subject = factory.invoke(null, Boolean.TRUE);
                            break;
                        }
                    }
                    if (subject == null) throw new NoSuchMethodException("BehaviorSubject has no default-value factory");
                    changes = subject;
                }
            }
        }
        return (Observable<Object>) subject;
    }

    /**
     * Runs where Spotify opens a URI from a list row. Opens our rows in the server browser and returns null;
     * returns every other URI unchanged for Spotify to handle.
     */
    public static String open(Object navigator, String uri) {
        if (uri == null || !uri.startsWith(URI_PREFIX)) return uri;
        Context context = host(navigator);
        if (context == null) {
            Log.e(TAG, "No context to open " + uri);
            return null;
        }
        try {
            String rest = uri.substring(URI_PREFIX.length());
            if (rest.startsWith("album:")) {
                ServerMusicActivity.playAlbum(context, Uri.decode(rest.substring(6)));
            } else if (rest.startsWith("artist:")) {
                ServerMusicActivity.openArtist(context, Uri.decode(rest.substring(7)));
            } else {
                throw new IllegalArgumentException("Unknown server row " + uri);
            }
        } catch (RuntimeException error) {
            Log.e(TAG, "Could not open " + uri, error);
            Toast.makeText(context, "Could not open this server item.", Toast.LENGTH_SHORT).show();
        }
        return null;
    }

    /** The Activity Spotify's navigator starts pages from, or the application when it cannot be read. */
    private static Context host(Object navigator) {
        try {
            Object activity = navigator.getClass().getField("a").get(navigator);
            if (activity instanceof Context) return (Context) activity;
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w(TAG, "Spotify's navigator changed; opening server items from the application", error);
        }
        return ServerConfig.context();
    }

    /**
     * Runs as Spotify builds the chip row: adds our chip after Spotify's own while nothing is selected,
     * and leaves only ours once it is selected (the row looks the selected chip up among these).
     */
    public static List<?> chipRow(List<?> selected, List<?> available) {
        if (available == null) return available;
        try {
            Native n = natives();
            if (selected != null && !selected.isEmpty())
                return n.chip.isInstance(selected.get(0)) ? Collections.singletonList(n.newChip()) : available;
            return failed || chipLabel() == null ? available : n.withChip(available);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            disable(error);
            return available;
        }
    }

    /** Our chip's label, or null for Spotify's own chips. */
    public static String label(Object filter) {
        if (!isChip(filter)) return null;
        String label = chipLabel();
        return label == null ? "Server" : label;
    }

    /** Our chip's spoken description, or null for Spotify's own chips. */
    public static String description(Object filter) {
        String label = label(filter);
        return label == null ? null : label + ", show only " + label + " items";
    }

    /** Keeps our chip out of the filters Spotify remembers across restarts. */
    public static List<?> remembered(List<?> selected) {
        if (selected == null || selected.isEmpty()) return selected;
        List<Object> kept = null;
        for (int i = 0; i < selected.size(); i++) {
            Object filter = selected.get(i);
            if (isChip(filter)) {
                if (kept == null) kept = new ArrayList<>(selected.subList(0, i));
            } else if (kept != null) kept.add(filter);
        }
        return kept == null ? selected : kept;
    }

    private static boolean isChip(Object filter) {
        if (filter == null) return false;
        try {
            return natives().chip.isInstance(filter);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            disable(error);
            return false;
        }
    }

    /** The provider's name while server rows exist, or null when there is nothing to filter to. */
    static String chipLabel() {
        ServerConfig.Snapshot snapshot = ServerConfig.snapshot();
        if (!snapshot.enabled || ServerIndex.catalog().albumCount() == 0) return null;
        return snapshot.provider() == ServerConfig.Provider.JELLYFIN ? "Jellyfin" : "WebDAV";
    }

    /** Wraps the native list stream for the window recorded by {@link #begin}. */
    public static Observable<?> page(Observable<?> pages) {
        Object request = requests.get();
        requests.remove();
        if (pages == null || request == null || failed || !ServerConfig.snapshot().enabled) return pages;
        try {
            Native n = natives();
            Request window = n.request(request);
            if (!window.root || n.chipSelected(window.filters)) return pages;
            Filter filter = n.filter(window.filters);
            if (filter == Filter.NONE) return pages;
            String key = window.key;
            Observable<Object> updates = changes();
            return pages.switchMap(page -> updates.map(ignored -> merge(page, window, filter, key)));
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            disable(error);
            return pages;
        }
    }

    private static Object merge(Object page, Request window, Filter filter, String key) {
        if (failed) return page;
        try {
            List<Entry> entries = entries(ServerIndex.catalog(), ServerConfig.snapshot().jellyfinConnection(), filter);
            if (entries.isEmpty()) return page;
            return natives().merge(page, window, entries, key);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            disable(error);
            return page;
        }
    }

    /** Server rows follow Spotify's rows: albums first, then artists, each in catalog order. */
    @SuppressWarnings("unchecked")
    static List<Entry> entries(MusicCatalog catalog, JellyfinConnection jellyfin, Filter filter) {
        Object[] last = lastEntries;
        if (last[0] == catalog && last[1] == filter) return (List<Entry>) last[2];
        if (catalog.albumCount() == 0 && catalog.artistCount() == 0) return Collections.emptyList();
        List<Entry> result = new ArrayList<>();
        if (filter == Filter.ALL || filter == Filter.ALBUMS) {
            for (MusicCatalog.Album album : catalog.allAlbums())
                result.add(new Entry(Kind.ALBUM, album.id, album.title, album.artist,
                        image(jellyfin, album.id, album.imageTag)));
        }
        if (filter == Filter.ALL || filter == Filter.ARTISTS) {
            for (MusicCatalog.Artist artist : catalog.allArtists())
                result.add(new Entry(Kind.ARTIST, artist.id, artist.name, "", image(jellyfin, artist.id, "")));
        }
        List<Entry> entries = Collections.unmodifiableList(result);
        lastEntries = new Object[] {catalog, filter, entries};
        return entries;
    }

    /** Jellyfin serves item images without authentication; other providers have no artwork. */
    static String image(JellyfinConnection jellyfin, String catalogId, String tag) {
        return image(jellyfin, catalogId, tag, 320);
    }

    /** The item's primary image, scaled by the server to fill {@code size} pixels. */
    static String image(JellyfinConnection jellyfin, String catalogId, String tag, int size) {
        if (jellyfin == null || !catalogId.startsWith("id:")) return "";
        String base = jellyfin.root.toASCIIString();
        StringBuilder url = new StringBuilder(base).append(base.endsWith("/") ? "" : "/")
                .append("Items/").append(Uri.encode(catalogId.substring(3)))
                .append("/Images/Primary?fillHeight=").append(size).append("&fillWidth=").append(size).append("&quality=90");
        if (tag != null && !tag.isEmpty()) url.append("&tag=").append(Uri.encode(tag));
        return url.toString();
    }

    /**
     * Positions of one window after appending {@code entries} to {@code serverTotal} native rows.
     * Returns {first, endExclusive, firstEntry}, or null when the window holds no server rows.
     */
    static int[] appended(int skip, int length, int nativeRows, int serverTotal, int entries) {
        int start = Math.max(skip + nativeRows, serverTotal);
        int end = Math.min(skip + length, serverTotal + entries);
        if (skip + nativeRows < serverTotal || start >= end) return null;
        return new int[] {start, end, start - serverTotal};
    }

    /**
     * Spotify's row count for a window that came back empty: 0 for the first window, otherwise the last
     * total seen for the same sort and filters, or null when it is unknown.
     */
    static Integer emptyWindowTotal(int skip, Integer known) {
        if (skip == 0) return 0;
        return known == null ? null : Math.min(known, skip);
    }

    private static void disable(Throwable error) {
        if (failed) return;
        failed = true;
        Log.e(TAG, "Your Library changed shape; server rows are off until Spotify restarts.", error);
    }

    private static Native natives() throws ReflectiveOperationException {
        Native n = natives;
        if (n == null) natives = n = new Native();
        return n;
    }

    static final class Request {
        final int skip, length;
        final boolean root, folder;
        final List<?> filters;
        final String key;

        Request(int skip, int length, boolean root, boolean folder, List<?> filters, String key) {
            this.skip = skip;
            this.length = length;
            this.root = root;
            this.folder = folder;
            this.filters = filters;
            this.key = key;
        }
    }

    /** Reflective access to Spotify 9.1.80's Your Library model. */
    private static final class Native {
        final Field skip, length, sort, container, filters;
        final Class<?> root, folder, albumFilter, artistFilter, chip;
        final Constructor<?> chipConstructor;
        final Object noExtra;
        final Class<?> loaded;
        final Field count, range, items, pinned, chips, flag, extra;
        final Constructor<?> loadedPage, page, row, albumExtra;
        final Method window;
        final Field pageState, pageExtra;
        final Object emptyRange, album, artist, artistExtra;

        Native() throws ReflectiveOperationException {
            Class<?> request = Class.forName("p.z770");
            skip = request.getField("a");
            length = request.getField("b");
            sort = request.getField("f");
            container = request.getField("j");
            filters = request.getField("k");
            root = Class.forName("p.kvi");
            folder = Class.forName("p.jvi");
            chip = Class.forName("p.q670");
            chipConstructor = chip.getConstructor(List.class);
            noExtra = Class.forName("p.iwi").getField("a").get(null);
            albumFilter = Class.forName("p.e670");
            artistFilter = Class.forName("p.k670");
            loaded = Class.forName("p.j290");
            count = loaded.getField("a");
            range = loaded.getField("b");
            items = loaded.getField("c");
            pinned = loaded.getField("d");
            chips = loaded.getField("e");
            flag = loaded.getField("f");
            extra = loaded.getField("g");
            Class<?> rangeType = Class.forName("p.m740");
            Class<?> state = Class.forName("p.c290");
            loadedPage = loaded.getConstructor(int.class, rangeType, ArrayList.class, List.class, List.class, boolean.class, int.class);
            Class<?> pageType = Class.forName("p.ou70");
            Class<?> pageExtraType = Class.forName("p.kwi");
            page = pageType.getConstructor(state, pageExtraType);
            pageState = pageType.getField("a");
            pageExtra = pageType.getField("b");
            window = Class.forName("p.afl0").getMethod("p0", int.class, int.class);
            emptyRange = rangeType.getField("d").get(null);
            Class<?> type = Class.forName("p.ypu");
            album = enumConstant(type, "ALBUM");
            artist = enumConstant(type, "ARTIST");
            Class<?> extraType = Class.forName("p.ugx");
            row = Class.forName("p.iic1").getConstructor(String.class, String.class, boolean.class, String.class, type, String.class, extraType, int.class);
            albumExtra = Class.forName("p.uw2").getConstructor(String.class, int.class, boolean.class, boolean.class);
            artistExtra = Class.forName("p.ao5").getField("a").get(null);
        }

        @SuppressWarnings({"unchecked", "rawtypes"})
        private static Object enumConstant(Class<?> type, String name) {
            return Enum.valueOf((Class) type, name);
        }

        Request request(Object value) throws IllegalAccessException {
            List<?> selected = (List<?>) filters.get(value);
            Object where = container.get(value);
            Object order = sort.get(value);
            String key = (order == null ? "" : order.toString()) + "|" + classes(selected);
            return new Request(skip.getInt(value), length.getInt(value), root.isInstance(where), folder.isInstance(where), selected, key);
        }

        boolean chipSelected(List<?> selected) {
            if (selected == null) return false;
            for (Object filter : selected) if (chip.isInstance(filter)) return true;
            return false;
        }

        List<?> withChip(List<?> chips) throws ReflectiveOperationException {
            for (Object chip : chips) if (this.chip.isInstance(chip)) return chips;
            List<Object> result = new ArrayList<>(chips);
            result.add(newChip());
            return result;
        }

        Object newChip() throws ReflectiveOperationException {
            return chipConstructor.newInstance(Collections.emptyList());
        }

        /** A page holding only our rows, as Spotify would return for a filter that matches them. */
        Object serverOnly(Request request, List<Entry> entries) throws ReflectiveOperationException {
            int end = Math.min(request.skip + request.length, entries.size());
            ArrayList<Object> rows = new ArrayList<>();
            for (int i = request.skip; i < end; i++) rows.add(row(entries.get(i)));
            Object windowRange = rows.isEmpty() ? emptyRange : window.invoke(null, request.skip, end);
            Object state = loadedPage.newInstance(entries.size(), windowRange, rows, Collections.emptyList(),
                    Collections.singletonList(newChip()), false, 0);
            return page.newInstance(state, noExtra);
        }

        Filter filter(List<?> selected) {
            if (selected == null || selected.isEmpty()) return Filter.ALL;
            if (selected.size() != 1) return Filter.NONE;
            Object only = selected.get(0);
            if (albumFilter.isInstance(only)) return Filter.ALBUMS;
            if (artistFilter.isInstance(only)) return Filter.ARTISTS;
            return Filter.NONE;
        }

        Object merge(Object value, Request request, List<Entry> entries, String key) throws ReflectiveOperationException {
            Object state = pageState.get(value);
            if (!loaded.isInstance(state)) return value;
            int total = count.getInt(state);
            Object currentRange = range.get(state);
            ArrayList<?> rows = (ArrayList<?>) items.get(state);
            boolean empty = rows.isEmpty() && emptyRange.equals(currentRange);
            int serverTotal;
            if (!empty) {
                serverTotal = total;
                serverTotals.put(key, total);
            } else {
                Integer known = emptyWindowTotal(request.skip, serverTotals.get(key));
                if (known == null) return value;
                serverTotal = known;
            }
            int nativeRows = empty ? 0 : rows.size();
            ArrayList<Object> merged = new ArrayList<>(rows);
            int[] added = appended(request.skip, request.length, nativeRows, serverTotal, entries.size());
            Object nextRange = currentRange;
            if (added != null) {
                for (int i = added[2]; i < added[2] + (added[1] - added[0]); i++) merged.add(row(entries.get(i)));
                nextRange = window.invoke(null, request.skip, request.skip + merged.size());
            }
            List<?> filters = (List<?>) chips.get(state);
            if ((request.filters == null || request.filters.isEmpty()) && chipLabel() != null) filters = withChip(filters);
            Object next = loadedPage.newInstance(serverTotal + entries.size(), nextRange, merged,
                    pinned.get(state), filters, flag.getBoolean(state), extra.getInt(state));
            return page.newInstance(next, pageExtra.get(value));
        }

        Object row(Entry entry) throws ReflectiveOperationException {
            if (entry.kind == Kind.ALBUM) {
                return this.row.newInstance(entry.uri(), entry.title, false, entry.image, album, null,
                        albumExtra.newInstance(entry.subtitle, 2, false, false), 1);
            }
            return this.row.newInstance(entry.uri(), entry.title, false, entry.image, artist, null, artistExtra, 1);
        }

        private static String classes(List<?> values) {
            if (values == null) return "";
            StringBuilder names = new StringBuilder();
            for (Object value : values) names.append(value == null ? "null" : value.getClass().getName()).append(',');
            return names.toString();
        }
    }
}
