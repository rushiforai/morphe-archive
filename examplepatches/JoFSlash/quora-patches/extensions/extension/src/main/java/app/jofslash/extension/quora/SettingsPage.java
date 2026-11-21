package app.jofslash.extension.quora;

import android.app.Activity;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.text.InputType;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * The patch settings as full screen pages in the style of Quora's own settings: a top bar with a
 * back arrow, then sections of rows. Switches save as you flip them.
 */
final class SettingsPage {

    private static final String TAG = "JoFSlashPatches";

    // The lists a backup holds, by their key in it.
    private static final String LISTS_KEY = "lists";
    private static final Map<String, ReadingHistory> LISTS = new LinkedHashMap<>();

    static {
        LISTS.put("history", ReadingHistory.HISTORY);
        LISTS.put("bookmarks", ReadingHistory.BOOKMARKS);
        LISTS.put("dismissed", ReadingHistory.DISMISSED);
    }

    /** Switches whose change only shows after the app restarts. */
    private static final Set<String> RESTART = new HashSet<>(Arrays.asList(
            "hideTabs", "startTab", "textSize", "disablePullToRefresh", "disableSwipeBetweenFeeds"));

    private final Activity activity;
    private final float density;
    private final int text, secondary, background, section, divider, bar, accent;
    private final boolean dark;
    private Dialog mainPage;

