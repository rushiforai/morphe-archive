package app.nogoogle.gboard.gif;

import android.net.Uri;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Wikimedia Commons as a GIF source (no account or key): animated GIF files from the MediaWiki
 * search API, answered in Tenor v2 form for Gboard's GIF tab. Commons has few reaction GIFs, so
 * "trending" is a fixed search for animals and funny clips.
 */
final class WikimediaGifs {
    private static final String API = "https://commons.wikimedia.org/w/api.php";
    private static final String FEATURED = "cat OR dog OR funny OR dance";
    private static final long MAX_BYTES = 8 << 20; // larger files are slow to send
    private static final int THUMB_WIDTH = 220;

    private WikimediaGifs() {
    }

    static GifBridge.Result answer(String endpoint, Uri tenor) throws Exception {
        String filter = tenor.getQueryParameter("searchfilter");
        boolean stickers = filter != null && filter.contains("sticker");
        switch (endpoint) {
            case "search":
            case "featured":
                if (stickers) return GifBridge.Result.ok("{\"results\":[],\"next\":\"\"}");
                String q = "search".equals(endpoint) ? tenor.getQueryParameter("q") : null;
                return search(q == null || q.trim().isEmpty() ? FEATURED : q.trim(),
                        tenor.getQueryParameter("limit"), tenor.getQueryParameter("pos"));
            case "posts":
                return posts(tenor.getQueryParameter("ids"));
            default: // autocomplete, trending_terms, search_suggestions
                return GifBridge.Result.ok("{\"results\":[]}");
        }
    }

    private static GifBridge.Result search(String q, String limitParam, String pos) throws Exception {
        int limit = clamp(parse(limitParam, 30), 1, 50);
        int offset = Math.max(0, parse(pos, 0));
        Uri url = base()
                .appendQueryParameter("generator", "search")
                .appendQueryParameter("gsrnamespace", "6")
                .appendQueryParameter("gsrsearch", "filemime:image/gif " + q)
                .appendQueryParameter("gsrlimit", String.valueOf(limit))
                .appendQueryParameter("gsroffset", String.valueOf(offset))
                .build();
        GifBridge.Result r = GifBridge.fetch(url.toString());
        return r.ok() ? GifBridge.Result.ok(toTenor(r.text())) : r;
    }

    private static GifBridge.Result posts(String ids) throws Exception {
        if (ids == null || ids.isEmpty()) return GifBridge.Result.ok("{\"results\":[]}");
        Uri url = base().appendQueryParameter("pageids", ids.replace(',', '|')).build();
        GifBridge.Result r = GifBridge.fetch(url.toString());
        return r.ok() ? GifBridge.Result.ok(toTenor(r.text())) : r;
    }

    private static Uri.Builder base() {
        return Uri.parse(API).buildUpon()
                .appendQueryParameter("action", "query")
                .appendQueryParameter("format", "json")
                .appendQueryParameter("formatversion", "2")
                .appendQueryParameter("prop", "imageinfo")
                .appendQueryParameter("iiprop", "url|size|mime")
                .appendQueryParameter("iiurlwidth", String.valueOf(THUMB_WIDTH));
    }

    /** MediaWiki query answer → Tenor v2 search answer (animated GIFs only, in search order). */
    static String toTenor(String json) throws Exception {
        JSONObject root = new JSONObject(json);
        JSONObject query = root.optJSONObject("query");
        JSONArray pages = query == null ? null : query.optJSONArray("pages");
        List<JSONObject> sorted = new ArrayList<>();
        if (pages != null) {
            for (int i = 0; i < pages.length(); i++) {
                JSONObject p = pages.optJSONObject(i);
                if (p != null) sorted.add(p);
            }
        }
        sorted.sort((a, b) -> Integer.compare(a.optInt("index", Integer.MAX_VALUE), b.optInt("index", Integer.MAX_VALUE)));
        JSONArray results = new JSONArray();
        for (JSONObject page : sorted) {
            JSONArray infos = page.optJSONArray("imageinfo");
            JSONObject info = infos == null ? null : infos.optJSONObject(0);
            if (info == null || !"image/gif".equals(info.optString("mime"))) continue;
            long size = info.optLong("size");
            // Commons reports a duration only for animated GIFs.
            if (size <= 0 || size > MAX_BYTES || info.optDouble("duration", 0) <= 0) continue;
            String original = info.optString("url");
            if (original.isEmpty()) continue;
            String thumb = info.optString("thumburl", original);
            String title = page.optString("title").replaceFirst("^File:", "").replaceFirst("(?i)\\.gif$", "");
            JSONObject formats = new JSONObject()
                    .put("gif", format(original, info.optInt("width"), info.optInt("height"), size))
                    .put("tinygif", format(thumb, info.optInt("thumbwidth"), info.optInt("thumbheight"), 0));
            results.put(new JSONObject()
                    .put("id", "wikimedia~" + page.optLong("pageid"))
                    .put("title", title)
                    .put("content_description", title)
                    .put("url", info.optString("descriptionurl"))
                    .put("media_formats", formats));
        }
        JSONObject cont = root.optJSONObject("continue");
        String next = cont != null && cont.has("gsroffset") ? String.valueOf(cont.optInt("gsroffset")) : "";
        return new JSONObject().put("results", results).put("next", next).toString();
    }

    private static JSONObject format(String url, int width, int height, long size) throws Exception {
        return new JSONObject()
                .put("url", GifBridge.proxied(url))
                .put("dims", new JSONArray().put(width).put(height))
                .put("size", size);
    }

    private static int parse(String s, int fallback) {
        try {
            return s == null ? fallback : Integer.parseInt(s.trim());
        } catch (NumberFormatException e) {
            return fallback;
        }
    }

    private static int clamp(int v, int lo, int hi) {
        return Math.max(lo, Math.min(hi, v));
    }
}
