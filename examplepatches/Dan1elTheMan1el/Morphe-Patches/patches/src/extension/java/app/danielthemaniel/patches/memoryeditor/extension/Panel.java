package app.danielthemaniel.patches.memoryeditor.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Collections;
import java.util.EnumSet;
import java.util.List;
import java.util.Locale;
import java.util.function.Consumer;

/** The editor window: Search / Results / Saved tabs, built in code (no app resources needed). */
final class Panel {
    private static final int THEME = android.R.style.Theme_DeviceDefault_Dialog_NoActionBar;
    private static final int MATCH = ViewGroup.LayoutParams.MATCH_PARENT;
    private static final int WRAP = ViewGroup.LayoutParams.WRAP_CONTENT;
    private static final int NUMBER_INPUT = InputType.TYPE_CLASS_NUMBER
            | InputType.TYPE_NUMBER_FLAG_SIGNED | InputType.TYPE_NUMBER_FLAG_DECIMAL;
    private static final int TEXT_INPUT = InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS;

    final Activity activity;
    private final Scanner scanner = MemoryEditor.scanner;
    private final SavedStore saved = MemoryEditor.saved;
    private final Handler main = new Handler(Looper.getMainLooper());

    private Dialog dialog;
    private Context ctx;
    private int tab;
    private final Button[] tabs = new Button[3];
    private final View[] pages = new View[3];
    private TextView status, resultsHeader, savedHeader;
    private EditText valueEdit;
    private Spinner typeSpin, modeSpin;
    private ListView resultsList;
    private BaseAdapter resultsAdapter, savedAdapter;
    private List<Scanner.Hit> hits = Collections.emptyList();
    private List<MemMaps.Region> maps = Collections.emptyList();
    private int seenGeneration = -1;
    private int ticks;

    Panel(Activity activity) {
        this.activity = activity;
    }

    void show() {
        dialog = new Dialog(activity, THEME);
        ctx = dialog.getContext();
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(buildRoot());
        dialog.setOnDismissListener(d -> {
            main.removeCallbacks(ticker);
            if (MemoryEditor.panel == this) MemoryEditor.panel = null;
        });
        dialog.show();
        Window w = dialog.getWindow();
        if (w != null) {
            DisplayMetrics dm = activity.getResources().getDisplayMetrics();
            w.setLayout((int) (dm.widthPixels * 0.94f), (int) (dm.heightPixels * 0.85f));
            w.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        }
        maps = MemMaps.read();
        if (saved.resolvePending(maps)) saved.save();
        selectTab(MemoryEditor.lastTab);
        main.post(ticker);
    }

    void dismiss() {
        if (dialog != null && dialog.isShowing()) {
            try {
                dialog.dismiss();
            } catch (RuntimeException ignored) {
            }
        }
    }

    private final Runnable ticker = new Runnable() {
        @Override
        public void run() {
            if (dialog == null || !dialog.isShowing()) return;
            status.setText(scanner.status);
            if (scanner.generation != seenGeneration) {
                seenGeneration = scanner.generation;
                hits = scanner.preview;
                maps = MemMaps.read();
                resultsAdapter.notifyDataSetChanged();
                updateHeaders();
            }
            if ((ticks++ & 1) == 0) {
                if (tab == 1) refreshVisibleHits();
                else if (tab == 2) savedAdapter.notifyDataSetChanged();
            }
            main.postDelayed(this, 400);
        }
    };

    // ---- layout --------------------------------------------------------------------------

    private View buildRoot() {
        LinearLayout root = column();
        root.setPadding(dp(14), dp(10), dp(14), dp(10));

        LinearLayout title = row();
        title.addView(text("Memory editor", 18, true), weight());
        title.addView(button("✕", v -> dismiss()));
        root.addView(title);

        LinearLayout tabRow = row();
        String[] names = { "Search", "Results", "Saved" };
        for (int i = 0; i < 3; i++) {
            final int idx = i;
            tabs[i] = button(names[i], v -> selectTab(idx));
            tabRow.addView(tabs[i], weight());
        }
        root.addView(tabRow);

        FrameLayout content = new FrameLayout(ctx);
        pages[0] = buildSearch();
        pages[1] = buildResults();
        pages[2] = buildSaved();
        for (View p : pages) content.addView(p, new FrameLayout.LayoutParams(MATCH, MATCH));
        root.addView(content, new LinearLayout.LayoutParams(MATCH, 0, 1));

        status = text("", 13, false);
        status.setPadding(0, dp(6), 0, 0);
        root.addView(status);
        return root;
    }

