package app.nogoogle.gboard.gif;

import android.net.Uri;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Locale;

/**
 * Openverse (WordPress' openly licensed media search) as a GIF source: no account or key, but
 * anonymous use is limited to about 200 searches a day. Openverse indexes files hosted elsewhere;
 * only those on hosts the network helper may fetch from (Wikimedia, Flickr) are asked for and kept.
 */
final class OpenverseGifs {
    private static final String API = "https://api.openverse.org/v1/images/";
    private static final String FEATURED = "animation"; // "funny animation" matches a single GIF
    private static final int PER_PAGE = 20;
    private static final long MAX_BYTES = 6 << 20;

    private OpenverseGifs() {
    }

    static GifBridge.Result answer(String endpoint, Uri tenor) throws Exception {
        String filter = tenor.getQueryParameter("searchfilter");
        if (filter != null && filter.contains("sticker")) return GifBridge.Result.ok("{\"results\":[],\"next\":\"\"}");
        switch (endpoint) {
            case "featured":
            case "search": {
                String q = "search".equals(endpoint) ? tenor.getQueryParameter("q") : null;
                q = q == null || q.trim().isEmpty() ? FEATURED : q.trim();
                int page = Math.max(1, parse(tenor.getQueryParameter("pos")));
                Uri url = Uri.parse(API).buildUpon().appendQueryParameter("q", q)
                        .appendQueryParameter("extension", "gif").appendQueryParameter("mature", "false")
                        .appendQueryParameter("source", "wikimedia,flickr")
                        .appendQueryParameter("page_size", String.valueOf(PER_PAGE))
                        .appendQueryParameter("page", String.valueOf(page)).build();
                GifBridge.Result r = GifBridge.fetch(url.toString());
                if (r.code == 429) GifBridge.notice("Openverse: daily limit for anonymous searches reached");
                return r.ok() ? GifBridge.Result.ok(toTenor(r.text(), page)) : r;
            }
            default: // autocomplete, trending_terms, search_suggestions, posts
                return GifBridge.Result.ok("{\"results\":[]}");
        }
    }

    static String toTenor(String json, int page) throws Exception {
        JSONObject root = new JSONObject(json);
        JSONArray in = root.optJSONArray("results");
        JSONArray out = new JSONArray();
        for (int i = 0; in != null && i < in.length(); i++) {
            JSONObject g = in.optJSONObject(i);
            if (g == null) continue;
            String url = g.optString("url");
            long size = g.optLong("filesize", 0);
            if (!fetchable(url) || size > MAX_BYTES || !"gif".equals(g.optString("filetype", "gif"))) continue;
            String title = g.optString("title", "GIF");
            JSONObject gif = new JSONObject().put("url", GifBridge.proxied(url))
                    .put("dims", new JSONArray().put(g.optInt("width")).put(g.optInt("height")))
                    .put("size", size);
            out.put(new JSONObject().put("id", "openverse~" + g.optString("id")).put("title", title)
                    .put("content_description", title).put("url", g.optString("foreign_landing_url"))
                    .put("media_formats", new JSONObject().put("gif", gif).put("tinygif", gif)));
        }
        String next = page < root.optInt("page_count", 0) ? String.valueOf(page + 1) : "";
        return new JSONObject().put("results", out).put("next", next).toString();
    }

    /** Hosts the network helper allows (see its allow-list). */
    private static boolean fetchable(String url) {
        if (!url.startsWith("https://")) return false;
        String host = Uri.parse(url).getHost();
        if (host == null) return false;
        host = host.toLowerCase(Locale.ROOT);
        return host.endsWith(".wikimedia.org") || host.endsWith(".staticflickr.com");
    }

    private static int parse(String s) {
        try {
            return s == null || s.isEmpty() ? 0 : Integer.parseInt(s.trim());
        } catch (NumberFormatException e) {
            return 0;
        }
    }
}
