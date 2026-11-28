package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.content.UriPermission;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.provider.DocumentsContract;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.io.InputStream;
import java.text.DateFormatSymbols;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.xml.parsers.DocumentBuilderFactory;

import app.morphe.extension.sabp.EppyDiag;
import app.morphe.extension.sabp.EppyPlayer;
import app.morphe.extension.sabp.SabpPrefs;

/**
 * Listening statistics read from SABP's own record, "!Smart AudioBook Player Statistics/
 * statistics.xml" in the library folder. SABP stores listening time per book per month, so that
 * is what this shows: total, the last twelve months, and time per book. Nothing is estimated.
 */
public final class StatisticsPage extends Page {
    public static final String KEY = "statistics";
    private static final String DIR = "!Smart AudioBook Player Statistics";

    private static final class BookStat {
        String path;
        int total;
        final TreeMap<String, Integer> months = new TreeMap<>();
    }

    public StatisticsPage(Host host) {
        super(host, KEY, null, "Listening statistics", true);
        body.addView(emptyState(EppyIcon.CHART, "Reading SABP's statistics…", "", null, null));
        load();
    }

    private void load() {
        Context app = c.getApplicationContext();
        Handler main = new Handler(Looper.getMainLooper());
        new Thread(() -> {
            List<BookStat> stats = null;
            String error = null;
            try {
                stats = read(app);
            } catch (Throwable t) {
                error = t.getClass().getSimpleName();
                EppyDiag.error("stats", "read failed: " + t);
            }
            final List<BookStat> s = stats;
            final String e = error;
            main.post(() -> show(s, e));
        }, "eppy-stats").start();
    }

    private static List<BookStat> read(Context c) throws Exception {
        for (UriPermission p : c.getContentResolver().getPersistedUriPermissions()) {
            Uri tree = p.getUri();
            if (!p.isReadPermission() || !DocumentsContract.isTreeUri(tree)) continue;
            String root = DocumentsContract.getTreeDocumentId(tree);
            for (String name : new String[]{"statistics.xml", "statistics copy.xml"}) {
                Uri doc = DocumentsContract.buildDocumentUriUsingTree(tree, root + "/" + DIR + "/" + name);
                try (InputStream in = c.getContentResolver().openInputStream(doc)) {
                    if (in == null) continue;
                    return parse(in);
                } catch (Exception ignored) {
                }
            }
        }
        return null;
    }

    private static List<BookStat> parse(InputStream in) throws Exception {
        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
        f.setExpandEntityReferences(false);
        Document d = f.newDocumentBuilder().parse(in);
        ArrayList<BookStat> out = new ArrayList<>();
        NodeList books = d.getDocumentElement().getChildNodes();
        for (int i = 0; i < books.getLength(); i++) {
            Node n = books.item(i);
            if (!(n instanceof Element) || !((Element) n).getTagName().equals("book")) continue;
            BookStat b = new BookStat();
            NodeList kids = n.getChildNodes();
            for (int k = 0; k < kids.getLength(); k++) {
                Node e = kids.item(k);
                if (!(e instanceof Element)) continue;
                String tag = ((Element) e).getTagName(), text = e.getTextContent().trim();
                if (tag.equals("path")) b.path = text;
                else if (tag.equals("time")) {
                    String[] parts = text.split(" ");
                    if (parts.length >= 2 && parts[0].length() == 7 && parts[0].charAt(4) == '-') {
                        try {
                            int secs = Integer.parseInt(parts[1]);
                            b.months.merge(parts[0], secs, Integer::sum);
                            b.total += secs;
                        } catch (NumberFormatException ignored) {
                        }
                    }
                }
            }
            if (b.path != null && b.total > 0) out.add(b);
        }
        return out;
    }

