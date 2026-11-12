/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;

import androidx.annotation.Nullable;

import com.facebook.litho.ComponentHost;
import com.facebook.litho.TextContent;

import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceUtils;

/**
 * The green checks on the track rows of an album page. The rows are Litho views that are mounted by the page's list
 * without a bind that reports a model, so a row cannot tell which song it shows. What a row does show is its track
 * number, drawn in a cell at its start. When the page is an album whose track list is known (recorded by its
 * download, or read once from the page for the songs downloaded one by one; the header names it, see
 * {@link DownloadedHeaders}), the row that shows the number n is the n-th track of that list, and it gets a
 * check when that track has a stream copy, drawn at the end of the row, next to its action menu (a row without a
 * menu cell gets none). The numbers must make sense (see {@link AlbumTrackNumbers#problem}): otherwise no row of the
 * page is marked. A row whose number is unknown is never marked.
 *
 * <p>A scanner belongs to ONE page: the list that its header's own page layout holds. The header that was bound
 * last owns the list ({@link AlbumPageGuard#mayScan}), a header that is detached, hidden or not the owner clears its
 * checks and stops, and a list whose rows show other titles than this album's rows showed before is not marked
 * ({@link AlbumPageGuard.Titles}), so a list that is reused for another album never gets this album's checks.
 *
 * <p>The page is looked at after a layout or scroll of the window, one scan per frame at most, and only while the
 * setting is on and the header names an album with a known track list; otherwise nothing is registered. A scan
 * remembers per row view where its number cell and the host that draws the number are, so a row that did not change
 * costs one text read and no allocation. Main thread only; the state holds only weak references to views.
 */
final class DownloadedAlbumRows {
    private static final String[] PAGE_IDS = {"results_container", "content_container"};
    private static final String ALBUM_PREFIX = "OLAK5uy_";
    private static final int MAX_PARENTS = 8;
    private static final int MAX_PARENT_WALK = 40;
    private static final int MAX_VIEWS = 1500;
    /** A track row has a few dozen views; a view that is not one is given up on sooner. */
    private static final int MAX_CELL_VIEWS = 200;
    private static final int MAX_TEXT_DEPTH = 12;
    private static final long RETRY_MILLIS = 300;
    private static final int MAX_RETRIES = 5;
    private static final int SLACK_PX = 1;
    private static final WeakReference<ComponentHost> NO_HOST = new WeakReference<>(null);

    /** The scanner that owns each list; the newest bind wins. */
    private static final Map<ViewGroup, State> owners = new WeakHashMap<>();
    private static int binds;

    /** A cell of a row (its number or its action menu), in the row's pixels. */
    record Cell(int left, int top, int width, int height) {}

    /** The cells of a laid out row: the number is required, the menu is null when the row has none. */
    record Cells(Cell number, @Nullable Cell menu) {}

    /** What is remembered of a track row view; the view itself is only weakly held. */
    static final class Row {
        final WeakReference<View> view;
        final AlbumRowCheck check = new AlbumRowCheck();
        Cell cell;
        @Nullable
        Cell menu;
        int width;
        int height;
        int top;
        int number = AlbumTrackNumbers.UNKNOWN;
        WeakReference<ComponentHost> numberHost = NO_HOST;
        WeakReference<ComponentHost> titleHost = NO_HOST;
        @Nullable
        CharSequence title;
        boolean marked;

        Row(View view) {
            this.view = new WeakReference<>(view);
        }
    }

    /** Per header container. */
    static final class State {
        @Nullable
        String sourceId;
        @Nullable
        Watcher watcher;
        WeakReference<ViewGroup> container = new WeakReference<>(null);
        WeakReference<ViewGroup> page = new WeakReference<>(null);
        WeakReference<View> pageRoot = new WeakReference<>(null);
        int bind = -1;
        boolean claimPending;
        boolean scanQueued;
        int retries;
        int highestNumber;
        int lastHighest;
        int lastRecorded;
        int lastCount = -1;
        int[] numbers = new int[0];
        int[] lastNumbers = new int[0];
        @Nullable
        String lastProblem;
        final Map<View, Row> rows = new WeakHashMap<>();
        final List<Row> found = new ArrayList<>();
        final ArrayDeque<ViewGroup> pending = new ArrayDeque<>();
        final NumberReader reader = new NumberReader();
        final DownloadedAlbumLog.PageLog log = new DownloadedAlbumLog.PageLog();

