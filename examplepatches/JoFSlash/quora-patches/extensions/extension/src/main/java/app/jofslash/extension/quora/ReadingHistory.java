package app.jofslash.extension.quora;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * A list of answers, posts and questions, newest first: the reading history and the bookmarks.
 * Kept in the app's own storage, apart from the settings; Backup in Patch settings saves them too.
 */
final class ReadingHistory {

    private static final String TAG = "JoFSlashPatches";
    private static final String KEY = "items";

    /** The answers, posts and questions you opened. */
    static final ReadingHistory HISTORY = new ReadingHistory("jofslash_history", 300, true);
    /** The answers and posts you saved. When it is full, nothing is dropped: a new one is refused. */
    static final ReadingHistory BOOKMARKS = new ReadingHistory("jofslash_bookmarks", 5000, false);
    /**
     * The questions you marked "Not interested in this question". Each one is kept with a Quora
     * search link for its title, as the feed doesn't show the question's own address.
     */
    static final ReadingHistory DISMISSED = new ReadingHistory("jofslash_dismissed", 1000, true);

    /** The link a dismissed question is kept under. */
    static String questionSearchUrl(String title) {
        return "https://www.quora.com/search?q=" + android.net.Uri.encode(title.trim().replaceAll("\\s+", " "));
    }

    // Only Quora pages: quora.com and Spaces on their own subdomains.
    private static final Pattern QUORA_URL = Pattern.compile("^https://([a-z0-9-]+\\.)?quora\\.com/[^\\s]*$");

    static final class Item {
        final String url, title, author;
        final long time;

        Item(String url, String title, String author, long time) {
            this.url = url;
            this.title = title;
            this.author = author;
            this.time = time;
        }
    }

    private final String prefsName;
    final int max;
    // Whether the oldest items make room for new ones (the history) or new ones are refused (bookmarks).
    private final boolean dropOldest;

    private ReadingHistory(String prefsName, int max, boolean dropOldest) {
        this.prefsName = prefsName;
        this.max = max;
        this.dropOldest = dropOldest;
    }

    static boolean isQuoraUrl(String url) {
        return url != null && url.length() < 2000 && QUORA_URL.matcher(url).matches();
    }

    private SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(prefsName, Context.MODE_PRIVATE);
    }

    /**
     * Adds an item, or moves it to the top when it is already there. Returns false when it wasn't
     * added: a full list that keeps its oldest items, or an item that isn't a Quora page.
     */
    synchronized boolean add(Context context, String url, String title, String author) {
        if (context == null || !isQuoraUrl(url) || title == null || title.trim().isEmpty()) return false;
        try {
            List<Item> items = load(context);
            boolean present = false;
            for (int i = items.size() - 1; i >= 0; i--) {
                if (items.get(i).url.equals(url)) {
                    items.remove(i);
                    present = true;
                }
            }
            if (!present && !dropOldest && items.size() >= max) return false;
            items.add(0, new Item(url, clip(title.trim(), 300), clip(author == null ? "" : author.trim(), 100),
                    System.currentTimeMillis()));
            while (items.size() > max) items.remove(items.size() - 1);
            save(context, items);
            return true;
        } catch (Exception ex) {
            Log.e(TAG, "Failed to save " + prefsName, ex);
            return false;
        }
    }

    /** The list for a backup, newest first. */
    synchronized JSONArray toJson(Context context) {
        return toJson(load(context));
    }

    /**
     * Adds the items of a backup that aren't in the list yet, keeping their dates, and returns how
     * many were added. Items that don't fit are left out, the ones already there stay.
     */
    synchronized int merge(Context context, JSONArray saved) {
        if (context == null || saved == null) return 0;
        try {
            List<Item> items = load(context);
            java.util.Set<String> urls = new java.util.HashSet<>();
            for (Item item : items) urls.add(item.url);
            int added = 0;
            for (int i = 0; i < saved.length() && items.size() < max; i++) {
                JSONObject o = saved.optJSONObject(i);
                if (o == null) continue;
                String url = o.optString("u");
                String title = o.optString("t").trim();
                if (!isQuoraUrl(url) || title.isEmpty() || !urls.add(url)) continue;
                items.add(new Item(url, clip(title, 300), clip(o.optString("a").trim(), 100), o.optLong("d")));
                added++;
            }
            if (added == 0) return 0;
            // Newest first again, whatever order the two lists were in.
            java.util.Collections.sort(items, (a, b) -> Long.compare(b.time, a.time));
            save(context, items);
            return added;
        } catch (Exception ex) {
            Log.e(TAG, "Failed to restore " + prefsName, ex);
            return 0;
        }
    }

    synchronized void remove(Context context, String url) {
        if (context == null || url == null) return;
        try {
            List<Item> items = load(context);
            boolean changed = false;
            for (int i = items.size() - 1; i >= 0; i--) {
                if (items.get(i).url.equals(url)) {
                    items.remove(i);
                    changed = true;
                }
            }
            if (changed) save(context, items);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to save " + prefsName, ex);
        }
    }

    synchronized boolean contains(Context context, String url) {
        if (context == null || url == null) return false;
        for (Item item : load(context)) {
            if (item.url.equals(url)) return true;
        }
        return false;
    }

    synchronized List<Item> load(Context context) {
        List<Item> items = new ArrayList<>();
        if (context == null) return items;
        try {
            JSONArray array = new JSONArray(prefs(context).getString(KEY, "[]"));
            for (int i = 0; i < array.length(); i++) {
                JSONObject o = array.optJSONObject(i);
                if (o == null || !isQuoraUrl(o.optString("u"))) continue;
                items.add(new Item(o.optString("u"), o.optString("t"), o.optString("a"), o.optLong("d")));
            }
        } catch (Exception ex) {
            Log.e(TAG, "Failed to read " + prefsName, ex);
        }
        return items;
    }

    synchronized void clear(Context context) {
        if (context != null) prefs(context).edit().remove(KEY).apply();
    }

    private void save(Context context, List<Item> items) throws Exception {
        prefs(context).edit().putString(KEY, toJson(items).toString()).apply();
    }

    private static JSONArray toJson(List<Item> items) {
        JSONArray array = new JSONArray();
        for (Item item : items) {
            JSONObject o = new JSONObject();
            try {
                o.put("u", item.url);
                o.put("t", item.title);
                o.put("a", item.author);
                o.put("d", item.time);
            } catch (Exception ex) {
                // Only a null key or a non-finite number can fail, neither of which happens here.
                continue;
            }
            array.put(o);
        }
        return array;
    }

    private static String clip(String s, int max) {
        return s.length() <= max ? s : s.substring(0, max);
    }
}
