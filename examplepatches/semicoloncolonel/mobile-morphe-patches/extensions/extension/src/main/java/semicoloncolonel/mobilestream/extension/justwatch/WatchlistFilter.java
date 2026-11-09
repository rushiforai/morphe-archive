package semicoloncolonel.mobilestream.extension.justwatch;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;

import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;
import okio.Buffer;

/**
 * Watchlist patches for JustWatch: "Streaming titles only", "Hide
 * unavailable titles", and "Hide watched titles".
 *
 * The Watchlist loads its titles with a first-page query and then
 * WatchlistPaginationQuery, both with titleListType WATCHLIST. The first
 * page is WatchlistContentQuery in the phone app (8 titles a page) and
 * WatchlistGridQuery in the Android TV app (18 a page). Each patch turns on
 * one switch here. Only data the app already asks for is used, and no other
 * query is touched.
 *
 * Streaming titles only: when the user has not picked a Types filter, the
 * request asks for subscription, free, and ad-supported offers, the same as
 * picking those types in the app's own Types filter.
 *
 * Hide unavailable titles and Hide watched titles drop titles from each
 * response. To keep a page from coming back short or empty, the filter asks
 * for larger pages and, while a page has fewer titles left than the app asked
 * for, fetches the next page and appends it. The Android TV app's queries do
 * not ask for offerCount or isReleased, which Hide unavailable titles needs
 * with All picked, so the filter adds them under its own names
 * (msp_offerCount, msp_isReleased), which the app ignores.
 */
@SuppressWarnings("unused")
public final class WatchlistFilter implements Interceptor {
    private static final String TAG = "MSP-JW";
    private static final long MAX_BODY = 1024 * 1024;

    private static final String[] FIRST_PAGE_QUERIES = {
            "query WatchlistContentQuery(", "query WatchlistGridQuery("};
    private static final String PAGINATION_QUERY = "query WatchlistPaginationQuery(";
    // The main list of a first-page query, which has no $after variable and a
    // fixed page size. Other lists in the query (allProvidersList) take a
    // literal filter, not $filter.
    private static final java.util.regex.Pattern FIRST_PAGE_LIST = java.util.regex.Pattern.compile(
            "titleListV2\\((?=[^)]*filter: \\$filter)[^)]*?first: (\\d+)");
    private static final java.util.regex.Pattern DEFAULT_FIRST =
            java.util.regex.Pattern.compile("\\$first: Int = (\\d+)");

    private static final String NODE = "node {";
    private static final String CONTENT = "content(country: $country, language: $language) {";

    /** The fewest titles asked for per request while titles are being dropped. */
    private static final int MIN_FETCH_SIZE = 24;
    /** Extra pages fetched to fill one short page. */
    private static final int MAX_EXTRA_FETCHES = 5;

    private static final String[] STREAMING_TYPES = {"FLATRATE", "FLATRATE_AND_BUY", "FREE", "ADS"};

    private static volatile boolean streamingOnly;
    private static volatile boolean hideUnavailable;
    private static volatile boolean hideWatched;

    public static void installStreamingOnly(OkHttpClient.Builder builder) {
        streamingOnly = true;
        install(builder);
    }

    public static void installHideUnavailable(OkHttpClient.Builder builder) {
        hideUnavailable = true;
        install(builder);
    }

    public static void installHideWatched(OkHttpClient.Builder builder) {
        hideWatched = true;
        install(builder);
    }

    private static void install(OkHttpClient.Builder builder) {
        try {
            for (Interceptor interceptor : builder.interceptors()) {
                if (interceptor instanceof WatchlistFilter) {
                    return;
                }
            }
            builder.interceptors().add(new WatchlistFilter());
        } catch (Throwable t) {
            Log.w(TAG, "watchlist filter install failed: " + t);
        }
    }

    private static boolean dropsTitles() {
        return hideUnavailable || hideWatched;
    }

    /** A parsed Watchlist request, or null for any other request. */
    private static final class Call {
        final JSONObject body;
        final boolean pagination;
        final MediaType type;
        /** Titles the app asked for per page. */
        final int pageSize;

        Call(JSONObject body, boolean pagination, MediaType type, int pageSize) {
            this.body = body;
            this.pagination = pagination;
            this.type = type;
            this.pageSize = pageSize;
        }

        int fetchSize() {
            return Math.max(MIN_FETCH_SIZE, pageSize * 2);
        }