        /** Whether the header of this scanner is still attached and shown. */
        boolean isLive() {
            ViewGroup header = container.get();
            return header != null && header.isAttachedToWindow() && header.isShown();
        }
    }

    /** The texts of one row's Litho hosts, collected to find its number and title. */
    static final class NumberReader {
        Cell cell;
        final List<String> insideCell = new ArrayList<>();
        final List<String> inRow = new ArrayList<>();
        @Nullable
        ComponentHost insideHost;
        int insideHosts;
        @Nullable
        ComponentHost titleHost;
        @Nullable
        CharSequence title;

        void start(Cell cell) {
            this.cell = cell;
            insideCell.clear();
            inRow.clear();
            insideHost = null;
            insideHosts = 0;
            titleHost = null;
            title = null;
        }
    }

    /** Registers the layout, scroll and detach listeners of a header's page; removes them again on request. */
    private static final class Watcher implements ViewTreeObserver.OnGlobalLayoutListener,
            ViewTreeObserver.OnScrollChangedListener, View.OnAttachStateChangeListener {
        private final WeakReference<ViewGroup> container;
        private final State state;

        Watcher(ViewGroup container, State state) {
            this.container = new WeakReference<>(container);
            this.state = state;
            container.addOnAttachStateChangeListener(this);
            if (container.isAttachedToWindow()) register(container.getViewTreeObserver());
        }

        void stop(ViewGroup view) {
            view.removeOnAttachStateChangeListener(this);
            unregister(view.getViewTreeObserver());
        }

        private void register(ViewTreeObserver observer) {
            observer.addOnGlobalLayoutListener(this);
            observer.addOnScrollChangedListener(this);
        }

        private void unregister(ViewTreeObserver observer) {
            if (!observer.isAlive()) return;

            observer.removeOnGlobalLayoutListener(this);
            observer.removeOnScrollChangedListener(this);
        }

        @Override
        public void onGlobalLayout() {
            scanSoon();
        }

        @Override
        public void onScrollChanged() {
            scanSoon();
        }

        private void scanSoon() {
            ViewGroup current = container.get();
            if (current != null) scanLater(current, state);
        }

        @Override
        public void onViewAttachedToWindow(View view) {
            register(view.getViewTreeObserver());
        }

        @Override
        public void onViewDetachedFromWindow(View view) {
            unregister(view.getViewTreeObserver());
            // The page is going away; its row views may be reused by another page, so no check stays on them.
            clearChecks(state);
        }
    }

    private DownloadedAlbumRows() {}

    /** A header was bound (not only laid out): it claims its page from now on. */
    static void onBound(ViewGroup container, State state) {
        state.bind = ++binds;
        state.claimPending = true;
        state.container = new WeakReference<>(container);
        state.retries = 0;
    }

    /** The header was bound or laid out, or the stream copies changed: look at the page again. */
    static void apply(ViewGroup container, State state, List<String> sourceIds) {
        readUnrecordedAlbum(container, state, sourceIds);
        String source = wantedSource(sourceIds);
        if (source == null || !source.equals(state.sourceId)) {
            state.highestNumber = 0;
            state.retries = 0;
            state.lastCount = -1;
            state.log.reset();
        }
        state.sourceId = source;
        if (source == null && !state.claimPending) {
            stop(container, state);
            return;
        }

        if (source != null && state.watcher == null) state.watcher = new Watcher(container, state);
        scanLater(container, state);
    }

    /** The one album whose track list this page shows, or null when no row may be marked. */
    @Nullable
    private static String wantedSource(List<String> sourceIds) {
        if (!DownloadedMarkers.enabled() || sourceIds.size() != 1 || !sourceIds.get(0).startsWith(ALBUM_PREFIX)) {
            return null;
        }

        List<String> tracks = tracksOf(DownloadedMarkers.loadedRegistry(), sourceIds.get(0));
        return tracks == null || tracks.isEmpty() ? null : sourceIds.get(0);
    }

