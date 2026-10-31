package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.content.SharedPreferences;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import app.morphe.extension.sabp.EppyBridge;
import app.morphe.extension.sabp.EppyPlayer;
import app.morphe.extension.sabp.EppyTheme;
import app.morphe.extension.sabp.LibraryScan;

/**
 * Library: filter (all / in progress / not started / finished), sort (recent, title, progress,
 * date added, length), grid or list, and pull-to-refresh. Refreshing reloads SABP's library
 * (progress, states) and checks the library folders for new, missing and moved books, in the
 * background and cancellable. Adding new books uses SABP's own full scan.
 */
public final class LibraryPage {
    private static final String[] FILTERS = {"All", "In progress", "Not started", "Finished"};
    private static final String[] SORTS = {"Recently played", "Title", "Progress", "Date added", "Length"};

    private final Host host;
    private final HomePage cards;
    private final Context c;
    private final EppyTheme t;
    public final PullRefresh root;
    public final ScrollView scroll;
    private final LinearLayout grid;
    private final LinearLayout segments;
    private final LinearLayout tools;
    private final LinearLayout status;
    private final LibraryScan scan = new LibraryScan();
    private int filter, sort;
    private boolean list;
    private int widthPx;
    private LibraryScan.Result lastScan;

    public LibraryPage(Host host, HomePage cards) {
        this.host = host;
        this.cards = cards;
        this.c = host.activity();
        this.t = host.theme();
        SharedPreferences p = EppyTheme.prefs(c);
        filter = Math.max(0, Math.min(FILTERS.length - 1, p.getInt("libFilter", 0)));
        sort = Math.max(0, Math.min(SORTS.length - 1, p.getInt("libSort", 0)));
        list = p.getBoolean("libList", false);

        scroll = new ScrollView(c);
        scroll.setFillViewport(true);
        LinearLayout col = Ui.column(c);
        col.setPadding(Ui.dp(c, 20), Ui.dp(c, 12), Ui.dp(c, 20), Ui.dp(c, 8));
        scroll.addView(col, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root = new PullRefresh(c, t, scroll, this::refresh);

        LinearLayout header = Ui.row(c);
        header.setGravity(Gravity.CENTER_VERTICAL);
        TextView h = Ui.text(c, t, "Library", 30, 600, t.onSurface);
        h.setAccessibilityHeading(true);
        header.addView(h, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        header.addView(Ui.iconButton(c, t, EppyIcon.REFRESH, t.onSurface, 0, "Refresh library", v -> {
            root.setRefreshing(true);
            refresh();
        }));
        header.addView(Ui.iconButton(c, t, EppyIcon.FOLDER, t.onSurface, 0, "Manage library folders (Smart AudioBook Player)",
                v -> host.openSabp(EppyBridge.LIBRARY_ACTIVITY)));
        col.addView(header, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        status = Ui.column(c);
        col.addView(status);

        segments = Ui.row(c);
        LinearLayout.LayoutParams sl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sl.topMargin = Ui.dp(c, 12);
        android.widget.HorizontalScrollView segScroll = new android.widget.HorizontalScrollView(c);
        segScroll.setHorizontalScrollBarEnabled(false);
        segScroll.addView(segments);
        col.addView(segScroll, sl);

        tools = Ui.row(c);
        tools.setGravity(Gravity.CENTER_VERTICAL);
        tools.setPadding(0, Ui.dp(c, 8), 0, 0);
        col.addView(tools);

        grid = Ui.column(c);
        LinearLayout.LayoutParams gl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        gl.topMargin = Ui.dp(c, 12);
        col.addView(grid, gl);
        buildControls();
        rebuild();
    }

    private void save() {
        EppyTheme.prefs(c).edit().putInt("libFilter", filter).putInt("libSort", sort).putBoolean("libList", list).apply();
    }

    private void buildControls() {
        segments.removeAllViews();
        for (int i = 0; i < FILTERS.length; i++) {
            final int idx = i;
            segments.addView(Ui.chip(c, t, i == filter ? EppyIcon.CHECK : 0, FILTERS[i], i == filter, v -> {
                filter = idx;
                save();
                buildControls();
                rebuild();
            }));
            segments.addView(Ui.space(c, 8, 1));
        }
        tools.removeAllViews();
        tools.addView(Ui.chip(c, t, EppyIcon.SORT, SORTS[sort], false, v -> {
            Sheet sh = new Sheet(host.overlayRoot(), t, "Sort by");
            for (int i = 0; i < SORTS.length; i++) {
                final int idx = i;
                sh.item(i == sort ? EppyIcon.CHECK : 0, SORTS[i], null, () -> {
                    sort = idx;
                    save();
                    buildControls();
                    rebuild();
                });
            }
            sh.show();
        }));
        tools.addView(new View(c), Ui.lp(0, 1, 1));
        tools.addView(Ui.iconButton(c, t, list ? EppyIcon.GRID : EppyIcon.LIST, t.onSurfaceVariant, 0,
                list ? "Show as grid" : "Show as list", v -> {
                    list = !list;
                    save();
                    buildControls();
                    rebuild();
                }));
    }

    /** Reloads the library from SABP and checks the folders for changes. */
    private void refresh() {
        EppyPlayer p = host.player();
        p.refreshLibrary(true);
        if (scan.running()) return;
        HashMap<String, String> books = new HashMap<>();
        for (EppyPlayer.Book b : p.allBooks()) books.put(b.folderUri, b.title);
        showStatus("Checking library folders…", null, null, true);
        scan.start(c, books, new LibraryScan.Listener() {
            @Override
            public void onProgress(int folders) {
                showStatus("Checking library folders… " + folders + " folders", null, null, true);
            }

            @Override
            public void onDone(LibraryScan.Result r) {
                root.setRefreshing(false);
                lastScan = r;
                showResult(r);
                rebuild();
            }
        });
    }

    private void showResult(LibraryScan.Result r) {
        StringBuilder detail = new StringBuilder();
        int newCount = r.added.size() - r.moved.size();
        if (newCount > 0) detail.append("New: ").append(join(r.added, 4)).append('\n');
        if (!r.moved.isEmpty()) detail.append("Moved: ").append(join(r.moved, 4)).append('\n');
        int gone = r.missing.size() - r.moved.size();
        if (gone > 0) detail.append("Missing: ").append(join(r.missing, 4)).append('\n');
        if (r.hasChanges()) {
            showStatus(r.summary(), detail.toString().trim(), "Update with SABP's scan", false);
        } else {
            showStatus(r.summary(), r.error != null ? null : null, r.error != null ? "Open library folders" : null, false);
        }
    }

    private static String join(List<String> items, int max) {
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < Math.min(max, items.size()); i++) b.append(i > 0 ? ", " : "").append(items.get(i));
        if (items.size() > max) b.append(" and ").append(items.size() - max).append(" more");
        return b.toString();
    }

    private void showStatus(String title, String detail, String action, boolean working) {
        status.removeAllViews();
        LinearLayout box = Ui.column(c);
        box.setBackground(Ui.rounded(t.surfaceContainer, Ui.dp(c, 16)));
        box.setPadding(Ui.dp(c, 16), Ui.dp(c, 12), Ui.dp(c, 16), Ui.dp(c, 12));
        LinearLayout top = Ui.row(c);
        top.setGravity(Gravity.CENTER_VERTICAL);
        top.addView(Ui.text(c, t, title, 14, 600, t.onSurface), Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        top.addView(Ui.iconButton(c, t, EppyIcon.CLOSE, t.onSurfaceVariant, 0, working ? "Stop checking" : "Dismiss", v -> {
            if (working) scan.cancel();
            status.removeAllViews();
            root.setRefreshing(false);
        }));
        box.addView(top);
        if (detail != null && !detail.isEmpty()) box.addView(Ui.text(c, t, detail, 13, 400, t.onSurfaceVariant));
        if (action != null) {
            TextView a = Ui.textButton(c, t, action, v -> host.openSabp(EppyBridge.LIBRARY_ACTIVITY));
            box.addView(a);
            TextView why = Ui.text(c, t, "Adding and removing books is done by Smart AudioBook Player's own scan: in its library, tap ⋮ → Full scan, then come back.", 12, 400, t.onSurfaceVariant);
            box.addView(why);
        }
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = Ui.dp(c, 8);
        status.addView(box, lp);
        status.announceForAccessibility(title);
    }

    public void setWidth(int px) {
        if (px != widthPx) {
            widthPx = px;
            rebuild();
        }
    }

    public void rebuild() {
        grid.removeAllViews();
        EppyPlayer p = host.player();
        List<EppyPlayer.Book> books = new ArrayList<>();
        switch (filter) {
            case 1:
                books.addAll(p.shelf(EppyPlayer.STATE_STARTED));
                break;
            case 2:
                books.addAll(p.shelf(EppyPlayer.STATE_NEW));
                break;
            case 3:
                books.addAll(p.shelf(EppyPlayer.STATE_FINISHED));
                break;
            default:
                books.addAll(p.allBooks());
        }
        Comparator<EppyPlayer.Book> cmp;
        switch (sort) {
            case 1:
                cmp = (a, b) -> a.title.compareToIgnoreCase(b.title);
                break;
            case 2:
                cmp = (a, b) -> Float.compare(b.progress(), a.progress());
                break;
            case 3:
                cmp = (a, b) -> Long.compare(b.added, a.added);
                break;
            case 4:
                cmp = (a, b) -> Integer.compare(b.length, a.length);
                break;
            default:
                cmp = (a, b) -> Long.compare(b.lastPlayed, a.lastPlayed);
        }
        if (sort != 0 || hasPlayTimes(books)) Collections.sort(books, cmp);

        if (books.isEmpty()) {
            TextView e = Ui.text(c, t, p.isLibraryLoading() ? "Loading…" : p.libraryEmpty() ? "No books yet" : "No books here", 16, 400, t.onSurfaceVariant);
            e.setGravity(Gravity.CENTER);
            e.setPadding(0, Ui.dp(c, 48), 0, Ui.dp(c, 16));
            grid.addView(e, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            if (p.libraryEmpty() && !p.isLibraryLoading()) {
                TextView b = cards.filledButton("Choose library folder", v -> host.openSabp(EppyBridge.LIBRARY_ACTIVITY));
                LinearLayout.LayoutParams bl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, Ui.dp(c, 48));
                bl.gravity = Gravity.CENTER_HORIZONTAL;
                grid.addView(b, bl);
            }
            return;
        }

        if (list) {
            for (EppyPlayer.Book b : books) grid.addView(cards.listRow(b));
            return;
        }
        int avail = widthPx > 0 ? widthPx - Ui.dp(c, 40) : c.getResources().getDisplayMetrics().widthPixels - Ui.dp(c, 40);
        int gap = Ui.dp(c, 14);
        int cols = Math.max(2, Math.min(8, (avail + gap) / (Ui.dp(c, 150) + gap)));
        int cell = (avail - gap * (cols - 1)) / cols;
        int cellDp = Math.round(cell / c.getResources().getDisplayMetrics().density);
        LinearLayout row = null;
        for (int i = 0; i < books.size(); i++) {
            if (i % cols == 0) {
                row = Ui.row(c);
                row.setGravity(Gravity.TOP);
                LinearLayout.LayoutParams rl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                rl.bottomMargin = Ui.dp(c, 18);
                grid.addView(row, rl);
            }
            View card = cards.bookCard(books.get(i), cellDp);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(cell, ViewGroup.LayoutParams.WRAP_CONTENT);
            if (i % cols != cols - 1) lp.rightMargin = gap;
            row.addView(card, lp);
        }
    }

    private static boolean hasPlayTimes(List<EppyPlayer.Book> books) {
        for (EppyPlayer.Book b : books) if (b.lastPlayed > 0) return true;
        return false;
    }

    public void onRemoved() {
        scan.cancel();
    }
}
