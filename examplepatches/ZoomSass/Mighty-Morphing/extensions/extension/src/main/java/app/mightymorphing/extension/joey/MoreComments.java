package app.mightymorphing.extension.joey;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Field;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Set;

/**
 * Reddit refuses some logins on /api/morechildren. Each hidden reply is loaded
 * from the comments page instead, then handed back in the shape Joey already reads.
 */
public final class MoreComments {
    private MoreComments() {}

    public static Object rewrite(Object adapter, Object request) {
        boolean tapped = false;
        try {
            URL url = (URL) call(request, "g");
            if (url == null) return null;
            remember(url);
            String route = route(url);
            if (route.endsWith("/api/info") || route.contains("/by_id/")) return lookup(adapter, request, url, route);
            if (!route.endsWith("/api/morechildren")) {
                return null;
            }
            String method = String.valueOf(call(request, "e"));
            if (!"GET".equalsIgnoreCase(method) && !"POST".equalsIgnoreCase(method)) return null;
            Params params = params(url, call(request, "b"));
            if (params.linkId == null || params.children.isEmpty()) return null;
            tapped = true;
            RequestLog.count("morechildren-taps");
            String postId = strip(params.linkId, "t3_");
            Object client = field(adapter, "a");
            JSONArray things = new JSONArray();
            Set<String> seen = new LinkedHashSet<>();
            Set<String> names = new LinkedHashSet<>();
            java.util.Map<String, JSONObject> bulk = new java.util.HashMap<>();
            java.util.List<String> deferred = new java.util.ArrayList<>();
            boolean bulkTried = false;
            boolean progressed = false;
            int requests = 0;
            String continuationParent = null;
            int continuationDepth = 0;
            Reply failure = null;
            Reply any = null;
            Reply lastReply = null;
            long started = System.currentTimeMillis();
            boolean stop = false;
            boolean capped = false;
            boolean bulkWorked = false;
            int failed = 0;
            int gone = 0;
            int unreadable = 0;
            String firstFailure = null;
            for (String child : params.children) {
                if (seen.contains(child)) continue;
                JSONObject comment = bulk.get(child);
                if (comment == null) {
                    if (stop || requests >= MAX_REQUESTS) {
                        if (requests >= MAX_REQUESTS) capped = true;
                        deferred.add(child);
                        continue;
                    }
                    requests++;
                    Reply reply = get(client, request,
                            focusedUrl(url, postId, child, params.sort, params.profileImg));
                    lastReply = reply;
                    if (reply.code < 200 || reply.code >= 300) {
                        if (firstFailure == null) {
                            firstFailure = reply.code + "/" + kind(reply);
                            RequestLog.Entry note = RequestLog.entry("morechildren-request")
                                    .put("status", reply.code).put("kind", kind(reply)).put("ms", reply.ms);
                            limits(note, reply);
                            note.save();
                        }
                        failed++;
                        if (reply.code == 404) {
                            gone++;
                            continue;
                        }
                        if (reply.code == 429) stop = true;
                        if (reply.code == 429 || reply.code >= 500 || things.length() > 0) {
                            failure = reply;
                            deferred.add(child);
                            continue;
                        }
                        summary(params.children.size(), things, requests, capped, bulkWorked, deferred.size(),
                                failed, gone, unreadable, started, reply, false);
                        return wrap(request, reply);
                    }
                    any = reply;
                    try {
                        comment = focusedComment(reply.text, child);
                    } catch (Throwable unreadableReply) {
                        unreadable++;
                        continue;
                    }
                }
                progressed = true;
                if (comment == null) continue;
                String parent = comment.getJSONObject("data").optString("parent_id");
                if (continuationParent == null) {
                    continuationParent = parent;
                    continuationDepth = comment.getJSONObject("data").optInt("depth", 0);
                }
                flatten(comment, seen, names, things);
                if (bulkTried || requests >= MAX_REQUESTS) continue;
                int remaining = 0;
                for (String id : params.children) {
                    if (!seen.contains(id) && ++remaining == 2) break;
                }
                boolean top = parent.equals("t3_" + postId);
                if (remaining < 2 || !(top || parent.startsWith("t1_"))) continue;
                // One request for the whole parent, instead of one for every hidden reply.
                bulkTried = true;
                requests++;
                String parentId = top ? null : strip(parent, "t1_");
                Reply whole = get(client, request, parentListingUrl(url, postId, parentId, params.sort, params.profileImg));
                lastReply = whole;
                if (whole.code < 200 || whole.code >= 300) {
                    RequestLog.Entry note = RequestLog.entry("morechildren-bulk")
                            .put("status", whole.code).put("kind", kind(whole)).put("ms", whole.ms);
                    limits(note, whole);
                    note.save();
                    if (whole.code == 429) stop = true;
                    continue;
                }
                try {
                    JSONArray candidates;
                    if (top) {
                        candidates = new JSONArray(whole.text).getJSONObject(1)
                                .getJSONObject("data").getJSONArray("children");
                    } else {
                        JSONObject holder = focusedComment(whole.text, parentId);
                        candidates = holder == null ? null : repliesOf(holder.getJSONObject("data").opt("replies"));
                    }
                    if (candidates != null) collect(candidates, params.children, bulk);
                    bulkWorked = !bulk.isEmpty();
                } catch (Throwable ignored) {
                    // The single requests below still work.
                }
            }
            if (!progressed && failure != null) {
                summary(params.children.size(), things, requests, capped, bulkWorked, deferred.size(),
                        failed, gone, unreadable, started, failure, false);
                return wrap(request, failure);
            }
            if (any == null) any = failure;
            JSONArray rest = new JSONArray();
            for (String id : deferred) {
                if (!seen.contains(id)) rest.put(id);
            }
            if (rest.length() > 0) {
                // Like Reddit, hand back what is left as a placeholder for the next tap.
                String first = rest.getString(0);
                things.put(new JSONObject().put("kind", "more").put("data", new JSONObject()
                        .put("count", rest.length())
                        .put("name", "t1_" + first)
                        .put("id", first)
                        .put("parent_id", continuationParent != null ? continuationParent : "t3_" + postId)
                        .put("depth", continuationDepth)
                        .put("children", rest)));
            }
            JSONObject data = new JSONObject().put("things", things);
            JSONObject json = new JSONObject().put("errors", new JSONArray()).put("data", data);
            String payload = new JSONObject().put("json", json).toString();
            boolean unclean = failed > 0 || unreadable > 0 || rest.length() > 0 || things.length() == 0;
            summary(params.children.size(), things, requests, capped, bulkWorked, rest.length(),
                    failed, gone, unreadable, started, lastReply, !unclean);
            if (any == null) return null;
            // Nothing could be read at all: leave it to Joey's own request, as before.
            if (things.length() == 0 && rest.length() == 0 && unreadable > 0) return null;
            return newResponse(request, payload, any.headers, 200, "OK", any.protocol);
        } catch (Throwable failure) {
            if (tapped) {
                try {
                    RequestLog.count("morechildren-problem");
                    RequestLog.entry("morechildren").put("result", "error")
                            .put("error", failure.getClass().getSimpleName()).save();
                } catch (Throwable ignored) {
                }
            }
            return null;
        }
    }