    /**
     * The track list of the album: the one recorded by its download, else the one read from its page for the songs
     * downloaded one by one (see {@link KnownAlbumTracks}); null when neither is known.
     */
    @Nullable
    private static List<String> tracksOf(@Nullable DownloadedRegistry registry, String albumId) {
        if (registry == null) return null;

        List<String> recorded = registry.sourceTracks(albumId);
        return recorded != null && !recorded.isEmpty() ? recorded : KnownAlbumTracks.tracksOf(albumId);
    }

    /**
     * An album that was never downloaded as a whole has no recorded track list: its songs that have a stream copy of
     * their own are marked from the list read once from its page, only when the device holds a stream copy at all.
     */
    private static void readUnrecordedAlbum(ViewGroup container, State state, List<String> sourceIds) {
        if (!DownloadedMarkers.enabled() || sourceIds.size() != 1 || !sourceIds.get(0).startsWith(ALBUM_PREFIX)) {
            return;
        }

        DownloadedRegistry registry = DownloadedMarkers.loadedRegistry();
        String albumId = sourceIds.get(0);
        if (registry == null || !registry.hasTracks() || tracksOf(registry, albumId) != null) return;

        WeakReference<ViewGroup> header = new WeakReference<>(container);
        KnownAlbumTracks.readLater(albumId, () -> {
            ViewGroup current = header.get();
            if (current != null) apply(current, state, sourceIds);
        });
    }

    /** Removes the listeners and every check of the page. */
    private static void stop(ViewGroup container, State state) {
        state.sourceId = null;
        if (state.watcher != null) {
            state.watcher.stop(container);
            state.watcher = null;
        }
        clearChecks(state);
    }

    private static void clearChecks(State state) {
        for (Map.Entry<View, Row> entry : state.rows.entrySet()) entry.getValue().check.hide(entry.getKey());
        state.rows.clear();
        state.found.clear();
    }

    private static void scanLater(ViewGroup container, State state) {
        if (state.scanQueued || (state.sourceId == null && !state.claimPending)) return;

        state.scanQueued = true;
        container.post(() -> scanQueued(container, state));
    }

    private static void scanQueued(ViewGroup container, State state) {
        state.scanQueued = false;
        if ((state.sourceId == null && !state.claimPending) || !container.isAttachedToWindow()) return;

        try {
            scan(container, state);
        } catch (Exception ex) {
            Logger.printException(() -> "Could not mark the downloaded tracks of an album page", ex);
        }
    }

    private static void scan(ViewGroup container, State state) {
        if (!container.isShown() || container.getWindowVisibility() != View.VISIBLE) return;

        if (!DownloadedMarkers.enabled()) {
            stop(container, state);
            state.claimPending = false;
            return;
        }

        ViewGroup page = findPage(container, state);
        if (page == null) {
            retryLater(container, state);
            return;
        }

        if (!claim(page, state)) {
            if (DownloadedAlbumLog.enabled()) state.log.declined(state.sourceId, 0, "not this page");
            stop(container, state);
            state.claimPending = false;
            return;
        }

        state.claimPending = false;
        DownloadedRegistry registry = DownloadedMarkers.loadedRegistry();
        List<String> tracks = state.sourceId == null ? null : tracksOf(registry, state.sourceId);
        if (tracks == null || tracks.isEmpty()) {
            stop(container, state);
            return;
        }

        if (!page.isShown()) return;

        findRows(page, state);
        List<Row> rows = state.found;
        boolean unnumbered = readNumbers(rows, state);
        String problem = problem(rows.size(), state, tracks.size());
        if (problem == null && !fitsAlbum(rows, AlbumPageGuard.titlesOf(state.sourceId))) {
            problem = "not this album: the rows show other titles";
        }

        for (Row known : state.rows.values()) known.marked = false;
        for (Row row : rows) {
            View view = row.view.get();
            row.marked = view != null && problem == null && isDownloaded(row, tracks, registry)
                    && row.menu != null && row.check.show(view, row.menu);
        }
        for (Map.Entry<View, Row> entry : state.rows.entrySet()) {
            if (!entry.getValue().marked) entry.getValue().check.hide(entry.getKey());
        }
        if (DownloadedAlbumLog.enabled()) logResult(state, rows, tracks.size(), problem);

        if (unnumbered) retryLater(container, state);
    }