    private void show(List<BookStat> stats, String error) {
        body.removeAllViews();
        boolean enabled = SabpPrefs.statisticsEnabled(c).get(c);
        if (stats == null) {
            body.addView(emptyState(EppyIcon.CHART, error != null ? "Couldn't read the statistics" : "No statistics yet",
                    enabled ? "SABP saves listening time per book and month in a \"" + DIR + "\" folder inside your library folder. Listen for a while and come back."
                            : "Recording is off. Turn on Listening statistics in Player settings.",
                    enabled ? "Try again" : "Open Player settings", v -> {
                        if (enabled) {
                            body.removeAllViews();
                            load();
                        } else host.pushPage(PlayerSettingsPage.KEY, null);
                    }));
            return;
        }
        int total = 0;
        TreeMap<String, Integer> months = new TreeMap<>();
        for (BookStat b : stats) {
            total += b.total;
            for (Map.Entry<String, Integer> m : b.months.entrySet()) months.merge(m.getKey(), m.getValue(), Integer::sum);
        }
        if (!enabled) note(body, "Recording is currently off (Player settings → Listening statistics); this is what was recorded before.");

        LinearLayout tiles = Ui.row(c);
        tiles.addView(tile(Ui.duration(total), "Total listened"), Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        tiles.addView(Ui.space(c, 8, 1));
        String thisMonth = monthKey(Calendar.getInstance());
        Integer tm = months.get(thisMonth);
        tiles.addView(tile(Ui.duration(tm != null ? tm : 0), "This month"), Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        tiles.addView(Ui.space(c, 8, 1));
        tiles.addView(tile(String.valueOf(stats.size()), stats.size() == 1 ? "Book" : "Books"), Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        LinearLayout.LayoutParams tl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        tl.topMargin = Ui.dp(c, 8);
        body.addView(tiles, tl);

        sectionTitle("Last 12 months");
        LinearLayout chart = card();
        chart.addView(bars(months));

        sectionTitle("By book");
        LinearLayout list = card();
        Collections.sort(stats, (a, b) -> Integer.compare(b.total, a.total));
        HashMap<String, EppyPlayer.Book> byName = new HashMap<>();
        for (EppyPlayer.Book bk : host.player().allBooks()) byName.put(bk.title, bk);
        for (BookStat b : stats) {
            String name = b.path.contains("/") ? b.path.substring(b.path.lastIndexOf('/') + 1) : b.path;
            EppyPlayer.Book bk = byName.get(name);
            list.addView(Ui.linkRow(c, t, EppyIcon.LIBRARY, name, Ui.duration(b.total) + " · " + b.months.size() + (b.months.size() == 1 ? " month" : " months"),
                    bk == null ? null : v -> host.playBook(bk, true)));
        }
        note(body, "From Smart AudioBook Player's statistics file, which records time per book per month. Shared with the classic statistics screen.");
    }

    private View tile(String value, String label) {
        LinearLayout box = Ui.column(c);
        box.setBackground(Ui.rounded(t.surfaceContainer, Ui.dp(c, 20)));
        box.setPadding(Ui.dp(c, 14), Ui.dp(c, 12), Ui.dp(c, 14), Ui.dp(c, 12));
        box.addView(Ui.text(c, t, value, 18, 650, t.onSurface));
        box.addView(Ui.text(c, t, label, 12, 500, t.onSurfaceVariant));
        return box;
    }

    private static String monthKey(Calendar cal) {
        return String.format(java.util.Locale.US, "%04d-%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1);
    }

    /** Twelve bars, oldest to newest, height by time listened. */
    private View bars(TreeMap<String, Integer> months) {
        LinearLayout row = Ui.row(c);
        row.setGravity(Gravity.BOTTOM);
        row.setPadding(Ui.dp(c, 12), Ui.dp(c, 12), Ui.dp(c, 12), Ui.dp(c, 8));
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -11);
        int max = 1;
        String[] keys = new String[12];
        for (int i = 0; i < 12; i++) {
            keys[i] = monthKey(cal);
            Integer v = months.get(keys[i]);
            if (v != null) max = Math.max(max, v);
            cal.add(Calendar.MONTH, 1);
        }
        String[] shortMonths = new DateFormatSymbols().getShortMonths();
        int barMax = Ui.dp(c, 120);
        for (int i = 0; i < 12; i++) {
            Integer v = months.get(keys[i]);
            int val = v != null ? v : 0;
            LinearLayout col = Ui.column(c);
            col.setGravity(Gravity.CENTER_HORIZONTAL | Gravity.BOTTOM);
            View bar = new View(c);
            bar.setBackground(Ui.rounded(val > 0 ? t.primary : t.surfaceContainerHighest, Ui.dp(c, 4)));
            col.addView(bar, new LinearLayout.LayoutParams(Ui.dp(c, 14), Math.max(Ui.dp(c, 3), Math.round(barMax * (val / (float) max)))));
            int month = Integer.parseInt(keys[i].substring(5)) - 1;
            TextView l = Ui.label(c, t, shortMonths[month].substring(0, Math.min(3, shortMonths[month].length())), 10, 500, t.onSurfaceVariant);
            l.setGravity(Gravity.CENTER);
            col.addView(l);
            col.setContentDescription(shortMonths[month] + " " + keys[i].substring(0, 4) + ": " + Ui.duration(val));
            col.setFocusable(true);
            row.addView(col, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        }
        return row;
    }
}
