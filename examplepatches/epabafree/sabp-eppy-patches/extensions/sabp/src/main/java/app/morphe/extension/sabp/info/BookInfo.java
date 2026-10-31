package app.morphe.extension.sabp.info;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Optional online book information, behind a common provider interface.
 *
 * <p>Off by default. Nothing is sent anywhere until the user turns on "Online lookups" in
 * Settings → Book information sources. Only the book's title (and the author, if known) is sent,
 * and only to the providers the user enabled. Results are shown as candidates to choose from; nothing
 * is linked to a book automatically unless the user picks "automatic" and the match is unambiguous.
 * Every field remembers which provider it came from.
 */
public final class BookInfo {

    /** A normalised result from any provider. */
    public static final class Record {
        public String providerId, providerName, sourceUrl;
        public String title, subtitle, authors, year, description, isbn, subjects;
        public long fetchedAt;

        JSONObject toJson() throws Exception {
            JSONObject o = new JSONObject();
            o.put("provider", providerId).put("providerName", providerName).put("url", sourceUrl)
                    .put("title", title).put("subtitle", subtitle).put("authors", authors).put("year", year)
                    .put("description", description).put("isbn", isbn).put("subjects", subjects).put("fetchedAt", fetchedAt);
            return o;
        }

        static Record fromJson(JSONObject o) {
            Record r = new Record();
            r.providerId = o.optString("provider");
            r.providerName = o.optString("providerName");
            r.sourceUrl = o.optString("url");
            r.title = o.optString("title");
            r.subtitle = o.optString("subtitle");
            r.authors = o.optString("authors");
            r.year = o.optString("year");
            r.description = o.optString("description");
            r.isbn = o.optString("isbn");
            r.subjects = o.optString("subjects");
            r.fetchedAt = o.optLong("fetchedAt");
            return r;
        }
    }

    /** One information source. */
    public interface Provider {
        String id();

        String name();

        /** What is sent, and whether an account/key is needed (shown in Settings). */
        String about();

        boolean needsKey();

        List<Record> search(Context c, String title, String author) throws Exception;

        /** Fills fields that need a second request (e.g. description). */
        void complete(Context c, Record r) throws Exception;
    }

    public static final Provider[] PROVIDERS = {new OpenLibrary(), new GoogleBooks()};
    private static final String UA = "eppy-sabp/0.4 (https://github.com/epabafree/sabp-eppy-patches)";
    private static final long CACHE_DAYS = 90;

    private BookInfo() {
    }

    // ---- settings -------------------------------------------------------------------------------