    private SettingsPage(Activity activity) {
        this.activity = activity;
        density = activity.getResources().getDisplayMetrics().density;
        dark = (activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        // Quora's settings colors.
        text = dark ? 0xFFE6E7E8 : 0xFF282829;
        secondary = dark ? 0xFF939598 : 0xFF636466;
        background = dark ? 0xFF181818 : 0xFFF1F2F2;
        section = dark ? 0xFF000000 : 0xFFFFFFFF;
        divider = dark ? 0xFF262626 : 0xFFDEE0E1;
        bar = dark ? 0xFF202020 : 0xFFF7F7F8;
        accent = 0xFF2E69FF;
    }

    static void open(Activity activity, SharedPreferences prefs) {
        try {
            new SettingsPage(activity).main(prefs);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to open the patch settings", ex);
        }
    }

    // ------------------------------------------------------------------ pages

    private void main(SharedPreferences prefs) {
        Map<String, String> switches = PatchSettings.switches();
        Map<String, String[]> texts = PatchSettings.texts();
        Map<String, PatchSettings.Choice> choices = PatchSettings.choices();
        LinearLayout content = column();
        Set<String> changed = new HashSet<>();

        String status = PageCheck.status(prefs);
        if (status != null) {
            LinearLayout box = section(null);
            box.addView(note(status));
            content.addView(box);
        }

        List<String> keys = new ArrayList<>(switches.keySet());
        java.util.Collections.sort(keys, (a, b) -> String.CASE_INSENSITIVE_ORDER.compare(switches.get(a), switches.get(b)));
        for (String category : SettingsCatalog.CATEGORIES) {
            LinearLayout box = null;
            for (String key : keys) {
                if (!category.equals(SettingsCatalog.category(key))) continue;
                if (box == null) box = section(category);
                add(box, switchRow(prefs, key, switches.get(key), SettingsCatalog.help(key), changed));
                for (PatchSettings.Choice choice : choices.values()) {
                    if (key.equals(choice.parent)) add(box, choiceRow(prefs, choice, changed));
                }
            }
            if (box != null) content.addView(box);
        }

        LinearLayout more = section("More");
        if (!texts.isEmpty()) {
            add(more, linkRow("Filters", "Keywords, authors and Spaces to hide.", () -> filters(prefs, texts)));
        }
        if (switches.containsKey("readingHistory")) {
            add(more, linkRow("History", "Answers, posts and questions you opened.", this::history));
        }
        if (switches.containsKey("bookmarks")) {
            add(more, linkRow("Bookmarks", "Answers and posts you saved.", this::bookmarks));
        }
        if (switches.containsKey("hideDismissedQuestions")) {
            add(more, linkRow("Dismissed questions", "Questions whose answers the feed hides.", this::dismissedQuestions));
        }
        add(more, linkRow("Backup", "Your settings and lists as text, to keep or restore.", () -> backup(prefs)));
        add(more, linkRow("Report a problem", "Copies the app details and opens a bug report on GitHub.",
                () -> report(prefs, switches)));
        content.addView(more);

        if (switches.isEmpty() && texts.isEmpty()) {
            content.addView(note("Open a page in the app first; the patches that work on pages appear here once they have run."));
        }
        TextView none = note("No patch matches.");
        none.setVisibility(View.GONE);
        content.addView(none);
        content.addView(search(content, none, "Search patches"), 0);

        mainPage = show("Quora patches", content, () -> {
            if (changed.isEmpty()) return;
            PatchSettings.reload();
            for (String key : changed) {
                if (RESTART.contains(key)) {
                    Toast.makeText(activity, Texts.t("Some changes show after restarting the app."), Toast.LENGTH_LONG).show();
                    break;
                }
            }
        });
    }

    private void filters(SharedPreferences prefs, Map<String, String[]> texts) {
        LinearLayout content = column();
        Map<String, EditText> fields = new LinkedHashMap<>();
        for (Map.Entry<String, String[]> entry : texts.entrySet()) {
            LinearLayout box = section(entry.getValue()[0]);
            EditText field = field(prefs.getString(entry.getKey(), entry.getValue()[1]));
            field.setHint(Texts.t("Separate with commas"));
            box.addView(field);
            content.addView(box);
            fields.put(entry.getKey(), field);
        }
        LinearLayout help = section(null);
        help.addView(note("Matching ignores case. Saved when you go back."));
        content.addView(help);

        show("Filters", content, () -> {
            SharedPreferences.Editor editor = prefs.edit();
            boolean edited = false;
            for (Map.Entry<String, EditText> f : fields.entrySet()) {
                String value = f.getValue().getText().toString().trim();
                if (!value.equals(prefs.getString(f.getKey(), texts.get(f.getKey())[1]))) edited = true;
                editor.putString(f.getKey(), value);
            }
            editor.apply();
            if (edited) PatchSettings.reload();
        });
    }

    private void history() {
        itemList(ReadingHistory.HISTORY, "History",
                "Nothing yet. Answers, posts and questions you open show up here.",
                null, null, "Clear the whole history?", "History cleared.");
    }

    private void bookmarks() {
        itemList(ReadingHistory.BOOKMARKS, "Bookmarks",
                "Nothing saved yet. Tap the bookmark next to Share under an open answer or post.",
                "Remove this bookmark?", "Removed from Bookmarks", null, null);
    }

    private void dismissedQuestions() {
        itemList(ReadingHistory.DISMISSED, "Dismissed questions",
                "Nothing yet. Questions you mark \"Not interested in this question\" show up here.",
                "Show this question again?", "Removed from the list", "Clear the whole list?", "List cleared.");
    }

    /** "Answer by Jane" in the phone's language. */
    private static String byline(String author) {
        for (String kind : new String[]{"Answer by ", "Post by "}) {
            if (author.startsWith(kind)) return Texts.t(kind) + author.substring(kind.length());
        }
        return Texts.t(author);
    }

    /**
     * A list of answers, posts and questions that open in the app when tapped. When removeAsk is set,
     * long-pressing one removes it; when clearAsk is set, Clear in the top bar empties the list.
     */
    private void itemList(ReadingHistory store, String title, String empty, String removeAsk, String removedToast,
                          String clearAsk, String clearedToast) {
        List<ReadingHistory.Item> items = store.load(activity);
        LinearLayout content = column();
        Dialog[] page = new Dialog[1];
        if (items.isEmpty()) {
            content.addView(note(empty));
        } else {
            if (removeAsk != null) {
                LinearLayout hint = section(null);
                hint.addView(note("Long-press one to remove it."));
                content.addView(hint);
            }
            LinearLayout box = section(null);
            long now = System.currentTimeMillis();
            for (ReadingHistory.Item item : items) {
                String when = now - item.time < android.text.format.DateUtils.MINUTE_IN_MILLIS
                        ? Texts.t("Just now")
                        : android.text.format.DateUtils.getRelativeTimeSpanString(
                                item.time, now, android.text.format.DateUtils.MINUTE_IN_MILLIS).toString();
                String line = item.author.isEmpty() ? when : byline(item.author) + " · " + when;
                View row = linkRow(item.title, line, () -> {
                    if (!ReadingHistory.isQuoraUrl(item.url)) return;
                    try {
                        // Quora opens its own links in the app.
                        android.content.Intent open = new android.content.Intent(
                                android.content.Intent.ACTION_VIEW, android.net.Uri.parse(item.url));
                        open.setPackage(activity.getPackageName());
                        activity.startActivity(open);
                        if (page[0] != null) page[0].dismiss();
                        if (mainPage != null) mainPage.dismiss();
                    } catch (Exception ex) {
                        Log.e(TAG, "Failed to open " + title, ex);
                    }
                });
                if (removeAsk != null) {
                    row.setOnLongClickListener((v) -> {
                        confirm(removeAsk, "Remove", () -> {
                            store.remove(activity, item.url);
                            // The row and the divider line next to it.
                            ViewGroup list = (ViewGroup) row.getParent();
                            int index = list.indexOfChild(row);
                            list.removeView(row);
                            if (index > 0) list.removeViewAt(index - 1);
                            else if (list.getChildCount() > 0) list.removeViewAt(0);
                            Toast.makeText(activity, Texts.t(removedToast), Toast.LENGTH_SHORT).show();
                        });
                        return true;
                    });
                }
                add(box, row);
            }
            content.addView(box);

            LinearLayout actions = section(null);
            add(actions, linkRow("Copy as text", "Every title with its link, to keep or share.", () -> {
                StringBuilder list = new StringBuilder();
                for (ReadingHistory.Item item : store.load(activity)) {
                    list.append(item.title).append('\n').append(item.url).append("\n\n");
                }
                ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
                if (clipboard == null) return;
                clipboard.setPrimaryClip(ClipData.newPlainText(title, list.toString().trim()));
                Toast.makeText(activity, Texts.t(title + " copied."), Toast.LENGTH_SHORT).show();
            }));
            content.addView(actions);

            TextView none = note("Nothing matches.");
            none.setVisibility(View.GONE);
            content.addView(none);
            content.addView(search(content, none, "Search " + title.toLowerCase()), 0);
        }
        Runnable clear = clearAsk == null || items.isEmpty() ? null : () -> confirm(clearAsk, "Clear", () -> {
            store.clear(activity);
            Toast.makeText(activity, Texts.t(clearedToast), Toast.LENGTH_SHORT).show();
            if (page[0] != null) page[0].dismiss();
        });
        page[0] = show(title, content, null, "Clear", clear);
    }

    /**
     * Copies what helps with a bug report (no account or personal details: versions, the patches
     * that are on and the page check) and opens the bug report form.
     */
    private void report(SharedPreferences prefs, Map<String, String> switches) {
        StringBuilder text = new StringBuilder();
        String quora = "?";
        try {
            quora = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionName;
        } catch (Exception ignored) {
            // Leave it as "?".
        }
        text.append("Quora: ").append(quora).append('\n');
        text.append("Android: ").append(android.os.Build.VERSION.RELEASE)
                .append(" (API ").append(android.os.Build.VERSION.SDK_INT).append(")\n");
        List<String> on = new ArrayList<>();
        List<String> off = new ArrayList<>();
        for (Map.Entry<String, String> entry : switches.entrySet()) {
            (prefs.getBoolean(entry.getKey(), true) ? on : off).add(entry.getValue());
        }
        java.util.Collections.sort(on, String.CASE_INSENSITIVE_ORDER);
        java.util.Collections.sort(off, String.CASE_INSENSITIVE_ORDER);
        text.append("On: ").append(on.isEmpty() ? "none" : android.text.TextUtils.join(", ", on)).append('\n');
        text.append("Switched off: ").append(off.isEmpty() ? "none" : android.text.TextUtils.join(", ", off)).append('\n');
        String status = PageCheck.status(prefs);
        text.append(status == null ? "Page check: not run yet" : status).append('\n');
        try {
            ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            if (clipboard != null) clipboard.setPrimaryClip(ClipData.newPlainText("Quora patches", text.toString()));
            Toast.makeText(activity, Texts.t("App details copied. Paste them into the report."), Toast.LENGTH_LONG).show();
            android.content.Intent open = new android.content.Intent(android.content.Intent.ACTION_VIEW,
                    android.net.Uri.parse("https://github.com/JoFSlash/quora-patches/issues/new?template=bug_report.yml"));
            // A browser, not this app: Quora handles only quora.com links.
            open.addCategory(android.content.Intent.CATEGORY_BROWSABLE);
            activity.startActivity(open);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to open the bug report", ex);
            Toast.makeText(activity, Texts.t("App details copied. Open github.com/JoFSlash/quora-patches/issues to report."),
                    Toast.LENGTH_LONG).show();
        }
    }

    private void confirm(String message, String action, Runnable onConfirm) {
        new android.app.AlertDialog.Builder(activity, dark
                ? android.R.style.Theme_Material_Dialog_Alert
                : android.R.style.Theme_Material_Light_Dialog_Alert)
                .setMessage(Texts.t(message))
                .setNegativeButton(Texts.t("Cancel"), null)
                .setPositiveButton(Texts.t(action), (d, w) -> onConfirm.run())
                .show();
    }

    private void backup(SharedPreferences prefs) {
        JSONObject json = new JSONObject();
        try {
            for (Map.Entry<String, ?> entry : prefs.getAll().entrySet()) {
                String key = entry.getKey();
                // The page check's own counters and the hint flag are not settings.
                if (key.startsWith("check_") || key.startsWith("hint_")) continue;
                json.put(key, entry.getValue());
            }
            // History, Bookmarks and Dismissed questions, under one key that older versions skip.
            JSONObject lists = new JSONObject();
            for (Map.Entry<String, ReadingHistory> list : LISTS.entrySet()) {
                org.json.JSONArray items = list.getValue().toJson(activity);
                if (items.length() > 0) lists.put(list.getKey(), items);
            }
            if (lists.length() > 0) json.put(LISTS_KEY, lists);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to write the backup", ex);
        }
        LinearLayout content = column();
        LinearLayout box = section("Your settings and lists");
        EditText field = field(json.toString());
        box.addView(field);
        content.addView(box);

        LinearLayout actions = section(null);
        add(actions, linkRow("Copy", "Keep the text somewhere safe.", () -> {
            ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            if (clipboard == null) return;
            clipboard.setPrimaryClip(ClipData.newPlainText("Quora patches", field.getText().toString()));
            Toast.makeText(activity, Texts.t("Copied."), Toast.LENGTH_SHORT).show();
        }));
        add(actions, linkRow("Restore", "Paste a saved text above first.", () -> {
            try {
                JSONObject saved = new JSONObject(field.getText().toString().trim());
                SharedPreferences.Editor editor = prefs.edit();
                for (Iterator<String> it = saved.keys(); it.hasNext(); ) {
                    String key = it.next();
                    Object value = saved.get(key);
                    if (value instanceof Boolean) editor.putBoolean(key, (Boolean) value);
                    else if (value instanceof String) editor.putString(key, (String) value);
                }
                editor.apply();
                PatchSettings.reload();
                // Lists are merged: what is already on the phone stays.
                int added = 0;
                JSONObject lists = saved.optJSONObject(LISTS_KEY);
                if (lists != null) {
                    for (Map.Entry<String, ReadingHistory> list : LISTS.entrySet()) {
                        added += list.getValue().merge(activity, lists.optJSONArray(list.getKey()));
                    }
                }
                Toast.makeText(activity, added > 0
                        ? Texts.t("Settings restored. Items added to your lists: ") + added
                        : Texts.t("Settings restored."), Toast.LENGTH_SHORT).show();
            } catch (Exception ex) {
                Toast.makeText(activity, Texts.t("That is not a saved settings text."), Toast.LENGTH_LONG).show();
            }
        }));
        content.addView(actions);
        show("Backup", content, null);
    }

    // ------------------------------------------------------------------ frame

    /** A full screen window with a top bar; back (the arrow or the system back) closes it. */
    private Dialog show(String title, View content, Runnable onClose) {
        return show(title, content, onClose, null, null);
    }

    /** As above, with a text button at the right end of the top bar. */
    private Dialog show(String title, View content, Runnable onClose, String actionLabel, Runnable action) {
        Dialog dialog = new Dialog(activity, dark
                ? android.R.style.Theme_Material_NoActionBar
                : android.R.style.Theme_Material_Light_NoActionBar);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(bar);
        root.setFitsSystemWindows(true);

        LinearLayout top = new LinearLayout(activity);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);
        top.setBackgroundColor(bar);
        top.setMinimumHeight(dp(56));
        TextView back = new TextView(activity);
        back.setText("←");
        back.setTextSize(26);
        back.setTextColor(text);
        back.setGravity(Gravity.CENTER);
        back.setOnClickListener((v) -> dialog.dismiss());
        back.setContentDescription(Texts.t("Back"));
        top.addView(back, new LinearLayout.LayoutParams(dp(56), dp(56)));
        TextView name = new TextView(activity);
        name.setText(Texts.t(title));
        name.setTextSize(21);
        name.setTypeface(Typeface.DEFAULT_BOLD);
        name.setTextColor(text);
        top.addView(name, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        if (actionLabel != null && action != null) {
            TextView button = new TextView(activity);
            button.setText(Texts.t(actionLabel));
            button.setTextSize(16);
            button.setTypeface(Typeface.DEFAULT_BOLD);
            button.setTextColor(accent);
            button.setGravity(Gravity.CENTER);
            button.setPadding(dp(16), 0, dp(16), 0);
            button.setOnClickListener((v) -> action.run());
            top.addView(button, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, dp(56)));
        }
        root.addView(top);
        View line = new View(activity);
        line.setBackgroundColor(divider);
        root.addView(line, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, dp(1) / 2)));

        ScrollView scroll = new ScrollView(activity);
        scroll.setBackgroundColor(background);
        scroll.addView(content);
        root.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        dialog.setContentView(root);
        // Keep the keyboard closed until the search field is tapped.
        root.setFocusableInTouchMode(true);
        root.requestFocus();
        if (onClose != null) dialog.setOnDismissListener((d) -> onClose.run());
        Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            // A page, not a popup: no dimmed app behind it, and the bar color under the status bar.
            window.clearFlags(android.view.WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.setSoftInputMode(android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                    | android.view.WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN);
            window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(bar));
            window.setWindowAnimations(android.R.style.Animation_Activity);
            window.setStatusBarColor(bar);
            window.setNavigationBarColor(background);
            // Dark icons on the light bar, light icons on the dark one.
            window.getDecorView().setSystemUiVisibility(dark ? 0 : View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
            if (android.os.Build.VERSION.SDK_INT >= 30) {
                android.view.WindowInsetsController insets = window.getInsetsController();
                if (insets != null) {
                    int light = android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                            | android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                    insets.setSystemBarsAppearance(dark ? 0 : light, light);
                }
            }
        }
        dialog.show();
        return dialog;
    }

    // ------------------------------------------------------------------ rows

    private LinearLayout column() {
        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setPadding(0, 0, 0, dp(24));
        return column;
    }

    /** A block on the page, with a bold header like Quora's "Display" or "Privacy". */
    private LinearLayout section(String header) {
        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setBackgroundColor(section);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(8);
        box.setLayoutParams(params);
        if (header != null) {
            TextView title = new TextView(activity);
            title.setText(Texts.t(header));
            title.setTextSize(17);
            title.setTypeface(Typeface.DEFAULT_BOLD);
            title.setTextColor(text);
            title.setPadding(dp(16), dp(14), dp(16), dp(12));
            box.addView(title);
        }
        return box;
    }

    private View switchRow(SharedPreferences prefs, String key, String name, String help, Set<String> changed) {
        Switch toggle = new Switch(activity);
        toggle.setChecked(prefs.getBoolean(key, true));
        int[][] states = {{android.R.attr.state_checked}, {}};
        toggle.setThumbTintList(new ColorStateList(states, new int[]{accent, dark ? 0xFF8A8B8D : 0xFFFFFFFF}));
        toggle.setTrackTintList(new ColorStateList(states, new int[]{(accent & 0x00FFFFFF) | 0x66000000, divider}));
        toggle.setOnCheckedChangeListener((button, isChecked) -> {
            prefs.edit().putBoolean(key, isChecked).apply();
            changed.add(key);
        });
        LinearLayout row = row(name, help);
        row.addView(toggle);
        row.setOnClickListener((v) -> toggle.toggle());
        return row;
    }

    /** An option of the patch above it, such as "Older than: 3 years"; opens a page to pick another value. */
    private View choiceRow(SharedPreferences prefs, PatchSettings.Choice choice, Set<String> changed) {
        String value = prefs.getString("opt_" + choice.key, choice.patched);
        View row = linkRow(choice.name, choice.summary(value), null);
        row.setPadding(dp(32), row.getPaddingTop(), row.getPaddingRight(), row.getPaddingBottom());
        TextView summary = (TextView) ((LinearLayout) ((LinearLayout) row).getChildAt(0)).getChildAt(1);
        row.setOnClickListener((v) -> pick(prefs, choice, summary, changed));
        return row;
    }

    /** A page listing an option's values: tap one, or tick several for options that take more than one. */
    private void pick(SharedPreferences prefs, PatchSettings.Choice choice, TextView summary, Set<String> changed) {
        String current = prefs.getString("opt_" + choice.key, choice.patched);
        Set<String> picked = new HashSet<>(Arrays.asList(current.split(",")));
        LinearLayout content = column();
        LinearLayout box = section(null);
        Dialog[] page = new Dialog[1];
        for (int i = 0; i < choice.values.length; i++) {
            String value = choice.values[i];
            android.widget.CompoundButton mark = choice.multi
                    ? new android.widget.CheckBox(activity) : new android.widget.RadioButton(activity);
            mark.setChecked(picked.contains(value));
            mark.setButtonTintList(ColorStateList.valueOf(accent));
            mark.setClickable(false);
            LinearLayout row = row(choice.labels[i], null);
            row.addView(mark);
            row.setOnClickListener((v) -> {
                if (choice.multi) {
                    if (!picked.remove(value)) picked.add(value);
                    mark.setChecked(picked.contains(value));
                    List<String> ordered = new ArrayList<>();
                    for (String option : choice.values) if (picked.contains(option)) ordered.add(option);
                    save(prefs, choice, android.text.TextUtils.join(",", ordered), summary, changed);
                } else {
                    save(prefs, choice, value, summary, changed);
                    if (page[0] != null) page[0].dismiss();
                }
            });
            add(box, row);
        }
        content.addView(box);
        page[0] = show(choice.name, content, null);
    }

    private void save(SharedPreferences prefs, PatchSettings.Choice choice, String value, TextView summary,
                      Set<String> changed) {
        prefs.edit().putString("opt_" + choice.key, value).apply();
        summary.setText(choice.summary(value));
        changed.add(choice.parent);
    }

    private View linkRow(String name, String help, Runnable action) {
        LinearLayout row = row(name, help);
        TextView chevron = new TextView(activity);
        chevron.setText("›");
        chevron.setTextSize(26);
        chevron.setTextColor(secondary);
        row.addView(chevron);
        if (action != null) row.setOnClickListener((v) -> action.run());
        return row;
    }

    private LinearLayout row(String name, String help) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(16), dp(12), dp(16), dp(12));
        row.setMinimumHeight(dp(56));
        // What the search field looks in.
        row.setTag((name + " " + (help == null ? "" : help) + " " + Texts.t(name) + " " + (help == null ? "" : Texts.t(help))).toLowerCase());
        android.util.TypedValue ripple = new android.util.TypedValue();
        if (activity.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true)) {
            row.setForeground(activity.getDrawable(ripple.resourceId));
        }

        LinearLayout texts = new LinearLayout(activity);
        texts.setOrientation(LinearLayout.VERTICAL);
        TextView title = new TextView(activity);
        title.setText(Texts.t(name));
        title.setTextSize(16);
        title.setTextColor(text);
        texts.addView(title);
        if (help != null) {
            TextView line = new TextView(activity);
            line.setText(Texts.t(help));
            line.setTextSize(13);
            line.setTextColor(secondary);
            line.setPadding(0, dp(2), dp(12), 0);
            texts.addView(line);
        }
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        return row;
    }

    /**
     * A search field that keeps only the rows whose name or line contains the words typed,
     * and hides the sections left empty.
     */
    private View search(LinearLayout content, TextView none, String hint) {
        EditText field = new EditText(activity);
        field.setHint(Texts.t(hint));
        field.setSingleLine(true);
        field.setTextSize(16);
        field.setTextColor(text);
        field.setHintTextColor(secondary);
        field.setPadding(dp(14), dp(10), dp(14), dp(10));
        android.graphics.drawable.GradientDrawable shape = new android.graphics.drawable.GradientDrawable();
        shape.setColor(dark ? 0xFF262626 : 0xFFF1F2F2);
        shape.setCornerRadius(dp(20));
        field.setBackground(shape);
        LinearLayout box = new LinearLayout(activity);
        box.setBackgroundColor(section);
        box.setPadding(dp(12), dp(10), dp(12), dp(10));
        box.addView(field, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        field.addTextChangedListener(new android.text.TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(android.text.Editable s) {
                String[] words = s.toString().toLowerCase().trim().split("\\s+");
                boolean all = s.toString().trim().isEmpty();
                boolean any = false;
                for (int i = 0; i < content.getChildCount(); i++) {
                    View child = content.getChildAt(i);
                    if (child == box || child == none) continue;
                    boolean shown = false;
                    if (child instanceof LinearLayout) {
                        LinearLayout group = (LinearLayout) child;
                        for (int j = 0; j < group.getChildCount(); j++) {
                            View item = group.getChildAt(j);
                            if (item.getTag() instanceof String) {
                                boolean match = all || matches((String) item.getTag(), words);
                                item.setVisibility(match ? View.VISIBLE : View.GONE);
                                shown |= match;
                            } else if (!(item instanceof TextView)) {
                                // The lines between rows only make sense in the full list.
                                item.setVisibility(all ? View.VISIBLE : View.GONE);
                            }
                        }
                    }
                    child.setVisibility(all || shown ? View.VISIBLE : View.GONE);
                    any |= shown;
                }
                none.setVisibility(!all && !any ? View.VISIBLE : View.GONE);
            }
        });
        return box;
    }

    private static boolean matches(String haystack, String[] words) {
        for (String word : words) if (!haystack.contains(word)) return false;
        return true;
    }

    /** Adds a row to a section, with a thin line above it like Quora's lists. */
    private void add(LinearLayout box, View row) {
        if (box.getChildCount() > 0) {
            View line = new View(activity);
            line.setBackgroundColor(divider);
            box.addView(line, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, dp(1) / 2)));
        }
        box.addView(row);
    }

    private TextView note(String message) {
        TextView note = new TextView(activity);
        note.setText(Texts.t(message));
        note.setTextSize(14);
        note.setTextColor(secondary);
        note.setPadding(dp(16), dp(14), dp(16), dp(14));
        return note;
    }

    private EditText field(String value) {
        EditText field = new EditText(activity);
        field.setText(value);
        field.setTextColor(text);
        field.setHintTextColor(secondary);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        field.setBackgroundTintList(ColorStateList.valueOf(accent));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.setMargins(dp(12), 0, dp(12), dp(12));
        field.setLayoutParams(params);
        return field;
    }

    private int dp(int value) {
        return (int) (value * density);
    }
}
