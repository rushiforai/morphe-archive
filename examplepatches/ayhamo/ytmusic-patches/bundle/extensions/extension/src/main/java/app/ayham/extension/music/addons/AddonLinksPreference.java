package app.ayham.extension.music.addons;

import android.app.AlertDialog;
import android.content.Context;
import android.content.res.TypedArray;
import android.preference.Preference;
import android.text.InputType;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;

/**
 * The settings' "Addon links": the user's addons in the order they are asked (the first one
 * first). A tap opens the list: add a link (pasted from the addon's site), or tap one to move it
 * to the top, test it or remove it. Each link is shown whole, on its own line: it is the user's own
 * device and settings (the logs still only ever get it redacted).
 */
@SuppressWarnings("deprecation")
public class AddonLinksPreference extends Preference {
    public AddonLinksPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        refresh();
    }

    public AddonLinksPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        refresh();
    }

    public AddonLinksPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        refresh();
    }

    public AddonLinksPreference(Context context) {
        super(context);
        refresh();
    }

    /** The host, for a dialog's title. */
    static String host(String link) {
        Protocol.Url u = Protocol.parse(link);
        return u == null ? "(not a link)" : u.host;
    }

    /** The settings row's summary: each whole link on its own line, a blank line between, numbered in the order asked. */
    static String summary(List<String> links) {
        if (links.isEmpty()) return "None yet. Tap to add your addons' links; the first one is asked first.";
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < links.size(); i++) b.append(i + 1).append(". ").append(links.get(i)).append("\n\n"); // (a blank line between links)
        return b.append("Tap to add, test, reorder or remove.").toString();
    }

    private void refresh() {
        setTitle("Addon links");
        setSummary(summary(AddonSettings.links(getContext())));
    }

    @Override
    protected void onBindView(android.view.View view) {
        super.onBindView(view);
        // every link in full: the summary's default line cap would cut them
        TextView s = view.findViewById(android.R.id.summary);
        if (s != null) s.setMaxLines(Integer.MAX_VALUE);
    }

    @Override
    protected void onClick() {
        open();
    }

    private void open() {
        final Context c = getContext();
        final List<String> links = AddonSettings.links(c);
        TypedArray ta = c.obtainStyledAttributes(new int[]{android.R.attr.textColorPrimary, android.R.attr.textColorSecondary});
        final int text = ta.getColor(0, 0xFFFFFFFF), sub = ta.getColor(1, 0xB3FFFFFF);
        ta.recycle();
        int pad = dp(c, 20);
        LinearLayout list = new LinearLayout(c);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding(pad, dp(c, 8), pad, 0);
        final AlertDialog[] dialog = new AlertDialog[1];
        if (links.isEmpty()) {
            TextView t = new TextView(c);
            t.setText("No addons yet.");
            t.setTextColor(sub);
            t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
            list.addView(t);
        }
        for (int i = 0; i < links.size(); i++) {
            final int at = i;
            TextView t = new TextView(c);
            t.setText((i + 1) + ".  " + links.get(i));
            t.setTextColor(text);
            t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            t.setPadding(0, dp(c, 12), 0, dp(c, 12));
            t.setOnClickListener(v -> {
                String[] what = at == 0 ? new String[]{"Test", "Remove"} : new String[]{"Test", "Move to the top", "Remove"};
                // the choices drawn in the dialog's own text colour (setItems' rows came out black on
                // the dark theme's black)
                LinearLayout rows = new LinearLayout(c);
                rows.setOrientation(LinearLayout.VERTICAL);
                rows.setPadding(pad, dp(c, 4), pad, dp(c, 4));
                final AlertDialog[] menu = new AlertDialog[1];
                for (String w : what) {
                    TextView r = new TextView(c);
                    r.setText(w);
                    r.setTextColor(text);
                    r.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
                    r.setPadding(0, dp(c, 14), 0, dp(c, 14));
                    r.setOnClickListener(x -> {
                        if (menu[0] != null) menu[0].dismiss();
                        if (w.equals("Test")) {
                            test(links.get(at));
                            return;
                        }
                        String l = links.remove(at);
                        if (w.startsWith("Move")) links.add(0, l);
                        AddonSettings.setLinks(c, links);
                        refresh();
                        if (dialog[0] != null) dialog[0].dismiss();
                        open();
                    });
                    rows.addView(r);
                }
                menu[0] = new AlertDialog.Builder(c).setTitle(host(links.get(at))).setView(rows).setNegativeButton("Cancel", null).show();
            });
            // a thin line between links, so each reads as its own
            if (i > 0) {
                android.view.View line = new android.view.View(c);
                line.setBackgroundColor((sub & 0x00FFFFFF) | 0x40000000);
                list.addView(line, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, Math.max(1, dp(c, 1))));
            }
            list.addView(t);
        }
        ScrollView sv = new ScrollView(c);
        sv.addView(list);
        dialog[0] = new AlertDialog.Builder(c)
                .setTitle("Addon links")
                .setView(sv)
                .setPositiveButton("Add", (d, w) -> add(links))
                .setNegativeButton("Done", null)
                .show();
    }

    private void add(final List<String> links) {
        final Context c = getContext();
        final EditText e = new EditText(c);
        e.setHint("https://…");
        e.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        e.setSingleLine(true);
        LinearLayout box = new LinearLayout(c);
        int pad = dp(c, 20);
        box.setPadding(pad, dp(c, 8), pad, 0);
        box.addView(e, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        new AlertDialog.Builder(c)
                .setTitle("Add an addon")
                .setMessage("Paste the addon's link (its manifest link from the addon's site). It holds your token and stays on this device.")
                .setView(box)
                .setPositiveButton("Add", (d, w) -> {
                    String l = e.getText().toString().trim();
                    String why = AddonSettings.problem(l);
                    if (why != null) {
                        Toast.makeText(c, why, Toast.LENGTH_SHORT).show();
                        return;
                    }
                    // §2: the same addon however its link is written (a trailing /manifest.json, the host's case)
                    boolean dup = false;
                    for (String x : links) if (Protocol.sameAddon(x, l)) dup = true;
                    if (dup) {
                        Toast.makeText(c, "Already in the list", Toast.LENGTH_SHORT).show();
                        return;
                    }
                    links.add(l);
                    AddonSettings.setLinks(c, links);
                    refresh();
                    open();
                })
                .setNegativeButton("Cancel", (d, w) -> open())
                .show();
        e.requestFocus();
    }

    /**
     * Test: the addon's manifest, then one search (a search, not a stream: it costs none of the
     * addon's stream budget). The answer and how long it took, or why it failed.
     */
    private void test(final String link) {
        final Context c = getContext();
        final AlertDialog wait = new AlertDialog.Builder(c).setTitle(host(link)).setMessage("Testing…").setNegativeButton("Close", null).show();
        final android.os.Handler main = new android.os.Handler(android.os.Looper.getMainLooper());
        new Thread(() -> {
            String msg;
            long t0 = android.os.SystemClock.elapsedRealtime();
            try {
                AddonClient cl = AddonClient.create(null);
                AddonClient.Discovered d = cl.discover(link);
                long t1 = android.os.SystemClock.elapsedRealtime();
                if (!d.manifest.usable) {
                    // no search to ask: its /search would fail and hide why (testResult says it)
                    msg = testResult(d.manifest, 0, t1 - t0, 0);
                } else {
                    TrackMatcher.Target tg = new TrackMatcher.Target();
                    tg.title = TEST_TITLE;
                    tg.artist = TEST_ARTIST;
                    java.util.List<Object> rows = cl.search(new AddonClient.Addon(d.base), tg, TEST_ARTIST + " " + TEST_TITLE, d.manifest);
                    long t2 = android.os.SystemClock.elapsedRealtime();
                    msg = testResult(d.manifest, rows.size(), t1 - t0, t2 - t1);
                }
            } catch (Throwable e) {
                // a network error's message can hold the link, and so the token
                msg = "Failed: " + (e.getMessage() != null ? Protocol.scrub(e.getMessage()) : e.getClass().getSimpleName());
            }
            final String m = msg;
            main.post(() -> {
                if (wait.isShowing()) wait.setMessage(m);
            });
        }, "AddonTest").start();
    }

    static final String TEST_TITLE = "Blinding Lights", TEST_ARTIST = "The Weeknd";

    /** What a test found: the addon's name and version, and the search's rows. */
    static String testResult(Protocol.Manifest m, int rows, long manifestMs, long searchMs) {
        String name = m.name != null && !m.name.isEmpty() ? m.name : "The addon";
        String v = m.version != null && !m.version.isEmpty() ? " " + m.version : "";
        String head = name + v + " answers (" + manifestMs + " ms).";
        if (!m.usable) return head + "\nIt has no search, so it can't be used.";
        return head + "\nA search for \"" + TEST_ARTIST + " - " + TEST_TITLE + "\": " + (rows == 0 ? "no songs" : rows + (rows == 1 ? " song" : " songs"))
                + " (" + searchMs + " ms)." + (m.allowDownloads ? "" : "\nIt allows no downloads.");
    }

    private static int dp(Context c, float v) {
        return Math.round(v * c.getResources().getDisplayMetrics().density);
    }
}