    public static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences("eppy_bookinfo", Context.MODE_PRIVATE);
    }

    public static boolean onlineEnabled(Context c) {
        return prefs(c).getBoolean("online", false) && app.morphe.extension.sabp.EppyFlags.on(c, app.morphe.extension.sabp.EppyFlags.ONLINE_LOOKUP);
    }

    public static boolean automatic(Context c) {
        return prefs(c).getBoolean("auto", false);
    }

    public static boolean providerEnabled(Context c, Provider p) {
        return prefs(c).getBoolean("enabled:" + p.id(), !p.needsKey());
    }

    public static String apiKey(Context c, Provider p) {
        return prefs(c).getString("key:" + p.id(), "");
    }

    /** Providers in the user's order. */
    public static List<Provider> ordered(Context c) {
        String order = prefs(c).getString("order", "openlibrary,googlebooks");
        ArrayList<Provider> out = new ArrayList<>();
        for (String id : order.split(",")) for (Provider p : PROVIDERS) if (p.id().equals(id) && !out.contains(p)) out.add(p);
        for (Provider p : PROVIDERS) if (!out.contains(p)) out.add(p);
        return out;
    }

    public static void move(Context c, Provider p, int delta) {
        List<Provider> list = ordered(c);
        int i = list.indexOf(p), j = Math.max(0, Math.min(list.size() - 1, i + delta));
        list.remove(i);
        list.add(j, p);
        StringBuilder b = new StringBuilder();
        for (Provider x : list) b.append(b.length() > 0 ? "," : "").append(x.id());
        prefs(c).edit().putString("order", b.toString()).apply();
    }

    // ---- cache ----------------------------------------------------------------------------------

    public static Record cached(Context c, String folderUri) {
        String s = prefs(c).getString("book:" + folderUri, null);
        if (s == null) return null;
        try {
            Record r = Record.fromJson(new JSONObject(s));
            if (System.currentTimeMillis() - r.fetchedAt > CACHE_DAYS * 86_400_000L) return null;
            return r;
        } catch (Throwable t) {
            prefs(c).edit().remove("book:" + folderUri).apply();
            return null;
        }
    }

    public static void save(Context c, String folderUri, Record r) {
        try {
            prefs(c).edit().putString("book:" + folderUri, r.toJson().toString()).apply();
        } catch (Throwable ignored) {
        }
    }

    public static void forget(Context c, String folderUri) {
        prefs(c).edit().remove("book:" + folderUri).apply();
    }

    public static void clearCache(Context c) {
        SharedPreferences.Editor e = prefs(c).edit();
        for (String k : prefs(c).getAll().keySet()) if (k.startsWith("book:")) e.remove(k);
        e.apply();
    }

    /** Searches enabled providers in order; errors are collected per provider, never thrown. */
    public static List<Record> searchAll(Context c, String title, String author, List<String> errors) {
        ArrayList<Record> out = new ArrayList<>();
        for (Provider p : ordered(c)) {
            if (!providerEnabled(c, p)) continue;
            if (p.needsKey() && apiKey(c, p).isEmpty()) {
                errors.add(p.name() + ": needs an API key (Settings → Book information sources).");
                continue;
            }
            try {
                out.addAll(p.search(c, title, author));
            } catch (Throwable t) {
                errors.add(p.name() + ": " + friendly(t));
            }
        }
        return out;
    }

    static String friendly(Throwable t) {
        String m = t.getMessage() != null ? t.getMessage() : "";
        if (t instanceof java.net.UnknownHostException) return "offline or the service can't be reached.";
        if (t instanceof java.net.SocketTimeoutException) return "the service didn't answer in time.";
        if (m.startsWith("HTTP 429")) return "too many requests right now; try again later.";
        if (m.startsWith("HTTP 4")) return "the request was refused (" + m + "). Check the API key.";
        if (m.startsWith("HTTP 5")) return "the service is having problems (" + m + ").";
        return t.getClass().getSimpleName() + (m.isEmpty() ? "" : ": " + m);
    }

    /** Title similarity used to decide whether an automatic pick is unambiguous. */
    public static boolean sameTitle(String a, String b) {
        return norm(a).equals(norm(b));
    }

    static String norm(String s) {
        return s == null ? "" : s.toLowerCase(Locale.ROOT).replaceAll("\\(.*?\\)|\\[.*?]", " ").replaceAll("[^\\p{L}\\p{N}]+", " ").trim();
    }

    // ---- http -------------------------------------------------------------------------------------

    static String get(String url) throws Exception {
        HttpURLConnection con = (HttpURLConnection) new URL(url).openConnection();
        con.setConnectTimeout(10_000);
        con.setReadTimeout(15_000);
        con.setRequestProperty("User-Agent", UA);
        con.setRequestProperty("Accept", "application/json");
        try {
            int code = con.getResponseCode();
            if (code / 100 != 2) throw new java.io.IOException("HTTP " + code);
            try (InputStream in = con.getInputStream(); BufferedReader r = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {
                StringBuilder b = new StringBuilder();
                char[] buf = new char[8192];
                int n;
                while ((n = r.read(buf)) > 0 && b.length() < 2_000_000) b.append(buf, 0, n);
                return b.toString();
            }
        } finally {
            con.disconnect();
        }
    }

    static String enc(String s) throws Exception {
        return URLEncoder.encode(s, "UTF-8");
    }

    static String stripHtml(String s) {
        if (s == null) return "";
        return s.replaceAll("<br\\s*/?>", "\n").replaceAll("<[^>]+>", "").replace("&amp;", "&").replace("&quot;", "\"")
                .replace("&#39;", "'").replaceAll("[ \\t]+", " ").trim();
    }

    // ---- providers ------------------------------------------------------------------------------

    /** Open Library (Internet Archive). No key; identifies itself with a User-Agent as requested. */
    static final class OpenLibrary implements Provider {
        public String id() {
            return "openlibrary";
        }

        public String name() {
            return "Open Library";
        }

        public String about() {
            return "No account or key. Sends the book's title and author to openlibrary.org. eppy identifies itself with a "
                    + "User-Agent as Open Library asks, and stays within its rate limits.";
        }

        public boolean needsKey() {
            return false;
        }

        public List<Record> search(Context c, String title, String author) throws Exception {
            String url = "https://openlibrary.org/search.json?limit=6&fields=key,title,subtitle,author_name,first_publish_year,isbn,subject&title="
                    + enc(title) + (author != null && !author.isEmpty() ? "&author=" + enc(author) : "");
            JSONObject o = new JSONObject(get(url));
            JSONArray docs = o.optJSONArray("docs");
            ArrayList<Record> out = new ArrayList<>();
            if (docs == null) return out;
            for (int i = 0; i < docs.length(); i++) {
                JSONObject d = docs.getJSONObject(i);
                Record r = new Record();
                r.providerId = id();
                r.providerName = name();
                r.title = d.optString("title");
                r.subtitle = d.optString("subtitle");
                r.authors = join(d.optJSONArray("author_name"), 3);
                r.year = d.has("first_publish_year") ? String.valueOf(d.optInt("first_publish_year")) : "";
                r.isbn = first(d.optJSONArray("isbn"));
                r.subjects = join(d.optJSONArray("subject"), 6);
                r.sourceUrl = "https://openlibrary.org" + d.optString("key");
                out.add(r);
            }
            return out;
        }

        public void complete(Context c, Record r) throws Exception {
            if (r.sourceUrl == null || !r.sourceUrl.contains("/works/")) return;
            JSONObject w = new JSONObject(get(r.sourceUrl + ".json"));
            Object d = w.opt("description");
            if (d instanceof JSONObject) r.description = ((JSONObject) d).optString("value");
            else if (d instanceof String) r.description = (String) d;
            r.description = stripHtml(r.description);
        }
    }

    /** Google Books. Requires the user's own API key (per Google's documentation). */
    static final class GoogleBooks implements Provider {
        public String id() {
            return "googlebooks";
        }

        public String name() {
            return "Google Books";
        }

        public String about() {
            return "Needs your own free API key from the Google Cloud console (Books API). Sends the title, author and your key to "
                    + "googleapis.com. Descriptions are publisher-supplied when available.";
        }

        public boolean needsKey() {
            return true;
        }

        public List<Record> search(Context c, String title, String author) throws Exception {
            String q = "intitle:" + title + (author != null && !author.isEmpty() ? "+inauthor:" + author : "");
            String url = "https://www.googleapis.com/books/v1/volumes?maxResults=6&printType=books&q=" + enc(q) + "&key=" + enc(apiKey(c, this));
            JSONObject o = new JSONObject(get(url));
            JSONArray items = o.optJSONArray("items");
            ArrayList<Record> out = new ArrayList<>();
            if (items == null) return out;
            for (int i = 0; i < items.length(); i++) {
                JSONObject v = items.getJSONObject(i).optJSONObject("volumeInfo");
                if (v == null) continue;
                Record r = new Record();
                r.providerId = id();
                r.providerName = name();
                r.title = v.optString("title");
                r.subtitle = v.optString("subtitle");
                r.authors = join(v.optJSONArray("authors"), 3);
                String date = v.optString("publishedDate");
                r.year = date.length() >= 4 ? date.substring(0, 4) : date;
                r.description = stripHtml(v.optString("description"));
                r.subjects = join(v.optJSONArray("categories"), 6);
                JSONArray ids = v.optJSONArray("industryIdentifiers");
                if (ids != null && ids.length() > 0) r.isbn = ids.getJSONObject(0).optString("identifier");
                r.sourceUrl = v.optString("infoLink");
                out.add(r);
            }
            return out;
        }

        public void complete(Context c, Record r) {
        }
    }

    private static String join(JSONArray a, int max) {
        if (a == null) return "";
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < Math.min(max, a.length()); i++) b.append(i > 0 ? ", " : "").append(a.optString(i));
        return b.toString();
    }

    private static String first(JSONArray a) {
        return a != null && a.length() > 0 ? a.optString(0) : "";
    }
}
