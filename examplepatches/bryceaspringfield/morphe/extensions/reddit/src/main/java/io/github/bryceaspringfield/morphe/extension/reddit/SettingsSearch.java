package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.TAG;
import static io.github.bryceaspringfield.morphe.extension.reddit.Strings.t;

import android.app.Dialog;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceFragment;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Search over every row of Settings > Morphe, Morphe's own and this bundle's, as Morphe's YouTube settings have: the
 * Search settings row opens a box, each row whose title, summary, or page holds every word typed is listed with its
 * page, and a tap opens that page with the row scrolled to and marked.
 */
@SuppressWarnings("deprecation")
final class SettingsSearch {

    /** One row of the settings, with the pages opened to reach it. */
    private static final class Entry {
        final Preference row;
        /** The pages from the main list down to the one holding the row; empty for a row of the main list. */
        final List<PreferenceScreen> pages;
        final String title;
        final String place;
        final String text;

        Entry(Preference row, List<PreferenceScreen> pages, List<String> names) {
            this.row = row;
            this.pages = new ArrayList<>(pages);
            title = row.getTitle() == null ? "" : row.getTitle().toString();
            String summary = row.getSummary() == null ? "" : row.getSummary().toString();
            String path = String.join(" > ", names);
            place = path.isEmpty() ? summary : summary.isEmpty() ? path : path + "\n" + summary;
            text = plain(title + " " + summary + " " + path);
        }
    }

    private static WeakReference<PreferenceFragment> fragment = new WeakReference<>(null);

    private SettingsSearch() {
    }

    static void fragment(PreferenceFragment shown) {
        fragment = new WeakReference<>(shown);
    }

    /** Lowercase, without accents, so "diseno" finds "Diseño". */
    static String plain(String text) {
        return Normalizer.normalize(text, Normalizer.Form.NFD).replaceAll("\\p{M}+", "").toLowerCase(Locale.ROOT);
    }