    /** One note per tap, good ones and problems kept apart. Counts only. */
    private static void summary(int asked, JSONArray things, int requests, boolean capped, boolean bulk,
                                int left, int failed, int gone, int unreadable, long started, Reply last,
                                boolean good) {
        try {
            RequestLog.count(good ? "morechildren-clean" : "morechildren-problem");
            int loaded = 0;
            for (int i = 0; i < things.length(); i++) {
                if ("t1".equals(things.getJSONObject(i).optString("kind"))) loaded++;
            }
            RequestLog.Entry note = RequestLog.entry("morechildren")
                    .put("asked", asked).put("loaded", loaded).put("requests", requests)
                    .put("cap-hit", capped ? "yes" : "no").put("bulk", bulk ? "ok" : "no")
                    .put("left", left).put("failed", failed).put("gone", gone).put("unreadable", unreadable)
                    .put("ms", System.currentTimeMillis() - started);
            if (last != null) {
                note.put("last-status", last.code).put("last-kind", kind(last));
                limits(note, last);
            }
            if (good) note.saveGood();
            else note.save();
        } catch (Throwable ignored) {
        }
    }

    // ---- Fullname lookups (/api/info and /by_id) ----

    private static final java.util.ArrayDeque<String> RECENT = new java.util.ArrayDeque<>();

