// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import android.util.Log;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Answers the app's {@code POST /api/morechildren.json}, which Reddit refuses (403), from the comment pages
 * {@code /comments/<post>/_/<comment>.json}, which it still serves.
 *
 * <p>The app's own request becomes a GET of the first wanted comment's page, so it still goes through the app's
 * throttle and rate-limit reading; the other pages are fetched from the reply. The answer has the endpoint's own
 * shape: the wanted comments with their replies as one flat list, each after its parent and with empty
 * {@code replies}. The app takes each row's level from its parent's, and inserts the list in place of the tapped row.
 */
public final class MoreComments {
    static final RequestHook.Handler HANDLER = new RequestHook.Handler() {
        @Override
        protected boolean isOn() {
            return isEnabled();
        }

        @Override
        protected boolean handles(RequestHook.Request request) {
            return MoreComments.handles(request.appUrl);
        }

        @Override
        protected void rewrite(RequestHook.Request request) {
            Wanted wanted = wanted(request.form);
            request.url = pageUrl(origin(request.appUrl), wanted.post, wanted.ids.get(0), false, wanted.sort);
            request.sendWithoutForm();
        }

        @Override
        protected InputStream response(RequestHook.Request request, InputStream body) throws Exception {
            Wanted wanted = wanted(request.form);
            JSONArray firstPage = new JSONArray(new String(Http.readAll(body), StandardCharsets.UTF_8));
            Source reddit = new Reddit(request, origin(request.appUrl), wanted, focus(firstPage, wanted.ids.get(0)),
                    Thread.currentThread());
            JSONArray things = things(wanted.link, wanted.ids, reddit, pool(), ANSWER_DEADLINE_MS);
            return new ByteArrayInputStream(envelope(things).toString().getBytes(StandardCharsets.UTF_8));
        }
    };

    private static final String PATH = "/api/morechildren";
    /** Most comment pages fetched for one tap; the comments left over come back as a new "load more" row. */
    static final int BATCH = 20;
    // A parent's page reads its replies up to Reddit's own most per page.
    private static final int PARENT_LIMIT = 500;
    // A single comment's page reads its replies up to this.
    private static final int COMMENT_LIMIT = 50;
    // Requests left in Reddit's rate-limit window that are kept for the app's own requests.
    private static final int RESERVE = 20;
    private static final int THREADS = 4;
    // Each extra page's connection and reads: a page that hangs frees its pool thread soon after the answer gave up,
    // as an interrupt doesn't stop a blocked read.
    private static final int PAGE_TIMEOUT_MS = 5_000;
    // The app's loaders share 4 threads with this one: keep each answer short.
    private static final long ANSWER_DEADLINE_MS = 15_000;

    private static ExecutorService pool;
    // From the last comment page that had them, or null before the first.
    private static volatile RateLimit rateLimit;

    /** Reddit's X-Ratelimit-Remaining and the time its window ends. */
    static final class RateLimit {
        final int remaining;
        final long windowEnd;

        RateLimit(int remaining, long windowEnd) {
            this.remaining = remaining;
            this.windowEnd = windowEnd;
        }
    }

    /** What the app's form asks for. */
    static final class Wanted {
        /** The post's fullname, {@code t3_<id>}. */
        final String link;
        final String post;
        final List<String> ids;
        /** The sort for the comment pages, or null for the post's own. */
        final String sort;

        Wanted(String link, List<String> ids, String sort) {
            this.link = link;
            this.post = link.substring(3);
            this.ids = ids;
            this.sort = sort;
        }
    }

    /** Where comments come from: Reddit in the app, fixtures in tests. */
    interface Source {
        /**
         * The comment as a {@code t1} thing with its replies, or null if Reddit no longer has it. Throws if the request
         * fails. {@code parent} asks for as many replies as the page holds.
         */
        JSONObject comment(String id, boolean parent) throws Exception;

        /** How many more requests may be sent now. */
        int budget();

        /** Whether the app has given up on the answer. */
        boolean canceled();
    }

    private MoreComments() {}

    /** Turned on by the "Fix load more comments" patch. */
    public static boolean isEnabled() {
        return false;
    }

    /** Whether the URL is the endpoint, with or without {@code .json}, on a Reddit API host. Cheap for other URLs. */
    static boolean handles(String url) {
        if (url == null || !url.contains(PATH)) return false;
        try {
            String path = new URI(url).getPath();
            return (PATH.equals(path) || (PATH + ".json").equals(path)) && RequestHook.isRedditApi(url);
        } catch (URISyntaxException error) {
            return false;
        }
    }