    /** Looks again shortly, a few times: a page that is not laid out yet, or a row that has no text yet. */
    private static void retryLater(ViewGroup container, State state) {
        if (state.retries++ >= MAX_RETRIES) return;

        state.scanQueued = true;
        container.postDelayed(() -> scanQueued(container, state), RETRY_MILLIS);
    }

    /**
     * Makes this header the owner of the page's list unless a newer live header owns it.
     *
     * @return whether this header may scan the list
     */
    private static boolean claim(ViewGroup page, State state) {
        State owner = owners.get(page);
        boolean ownerLive = owner != null && owner != state && owner.isLive();
        boolean mayScan = AlbumPageGuard.mayScan(state.bind, owner == null ? -1 : owner.bind, ownerLive);
        if (mayScan) owners.put(page, state);
        return mayScan;
    }

    /** Whether every numbered row shows the title its number showed before; remembers the titles when so. */
    private static boolean fitsAlbum(List<Row> rows, AlbumPageGuard.Titles titles) {
        for (Row row : rows) {
            if (row.number != AlbumTrackNumbers.UNKNOWN && !titles.fits(row.number, row.title)) return false;
        }
        for (Row row : rows) {
            if (row.number != AlbumTrackNumbers.UNKNOWN) titles.remember(row.number, row.title);
        }
        return true;
    }

    private static boolean isDownloaded(Row row, List<String> tracks, DownloadedRegistry registry) {
        return row.number != AlbumTrackNumbers.UNKNOWN && row.number <= tracks.size()
                && registry.isDownloaded(tracks.get(row.number - 1));
    }

    /** Reads the number of every row, top to bottom; true when a row has none yet. */
    private static boolean readNumbers(List<Row> rows, State state) {
        if (state.numbers.length < rows.size()) state.numbers = new int[rows.size() + 8];

        boolean unnumbered = false;
        for (int place = 0; place < rows.size(); place++) {
            Row row = rows.get(place);
            View view = row.view.get();
            row.number = view == null ? AlbumTrackNumbers.UNKNOWN : readNumber(view, row, state.reader);
            state.numbers[place] = row.number;
            unnumbered |= row.number == AlbumTrackNumbers.UNKNOWN;
            state.highestNumber = Math.max(state.highestNumber, row.number);
        }
        return unnumbered;
    }

    /**
     * Why the numbers of the rows cannot be used, or null. The numbers are only checked again when they differ from
     * those of the previous scan, so a scan of an unchanged page does not allocate for it.
     */
    @Nullable
    private static String problem(int count, State state, int recordedCount) {
        boolean same = count == state.lastCount && state.highestNumber == state.lastHighest
                && recordedCount == state.lastRecorded;
        for (int place = 0; same && place < count; place++) same = state.numbers[place] == state.lastNumbers[place];
        if (same) return state.lastProblem;

        List<Integer> numbers = new ArrayList<>(count);
        for (int place = 0; place < count; place++) numbers.add(state.numbers[place]);
        state.lastProblem = AlbumTrackNumbers.problem(numbers, state.highestNumber, recordedCount);
        state.lastCount = count;
        state.lastHighest = state.highestNumber;
        state.lastRecorded = recordedCount;
        state.lastNumbers = Arrays.copyOf(state.numbers, Math.max(count, 1));
        return state.lastProblem;
    }

    private static void logResult(State state, List<Row> rows, int recorded, @Nullable String problem) {
        if (problem != null) {
            state.log.declined(state.sourceId, recorded, problem);
            return;
        }

        List<Integer> marked = new ArrayList<>();
        for (Row row : rows) if (row.marked) marked.add(row.number);
        state.log.marked(state.sourceId, recorded, marked);
    }

    /**
     * The list part of the header's own page: found from the header up to the lowest ancestor that holds a page
     * list, and remembered only while the header and the list are still below that same ancestor.
     */
    @Nullable
    private static ViewGroup findPage(ViewGroup container, State state) {
        ViewGroup known = state.page.get();
        View root = state.pageRoot.get();
        if (known != null && root != null && known.isAttachedToWindow() && isBelow(known, root)
                && isBelow(container, root)) {
            return known;
        }

        View current = container;
        for (int level = 0; level < MAX_PARENTS && current != null; level++) {
            for (String name : PAGE_IDS) {
                int id = ResourceUtils.getIdIdentifier(name);
                if (id != 0 && current.findViewById(id) instanceof ViewGroup found) {
                    state.page = new WeakReference<>(found);
                    state.pageRoot = new WeakReference<>(current);
                    return found;
                }
            }
            current = current.getParent() instanceof View parent ? parent : null;
        }
        return null;
    }