    private static void collect(PreferenceGroup group, List<PreferenceScreen> pages, List<String> names,
                                Preference skip, List<Entry> out) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference child = group.getPreference(i);
            if (child == skip) continue;
            if (!(child instanceof PreferenceCategory)) out.add(new Entry(child, pages, names));
            if (!(child instanceof PreferenceGroup)) continue;
            String name = child.getTitle() == null ? "" : child.getTitle().toString();
            if (!name.isEmpty()) names.add(name);
            if (child instanceof PreferenceScreen) pages.add((PreferenceScreen) child);
            collect((PreferenceGroup) child, pages, names, skip, out);
            if (child instanceof PreferenceScreen) pages.remove(pages.size() - 1);
            if (!name.isEmpty()) names.remove(names.size() - 1);
        }
    }

    /** The rows holding every word of the query, those with all of them in the title first. */
    static List<Integer> match(List<String> titles, List<String> texts, String query) {
        List<Integer> first = new ArrayList<>();
        List<Integer> rest = new ArrayList<>();
        String[] words = plain(query).trim().split("\\s+");
        if (words.length == 0 || words[0].isEmpty()) return first;
        for (int i = 0; i < texts.size(); i++) {
            boolean all = true;
            boolean inTitle = true;
            String title = plain(titles.get(i));
            for (String word : words) {
                if (!texts.get(i).contains(word)) all = false;
                if (!title.contains(word)) inTitle = false;
            }
            if (all) (inTitle ? first : rest).add(i);
        }
        first.addAll(rest);
        return first;
    }

    private static int themeColor(String method, int fallback) {
        try {
            return (Integer) Class.forName("app.morphe.extension.shared.theme.ThemeUtils").getMethod(method).invoke(null);
        } catch (Exception ex) {
            return fallback;
        }
    }

    static void show(Context context, PreferenceScreen root, Preference searchRow) {
        List<Entry> entries = new ArrayList<>();
        collect(root, new ArrayList<>(), new ArrayList<>(), searchRow, entries);
        List<String> titles = new ArrayList<>();
        List<String> texts = new ArrayList<>();
        for (Entry entry : entries) {
            titles.add(entry.title);
            texts.add(entry.text);
        }
        int background = themeColor("getAppBackgroundColor", 0xFF000000);
        int foreground = themeColor("getAppForegroundColor", 0xFFFFFFFF);
        float d = context.getResources().getDisplayMetrics().density;
        int pad = (int) (16 * d);

        Dialog dialog = new Dialog(context, android.R.style.Theme_DeviceDefault_NoActionBar);
        LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setBackgroundColor(background);
        layout.setFitsSystemWindows(true);
        EditText box = Dialogs.editText(context);
        box.setSingleLine(true);
        box.setHint(t("Search settings"));
        box.setTextColor(foreground);
        box.setHintTextColor((foreground & 0x00FFFFFF) | 0x80000000);
        LinearLayout.LayoutParams boxParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        boxParams.setMargins(pad, pad / 2, pad, pad / 2);
        layout.addView(box, boxParams);
        TextView none = new TextView(context);
        none.setText(t("No settings found"));
        none.setTextColor(foreground);
        none.setPadding(pad, pad, pad, pad);
        none.setVisibility(View.GONE);
        layout.addView(none);
        ListView list = new ListView(context);
        list.setDivider(null);
        layout.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));

        List<Integer> shown = new ArrayList<>();
        BaseAdapter adapter = new BaseAdapter() {
            @Override public int getCount() { return shown.size(); }
            @Override public Object getItem(int position) { return entries.get(shown.get(position)); }
            @Override public long getItemId(int position) { return shown.get(position); }

            @Override
            public View getView(int position, View convert, ViewGroup parent) {
                LinearLayout row = (LinearLayout) convert;
                if (row == null) {
                    row = new LinearLayout(context);
                    row.setOrientation(LinearLayout.VERTICAL);
                    row.setPadding(pad, pad * 3 / 4, pad, pad * 3 / 4);
                    TextView title = new TextView(context);
                    title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
                    title.setTextColor(foreground);
                    TextView place = new TextView(context);
                    place.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                    place.setTextColor((foreground & 0x00FFFFFF) | 0xB0000000);
                    place.setMaxLines(4);
                    row.addView(title);
                    row.addView(place);
                }
                Entry entry = entries.get(shown.get(position));
                ((TextView) row.getChildAt(0)).setText(entry.title);
                TextView place = (TextView) row.getChildAt(1);
                place.setText(entry.place);
                place.setVisibility(entry.place.isEmpty() ? View.GONE : View.VISIBLE);
                return row;
            }
        };
        list.setAdapter(adapter);
        list.setOnItemClickListener((parent, view, position, id) -> {
            Entry entry = entries.get(shown.get(position));
            dialog.dismiss();
            try {
                open(root, entry);
            } catch (Exception ex) {
                Log.e(TAG, "Could not open a search result", ex);
            }
        });
        box.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) { }

            @Override
            public void afterTextChanged(Editable s) {
                shown.clear();
                shown.addAll(match(titles, texts, s.toString()));
                none.setVisibility(shown.isEmpty() && !s.toString().trim().isEmpty() ? View.VISIBLE : View.GONE);
                adapter.notifyDataSetChanged();
            }
        });
        dialog.setContentView(layout);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setStatusBarColor(background);
            window.setNavigationBarColor(background);
            window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                    | WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
        }
        dialog.show();
        box.requestFocus();
        Log.i(TAG, "settings search: " + entries.size() + " rows indexed");
    }

    private static int position(PreferenceScreen screen, Preference row) {
        ListAdapter adapter = screen.getRootAdapter();
        for (int i = 0; i < adapter.getCount(); i++) if (adapter.getItem(i) == row) return i;
        return -1;
    }

    /** Opens each page down to the row's, then scrolls its list to the row and marks the row for a moment. */
    private static void open(PreferenceScreen root, Entry entry) {
        PreferenceScreen screen = root;
        for (PreferenceScreen page : entry.pages) {
            int at = position(screen, page);
            if (at < 0) return;
            // The click a tap on the page's row makes, which shows the page.
            screen.onItemClick(null, null, at, 0);
            screen = page;
        }
        int at = position(screen, entry.row);
        ListView list = null;
        if (screen == root) {
            PreferenceFragment shown = fragment.get();
            View view = shown == null ? null : shown.getView();
            if (view != null) list = view.findViewById(android.R.id.list);
        } else {
            Dialog dialog = screen.getDialog();
            if (dialog != null) list = dialog.findViewById(android.R.id.list);
        }
        Log.i(TAG, "settings search: opened " + entry.title + " at " + at + " through " + entry.pages.size() + " pages");
        if (list == null || at < 0) return;
        ListView target = list;
        int index = at + list.getHeaderViewsCount();
        target.setSelection(index);
        target.postDelayed(() -> {
            View row = target.getChildAt(index - target.getFirstVisiblePosition());
            if (row == null) return;
            Drawable before = row.getBackground();
            row.setBackgroundColor((themeColor("getAppForegroundColor", 0xFFFFFFFF) & 0x00FFFFFF) | 0x33000000);
            row.postDelayed(() -> row.setBackground(before), 1500);
        }, 250);
    }
}