    /** The post, comments and sort the form asks for; throws for a form that doesn't name a post and comments. */
    static Wanted wanted(Map<String, String> form) {
        if (form == null) throw new IllegalArgumentException("The more-comments request has no form");
        String link = form.get("link_id");
        link = link == null ? null : link.trim().toLowerCase(Locale.ROOT);
        List<String> ids = ids(form.get("children"));
        if (link == null || !link.matches("t3_[a-z0-9]+") || ids.isEmpty()) {
            throw new IllegalArgumentException("Unexpected more-comments form: " + form);
        }
        return new Wanted(link, ids, sort(form.get("sort")));
    }

    /** The scheme and host of the app's URL, where the comment pages are read with the same token. */
    static String origin(String url) {
        URI uri = URI.create(url);
        return uri.getScheme() + "://" + uri.getHost();
    }

    /** The endpoint's own response around the things: {@code {"json":{"errors":[],"data":{"things":[…]}}}}. */
    static JSONObject envelope(JSONArray things) throws JSONException {
        return new JSONObject().put("json", new JSONObject().put("errors", new JSONArray())
                .put("data", new JSONObject().put("things", things)));
    }

    /** The page of a comment on {@code origin}, holding as many replies as a parent's or a single comment's page. */
    static String pageUrl(String origin, String post, String id, boolean parent, String sort) {
        return origin + "/comments/" + post + "/_/" + id + ".json?limit=" + (parent ? PARENT_LIMIT : COMMENT_LIMIT)
                + (sort == null ? "" : "&sort=" + sort);
    }

    /** Requests that may still be sent: all of a batch with no current reading, else what's left above the reserve. */
    static int budget(RateLimit last, long now) {
        if (last == null || now >= last.windowEnd) return BATCH;
        return last.remaining - RESERVE;
    }

    /** Reddit's rate-limit headers read at {@code now}, or null if either is missing or not a number. */
    static RateLimit rateLimit(String remaining, String reset, long now) {
        if (remaining == null || reset == null) return null;
        try {
            return new RateLimit((int) Double.parseDouble(remaining), now + (long) (Double.parseDouble(reset) * 1000));
        } catch (NumberFormatException error) {
            return null;
        }
    }