    private View buildSearch() {
        ScrollView sv = new ScrollView(ctx);
        LinearLayout col = column();
        sv.addView(col);

        col.addView(label("Value"));
        valueEdit = edit(MemoryEditor.lastValue, NUMBER_INPUT);
        valueEdit.setHint("blank = unknown initial value");
        col.addView(valueEdit);

        col.addView(label("Type"));
        typeSpin = spinner(ValueType.labels());
        typeSpin.setSelection(MemoryEditor.lastType.ordinal());
        col.addView(typeSpin);

        col.addView(label("Compare"));
        modeSpin = spinner(Scanner.Mode.labels());
        modeSpin.setSelection(MemoryEditor.lastMode.ordinal());
        col.addView(modeSpin);

        col.addView(label("Regions"));
        for (MemMaps.Category c : MemMaps.Category.SELECTABLE) {
            CheckBox cb = new CheckBox(ctx);
            cb.setText(c.label + "  (" + c.code + ")");
            cb.setChecked(MemoryEditor.cats.contains(c));
            cb.setOnCheckedChangeListener((b, on) -> {
                if (on) MemoryEditor.cats.add(c);
                else MemoryEditor.cats.remove(c);
            });
            col.addView(cb);
        }

        LinearLayout r1 = row();
        r1.addView(button("New scan", v -> {
            remember();
            scanner.newScan(selectedType(), EnumSet.copyOf(MemoryEditor.cats), selectedMode(), valueText());
        }), weight());
        r1.addView(button("Refine", v -> {
            remember();
            scanner.refine(selectedMode(), valueText());
        }), weight());
        col.addView(r1);

        LinearLayout r2 = row();
        r2.addView(button("Cancel", v -> scanner.cancel()), weight());
        r2.addView(button("Reset", v -> scanner.reset()), weight());
        col.addView(r2);

        TextView help = text("How to: enter the value you see, New scan. Change it in-game, enter the new "
                + "value, Refine. Repeat until a few results are left.\n\nDon't know the number (e.g. a "
                + "health bar)? Leave the value blank and New scan, then refine with Changed / "
                + "Unchanged / Increased / Decreased.\n\nType is fixed by the New scan; refines reuse it.", 12, false);
        help.setAlpha(0.7f);
        help.setPadding(0, dp(10), 0, dp(4));
        col.addView(help);
        if (!MemIO.writable()) {
            TextView warn = text("⚠ /proc/self/mem opened read-only on this device: editing and freezing "
                    + "won't work.", 12, true);
            col.addView(warn);
        }
        return sv;
    }

    private View buildResults() {
        LinearLayout col = column();
        resultsHeader = text("", 13, false);
        col.addView(resultsHeader);

        LinearLayout r = row();
        r.addView(button("Set all…", v -> {
            if (scanner.state != Scanner.State.RESULTS || scanner.count == 0) {
                toast("No results");
                return;
            }
            prompt(String.format(Locale.US, "Set all %,d results to (%s)", scanner.count, scanner.type.label),
                    "", NUMBER_INPUT, scanner::setAll);
        }), weight());
        r.addView(button("Save shown", v -> {
            int n = Math.min(hits.size(), 100);
            for (int i = 0; i < n; i++) saved.add(maps, hits.get(i).addr, scanner.type, defaultLabel(hits.get(i)));
            saved.save();
            updateHeaders();
            toast("Saved " + n);
        }), weight());
        col.addView(r);

        resultsList = new ListView(ctx);
        resultsAdapter = new BaseAdapter() {
            @Override public int getCount() { return hits.size(); }
            @Override public Object getItem(int i) { return hits.get(i); }
            @Override public long getItemId(int i) { return i; }

            @Override
            public View getView(int pos, View convert, ViewGroup parent) {
                TextView tv = convert instanceof TextView ? (TextView) convert : rowText();
                tv.setText(describe(hits.get(pos)));
                return tv;
            }
        };
        resultsList.setAdapter(resultsAdapter);
        resultsList.setOnItemClickListener((p, v, pos, id) -> hitMenu(hits.get(pos)));
        col.addView(resultsList, new LinearLayout.LayoutParams(MATCH, 0, 1));
        return col;
    }