        JSONObject variables() {
            return body.optJSONObject("variables");
        }

        String query() {
            return body.optString("query", "");
        }
    }

    private static Call parse(Request request) {
        try {
            RequestBody body = request.body();
            if (body == null || !"POST".equals(request.method())
                    || !request.url().host().endsWith("justwatch.com")
                    || body.contentLength() < 0 || body.contentLength() > MAX_BODY) {
                return null;
            }
            Buffer buffer = new Buffer();
            body.writeTo(buffer);
            String text = buffer.readUtf8();
            boolean content = false;
            for (String name : FIRST_PAGE_QUERIES) {
                content |= text.contains(name);
            }
            boolean pagination = !content && text.contains(PAGINATION_QUERY);
            if (!content && !pagination) {
                return null;
            }
            JSONObject json = new JSONObject(text);
            JSONObject variables = json.optJSONObject("variables");
            if (variables == null || !"WATCHLIST".equals(variables.optString("titleListType"))) {
                return null;
            }
            String query = json.optString("query", "");
            int pageSize;
            if (pagination) {
                java.util.regex.Matcher defaults = DEFAULT_FIRST.matcher(query);
                pageSize = variables.optInt("first", defaults.find() ? Integer.parseInt(defaults.group(1)) : 8);
            } else {
                java.util.regex.Matcher list = FIRST_PAGE_LIST.matcher(query);
                if (!list.find()) {
                    return null;
                }
                pageSize = Integer.parseInt(list.group(1));
            }
            return new Call(json, pagination, body.contentType(), pageSize);
        } catch (Throwable t) {
            return null;
        }
    }

    private static Request rebuild(Request request, Call call) {
        RequestBody body = RequestBody.create(call.body.toString(), call.type);
        return request.newBuilder().post(body).build();
    }

    /** Applies the request-side changes: the default Types filter and the page size. */
    private static void prepare(Call call) throws Exception {
        JSONObject variables = call.variables();
        if (streamingOnly) {
            JSONObject filter = variables.optJSONObject("filter");
            if (filter == null) {
                filter = new JSONObject();
                variables.put("filter", filter);
            }
            JSONArray types = filter.optJSONArray("monetizationTypes");
            if (types == null || types.length() == 0) {
                JSONArray streaming = new JSONArray();
                for (String type : STREAMING_TYPES) {
                    streaming.put(type);
                }
                filter.put("monetizationTypes", streaming);
            }
        }
        if (hideUnavailable) {
            call.body.put("query", addAvailabilityFields(call.query()));
        }
        if (dropsTitles()) {
            if (call.pagination) {
                variables.put("first", call.fetchSize());
            } else {
                String query = call.query();
                java.util.regex.Matcher list = FIRST_PAGE_LIST.matcher(query);
                if (list.find()) {
                    call.body.put("query", query.substring(0, list.start(1)) + call.fetchSize()
                            + query.substring(list.end(1)));
                }
            }
        }
    }

    /**
     * Adds offerCount and content.isReleased to the list's titles when the
     * query does not ask for them (the Android TV app), under names the app
     * does not read.
     */
    private static String addAvailabilityFields(String query) {
        if (query.contains("offerCount(") || !query.contains("$platform: Platform")) {
            return query;
        }
        int list = query.indexOf("titleListV2(");
        int node = list < 0 ? -1 : query.indexOf(NODE, list);
        if (node < 0) {
            return query;
        }
        int afterNode = node + NODE.length();
        String result = query.substring(0, afterNode)
                + " msp_offerCount: offerCount(country: $country, platform: $platform, distinctPackages: true)"
                + query.substring(afterNode);
        int content = result.indexOf(CONTENT, afterNode);
        if (content >= 0 && !result.contains("isReleased")) {
            int afterContent = content + CONTENT.length();
            result = result.substring(0, afterContent) + " msp_isReleased: isReleased" + result.substring(afterContent);
        }
        return result;
    }

    /** A request for the page after the given cursor. */
    private static Call nextPage(Call call, String cursor) throws Exception {
        JSONObject body = new JSONObject(call.body.toString());
        if (call.pagination) {
            body.getJSONObject("variables").put("after", cursor);
        } else {
            String query = body.optString("query", "");
            java.util.regex.Matcher list = FIRST_PAGE_LIST.matcher(query);
            if (!list.find()) {
                return null;
            }
            int open = list.start() + "titleListV2(".length();
            body.put("query", query.substring(0, open) + "after: " + JSONObject.quote(cursor) + ", "
                    + query.substring(open));
        }
        return new Call(body, call.pagination, call.type, call.pageSize);
    }