    /**
     * The things to answer with, in the requested order. The first comment Reddit still has tells whose replies they
     * are; if they are a comment's, one page of that comment usually holds them all. The others get one page each,
     * a few at a time, at most {@link #BATCH} pages in all, fewer when Reddit's rate limit runs low, and none started
     * after the answer's deadline; the rest come back as a "more" thing. The first comment's page is the app's own
     * reply, which costs no request, so it is used even when the rate limit leaves nothing. Comments Reddit no
     * longer has are left out.
     * Pages are fetched on the pool, so the calling thread waits no longer than {@code timeoutMs}.
     */
    static JSONArray things(String link, List<String> ids, final Source source, ExecutorService pool, long timeoutMs)
            throws Exception {
        long deadline = System.currentTimeMillis() + timeoutMs;
        // The first page is the app's own reply, already in hand: it is answered even with no budget left.
        int limit = Math.max(1, Math.min(BATCH, source.budget()));
        Map<String, JSONObject> found = new HashMap<>();
        Set<String> gone = new HashSet<>();
        int sent = 0;
        String parent = null;
        // A failure here fails the whole answer: nothing could be loaded.
        for (String id : ids) {
            if (sent >= limit || System.currentTimeMillis() >= deadline) break;
            checkCanceled(source);
            JSONObject comment = fetch(source, id, false, pool, deadline);
            sent++;
            // Each page tells how much of the rate limit is left.
            limit = Math.min(limit, sent + Math.max(0, source.budget()));
            if (comment == null) {
                gone.add(id);
                continue;
            }
            found.put(id, comment);
            parent = comment.getJSONObject("data").getString("parent_id");
            break;
        }
        if (parent != null && parent.startsWith("t1_") && sent < limit && found.size() + gone.size() < ids.size()
                && System.currentTimeMillis() < deadline) {
            checkCanceled(source);
            sent++;
            try {
                JSONObject page = fetch(source, parent.substring(3), true, pool, deadline);
                if (page != null) {
                    Set<String> wanted = new HashSet<>(ids);
                    for (JSONObject reply : replies(page)) {
                        if (!"t1".equals(reply.optString("kind"))) continue;
                        String id = reply.getJSONObject("data").optString("id");
                        if (wanted.contains(id) && !found.containsKey(id)) found.put(id, reply);
                    }
                }
            } catch (InterruptedException error) {
                throw error;
            } catch (Exception error) {
                Log.w(App.TAG, "Parent comment failed, loading replies one by one", error);
            }
            limit = Math.min(limit, sent + Math.max(0, source.budget()));
        }

        List<String> rest = new ArrayList<>();
        for (String id : ids) {
            if (sent + rest.size() >= limit) break;
            if (!found.containsKey(id) && !gone.contains(id)) rest.add(id);
        }
        long timeLeft = deadline - System.currentTimeMillis();
        if (!rest.isEmpty() && timeLeft > 0) {
            checkCanceled(source);
            List<Callable<JSONObject>> fetches = new ArrayList<>();
            for (final String id : rest) {
                fetches.add(() -> {
                    checkCanceled(source);
                    return source.comment(id, false);
                });
            }
            // Pages not back by the deadline are canceled and come back in the "more" thing.
            List<Future<JSONObject>> results = pool.invokeAll(fetches, timeLeft, TimeUnit.MILLISECONDS);
            checkCanceled(source);
            for (int i = 0; i < rest.size(); i++) {
                try {
                    JSONObject comment = results.get(i).get();
                    if (comment == null) gone.add(rest.get(i));
                    else found.put(rest.get(i), comment);
                } catch (ExecutionException error) {
                    // Left for the next tap.
                    Log.w(App.TAG, "Comment " + rest.get(i) + " failed", error.getCause());
                } catch (CancellationException error) {
                    // Past the deadline: left for the next tap.
                }
            }
        }

        JSONArray things = new JSONArray();
        Set<String> added = new HashSet<>();
        for (String id : ids) {
            JSONObject comment = found.get(id);
            if (comment != null) flatten(comment, things, added);
        }
        // Not for the next tap: comments Reddit no longer has, and ones already in the list or in one of its rows.
        List<String> left = new ArrayList<>();
        for (String id : ids) {
            if (!found.containsKey(id) && !gone.contains(id) && !added.contains(id) && !added.contains("more_" + id)) {
                left.add(id);
            }
        }
        // With no comment found, the parent is unknown; the post works as well, as the app gives a row whose parent
        // isn't in the list the tapped row's level, and the next tap reads the parent again.
        if (!left.isEmpty()) things.put(more(left, parent != null ? parent : link));
        return things;
    }

    /** One page, waited for no later than the deadline; a page still loading then is canceled. */
    private static JSONObject fetch(final Source source, final String id, final boolean parent, ExecutorService pool,
            long deadline) throws Exception {
        long timeLeft = deadline - System.currentTimeMillis();
        if (timeLeft <= 0) throw new TimeoutException("No time left for comment " + id);
        Future<JSONObject> page = pool.submit(() -> source.comment(id, parent));
        try {
            return page.get(timeLeft, TimeUnit.MILLISECONDS);
        } catch (TimeoutException | InterruptedException error) {
            page.cancel(true);
            throw error;
        } catch (ExecutionException error) {
            Throwable cause = error.getCause();
            throw cause instanceof Exception ? (Exception) cause : error;
        }
    }

    private static void checkCanceled(Source source) {
        if (source.canceled()) throw new CancellationException("The app canceled the request");
    }

    /** The comment the page is about, or null when Reddit no longer has it and sends the post's top comments. */
    static JSONObject focus(JSONArray page, String id) throws JSONException {
        JSONArray children = page.getJSONObject(1).getJSONObject("data").getJSONArray("children");
        if (children.length() == 0) return null;
        JSONObject first = children.getJSONObject(0);
        if (!"t1".equals(first.getString("kind")) || !id.equals(first.getJSONObject("data").optString("id"))) return null;
        return first;
    }