    private static String route(URL url) {
        String path = url.getPath().toLowerCase(Locale.ROOT);
        return path.endsWith(".json") ? path.substring(0, path.length() - 5) : path;
    }

    /** Remembers the post a thread was opened for, so a lookup that names only a comment can be placed. */
    private static void remember(URL url) {
        String post = null;
        String[] parts = url.getPath().split("/");
        for (int i = 0; i + 1 < parts.length; i++) {
            if ("comments".equals(parts[i]) && parts[i + 1].matches("[a-z0-9]{4,10}")) {
                post = parts[i + 1];
                break;
            }
        }
        if (post == null) {
            String link = queryValue(url.getQuery(), "link_id");
            if (link != null && link.startsWith("t3_")) post = link.substring(3);
        }
        if (post == null) return;
        synchronized (RECENT) {
            RECENT.remove(post);
            RECENT.addFirst(post);
            while (RECENT.size() > 5) RECENT.removeLast();
        }
    }

    private static String queryValue(String query, String name) {
        if (query == null) return null;
        for (String pair : query.split("&")) {
            int cut = pair.indexOf('=');
            if (cut > 0 && name.equals(decode(pair.substring(0, cut)))) return decode(pair.substring(cut + 1));
        }
        return null;
    }

    private static final class Reply {
        int code;
        String text;
        Object headers;
        String protocol = "HTTP/1.1";
        String message = "";
        long ms;
    }

    /** What the reply looks like, as a plain word: json, html, empty or other. */
    private static String kind(Reply reply) {
        String text = reply.text == null ? "" : reply.text.trim();
        if (text.isEmpty()) return "empty";
        if (text.startsWith("{") || text.startsWith("[")) return "json";
        String lower = text.length() > 4000 ? text.substring(0, 4000).toLowerCase(Locale.ROOT) : text.toLowerCase(Locale.ROOT);
        if (lower.contains("<html") || lower.startsWith("<")) {
            if (lower.contains("too many requests") || lower.contains("whoa there")) return "html-toomany";
            if (lower.contains("blocked")) return "html-blocked";
            return "html";
        }
        return "other";
    }

    /** Reddit's rate limit counters, which are plain numbers. */
    private static void limits(RequestLog.Entry entry, Reply reply) {
        entry.put("rl-left", header(reply.headers, "x-ratelimit-remaining"));
        entry.put("rl-used", header(reply.headers, "x-ratelimit-used"));
        entry.put("rl-reset", header(reply.headers, "x-ratelimit-reset"));
        entry.put("retry-after", header(reply.headers, "retry-after"));
    }