    private View buildSaved() {
        LinearLayout col = column();
        savedHeader = text("", 13, false);
        col.addView(savedHeader);

        LinearLayout r = row();
        r.addView(button("Add address…", v -> prompt("Address (hex)", "0x", TEXT_INPUT, s -> {
            try {
                String h = s.trim();
                if (h.startsWith("0x") || h.startsWith("0X")) h = h.substring(2);
                long addr = Long.parseUnsignedLong(h, 16);
                maps = MemMaps.read();
                saved.add(maps, addr, MemoryEditor.lastType, "Manual");
                saved.save();
                updateHeaders();
                savedAdapter.notifyDataSetChanged();
            } catch (NumberFormatException e) {
                toast("Not a hex address");
            }
        })), weight());
        r.addView(button("Remove stale", v -> {
            saved.removeStale();
            updateHeaders();
            savedAdapter.notifyDataSetChanged();
        }), weight());
        col.addView(r);

        ListView lv = new ListView(ctx);
        savedAdapter = new BaseAdapter() {
            @Override public int getCount() { return saved.entries.size(); }
            @Override public Object getItem(int i) { return saved.entries.get(i); }
            @Override public long getItemId(int i) { return i; }

            @Override
            public View getView(int pos, View convert, ViewGroup parent) {
                SavedStore.Entry e = saved.entries.get(pos);
                LinearLayout row = row();
                row.setPadding(0, dp(4), 0, dp(4));
                CheckBox freeze = new CheckBox(ctx);
                freeze.setFocusable(false);
                freeze.setChecked(e.frozen);
                freeze.setEnabled(!e.stale);
                freeze.setOnCheckedChangeListener((b, on) -> {
                    if (!saved.setFrozen(e, on)) {
                        toast("Couldn't read the value to freeze");
                        b.setChecked(false);
                    }
                });
                TextView tv = rowText();
                tv.setText(describe(e));
                row.addView(freeze);
                row.addView(tv, weight());
                row.setOnClickListener(v -> editEntry(e));
                return row;
            }
        };
        lv.setAdapter(savedAdapter);
        col.addView(lv, new LinearLayout.LayoutParams(MATCH, 0, 1));
        TextView hint = text("Tick = freeze. Tap an entry to edit, rename, retype or delete.", 12, false);
        hint.setAlpha(0.7f);
        col.addView(hint);
        return col;
    }

    // ---- behaviour -----------------------------------------------------------------------

    private void selectTab(int i) {
        tab = i;
        MemoryEditor.lastTab = i;
        for (int k = 0; k < 3; k++) {
            pages[k].setVisibility(k == i ? View.VISIBLE : View.GONE);
            tabs[k].setAlpha(k == i ? 1f : 0.5f);
        }
        hideKeyboard();
        if (i == 1) refreshVisibleHits();
        if (i == 2) savedAdapter.notifyDataSetChanged();
        updateHeaders();
    }

    private void updateHeaders() {
        Scanner.State st = scanner.state;
        String n = st == Scanner.State.RESULTS ? String.format(Locale.US, "%,d", scanner.count) : "–";
        tabs[1].setText("Results (" + n + ")");
        tabs[2].setText("Saved (" + saved.entries.size() + ")");
        if (st == Scanner.State.EMPTY) {
            resultsHeader.setText("No scan yet.");
        } else if (st == Scanner.State.SNAPSHOT) {
            resultsHeader.setText("Unknown-value snapshot taken. Refine with Changed / Unchanged / Increased / Decreased.");
        } else {
            resultsHeader.setText(String.format(Locale.US, "%,d results · %s%s", scanner.count, scanner.type.label,
                    scanner.count > Scanner.PREVIEW_MAX ? " · showing first " + Scanner.PREVIEW_MAX : ""));
        }
        long stale = 0;
        for (SavedStore.Entry e : saved.entries) if (e.stale) stale++;
        savedHeader.setText(saved.entries.size() + " saved" + (stale > 0 ? " · " + stale + " stale" : ""));
    }

    private void refreshVisibleHits() {
        if (hits.isEmpty()) return;
        ValueType t = scanner.type;
        int first = Math.max(0, resultsList.getFirstVisiblePosition());
        int last = Math.min(hits.size() - 1, Math.max(first + 30, resultsList.getLastVisiblePosition()));
        for (int i = first; i <= last; i++) {
            Scanner.Hit h = hits.get(i);
            long x = MemIO.readX(h.addr, t);
            if (x != MemIO.FAIL) h.xCur = x;
        }
        resultsAdapter.notifyDataSetChanged();
    }

