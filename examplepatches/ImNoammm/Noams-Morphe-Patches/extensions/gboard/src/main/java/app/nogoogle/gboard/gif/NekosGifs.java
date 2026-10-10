package app.nogoogle.gboard.gif;

import android.net.Uri;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * nekos.best as a GIF source (no account or key): anime reaction GIFs by reaction (hug, wave,
 * laugh...), answered in Tenor v2 form. A search for a reaction (or a common word for one) lists
 * that reaction; any other search matches anime titles.
 */
final class NekosGifs {
    private static final String API = "https://nekos.best/api/v2/";
    private static final int PER_PAGE = 20;
    private static final int MAX_PAGES = 10; // each page is a new random draw
    private static final String[] FEATURED = {"wave", "happy", "hug", "laugh", "smile", "thumbsup"};
    // From https://nekos.best/api/v2/endpoints (the GIF ones).
    private static final Set<String> REACTIONS = new HashSet<>(Arrays.asList(
            "angry", "baka", "bite", "bleh", "blowkiss", "blush", "bonk", "bored", "carry", "clap",
            "confused", "cry", "cuddle", "dance", "facepalm", "feed", "handhold", "handshake", "happy",
            "highfive", "hug", "kabedon", "kick", "kiss", "lappillow", "laugh", "lurk", "nod", "nom",
            "nope", "nya", "pat", "peck", "poke", "pout", "punch", "run", "salute", "shake", "shocked",
            "shoot", "shrug", "sip", "sleep", "slap", "smile", "smug", "spin", "stare", "tableflip",
            "teehee", "think", "thumbsup", "tickle", "wag", "wave", "wink", "yawn", "yeet"));
    private static final Map<String, String> WORDS = new HashMap<>();

    static {
        String[][] pairs = {
                {"hi", "wave"}, {"hello", "wave"}, {"hey", "wave"}, {"bye", "wave"}, {"goodbye", "wave"},
                {"lol", "laugh"}, {"haha", "laugh"}, {"funny", "laugh"}, {"sad", "cry"}, {"crying", "cry"},
                {"love", "hug"}, {"hugs", "hug"}, {"thanks", "thumbsup"}, {"thank you", "thumbsup"},
                {"ok", "nod"}, {"okay", "nod"}, {"yes", "nod"}, {"no", "nope"}, {"mad", "angry"},
                {"sleepy", "sleep"}, {"tired", "yawn"}, {"idk", "shrug"}, {"i don't know", "shrug"},
                {"omg", "shocked"}, {"wow", "shocked"}, {"sorry", "pout"}, {"please", "pout"},
                {"excited", "happy"}, {"congratulations", "clap"}, {"congrats", "clap"}, {"yay", "happy"},
        };
        for (String[] p : pairs) WORDS.put(p[0], p[1]);
    }

    private NekosGifs() {
    }

    static GifBridge.Result answer(String endpoint, Uri tenor) throws Exception {
        String filter = tenor.getQueryParameter("searchfilter");
        if (filter != null && filter.contains("sticker")) return GifBridge.Result.ok("{\"results\":[],\"next\":\"\"}");
        int page = Math.max(0, parse(tenor.getQueryParameter("pos")));
        switch (endpoint) {
            case "featured":
                return reaction(FEATURED[page % FEATURED.length], page);
            case "search": {
                String q = tenor.getQueryParameter("q");
                q = q == null ? "" : q.trim().toLowerCase(Locale.ROOT);
                String reaction = REACTIONS.contains(q) ? q : WORDS.get(q);
                if (reaction != null) return reaction(reaction, page);
                if (q.isEmpty()) return reaction(FEATURED[0], page);
                Uri url = Uri.parse(API + "search").buildUpon().appendQueryParameter("query", q)
                        .appendQueryParameter("type", "2").appendQueryParameter("amount", String.valueOf(PER_PAGE))
                        .build();
                GifBridge.Result r = GifBridge.fetch(url.toString());
                return r.ok() ? GifBridge.Result.ok(toTenor(r.text(), -1)) : r;
            }
            case "posts":
                return posts(tenor.getQueryParameter("ids"));
            default: // autocomplete, trending_terms, search_suggestions
                return GifBridge.Result.ok("{\"results\":[]}");
        }
    }

    private static GifBridge.Result reaction(String reaction, int page) throws Exception {
        GifBridge.Result r = GifBridge.fetch(API + reaction + "?amount=" + PER_PAGE);
        return r.ok() ? GifBridge.Result.ok(toTenor(r.text(), page)) : r;
    }

    /** nekos.best answer → Tenor v2 (page < 0: no further pages). */
    static String toTenor(String json, int page) throws Exception {
        JSONArray in = new JSONObject(json).optJSONArray("results");
        JSONArray out = new JSONArray();
        for (int i = 0; in != null && i < in.length(); i++) {
            JSONObject g = in.optJSONObject(i);
            if (g == null) continue;
            String url = g.optString("url");
            String id = idOf(url);
            if (id == null) continue;
            JSONObject dims = g.optJSONObject("dimensions");
            out.put(result(id, url, g.optString("anime_name"),
                    dims == null ? 498 : dims.optInt("width", 498), dims == null ? 280 : dims.optInt("height", 280)));
        }
        String next = page >= 0 && page + 1 < MAX_PAGES ? String.valueOf(page + 1) : "";
        return new JSONObject().put("results", out).put("next", next).toString();
    }

    /** ".../api/v2/hug/<uuid>.gif" → "hug/<uuid>". */
    private static String idOf(String url) {
        if (!url.startsWith(API) || !url.endsWith(".gif")) return null;
        String id = url.substring(API.length(), url.length() - 4);
        return id.indexOf('/') > 0 ? id : null;
    }

    private static JSONObject result(String id, String url, String anime, int width, int height) throws Exception {
        String reaction = id.substring(0, id.indexOf('/'));
        String title = anime.isEmpty() ? reaction : reaction + " (" + anime + ")";
        JSONObject gif = new JSONObject().put("url", GifBridge.proxied(url))
                .put("dims", new JSONArray().put(width).put(height)).put("size", 0);
        return new JSONObject().put("id", "nekos~" + id).put("title", title)
                .put("content_description", title).put("url", "https://nekos.best")
                .put("media_formats", new JSONObject().put("gif", gif).put("tinygif", gif));
    }

    /** The GIF URL is in the id, so known GIFs need no request. */
    private static GifBridge.Result posts(String ids) throws Exception {
        JSONArray out = new JSONArray();
        if (ids != null) {
            for (String id : ids.split(",")) {
                if (id.indexOf('/') > 0 && id.matches("[a-z]+/[0-9a-f-]+")) {
                    out.put(result(id, API + id + ".gif", "", 498, 280));
                }
            }
        }
        return GifBridge.Result.ok(new JSONObject().put("results", out).toString());
    }

    private static int parse(String s) {
        try {
            return s == null || s.isEmpty() ? 0 : Integer.parseInt(s.trim());
        } catch (NumberFormatException e) {
            return 0;
        }
    }
}
