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
            for (String child : params.children) {
                if (seen.contains(child)) continue;
                JSONObject comment = bulk.get(child);
                if (comment == null) {
                    if (requests >= MAX_REQUESTS) {
                        deferred.add(child);
                        continue;
                    }
                    requests++;
                    Reply reply = get(client, request,
                            focusedUrl(url, postId, child, params.sort, params.profileImg));
                    if (reply.code < 200 || reply.code >= 300) {
                        if (reply.code < 500) return wrap(request, reply);
                        failure = reply;
                        deferred.add(child);
                        continue;
                    }
                    any = reply;
                    comment = focusedComment(reply.text, child);
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
                if (whole.code < 200 || whole.code >= 300) continue;
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
                } catch (Throwable ignored) {
                    // The single requests below still work.
                }
            }
            if (!progressed && failure != null) return wrap(request, failure);
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
            if (any == null) return null;
            return newResponse(request, payload, any.headers, 200, "OK", any.protocol);
        } catch (Throwable ignored) {
            return null;
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
    }

    private static Reply get(Object client, Object request, String url) throws Exception {
        Object response = fetch(client, request, url);
        Reply reply = new Reply();
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
        try {
            if (!"GET".equalsIgnoreCase(String.valueOf(call(request, "e")))) return null;
            Object client = field(adapter, "a");
            Reply first = get(client, request, url.toString());
            if (first.code != 403 || first.text.trim().startsWith("{") || first.text.trim().startsWith("[")) {
                return wrap(request, first);
            }
            String ids = route.contains("/by_id/")
                    ? decode(url.getPath().substring(url.getPath().toLowerCase(Locale.ROOT).indexOf("/by_id/") + 7)
                            .replaceAll("(?i)\\.json$", ""))
                    : queryValue(url.getQuery(), "id");
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
                    if (post.code < 200 || post.code >= 300) return wrap(request, post);
                    thing = firstChild(post.text, 0, fullname);
                } else if (fullname.startsWith("t1_")) {
                    thing = null;
                    for (String postId : candidates(client, request, url, referer, fullname)) {
                        Reply comment = get(client, request, base(url) + "/comments/" + postId + "/comment/"
                                + fullname.substring(3) + ".json?context=0&limit=1&depth=1&raw_json=1");
                        last = comment;
                        if (comment.code < 200 || comment.code >= 300) continue;
                        thing = firstChild(comment.text, 1, fullname);
                        if (thing != null) break;
                    }
                    if (thing == null) return wrap(request, first);
                    thing.getJSONObject("data").put("replies", "");
                } else {
                    return wrap(request, first);
                }
                if (thing != null) things.put(thing);
            }
            JSONObject data = new JSONObject().put("children", things).put("before", JSONObject.NULL)
                    .put("after", JSONObject.NULL).put("dist", things.length()).put("modhash", "");
            String payload = new JSONObject().put("kind", "Listing").put("data", data).toString();
            return newResponse(request, payload, last.headers, 200, "OK", last.protocol);
        } catch (Throwable ignored) {
            return null;
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
                                                     String fullname) {
        java.util.List<String> list = new java.util.ArrayList<>();
        String link = queryValue(url.getQuery(), "link_id");
        if (link != null && link.startsWith("t3_")) list.add(link.substring(3));
        if (referer.postId != null && !list.contains(referer.postId)) list.add(referer.postId);
        synchronized (RECENT) {
            for (String post : RECENT) if (!list.contains(post)) list.add(post);
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
