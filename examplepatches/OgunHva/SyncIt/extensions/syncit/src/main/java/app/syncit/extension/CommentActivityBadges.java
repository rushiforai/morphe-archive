package app.syncit.extension;

import android.os.Handler;
import android.os.Looper;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * Shows the three subreddits a commenter is most active in under their comment header.
 *
 * <p>Reddit does not expose that count, so it is worked out from what Project Arctic Shift
 * recorded of the author's recent public comments and posts. The archive is a free community
 * service, so answers are cached per author and only a couple of requests run at a time.
 *
 * @noinspection unused
 */
public final class CommentActivityBadges {
    private static final String API = "https://arctic-shift.photon-reddit.com/api/";
    private static final String USER_AGENT = "SyncIt/1.4.0 (+https://github.com/OgunHva/SyncIt)";

    private static final int SAMPLE = 100;
    private static final int TOP = 3;
    private static final int PENDING_LIMIT = 128;
    private static final int CACHE_ENTRIES = 512;

    private static final long CACHE_TTL_MS = 24L * 60L * 60L * 1000L;
    private static final long FAILURE_TTL_MS = 30L * 60L * 1000L;

    /** Authors currently bound to a header view, so a late answer only lands on the right comment. */
    private static final Map<TextView, String> bound =
            Collections.synchronizedMap(new WeakHashMap<TextView, String>());

    private static final Map<String, Cached> cache = Collections.synchronizedMap(
            new LinkedHashMap<String, Cached>(CACHE_ENTRIES + 1, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Cached> eldest) {
                    return size() > CACHE_ENTRIES;
                }
            });

    private static final Set<String> inFlight = ConcurrentHashMap.newKeySet();

    private static final ExecutorService executor =
            Executors.newFixedThreadPool(2, runnable -> {
                Thread thread = new Thread(runnable, "syncit-comment-activity");
                thread.setDaemon(true);
                return thread;
            });

    private static final Handler main = new Handler(Looper.getMainLooper());

    private CommentActivityBadges() {}

    /**
     * Called when a comment header is drawn.
     *
     * @param header The view drawing the header.
     * @param author The comment's author.
     */
    public static void annotate(TextView header, String author) {
        if (header == null || author == null) {
            return;
        }

        String name = author.trim();
        if (name.isEmpty() || name.equalsIgnoreCase("[deleted]")) {
            return;
        }

        bound.put(header, name);

        Cached cached = cached(name);
        if (cached != null) {
            show(header, name, cached.summary);
            return;
        }

        if (!inFlight.add(name)) {
            // The answer already on its way updates every header bound to this author.
            return;
        }

        if (executor instanceof ThreadPoolExecutor
                && ((ThreadPoolExecutor) executor).getQueue().size() >= PENDING_LIMIT) {
            inFlight.remove(name);
            return;
        }

        executor.execute(() -> {
            String summary = "";
            boolean failed = true;
            try {
                summary = fetch(name);
                failed = false;
            } catch (Throwable ignored) {
                // An unreachable archive leaves the comment as it was.
            }

            remember(name, summary, failed);
            inFlight.remove(name);

            String result = summary;
            if (!result.isEmpty()) {
                main.post(() -> showAll(name, result));
            }
        });
    }

    private static void showAll(String author, String summary) {
        List<TextView> views = new ArrayList<>();
        synchronized (bound) {
            for (Map.Entry<TextView, String> entry : bound.entrySet()) {
                if (author.equals(entry.getValue()) && entry.getKey() != null) {
                    views.add(entry.getKey());
                }
            }
        }

        for (TextView view : views) {
            show(view, author, summary);
        }
    }

    private static void show(TextView view, String author, String summary) {
        if (summary == null || summary.isEmpty()) {
            return;
        }

        if (!author.equals(bound.get(view))) {
            return;
        }

        view.post(() -> {
            if (!author.equals(bound.get(view))) {
                return;
            }

            String line = "Active in " + summary;
            if (view.getText().toString().contains(line)) {
                return;
            }

            view.append("\n" + line);
        });
    }

    /** The three subreddits holding most of the author's most recent recorded activity. */
    private static String fetch(String author) throws Exception {
        Map<String, Integer> counts = new HashMap<>();

        int sampled = collect("comments/search", author, counts);
        if (sampled < 10) {
            // Someone who posts more than they comment would show nothing from comments alone.
            collect("posts/search", author, counts);
        }

        if (counts.isEmpty()) {
            return "";
        }

        List<Map.Entry<String, Integer>> ranked = new ArrayList<>(counts.entrySet());
        ranked.sort((left, right) -> {
            int byCount = Integer.compare(right.getValue(), left.getValue());
            return byCount != 0 ? byCount : left.getKey().compareToIgnoreCase(right.getKey());
        });

        StringBuilder summary = new StringBuilder();
        for (int i = 0; i < Math.min(TOP, ranked.size()); i++) {
            if (i > 0) {
                summary.append(", ");
            }
            summary.append("r/").append(ranked.get(i).getKey());
        }
        return summary.toString();
    }

    private static int collect(String path, String author, Map<String, Integer> counts)
            throws Exception {
        String url = API + path
                + "?author=" + URLEncoder.encode(author, "UTF-8")
                + "&limit=" + SAMPLE
                + "&sort=desc";

        JSONArray data = new JSONObject(get(url)).optJSONArray("data");
        if (data == null) {
            return 0;
        }

        int sampled = 0;
        for (int i = 0; i < data.length(); i++) {
            JSONObject entry = data.optJSONObject(i);
            if (entry == null) {
                continue;
            }

            String subreddit = entry.optString("subreddit", "");
            if (subreddit.isEmpty() || subreddit.startsWith("u_")) {
                // A post made to the author's own profile is not a subreddit.
                continue;
            }

            counts.merge(subreddit, 1, Integer::sum);
            sampled++;
        }
        return sampled;
    }

    private static String get(String url) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(8000);
        connection.setReadTimeout(8000);
        connection.setRequestProperty("User-Agent", USER_AGENT);
        connection.setRequestProperty("Accept", "application/json");

        try {
            int code = connection.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) {
                throw new IOException("HTTP " + code + " from the archive");
            }

            try (InputStream input = connection.getInputStream();
                 BufferedReader reader = new BufferedReader(
                         new InputStreamReader(input, StandardCharsets.UTF_8))) {
                StringBuilder body = new StringBuilder();
                char[] buffer = new char[8192];
                int read;
                while ((read = reader.read(buffer)) != -1) {
                    body.append(buffer, 0, read);
                }
                return body.toString();
            }
        } finally {
            connection.disconnect();
        }
    }

    private static Cached cached(String author) {
        Cached entry = cache.get(author);
        if (entry == null) {
            return null;
        }

        if (System.currentTimeMillis() > entry.expiresAt) {
            cache.remove(author);
            return null;
        }
        return entry;
    }

    private static void remember(String author, String summary, boolean failed) {
        long ttl = failed ? FAILURE_TTL_MS : CACHE_TTL_MS;
        cache.put(author, new Cached(summary, System.currentTimeMillis() + ttl));
    }

    private static final class Cached {
        final String summary;
        final long expiresAt;

        Cached(String summary, long expiresAt) {
            this.summary = summary;
            this.expiresAt = expiresAt;
        }
    }
}