    private void hitMenu(Scanner.Hit h) {
        ValueType t = scanner.type;
        new AlertDialog.Builder(ctx)
                .setTitle(hex(h.addr))
                .setItems(new String[] { "Edit value", "Save", "Save + freeze" }, (d, which) -> {
                    if (which == 0) {
                        editValue(h.addr, t);
                        return;
                    }
                    SavedStore.Entry e = saved.add(maps, h.addr, t, defaultLabel(h));
                    if (which == 2) saved.setFrozen(e, true);
                    else saved.save();
                    updateHeaders();
                    toast(which == 2 ? "Saved + frozen" : "Saved");
                })
                .show();
    }

    private void editValue(long addr, ValueType t) {
        long x = MemIO.readX(addr, t);
        prompt("New value (" + t.label + ")", x == MemIO.FAIL ? "" : t.format(x ^ MemIO.KEY), NUMBER_INPUT, s -> {
            try {
                toast(MemIO.write(addr, t, t.parse(s)) ? "Written" : "Write failed");
            } catch (NumberFormatException e) {
                toast("Not a valid " + t.label);
            }
        });
    }

    private void editEntry(SavedStore.Entry e) {
        LinearLayout form = column();
        form.setPadding(dp(20), dp(8), dp(20), 0);
        EditText labelEdit = edit(e.label, TEXT_INPUT);
        long x = e.stale ? MemIO.FAIL : MemIO.readX(e.addr, e.type);
        String original = x == MemIO.FAIL ? "" : e.type.format(x ^ MemIO.KEY);
        EditText valEdit = edit(original, NUMBER_INPUT);
        valEdit.setEnabled(!e.stale);
        Spinner typeSp = spinner(ValueType.labels());
        typeSp.setSelection(e.type.ordinal());
        form.addView(label("Label"));
        form.addView(labelEdit);
        form.addView(label("Value"));
        form.addView(valEdit);
        form.addView(label("Type"));
        form.addView(typeSp);

        new AlertDialog.Builder(ctx)
                .setTitle(hex(e.addr) + (e.module != null ? "  " + e.module + "+0x" + Long.toHexString(e.offset) : ""))
                .setView(form)
                .setPositiveButton("Apply", (d, w) -> {
                    String l = labelEdit.getText().toString().trim();
                    if (!l.isEmpty()) e.label = l;
                    ValueType nt = ValueType.values()[typeSp.getSelectedItemPosition()];
                    boolean typeChanged = nt != e.type;
                    e.type = nt;
                    String v = valEdit.getText().toString().trim();
                    if (!e.stale && !v.isEmpty() && (typeChanged || !v.equals(original))) {
                        try {
                            if (!saved.setValue(e, nt.parse(v))) toast("Write failed");
                        } catch (NumberFormatException ex) {
                            toast("Not a valid " + nt.label);
                        }
                    } else if (typeChanged && e.frozen) {
                        saved.setFrozen(e, true); // re-capture the freeze value with the new width
                    }
                    saved.save();
                    savedAdapter.notifyDataSetChanged();
                })
                .setNeutralButton("Delete", (d, w) -> {
                    saved.remove(e);
                    updateHeaders();
                    savedAdapter.notifyDataSetChanged();
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private String describe(Scanner.Hit h) {
        ValueType t = scanner.type;
        if (h.tag == null) {
            MemMaps.Region r = MemMaps.find(maps, h.addr);
            h.tag = r == null ? "?" : r.cat.code;
        }
        long cur = h.xCur ^ MemIO.KEY, prev = h.xPrev ^ MemIO.KEY;
        String s = hex(h.addr) + "  " + pad(h.tag, 2) + "  " + t.format(cur);
        if (cur != prev) s += "   (was " + t.format(prev) + ")";
        return s;
    }

    private String describe(SavedStore.Entry e) {
        String val;
        if (e.stale) {
            val = e.module != null ? "— " + e.module + " not loaded yet" : "— stale (heap address from a previous launch)";
        } else {
            long x = MemIO.readX(e.addr, e.type);
            val = x == MemIO.FAIL ? "unreadable" : e.type.format(x ^ MemIO.KEY);
        }
        String where = e.module != null ? e.module + "+0x" + Long.toHexString(e.offset) : "session only";
        return e.label + "  ·  " + e.type.label + (e.frozen ? "  ·  ❄ frozen" : "")
                + "\n" + hex(e.addr) + "  (" + where + ")\n= " + val;
    }

    private String defaultLabel(Scanner.Hit h) {
        MemMaps.Region r = MemMaps.find(maps, h.addr);
        return r != null && r.module != null ? r.module : "Value";
    }

    private void remember() {
        MemoryEditor.lastValue = valueText();
        MemoryEditor.lastType = selectedType();
        MemoryEditor.lastMode = selectedMode();
        hideKeyboard();
    }

    private ValueType selectedType() {
        return ValueType.values()[Math.max(0, typeSpin.getSelectedItemPosition())];
    }

    private Scanner.Mode selectedMode() {
        return Scanner.Mode.values()[Math.max(0, modeSpin.getSelectedItemPosition())];
    }

    private String valueText() {
        return valueEdit.getText().toString();
    }

    // ---- widget helpers ------------------------------------------------------------------

    private void prompt(String title, String initial, int inputType, Consumer<String> onOk) {
        EditText et = edit(initial, inputType);
        et.selectAll();
        FrameLayout wrap = new FrameLayout(ctx);
        wrap.setPadding(dp(20), dp(8), dp(20), 0);
        wrap.addView(et);
        AlertDialog d = new AlertDialog.Builder(ctx)
                .setTitle(title)
                .setView(wrap)
                .setPositiveButton("OK", (di, w) -> onOk.accept(et.getText().toString()))
                .setNegativeButton("Cancel", null)
                .create();
        Window w = d.getWindow();
        if (w != null) w.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_VISIBLE);
        d.show();
        et.requestFocus();
    }

    private void hideKeyboard() {
        if (valueEdit == null) return;
        InputMethodManager imm = (InputMethodManager) ctx.getSystemService(Context.INPUT_METHOD_SERVICE);
        if (imm != null) imm.hideSoftInputFromWindow(valueEdit.getWindowToken(), 0);
    }

    private void toast(String s) {
        Toast.makeText(activity, s, Toast.LENGTH_SHORT).show();
    }

    private LinearLayout column() {
        LinearLayout l = new LinearLayout(ctx);
        l.setOrientation(LinearLayout.VERTICAL);
        return l;
    }

    private LinearLayout row() {
        LinearLayout l = new LinearLayout(ctx);
        l.setOrientation(LinearLayout.HORIZONTAL);
        l.setGravity(android.view.Gravity.CENTER_VERTICAL);
        return l;
    }

    private static LinearLayout.LayoutParams weight() {
        return new LinearLayout.LayoutParams(0, WRAP, 1);
    }

    private TextView text(String s, int sp, boolean bold) {
        TextView t = new TextView(ctx);
        t.setText(s);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        if (bold) t.setTypeface(Typeface.DEFAULT_BOLD);
        return t;
    }

    private TextView label(String s) {
        TextView t = text(s, 12, true);
        t.setAlpha(0.75f);
        t.setPadding(0, dp(10), 0, 0);
        return t;
    }

    private TextView rowText() {
        TextView t = text("", 13, false);
        t.setTypeface(Typeface.MONOSPACE);
        t.setPadding(dp(4), dp(8), dp(4), dp(8));
        return t;
    }

    private Button button(String s, View.OnClickListener l) {
        Button b = new Button(ctx);
        b.setText(s);
        b.setAllCaps(false);
        b.setOnClickListener(l);
        return b;
    }

    private EditText edit(String initial, int inputType) {
        EditText e = new EditText(ctx);
        e.setSingleLine(true);
        e.setInputType(inputType);
        e.setText(initial);
        return e;
    }

    private Spinner spinner(String[] items) {
        Spinner s = new Spinner(ctx, Spinner.MODE_DROPDOWN);
        ArrayAdapter<String> a = new ArrayAdapter<>(ctx, android.R.layout.simple_spinner_item, items);
        a.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        s.setAdapter(a);
        return s;
    }

    private int dp(int v) {
        return (int) (v * ctx.getResources().getDisplayMetrics().density + 0.5f);
    }

    private static String hex(long addr) {
        return "0x" + Long.toHexString(addr);
    }

    private static String pad(String s, int n) {
        StringBuilder b = new StringBuilder(s);
        while (b.length() < n) b.append(' ');
        return b.toString();
    }
}