    /** Whether the view is the ancestor or one of its descendants. */
    private static boolean isBelow(View view, View ancestor) {
        if (view == ancestor) return true;

        ViewParent parent = view.getParent();
        for (int level = 0; level < MAX_PARENT_WALK && parent != null; level++) {
            if (parent == ancestor) return true;

            parent = parent.getParent();
        }
        return false;
    }

    /** Puts every track-shaped row of the page into {@code state.found}, top to bottom. */
    private static void findRows(ViewGroup page, State state) {
        float density = page.getResources().getDisplayMetrics().density;
        ArrayDeque<ViewGroup> pending = state.pending;
        List<Row> found = state.found;
        found.clear();
        pending.clear();
        pending.add(page);
        int visited = 0;
        int[] at = new int[2];
        while (!pending.isEmpty() && visited < MAX_VIEWS) {
            ViewGroup group = pending.poll();
            for (int i = 0; i < group.getChildCount() && visited++ < MAX_VIEWS; i++) {
                View child = group.getChildAt(i);
                if (child.getVisibility() != View.VISIBLE || !(child instanceof ViewGroup childGroup)) continue;

                Row row = ElementRowLayout.isTrackRow(child.getWidth(), child.getHeight(), density)
                        ? rowOf(childGroup, state) : null;
                if (row == null) {
                    pending.add(childGroup);
                    continue;
                }
                child.getLocationInWindow(at);
                row.top = at[1];
                insertByTop(found, row);
            }
        }
    }

    /** The remembered row of a track-shaped view, with its number cell, or null when it has no number cell. */
    @Nullable
    private static Row rowOf(ViewGroup view, State state) {
        Row row = state.rows.get(view);
        if (row != null && row.cell != null && row.width == view.getWidth() && row.height == view.getHeight()) {
            return row;
        }

        Cells cells = findCells(view);
        if (cells == null) return null;

        if (row == null) {
            row = new Row(view);
            state.rows.put(view, row);
        }
        row.cell = cells.number();
        row.menu = cells.menu();
        row.width = view.getWidth();
        row.height = view.getHeight();
        row.numberHost = NO_HOST;
        return row;
    }

    private static void insertByTop(List<Row> rows, Row row) {
        int place = rows.size();
        while (place > 0 && rows.get(place - 1).top > row.top) place--;
        rows.add(place, row);
    }

    /** The cells of the track number and of the action menu of a laid out row; null when it has no number cell. */
    @Nullable
    static Cells findCells(ViewGroup row) {
        float density = row.getResources().getDisplayMetrics().density;
        boolean rightToLeft = row.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
        ArrayDeque<ViewGroup> pending = new ArrayDeque<>();
        ArrayDeque<int[]> origins = new ArrayDeque<>();
        pending.add(row);
        origins.add(new int[]{0, 0});
        Cell number = null;
        Cell menu = null;
        int visited = 0;
        while (!pending.isEmpty() && visited < MAX_CELL_VIEWS && (number == null || menu == null)) {
            ViewGroup group = pending.poll();
            int[] origin = origins.poll();
            for (int i = 0; i < group.getChildCount() && visited++ < MAX_CELL_VIEWS; i++) {
                View child = group.getChildAt(i);
                int left = origin[0] + child.getLeft();
                int top = origin[1] + child.getTop();
                int width = child.getWidth();
                int height = child.getHeight();
                int toLeft = left;
                int toRight = row.getWidth() - (left + width);
                int start = rightToLeft ? toRight : toLeft;
                int end = rightToLeft ? toLeft : toRight;
                if (number == null && ElementRowLayout.isNumberCell(start, width, height, row.getWidth(),
                        row.getHeight(), density)) {
                    number = new Cell(left, top, width, height);
                } else if (menu == null && ElementRowLayout.isMenuCell(end, width, height, row.getWidth(),
                        row.getHeight(), density)) {
                    menu = new Cell(left, top, width, height);
                } else if (child instanceof ViewGroup childGroup) {
                    pending.add(childGroup);
                    origins.add(new int[]{left, top});
                }
            }
        }
        return number == null ? null : new Cells(number, menu);
    }