    /**
     * Adds the comment or "more" thing and, after it, every reply below it, emptying each comment's {@code replies}.
     * Skips things already added, by their ID, and any other kind: the app inserts every thing in the list as one row.
     */
    static void flatten(JSONObject thing, JSONArray out, Set<String> added) throws JSONException {
        String kind = thing.optString("kind");
        if (!"t1".equals(kind) && !"more".equals(kind)) return;
        if (!added.add(rowId(kind, thing.getJSONObject("data")))) return;
        out.put(thing);
        if (!"t1".equals(kind)) return;
        List<JSONObject> replies = replies(thing);
        thing.getJSONObject("data").put("replies", "");
        for (JSONObject reply : replies) flatten(reply, out, added);
    }

    /**
     * A comment's own ID, and {@code more_<id>} for a "more", or {@code more_<parent>} for the "continue this
     * thread" ones, which all have the ID {@code _}.
     */
    private static String rowId(String kind, JSONObject data) {
        String id = data.optString("id");
        if ("t1".equals(kind)) return id;
        return "more_" + ("_".equals(id) ? data.optString("parent_id") : id);
    }

    private static List<JSONObject> replies(JSONObject comment) throws JSONException {
        List<JSONObject> replies = new ArrayList<>();
        JSONObject listing = comment.getJSONObject("data").optJSONObject("replies");
        if (listing == null) return replies;
        JSONArray children = listing.getJSONObject("data").getJSONArray("children");
        for (int i = 0; i < children.length(); i++) replies.add(children.getJSONObject(i));
        return replies;
    }

    /** A "more" thing as Reddit sends it, which the app shows as a "load more comments" row. */
    static JSONObject more(List<String> ids, String parent) throws JSONException {
        JSONArray children = new JSONArray();
        for (String id : ids) children.put(id);
        JSONObject data = new JSONObject()
                .put("id", ids.get(0))
                .put("name", "t1_" + ids.get(0))
                .put("parent_id", parent)
                .put("count", ids.size())
                .put("children", children);
        return new JSONObject().put("kind", "more").put("data", data);
    }

    /** The comma-separated comment IDs, lowercased, without duplicates, skipping any that aren't base-36. */
    static List<String> ids(String children) {
        List<String> ids = new ArrayList<>();
        if (children == null) return ids;
        for (String id : children.split(",")) {
            String clean = id.trim().toLowerCase(Locale.ROOT);
            if (clean.matches("[a-z0-9]+") && !ids.contains(clean)) ids.add(clean);
        }
        return ids;
    }

    /** The sort for the comment pages, or null for one that isn't a plain word. */
    static String sort(String sort) {
        return sort == null || !sort.matches("[a-z]+") ? null : sort;
    }

    private static synchronized ExecutorService pool() {
        if (pool == null) {
            pool = Executors.newFixedThreadPool(THREADS, task -> {
                Thread thread = new Thread(task, "edbfi-more-comments");
                thread.setDaemon(true);
                return thread;
            });
        }
        return pool;
    }

    /** Comment pages from Reddit, sent with the app's token; the first wanted one is the app's own reply. */
    private static final class Reddit implements Source {
        private final RequestHook.Request request;
        private final String origin;
        private final Wanted wanted;
        private final Thread caller;
        private JSONObject first;
        private boolean firstUsed;

        Reddit(RequestHook.Request request, String origin, Wanted wanted, JSONObject first, Thread caller) {
            this.request = request;
            this.origin = origin;
            this.wanted = wanted;
            this.first = first;
            this.caller = caller;
        }

        @Override
        public boolean canceled() {
            return caller.isInterrupted();
        }

        @Override
        public JSONObject comment(String id, boolean parent) throws Exception {
            synchronized (this) {
                if (!firstUsed && !parent && id.equals(wanted.ids.get(0))) {
                    firstUsed = true;
                    JSONObject comment = first;
                    first = null;
                    return comment;
                }
            }
            String url = pageUrl(origin, wanted.post, id, parent, wanted.sort);
            Http.Reply reply = request.get(url, PAGE_TIMEOUT_MS);
            RateLimit reading = rateLimit(reply.headers.get("X-Ratelimit-Remaining"),
                    reply.headers.get("X-Ratelimit-Reset"), System.currentTimeMillis());
            // Without one, the last reading stays.
            if (reading != null) rateLimit = reading;
            if (reply.status != 200) throw new IOException("Reddit returned " + reply.status + " for " + url);
            return focus(new JSONArray(new String(reply.body, StandardCharsets.UTF_8)), id);
        }

        @Override
        public int budget() {
            return MoreComments.budget(rateLimit, System.currentTimeMillis());
        }
    }
}