    private static boolean isWatched(JSONObject node) {
        if (node.optJSONObject("seenlistEntry") != null) {
            return true;
        }
        JSONObject seenState = node.optJSONObject("seenState");
        return seenState != null && seenState.optBoolean("caughtUp", false);
    }

    private static boolean isUnavailable(JSONObject node, boolean servicesPicked) {
        if (servicesPicked) {
            return node.optJSONObject("watchNowOffer") == null;
        }
        int offers = node.has("offerCount") ? node.optInt("offerCount", 1) : node.optInt("msp_offerCount", 1);
        if (offers != 0) {
            return false;
        }
        JSONObject content = node.optJSONObject("content");
        // An unreleased title has no offers yet. Keep it.
        return content == null || content.optBoolean("isReleased", content.optBoolean("msp_isReleased", true));
    }

    /** Removes dropped titles from a list's edges. Returns the edges kept. */
    private static JSONArray keep(JSONArray edges, boolean servicesPicked) {
        JSONArray kept = new JSONArray();
        if (edges == null) {
            return kept;
        }
        for (int i = 0; i < edges.length(); i++) {
            JSONObject edge = edges.optJSONObject(i);
            JSONObject node = edge == null ? null : edge.optJSONObject("node");
            if (node == null) {
                kept.put(edge);
                continue;
            }
            if (hideWatched && isWatched(node)) {
                continue;
            }
            if (hideUnavailable && isUnavailable(node, servicesPicked)) {
                continue;
            }
            kept.put(edge);
        }
        return kept;
    }

    private static JSONObject list(JSONObject json) {
        JSONObject data = json.optJSONObject("data");
        return data == null ? null : data.optJSONObject("titleListV2");
    }

    private static String readJson(Response response) throws IOException {
        ResponseBody body = response.body();
        if (body == null || !response.isSuccessful() || response.header("Content-Encoding") != null) {
            return null;
        }
        return body.string();
    }

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        if (!streamingOnly && !dropsTitles()) {
            return chain.proceed(request);
        }
        Call call = parse(request);
        if (call == null) {
            return chain.proceed(request);
        }
        try {
            prepare(call);
            request = rebuild(request, call);
        } catch (Throwable t) {
            Log.w(TAG, "watchlist request rewrite failed: " + t);
            return chain.proceed(request);
        }
        Response response = chain.proceed(request);
        if (!dropsTitles()) {
            return response;
        }
        MediaType type = response.body() == null ? null : response.body().contentType();
        String text = readJson(response);
        if (text == null) {
            return response;
        }
        try {
            JSONArray services = call.variables().optJSONArray("providerNames");
            boolean servicesPicked = services != null && services.length() > 0;
            JSONObject json = new JSONObject(text);
            JSONObject list = list(json);
            if (list != null) {
                JSONArray kept = keep(list.optJSONArray("edges"), servicesPicked);
                JSONObject pageInfo = list.optJSONObject("pageInfo");
                int fetches = 0;
                while (kept.length() < call.pageSize && pageInfo != null
                        && pageInfo.optBoolean("hasNextPage", false)
                        && fetches < MAX_EXTRA_FETCHES) {
                    String cursor = pageInfo.optString("endCursor", "");
                    Call next = cursor.isEmpty() ? null : nextPage(call, cursor);
                    if (next == null) {
                        break;
                    }
                    fetches++;
                    String nextText = readJson(chain.proceed(rebuild(request, next)));
                    JSONObject nextList = nextText == null ? null : list(new JSONObject(nextText));
                    if (nextList == null) {
                        break;
                    }
                    JSONArray more = keep(nextList.optJSONArray("edges"), servicesPicked);
                    for (int i = 0; i < more.length(); i++) {
                        kept.put(more.get(i));
                    }
                    pageInfo = nextList.optJSONObject("pageInfo");
                }
                list.put("edges", kept);
                if (pageInfo != null) {
                    list.put("pageInfo", pageInfo);
                }
                text = json.toString();
            }
        } catch (Throwable t) {
            Log.w(TAG, "watchlist filter failed: " + t);
        }
        return response.newBuilder()
                .removeHeader("Content-Length")
                .body(ResponseBody.create(text, type))
                .build();
    }
}
