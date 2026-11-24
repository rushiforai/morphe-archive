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
    // The saved texts of Bookmarks, only in a backup file.
    private static final String OFFLINE_KEY = "offline";

    static {
        LISTS.put("history", ReadingHistory.HISTORY);
        LISTS.put("bookmarks", ReadingHistory.BOOKMARKS);
        LISTS.put("dismissed", ReadingHistory.DISMISSED);
    }

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
        String updates = FilterUpdates.status(activity);
        String version = UpdateCheck.status(activity);
        String hidden = HiddenStats.status(prefs);
        String newer = UpdateCheck.newer(prefs);
        if (status != null || updates != null || version != null || hidden != null) {
            LinearLayout box = section(null);
            if (version != null) box.addView(note(version));
            if (newer != null) {
                add(box, linkRow("Get the new version", "What's new, and how to patch again.",
                        () -> UpdateCheck.openRelease(activity, newer)));
            }
            if (hidden != null) box.addView(note(hidden));
            if (status != null) box.addView(note(status));
            if (updates != null) box.addView(note(updates));
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
        boolean picker = switches.containsKey(Picker.KEY);
        if (!texts.isEmpty() || picker) {
            add(more, linkRow("Filters", "Keywords, authors and Spaces to hide.", () -> filters(prefs, texts)));
        }
        if (picker) {
            add(more, linkRow("Pick something to hide", "Tap a box on the page to hide it and every box like it.", () -> {
                if (mainPage != null) mainPage.dismiss();
                Picker.start(activity);
            }));
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
        if (GmsCoreCheck.applied) add(more, notificationsRow());
        add(more, linkRow("Presets", "Switch many patches at once: everything, a clean feed, for reading, or ads only.", () -> {
            if (mainPage != null) mainPage.dismiss();
            Presets.ask(activity, prefs, false);
        }));
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
                if (SettingsCatalog.RESTART.contains(key)) {
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
        EditText lists = null;
        if (texts.containsKey("authors")) {
            LinearLayout box = section("Author lists to follow");
            lists = field(AuthorLists.saved(prefs));
            lists.setHint("https://");
            lists.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI
                    | InputType.TYPE_TEXT_FLAG_MULTI_LINE | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
            box.addView(lists);
            box.addView(note(AuthorLists.status(prefs)));
            content.addView(box);
        }
        EditText picked = null;
        if (PatchSettings.isRegistered(Picker.KEY)) {
            LinearLayout box = section("Picked to hide");
            StringBuilder value = new StringBuilder();
            for (String selector : Picker.list(prefs)) value.append(selector).append('\n');
            picked = field(value.toString().trim());
            picked.setHint(Texts.t("Nothing picked yet"));
            picked.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                    | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
            box.addView(picked);
            box.addView(note("One per line. Delete a line to show those boxes again."));
            content.addView(box);
        }
        LinearLayout help = section(null);
        help.addView(note("Matching ignores case and finds whole words; end a word with * to also find longer ones (art* finds artist). Saved when you go back."));
        content.addView(help);

        EditText listsField = lists;
        EditText pickedField = picked;
        show("Filters", content, () -> {
            SharedPreferences.Editor editor = prefs.edit();
            boolean edited = false;
            for (Map.Entry<String, EditText> f : fields.entrySet()) {
                String value = f.getValue().getText().toString().trim();
                if (!value.equals(prefs.getString(f.getKey(), texts.get(f.getKey())[1]))) edited = true;
                editor.putString(f.getKey(), value);
            }
            editor.apply();
            if (listsField != null) AuthorLists.setUrls(activity, listsField.getText().toString());
            if (pickedField != null) {
                List<String> list = Picker.parse(pickedField.getText().toString());
                if (!list.equals(Picker.list(prefs))) Picker.save(activity, list);
            }
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
                boolean bookmark = store == ReadingHistory.BOOKMARKS;
                if (bookmark && OfflineCopies.has(activity, item.url)) line += " · " + Texts.t("Saved offline");
                View row = linkRow(item.title, line, () -> {
                    // A bookmark with its text saved opens that copy, which works offline.
                    if (bookmark && OfflineCopies.has(activity, item.url)) savedCopy(item, page[0]);
                    else openInApp(item, page[0]);
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
            if (store == ReadingHistory.BOOKMARKS) {
                add(actions, linkRow("Save to Downloads", "All bookmarks with their saved text, as a Markdown file.",
                        this::saveBookmarksFile));
                add(actions, linkRow("Share", "All bookmarks with their saved text, to a notes app, Pocket or mail.",
                        this::shareBookmarks));
            }
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
     * Writes every bookmark with its saved text to a Markdown file in Downloads, so they outlast the
     * app (an uninstall removes the saved copies). Before Android 10, where that needs a storage
     * permission, the file goes to the app's own folder on the phone's storage instead.
     */
    private void saveBookmarksFile() {
        saveToDownloads("Quora bookmarks " + fileDate() + ".md", "text/markdown",
                OfflineCopies.markdown(activity, ReadingHistory.BOOKMARKS.load(activity))
                        .getBytes(java.nio.charset.StandardCharsets.UTF_8));
    }

    /**
     * Sends the bookmarks as Markdown to another app. A share can't carry much text, so when the
     * saved texts make it too long, only the titles and links go, and Save to Downloads keeps all.
     */
    private void shareBookmarks() {
        List<ReadingHistory.Item> items = ReadingHistory.BOOKMARKS.load(activity);
        String all = OfflineCopies.markdown(activity, items);
        if (all.length() > 200_000) {
            StringBuilder list = new StringBuilder("# Quora bookmarks\n\n");
            for (ReadingHistory.Item item : items) list.append("- [").append(item.title).append("](").append(item.url).append(")\n");
            all = list.toString();
            Toast.makeText(activity, Texts.t("Too long to share with the saved texts: sharing the titles and links. Save to Downloads keeps all of it."),
                    Toast.LENGTH_LONG).show();
        }
        try {
            android.content.Intent send = new android.content.Intent(android.content.Intent.ACTION_SEND);
            send.setType("text/plain");
            send.putExtra(android.content.Intent.EXTRA_SUBJECT, "Quora bookmarks");
            send.putExtra(android.content.Intent.EXTRA_TEXT, all);
            activity.startActivity(android.content.Intent.createChooser(send, Texts.t("Share")));
        } catch (Exception ex) {
            Log.e(TAG, "Failed to share the bookmarks", ex);
        }
    }

    private static String fileDate() {
        return new java.text.SimpleDateFormat("yyyy-MM-dd HH-mm", java.util.Locale.ROOT).format(new java.util.Date());
    }

    /** Saves a file to Downloads (before Android 10, to the app's own Documents folder) and says where. */
    private void saveToDownloads(String name, String type, byte[] data) {
        try {
            String where;
            if (android.os.Build.VERSION.SDK_INT >= 29) {
                android.content.ContentValues values = new android.content.ContentValues();
                values.put(android.provider.MediaStore.MediaColumns.DISPLAY_NAME, name);
                values.put(android.provider.MediaStore.MediaColumns.MIME_TYPE, type);
                values.put(android.provider.MediaStore.MediaColumns.RELATIVE_PATH,
                        android.os.Environment.DIRECTORY_DOWNLOADS);
                android.net.Uri uri = activity.getContentResolver().insert(
                        android.provider.MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
                if (uri == null) throw new java.io.IOException("No Downloads entry");
                try (java.io.OutputStream out = activity.getContentResolver().openOutputStream(uri)) {
                    if (out == null) throw new java.io.IOException("No output stream");
                    out.write(data);
                }
                where = android.os.Environment.DIRECTORY_DOWNLOADS + "/" + name;
            } else {
                java.io.File folder = activity.getExternalFilesDir(android.os.Environment.DIRECTORY_DOCUMENTS);
                if (folder == null || (!folder.isDirectory() && !folder.mkdirs())) {
                    throw new java.io.IOException("No folder");
                }
                java.io.File file = new java.io.File(folder, name);
                try (java.io.FileOutputStream out = new java.io.FileOutputStream(file)) {
                    out.write(data);
                }
                where = file.getPath();
            }
            Toast.makeText(activity, Texts.t("Saved to") + " " + where, Toast.LENGTH_LONG).show();
        } catch (Exception ex) {
            Log.e(TAG, "Failed to save " + name, ex);
            Toast.makeText(activity, Texts.t("Couldn't save the file."), Toast.LENGTH_LONG).show();
        }
    }

    /** Opens an answer, post or question in the app and closes the given pages and the settings. */
    private void openInApp(ReadingHistory.Item item, Dialog... close) {
        if (!ReadingHistory.isQuoraUrl(item.url)) return;
        try {
            // Quora opens its own links in the app.
            android.content.Intent open = new android.content.Intent(
                    android.content.Intent.ACTION_VIEW, android.net.Uri.parse(item.url));
            open.setPackage(activity.getPackageName());
            activity.startActivity(open);
            for (Dialog d : close) if (d != null) d.dismiss();
            if (mainPage != null) mainPage.dismiss();
        } catch (Exception ex) {
            Log.e(TAG, "Failed to open " + item.url, ex);
        }
    }

    /**
     * The text of a bookmarked answer or post as it was saved, readable without internet. Open in
     * the top bar shows the page in Quora; Read aloud reads it when that patch is on.
     */
    private void savedCopy(ReadingHistory.Item item, Dialog listPage) {
        OfflineCopies.Copy copy = OfflineCopies.load(activity, item.url);
        if (copy == null) {
            openInApp(item, listPage);
            return;
        }
        LinearLayout content = column();
        if (PatchSettings.isRegistered("readAloud") && PatchSettings.isOn("readAloud")) {
            LinearLayout actions = section(null);
            add(actions, linkRow("Read aloud", "Reads this text out loud. Tap again to stop.",
                    () -> ReadAloud.toggle(content, copy.text, null, true)));
            content.addView(actions);
        }
        LinearLayout box = section(null);
        TextView head = new TextView(activity);
        head.setText(copy.title.isEmpty() ? item.title : copy.title);
        head.setTextSize(20);
        head.setTypeface(Typeface.DEFAULT_BOLD);
        head.setTextColor(text);
        head.setTextIsSelectable(true);
        head.setPadding(dp(16), dp(16), dp(16), dp(4));
        box.addView(head);
        TextView meta = new TextView(activity);
        String saved = Texts.t("Saved offline") + " " + android.text.format.DateUtils.getRelativeTimeSpanString(
                copy.time, System.currentTimeMillis(), android.text.format.DateUtils.MINUTE_IN_MILLIS);
        meta.setText(copy.author.isEmpty() ? saved : byline(copy.author) + " · " + saved);
        meta.setTextSize(13);
        meta.setTextColor(secondary);
        meta.setPadding(dp(16), 0, dp(16), dp(12));
        box.addView(meta);
        LinearLayout body = new LinearLayout(activity);
        body.setOrientation(LinearLayout.VERTICAL);
        addBody(body, copy.text, copy.images);
        box.addView(body);
        content.addView(box);
        content.addView(note(copy.images.isEmpty() ? "Saved as text: pictures, links and formatting aren't kept."
                : "Saved as text with its pictures: links and formatting aren't kept."));
        Dialog[] reader = new Dialog[1];
        reader[0] = show("Saved copy", content, () -> ReadAloud.stopFor(content), "Open",
                () -> openInApp(item, reader[0], listPage));
    }

    /** The text in pieces, with each picture after the text it came after on the page. */
    private void addBody(LinearLayout box, String body, List<OfflineCopies.Image> images) {
        box.removeAllViews();
        int from = 0;
        for (OfflineCopies.Image image : images) {
            int at = OfflineCopies.after(body, image.after, from);
            if (at > from) box.addView(bodyText(body.substring(from, at).trim(), text));
            from = Math.max(from, at);
            View picture = picture(image.file);
            if (picture != null) box.addView(picture);
        }
        if (from < body.length()) box.addView(bodyText(body.substring(from).trim(), text));
    }

    /**
     * Reader view: an answer or post from the page as plain text in the app's own page, with its
     * pictures, without Quora's page around it. The pictures load after the text, unless Data saver
     * holds them back.
     *
     * @param images  JSON [{s: address, a: the text before it}], from the page.
     * @param preview Whether the text is only the start of a shortened answer in the feed.
     */
    static void reader(Context context, String title, String author, String body, String images, boolean preview) {
        Activity activity = PatchSettings.activity(context);
        if (activity == null) return;
        try {
            new SettingsPage(activity).showReader(title == null ? "" : title.trim(), author == null ? "" : author.trim(),
                    body.trim(), images, preview);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to open the reader", ex);
        }
    }

    private void showReader(String title, String author, String body, String images, boolean preview) {
        LinearLayout content = column();
        if (PatchSettings.isRegistered("readAloud") && PatchSettings.isOn("readAloud")) {
            LinearLayout actions = section(null);
            add(actions, linkRow("Read aloud", "Reads this text out loud. Tap again to stop.",
                    () -> ReadAloud.toggle(content, body, null, true)));
            content.addView(actions);
        }
        LinearLayout box = section(null);
        if (!title.isEmpty()) {
            TextView head = new TextView(activity);
            head.setText(title);
            head.setTextSize(20);
            head.setTypeface(Typeface.DEFAULT_BOLD);
            head.setTextColor(text);
            head.setTextIsSelectable(true);
            head.setPadding(dp(16), dp(16), dp(16), dp(4));
            box.addView(head);
        }
        if (!author.isEmpty()) {
            TextView meta = new TextView(activity);
            meta.setText(byline(author));
            meta.setTextSize(13);
            meta.setTextColor(secondary);
            meta.setPadding(dp(16), title.isEmpty() ? dp(16) : 0, dp(16), dp(12));
            box.addView(meta);
        }
        LinearLayout bodyBox = new LinearLayout(activity);
        bodyBox.setOrientation(LinearLayout.VERTICAL);
        addBody(bodyBox, body, new ArrayList<>());
        box.addView(bodyBox);
        content.addView(box);
        if (preview) content.addView(note("This is the start the feed shows. Open the answer to read all of it here."));
        Dialog page = show("Reader view", content, () -> ReadAloud.stopFor(content));
        ReaderImages.load(activity, images, (loaded) -> {
            if (page.isShowing() && !loaded.isEmpty()) addBody(bodyBox, body, loaded);
        });
    }

    private TextView bodyText(String value, int color) {
        TextView body = new TextView(activity);
        body.setText(value);
        body.setTextSize(17);
        body.setTextColor(color);
        body.setLineSpacing(0, 1.35f);
        body.setTextIsSelectable(true);
        body.setPadding(dp(16), dp(4), dp(16), dp(12));
        return body;
    }

    /** A saved picture as wide as the page, made smaller when it is larger than the screen. */
    private View picture(java.io.File file) {
        try {
            android.graphics.BitmapFactory.Options bounds = new android.graphics.BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            android.graphics.BitmapFactory.decodeFile(file.getPath(), bounds);
            if (bounds.outWidth <= 0) return null;
            int width = activity.getResources().getDisplayMetrics().widthPixels;
            android.graphics.BitmapFactory.Options options = new android.graphics.BitmapFactory.Options();
            options.inSampleSize = 1;
            while (bounds.outWidth / (options.inSampleSize * 2) >= width) options.inSampleSize *= 2;
            // A long screenshot is narrow but very tall: keep it to 4 million pixels (16 MB) and
            // 4096 pixels high, the most a phone can draw as one picture.
            while ((long) (bounds.outWidth / options.inSampleSize) * (bounds.outHeight / options.inSampleSize) > 4_000_000L
                    || bounds.outHeight / options.inSampleSize > 4096) options.inSampleSize *= 2;
            android.graphics.Bitmap bitmap = android.graphics.BitmapFactory.decodeFile(file.getPath(), options);
            if (bitmap == null) return null;
            android.widget.ImageView view = new android.widget.ImageView(activity);
            view.setImageBitmap(bitmap);
            view.setAdjustViewBounds(true);
            view.setScaleType(android.widget.ImageView.ScaleType.FIT_CENTER);
            view.setPadding(dp(16), dp(4), dp(16), dp(12));
            view.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT));
            return view;
        } catch (Throwable ex) {
            Log.e(TAG, "Failed to show a saved picture", ex);
            return null;
        }
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
        if (UpdateCheck.version() != null) text.append("Patches: ").append(UpdateCheck.version()).append('\n');
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
                    android.net.Uri.parse("https://github.com/JoFSlash/morphe-patches/issues/new?template=bug_report.yml"));
            // A browser, not this app: Quora handles only quora.com links.
            open.addCategory(android.content.Intent.CATEGORY_BROWSABLE);
            activity.startActivity(open);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to open the bug report", ex);
            Toast.makeText(activity, Texts.t("App details copied. Open github.com/JoFSlash/morphe-patches/issues to report."),
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

    /** Your settings and the lists, as a backup holds them. */
    private JSONObject backupJson(SharedPreferences prefs) {
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
        return json;
    }

    /**
     * Puts back the settings of a backup and adds its list items and saved texts that aren't on
     * the phone yet, and says what it did.
     */
    private void restore(SharedPreferences prefs, JSONObject saved) throws Exception {
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
        // Saved texts, only in a backup file; after the bookmarks, which they belong to.
        int texts = 0;
        org.json.JSONArray copies = saved.optJSONArray(OFFLINE_KEY);
        for (int i = 0; copies != null && i < copies.length(); i++) {
            if (OfflineCopies.restore(activity, copies.optJSONObject(i))) texts++;
        }
        Toast.makeText(activity, added > 0
                ? Texts.t("Settings restored. Items added to your lists: ") + added
                : Texts.t("Settings restored."), Toast.LENGTH_SHORT).show();
        // Its own toast, as Android cuts a toast after two lines.
        if (texts > 0) {
            Toast.makeText(activity, Texts.t("Saved texts restored: ") + texts, Toast.LENGTH_SHORT).show();
        }
    }

    private void backup(SharedPreferences prefs) {
        JSONObject json = backupJson(prefs);
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
                restore(prefs, new JSONObject(field.getText().toString().trim()));
            } catch (Exception ex) {
                Toast.makeText(activity, Texts.t("That is not a saved settings text."), Toast.LENGTH_LONG).show();
            }
        }));
        content.addView(actions);

        LinearLayout files = section("Backup file");
        add(files, linkRow("Save to Downloads", "Also keeps the saved texts of your bookmarks, which don't fit in the text above.",
                () -> saveBackupFile(prefs)));
        add(files, linkRow("Restore from a file", "Pick a backup file you saved.", () -> {
            boolean opened = FilePicker.pick(activity, new String[]{"application/json", "application/octet-stream", "text/plain"},
                    (uri) -> restoreBackupFile(prefs, uri));
            if (!opened) Toast.makeText(activity, Texts.t("Couldn't open the file."), Toast.LENGTH_LONG).show();
        }));
        content.addView(files);
        show("Backup", content, null);
    }

    /** The backup with every saved text of Bookmarks, as a file in Downloads. */
    private void saveBackupFile(SharedPreferences prefs) {
        StringBuilder out = new StringBuilder(backupJson(prefs).toString());
        // The texts can be large, so they are added one by one instead of as one JSON object.
        out.setLength(out.length() - 1);
        if (out.length() > 1) out.append(',');
        out.append(JSONObject.quote(OFFLINE_KEY)).append(":[");
        boolean first = true;
        for (ReadingHistory.Item item : ReadingHistory.BOOKMARKS.load(activity)) {
            JSONObject copy = OfflineCopies.toJson(activity, item.url);
            if (copy == null) continue;
            if (!first) out.append(',');
            out.append(copy.toString());
            first = false;
        }
        out.append("]}");
        saveToDownloads("Quora patches backup " + fileDate() + ".json", "application/json",
                out.toString().getBytes(java.nio.charset.StandardCharsets.UTF_8));
    }

    private void restoreBackupFile(SharedPreferences prefs, android.net.Uri uri) {
        try (java.io.InputStream in = activity.getContentResolver().openInputStream(uri)) {
            if (in == null) throw new java.io.IOException("No input stream");
            java.io.ByteArrayOutputStream data = new java.io.ByteArrayOutputStream();
            byte[] buffer = new byte[64 * 1024];
            for (int n; (n = in.read(buffer)) > 0; ) {
                data.write(buffer, 0, n);
                if (data.size() > 200 * 1024 * 1024) throw new java.io.IOException("Too large");
            }
            restore(prefs, new JSONObject(data.toString("UTF-8").trim()));
        } catch (Exception ex) {
            Log.e(TAG, "Failed to restore the backup file", ex);
            Toast.makeText(activity, Texts.t("That is not a backup file."), Toast.LENGTH_LONG).show();
        }
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

    /**
     * What keeps notifications from coming, if anything. A tap opens the setting to change, and
     * the line is checked again when you come back to the page.
     */
    private View notificationsRow() {
        GmsCoreCheck.Status[] status = {GmsCoreCheck.status(activity)};
        View row = linkRow("Notifications", status[0].line, null);
        TextView line = (TextView) ((ViewGroup) ((ViewGroup) row).getChildAt(0)).getChildAt(1);
        row.setOnClickListener((v) -> {
            if (!GmsCoreCheck.open(activity, status[0])) {
                Toast.makeText(activity, Texts.t(status[0].line), Toast.LENGTH_LONG).show();
            }
        });
        row.getViewTreeObserver().addOnWindowFocusChangeListener((focused) -> {
            if (!focused) return;
            status[0] = GmsCoreCheck.status(activity);
            line.setText(Texts.t(status[0].line));
        });
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