    private static String header(Object headers, String name) {
        if (headers == null) return null;
        try {
            Object value = call(headers, "get", new Class<?>[]{String.class}, name);
            return value == null ? null : String.valueOf(value);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean emptyListing(String text) {
        try {
            JSONArray children = new JSONObject(text).getJSONObject("data").getJSONArray("children");
            return children.length() == 0;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean canWait() {
        try {
            return android.os.Looper.getMainLooper().getThread() != Thread.currentThread();
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Reply get(Object client, Object request, String url) throws Exception {
        long started = System.currentTimeMillis();
        Object response = fetch(client, request, url);
        Reply reply = new Reply();
        reply.ms = System.currentTimeMillis() - started;
        reply.code = (Integer) call(response, "code");
        Object body = call(response, "body");
        reply.text = body == null ? "" : String.valueOf(call(body, "string"));
        reply.headers = call(response, "headers");
        Object proto = call(response, "protocol");
        if (proto != null) reply.protocol = proto.toString().toUpperCase(Locale.ROOT);
        reply.message = String.valueOf(call(response, "message"));
        try {
            call(response, "close");
        } catch (Throwable ignored) {
        }
        return reply;
    }

    private static Object wrap(Object request, Reply reply) throws Exception {
        return newResponse(request, reply.text, reply.headers, reply.code, reply.message, reply.protocol);
    }

    /**
     * Asks Reddit as usual. Only when it refuses with its HTML block page are the posts and
     * comments rebuilt from the comments pages, which Reddit still answers.
     */
    private static Object lookup(Object adapter, Object request, URL url, String route) {
        long started = System.currentTimeMillis();
        String how = "";
        int tries = 0;
        int candidatesTried = 0;
        String source = "";
        boolean comment = false;
        try {
            if (!"GET".equalsIgnoreCase(String.valueOf(call(request, "e")))) return null;
            String ids = route.contains("/by_id/")
                    ? decode(url.getPath().substring(url.getPath().toLowerCase(Locale.ROOT).indexOf("/by_id/") + 7)
                            .replaceAll("(?i)\\.json$", ""))
                    : queryValue(url.getQuery(), "id");
            comment = ids != null && ids.contains("t1_");
            if (comment) RequestLog.count("comment-lookups");
            Object client = field(adapter, "a");
            Reply first = get(client, request, url.toString());
            // Joey's own request path signs in again on a 401. Leave it to that.
            if (first.code == 401) {
                if (comment) RequestLog.entry("lookup").put("status", 401).put("result", "left-to-joey").save();
                return null;
            }
            boolean html = first.code == 403 && !kind(first).equals("json");
            boolean limited = first.code == 429;
            // Only a comment can be too new to show. Other lookups may be empty for good.
            boolean empty = comment && first.code == 200 && emptyListing(first.text);
            if (!html && !limited && !empty) {
                if (comment) {
                    RequestLog.count("comment-lookup-clean");
                    RequestLog.entry("lookup").put("status", first.code).put("kind", kind(first))
                            .put("ms", first.ms).saveGood();
                }
                return wrap(request, first);
            }
            how = html ? "blocked" : limited ? "limited" : "empty";
            if (empty && canWait()) {
                // A comment that was only just posted can take a moment to show up.
                for (int i = 0; i < 2 && empty; i++) {
                    Thread.sleep(i == 0 ? 1200 : 2500);
                    tries++;
                    Reply again = get(client, request, url.toString());
                    if (again.code == 200 && !emptyListing(again.text)) {
                        RequestLog.count("comment-lookup-recovered");
                        RequestLog.entry("lookup").put("first", how).put("result", "found-after-wait")
                                .put("waits", tries).put("ms", System.currentTimeMillis() - started).save();
                        return wrap(request, again);
                    }
                    if (again.code != 200) {
                        first = again;
                        empty = false;
                        html = again.code == 403 && !kind(again).equals("json");
                        limited = again.code == 429;
                        how = how + ">" + again.code;
                    }
                }
            }
            if (!html && !limited && !empty) {
                note(first, how, tries, candidatesTried, source, "failed-" + first.code, started, comment, false);
                return wrap(request, first);
            }
            if (ids == null || ids.isEmpty()) return wrap(request, first);
            Referer referer = new Referer(request);
            JSONArray things = new JSONArray();
            Reply last = first;
            for (String fullname : new LinkedHashSet<>(java.util.Arrays.asList(ids.split(",")))) {
                fullname = fullname.trim();
                JSONObject thing;
                if (fullname.startsWith("t3_")) {
                    Reply post = get(client, request, base(url) + "/comments/" + fullname.substring(3)
                            + ".json?limit=1&depth=1&raw_json=1");
                    last = post;
                    if (post.code == 404) continue;
                    if (post.code < 200 || post.code >= 300) {
                        note(first, how, tries, candidatesTried, source, "post-failed-" + post.code, started,
                                comment, false);
                        return wrap(request, post);
                    }
                    thing = firstChild(post.text, 0, fullname);
                } else if (fullname.startsWith("t1_")) {
                    thing = null;
                    java.util.Map<String, String> sources = new java.util.HashMap<>();
                    for (String postId : candidates(client, request, url, referer, fullname, sources)) {
                        candidatesTried++;
                        Reply found = get(client, request, base(url) + "/comments/" + postId + "/comment/"
                                + fullname.substring(3) + ".json?context=0&limit=1&depth=1&raw_json=1");
                        last = found;
                        if (found.code < 200 || found.code >= 300) continue;
                        thing = firstChild(found.text, 1, fullname);
                        if (thing != null) {
                            source = String.valueOf(sources.get(postId));
                            break;
                        }
                    }
                    if (thing == null) {
                        note(first, how, tries, candidatesTried, source, "not-found-last-" + last.code, started,
                                comment, false);
                        return wrap(request, first);
                    }
                    thing.getJSONObject("data").put("replies", "");
                } else {
                    return wrap(request, first);
                }
                if (thing != null) things.put(thing);
            }
            JSONObject data = new JSONObject().put("children", things).put("before", JSONObject.NULL)
                    .put("after", JSONObject.NULL).put("dist", things.length()).put("modhash", "");
            String payload = new JSONObject().put("kind", "Listing").put("data", data).toString();
            note(first, how, tries, candidatesTried, source, things.length() > 0 ? "rebuilt" : "rebuilt-empty",
                    started, comment, things.length() > 0);
            return newResponse(request, payload, last.headers, 200, "OK", last.protocol);
        } catch (Throwable failure) {
            try {
                if (comment) RequestLog.count("comment-lookup-failed");
                RequestLog.entry("lookup").put("first", how).put("result", "error")
                        .put("error", failure.getClass().getSimpleName()).save();
            } catch (Throwable ignored) {
            }
            return null;
        }
    }

    private static void note(Reply first, String how, int waits, int candidates, String source, String result,
                             long started, boolean comment, boolean recovered) {
        try {
            if (comment) RequestLog.count(recovered ? "comment-lookup-recovered" : "comment-lookup-failed");
            RequestLog.Entry entry = RequestLog.entry("lookup").put("first", how).put("status", first.code)
                    .put("kind", kind(first)).put("waits", waits).put("posts-tried", candidates)
                    .put("post-from", source).put("result", result).put("ms", System.currentTimeMillis() - started);
            limits(entry, first);
            entry.save();
        } catch (Throwable ignored) {
        }
    }

    private static final class Referer {
        final String postId;

        Referer(Object request) {
            String id = null;
            try {
                Object headers = call(request, "d");
                Object value = headers == null ? null
                        : call(headers, "get", new Class<?>[]{String.class}, "Referer");
                if (value != null) {
                    java.util.regex.Matcher m = java.util.regex.Pattern.compile("/comments/([a-z0-9]+)")
                            .matcher(String.valueOf(value));
                    if (m.find()) id = m.group(1);
                }
            } catch (Throwable ignored) {
            }
            postId = id;
        }
    }

    /** Posts a comment may belong to, most likely first. A wrong guess is ruled out by the lookup itself. */
    private static java.util.List<String> candidates(Object client, Object request, URL url, Referer referer,
                                                     String fullname, java.util.Map<String, String> sources) {
        java.util.List<String> list = new java.util.ArrayList<>();
        String link = queryValue(url.getQuery(), "link_id");
        if (link != null && link.startsWith("t3_")) {
            list.add(link.substring(3));
            sources.put(link.substring(3), "link");
        }
        if (referer.postId != null && !list.contains(referer.postId)) {
            list.add(referer.postId);
            sources.put(referer.postId, "referer");
        }
        synchronized (RECENT) {
            for (String post : RECENT) {
                if (!list.contains(post)) {
                    list.add(post);
                    sources.put(post, "recent");
                }
            }
        }
        try {
            // Last resort for the account's own comments: its history names the post.
            Reply me = get(client, request, base(url) + "/api/v1/me");
            String name = me.code == 200 ? new JSONObject(me.text).optString("name", "") : "";
            if (!name.isEmpty()) {
                Reply mine = get(client, request, base(url) + "/user/" + name
                        + "/comments?limit=25&sort=new&raw_json=1");
                if (mine.code == 200) {
                    JSONArray children = new JSONObject(mine.text).getJSONObject("data").getJSONArray("children");
                    for (int i = 0; i < children.length(); i++) {
                        JSONObject d = children.getJSONObject(i).getJSONObject("data");
                        if (fullname.equals(d.optString("name"))) {
                            String post = d.optString("link_id");
                            if (post.startsWith("t3_") && !list.contains(post.substring(3))) {
                                list.add(0, post.substring(3));
                                sources.put(post.substring(3), "history");
                            }
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return list;
    }

    private static JSONObject firstChild(String json, int listing, String fullname) throws Exception {
        JSONArray children = new JSONArray(json).getJSONObject(listing).getJSONObject("data").getJSONArray("children");
        if (children.length() == 0) return null;
        JSONObject thing = children.getJSONObject(0);
        return fullname.equalsIgnoreCase(thing.getJSONObject("data").optString("name")) ? thing : null;
    }

    private static String base(URL url) {
        StringBuilder out = new StringBuilder(url.getProtocol()).append("://").append(url.getHost());
        if (url.getPort() > 0) out.append(':').append(url.getPort());
        return out.toString();
    }

    /** Keeps a huge thread quick and well inside Reddit's rate limit. */
    private static final int MAX_REQUESTS = 20;

    private static String parentListingUrl(URL original, String postId, String parentCommentId, String sort,
                                           String profileImg) {
        if (parentCommentId != null) {
            return focusedUrl(original, postId, parentCommentId, sort, profileImg) + "&limit=500&depth=10";
        }
        StringBuilder url = new StringBuilder(base(original)).append("/comments/").append(postId)
                .append(".json?limit=500&depth=2&raw_json=1");
        if (sort != null && !sort.isEmpty()) url.append("&sort=").append(sort);
        if (profileImg != null && !profileImg.isEmpty()) url.append("&profile_img=").append(profileImg);
        return url.toString();
    }

    private static JSONArray repliesOf(Object replies) {
        if (!(replies instanceof JSONObject)) return null;
        JSONObject data = ((JSONObject) replies).optJSONObject("data");
        return data == null ? null : data.optJSONArray("children");
    }

    private static void collect(JSONArray children, Set<String> targets, java.util.Map<String, JSONObject> found)
            throws Exception {
        for (int i = 0; i < children.length(); i++) {
            JSONObject thing = children.getJSONObject(i);
            if (!"t1".equals(thing.getString("kind"))) continue;
            JSONObject data = thing.getJSONObject("data");
            String id = data.getString("id");
            if (targets.contains(id)) found.put(id, thing);
            JSONArray replies = repliesOf(data.opt("replies"));
            if (replies != null) collect(replies, targets, found);
        }
    }

    private static Object fetch(Object client, Object request, String url) throws Exception {
        Class<?> builderClass = Class.forName("okhttp3.Request$Builder");
        Object builder = builderClass.getConstructor().newInstance();
        call(builder, "url", new Class<?>[]{String.class}, url);
        call(builder, "get");
        Object headers = call(request, "d");
        if (headers != null) {
            int size = (Integer) call(headers, "size");
            for (int i = 0; i < size; i++) {
                String name = String.valueOf(call(headers, "name", new Class<?>[]{int.class}, i));
                if (skipHeader(name)) continue;
                String value = String.valueOf(call(headers, "value", new Class<?>[]{int.class}, i));
                call(builder, "addHeader", new Class<?>[]{String.class, String.class}, name, value);
            }
        }
        Object built = call(builder, "build");
        Object call = call(client, "newCall", new Class<?>[]{Class.forName("okhttp3.Request")}, built);
        return call(call, "execute");
    }

    private static boolean skipHeader(String name) {
        String lower = name.toLowerCase(Locale.ROOT);
        return "content-length".equals(lower) || "content-type".equals(lower)
                || "content-encoding".equals(lower) || "host".equals(lower)
                || "accept-encoding".equals(lower);
    }

    private static JSONObject focusedComment(String json, String expectedId) throws Exception {
        JSONArray response = new JSONArray(json);
        JSONArray children = response.getJSONObject(1).getJSONObject("data").getJSONArray("children");
        if (children.length() == 0) return null;
        JSONObject focused = children.getJSONObject(0);
        String id = focused.getJSONObject("data").optString("id");
        if (!expectedId.equals(id)) {
            throw new IllegalStateException("unexpected comment " + id);
        }
        return focused;
    }

    private static void flatten(JSONObject thing, Set<String> seen, Set<String> names, JSONArray output)
            throws Exception {
        String kind = thing.getString("kind");
        JSONObject data = thing.getJSONObject("data");
        if ("t1".equals(kind)) {
            Object replies = data.opt("replies");
            String id = data.getString("id");
            if (seen.add(id)) {
                data.put("replies", "");
                output.put(thing);
                names.add(data.getString("name"));
            }
            if (replies instanceof JSONObject) {
                JSONObject listing = ((JSONObject) replies).optJSONObject("data");
                JSONArray children = listing == null ? null : listing.optJSONArray("children");
                if (children == null) return;
                for (int i = 0; i < children.length(); i++) {
                    flatten(children.getJSONObject(i), seen, names, output);
                }
            }
        } else if ("more".equals(kind) && names.contains(data.optString("parent_id"))) {
            output.put(thing);
        }
    }

    private static Object newResponse(Object request, String text, Object headers, int code,
                                      String message, String protocol) throws Exception {
        Class<?> type = Class.forName("net.dean.jraw.http.m");
        java.lang.reflect.Constructor<?> constructor = type.getDeclaredConstructor(
                Class.forName("net.dean.jraw.http.f"),
                String.class,
                Class.forName("okhttp3.Headers"),
                int.class,
                String.class,
                String.class);
        constructor.setAccessible(true);
        return constructor.newInstance(request, text, headers, code, message, protocol);
    }

    private static String focusedUrl(URL original, String postId, String commentId, String sort, String profileImg) {
        StringBuilder url = new StringBuilder();
        url.append(original.getProtocol()).append("://").append(original.getHost());
        int port = original.getPort();
        if (port > 0) url.append(':').append(port);
        url.append("/comments/").append(postId).append("/comment/").append(commentId)
                .append(".json?context=0&raw_json=1");
        if (sort != null && !sort.isEmpty()) url.append("&sort=").append(sort);
        if (profileImg != null && !profileImg.isEmpty()) url.append("&profile_img=").append(profileImg);
        return url.toString();
    }

    private static Params params(URL url, Object body) {
        Params params = new Params();
        read(params, url.getQuery());
        read(params, bodyText(body));
        return params;
    }

    private static void read(Params params, String encoded) {
        if (encoded == null || encoded.isEmpty()) return;
        for (String pair : encoded.split("&")) {
            int cut = pair.indexOf('=');
            String key = decode(cut < 0 ? pair : pair.substring(0, cut));
            String value = decode(cut < 0 ? "" : pair.substring(cut + 1));
            if ("link_id".equals(key)) params.linkId = value;
            else if ("children".equals(key) && !value.isEmpty()) {
                params.children.clear();
                for (String child : value.split(",")) {
                    if (!child.isEmpty()) params.children.add(strip(child, "t1_"));
                }
            } else if ("sort".equals(key)) params.sort = value;
            else if ("profile_img".equals(key)) params.profileImg = value;
        }
    }

    private static String bodyText(Object body) {
        if (body == null) return null;
        try {
            for (Field field : body.getClass().getDeclaredFields()) {
                if (field.getType() != byte[].class) continue;
                field.setAccessible(true);
                byte[] bytes = (byte[]) field.get(body);
                if (bytes != null) return new String(bytes, StandardCharsets.UTF_8);
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static String strip(String value, String prefix) {
        if (value != null && value.startsWith(prefix) && value.length() > prefix.length()) {
            return value.substring(prefix.length());
        }
        return value;
    }

    private static String decode(String value) {
        try {
            return URLDecoder.decode(value, "UTF-8");
        } catch (Exception ignored) {
            return value;
        }
    }

    private static Object field(Object target, String suffix) throws Exception {
        Class<?> type = target.getClass();
        while (type != null) {
            for (Field field : type.getDeclaredFields()) {
                if (field.getName().endsWith(suffix) && !field.getType().isPrimitive()) {
                    field.setAccessible(true);
                    Object value = field.get(target);
                    if (value != null && value.getClass().getName().contains("OkHttpClient")) return value;
                }
            }
            type = type.getSuperclass();
        }
        throw new IllegalStateException("missing client");
    }

    private static Object call(Object target, String name) throws Exception {
        return call(target, name, new Class<?>[0]);
    }

    private static Object call(Object target, String name, Class<?>[] types, Object... args) throws Exception {
        return target.getClass().getMethod(name, types).invoke(target, args);
    }

    private static final class Params {
        String linkId;
        String sort;
        String profileImg;
        final LinkedHashSet<String> children = new LinkedHashSet<>();
    }
}