    /**
     * The number a row shows, and its title (into {@link Row#title}). The hosts that drew them last time are read
     * first (one text read each); when one is gone, moved or has no single number, the texts of the whole row are
     * collected again.
     */
    private static int readNumber(View view, Row row, NumberReader reader) {
        ComponentHost numberHost = row.numberHost.get();
        ComponentHost titleHost = row.titleHost.get();
        if (numberHost != null && titleHost != null && isInsideCell(numberHost, view, row.cell)
                && isBelow(titleHost, view)) {
            List<CharSequence> texts = hostTexts(numberHost);
            List<CharSequence> titles = hostTexts(titleHost);
            int number = texts.size() == 1 ? AlbumTrackNumbers.parse(texts.get(0)) : AlbumTrackNumbers.UNKNOWN;
            if (number != AlbumTrackNumbers.UNKNOWN && !titles.isEmpty()) {
                row.title = titles.get(0);
                return number;
            }
        }

        reader.start(row.cell);
        collectTexts(view, 0, 0, reader, 0);
        int number = AlbumTrackNumbers.pick(reader.insideCell, reader.inRow);
        boolean fromHost = !reader.insideCell.isEmpty() && reader.insideHosts == 1;
        boolean known = fromHost && number != AlbumTrackNumbers.UNKNOWN;
        row.numberHost = known && reader.insideHost != null ? new WeakReference<>(reader.insideHost) : NO_HOST;
        row.titleHost = known && reader.titleHost != null ? new WeakReference<>(reader.titleHost) : NO_HOST;
        row.title = reader.title;
        return number;
    }

    /** Whether the host still lies inside the number cell of the row (the row is a recycled view). */
    private static boolean isInsideCell(ComponentHost host, View row, Cell cell) {
        int left = host.getLeft();
        int top = host.getTop();
        ViewParent parent = host.getParent();
        for (int level = 0; level < MAX_TEXT_DEPTH && parent != row; level++) {
            if (!(parent instanceof View view)) return false;

            left += view.getLeft();
            top += view.getTop();
            parent = view.getParent();
        }
        return parent == row && isInside(cell, left, top, host.getWidth(), host.getHeight());
    }

    /**
     * The texts the row's Litho hosts draw: those of the hosts that lie inside the number cell go to
     * {@link NumberReader#insideCell}, all of them to {@link NumberReader#inRow}, in the order the hosts are mounted.
     */
    private static void collectTexts(View view, int left, int top, NumberReader reader, int depth) {
        if (view instanceof ComponentHost host) {
            boolean inside = isInside(reader.cell, left, top, host.getWidth(), host.getHeight());
            List<CharSequence> texts = hostTexts(host);
            for (CharSequence item : texts) {
                if (item == null) continue;

                String text = item.toString().trim();
                reader.inRow.add(text);
                if (inside) reader.insideCell.add(text);
            }
            if (inside && !texts.isEmpty()) {
                reader.insideHost = host;
                reader.insideHosts++;
            } else if (!inside && reader.title == null && !texts.isEmpty() && texts.get(0) != null) {
                // The first text outside the number cell is the title: its host is mounted first.
                reader.titleHost = host;
                reader.title = texts.get(0);
            }
        }
        if (!(view instanceof ViewGroup group) || depth >= MAX_TEXT_DEPTH) return;

        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child.getVisibility() == View.VISIBLE) {
                collectTexts(child, left + child.getLeft(), top + child.getTop(), reader, depth + 1);
            }
        }
    }

    /** The texts a Litho host draws itself (not those of its child hosts); empty when it draws none. */
    private static List<CharSequence> hostTexts(ComponentHost host) {
        try {
            TextContent content = host.getTextContent();
            List<CharSequence> items = content == null ? null : content.getTextItems();
            return items == null ? Collections.emptyList() : items;
        } catch (RuntimeException unavailable) {
            return Collections.emptyList();
        }
    }

    private static boolean isInside(Cell cell, int left, int top, int width, int height) {
        return left >= cell.left() - SLACK_PX && top >= cell.top() - SLACK_PX
                && left + width <= cell.left() + cell.width() + SLACK_PX
                && top + height <= cell.top() + cell.height() + SLACK_PX;
    }
}
