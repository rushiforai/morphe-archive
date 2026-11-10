package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.*;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;
import java.util.zip.GZIPInputStream;

/**
 * Accounts run to farm karma: those Bot Bouncer flags (a list downloaded once a day), and a guess from the account's
 * name, Reddit's generated pattern of two words and a number, joined with a repost or a copied comment.
 */
final class KarmaFarmers {

    /** The list, rebuilt daily from Bot Bouncer's posts on r/BotBouncer, one lowercase name a line. */
    private static final String LIST_URL =
            "https://github.com/bryceaspringfield/morphe/releases/download/karma-farmers/karma_farmers.txt.gz";
    private static final String FILE = "morphe_karma_farmers.txt.gz";
    private static final long DAY_MS = 24L * 60 * 60 * 1000;
    /** The names Reddit generates for new accounts: Word-Word-1234, Word_Word1234, or WordWord1234. */
    private static final Pattern GENERATED = Pattern.compile("^[A-Z][a-z]+[-_]?[A-Z][a-z]+[-_]?\\d{1,4}$");
    /** Comments shorter than this, once normalized, are too generic to call a copy. */
    private static final int MIN_COMMENT = 30;
    private static final int MAX_KEPT = 5000;

    /** FNV-1a hashes of the listed names, sorted; null until loaded. */
    private static volatile long[] flagged;
    private static volatile boolean loading;
    /** When load() last tried; a failed download waits an hour before the next try. */
    private static volatile long lastAttempt;
    private static final long RETRY_MS = 60L * 60 * 1000;

    /** The author first seen writing each comment text since Reddit started. */
    private static final Map<String, String> COMMENTS = new LinkedHashMap<String, String>(256, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
            return size() > MAX_KEPT;
        }
    };

    private KarmaFarmers() {
    }

    static boolean any() {
        return getBoolean(HIDE_FLAGGED) || getBoolean(HIDE_LIKELY_FARMERS);
    }

    /** The reason to hide a post by a karma farmer, or null. */
    static String hidePost(PostInfo post) {
        if (getBoolean(HIDE_FLAGGED)) {
            for (String author : post.authors) if (isFlagged(author)) return "flagged account u/" + author;
        }
        if (getBoolean(HIDE_LIKELY_FARMERS) && !post.shownAuthors.isEmpty() && generated(post.shownAuthors.get(0))
                && (post.repost || Duplicates.seen(post))) {
            return "likely karma farmer u/" + post.shownAuthors.get(0);
        }
        return null;
    }

    /** The reason to hide a comment by a karma farmer, or null; records the comment's text. */
    static String hideComment(String author, String body) {
        String lower = author.toLowerCase(Locale.ROOT);
        if (getBoolean(HIDE_FLAGGED) && isFlagged(lower)) return "flagged account u/" + lower;
        if (!getBoolean(HIDE_LIKELY_FARMERS)) return null;
        String text = Normalizer.normalize(body, Normalizer.Form.NFD).replaceAll("\\p{M}+", "")
                .toLowerCase(Locale.ROOT).replaceAll("[^\\p{L}\\p{N}]+", " ").trim();
        if (text.length() < MIN_COMMENT) return null;
        synchronized (COMMENTS) {
            String first = COMMENTS.get(text);
            if (first == null) {
                COMMENTS.put(text, lower);
                return null;
            }
            if (!first.equals(lower) && generated(author)) return "likely karma farmer u/" + lower + " copying u/" + first;
        }
        return null;
    }

    static boolean generated(String name) {
        return name != null && GENERATED.matcher(name).matches();
    }

    static boolean isFlagged(String lowercaseName) {
        long[] list = flagged;
        if (list == null) {
            load();
            return false;
        }
        return Arrays.binarySearch(list, hash(lowercaseName)) >= 0;
    }

    /** The number of names listed, or -1 before the list is loaded. */
    static int size() {
        long[] list = flagged;
        return list == null ? -1 : list.length;
    }

    /** When the list was last downloaded, or 0. */
    static long updated() {
        SharedPreferences preferences = FilterSettings.preferences();
        return preferences == null ? 0 : preferences.getLong(FLAGGED_UPDATED, 0);
    }

    private static long hash(String name) {
        long h = 0xcbf29ce484222325L;
        for (int i = 0; i < name.length(); i++) {
            h ^= name.charAt(i);
            h *= 0x100000001b3L;
        }
        return h;
    }

    @SuppressLint("PrivateApi")
    private static Context app() {
        try {
            return (Context) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        } catch (Exception ex) {
            return null;
        }
    }

    /** Reads the saved list, downloading it first when missing or a day old; runs once, off the main thread. */
    static synchronized void load() {
        long now = System.currentTimeMillis();
        if (loading || now - lastAttempt < RETRY_MS) return;
        loading = true;
        lastAttempt = now;
        new Thread(() -> {
            try {
                Context context = app();
                if (context == null) return;
                File file = new File(context.getFilesDir(), FILE);
                if (!file.isFile() || System.currentTimeMillis() - updated() > DAY_MS) download(file);
                if (file.isFile()) read(file);
            } catch (Throwable ex) {
                Log.e(TAG, "karma farmer list failure", ex);
            } finally {
                loading = false;
            }
        }, "KarmaFarmers").start();
    }

    /** Downloads the list again now, then reads it; for the settings row. */
    static void refresh(Runnable done) {
        new Thread(() -> {
            try {
                Context context = app();
                if (context != null) {
                    File file = new File(context.getFilesDir(), FILE);
                    download(file);
                    if (file.isFile()) read(file);
                }
            } catch (Throwable ex) {
                Log.e(TAG, "karma farmer list failure", ex);
            }
            if (done != null) new android.os.Handler(android.os.Looper.getMainLooper()).post(done);
        }, "KarmaFarmers").start();
    }

    private static void download(File file) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(LIST_URL).openConnection();
        connection.setConnectTimeout(15000);
        connection.setReadTimeout(60000);
        connection.setInstanceFollowRedirects(true);
        try {
            if (connection.getResponseCode() != 200) {
                Log.w(TAG, "karma farmer list answered " + connection.getResponseCode());
                return;
            }
            File part = new File(file.getPath() + ".part");
            try (InputStream in = connection.getInputStream(); FileOutputStream out = new FileOutputStream(part)) {
                byte[] buffer = new byte[65536];
                int n;
                while ((n = in.read(buffer)) > 0) out.write(buffer, 0, n);
            }
            if (!part.renameTo(file)) throw new IllegalStateException("could not save the list");
            SharedPreferences preferences = FilterSettings.preferences();
            if (preferences != null) preferences.edit().putLong(FLAGGED_UPDATED, System.currentTimeMillis()).apply();
        } finally {
            connection.disconnect();
        }
    }

    private static void read(File file) throws Exception {
        long[] hashes = new long[1 << 16];
        int count = 0;
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                new GZIPInputStream(new FileInputStream(file), 65536), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.isEmpty() || line.charAt(0) == '#') continue;
                if (count == hashes.length) hashes = Arrays.copyOf(hashes, count * 2);
                hashes[count++] = hash(line.trim().toLowerCase(Locale.ROOT));
            }
        }
        long[] list = Arrays.copyOf(hashes, count);
        Arrays.sort(list);
        flagged = list;
        Log.i(TAG, "karma farmer list: " + count + " names");
    }
}
