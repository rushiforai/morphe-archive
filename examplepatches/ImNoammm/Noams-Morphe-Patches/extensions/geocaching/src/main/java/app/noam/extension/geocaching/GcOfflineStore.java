package app.noam.extension.geocaching;


import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Caches kept on the device, one JSON file each in the app's files folder. */
public final class GcOfflineStore {
    private static final Pattern PATTERN_NAME = Pattern.compile(
        "<span id=\"ctl00_ContentBody_CacheName\".*?>(.*?)</span>", Pattern.DOTALL);
    private static final Pattern PATTERN_DESC = Pattern.compile(
        "<span [^>]*id=\"ctl00_ContentBody_LongDescription\"[^>]*>(.*?)</span>\\s*</div>\\s*<(p|div) id=\"ctl00_ContentBody",
        Pattern.DOTALL);
    private static final Pattern PATTERN_SHORTDESC = Pattern.compile(
        "<span [^>]*id=\"ctl00_ContentBody_ShortDescription\"[^>]*>(.*?)</span>\\s*</div>", Pattern.DOTALL);
    private static final Pattern PATTERN_HINT = Pattern.compile(
        "<div id=\"div_hint\"[^>]*>(.*?)</div>", Pattern.DOTALL);
    private static final Pattern PATTERN_OWNER = Pattern.compile(
        "<div id=\"ctl00_ContentBody_mcd1\"[^>]*>.*?<a href=\"[^\"]*[?&]guid=([0-9a-fA-F-]+)[^\"]*\"[^>]*>(.*?)</a>", Pattern.DOTALL);
    private static final Pattern PATTERN_LATLON = Pattern.compile(
        "<span id=\"uxLatLon\"[^>]*>(.*?)</span>", Pattern.DOTALL);
    private static final Pattern PATTERN_DEGREES = Pattern.compile(
        "([NS])\\s*(\\d{1,2})[^\\d]+(\\d{1,2}(?:[.,]\\d+)?)\\s*([EW])\\s*(\\d{1,3})[^\\d]+(\\d{1,2}(?:[.,]\\d+)?)",
        Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_PLACED = Pattern.compile(
        "<div id=\"ctl00_ContentBody_mcd2\"[^>]*>[^:]*:\\s*([^<]+)", Pattern.DOTALL);
    private static final Pattern PATTERN_LINEBREAK = Pattern.compile("<(br|p)[^>]*>");
    // c:geo's GCConstants patterns for difficulty/terrain stars and container size.
    private static final Pattern PATTERN_DIFFICULTY = Pattern.compile(
        "<span id=\"ctl00_ContentBody_uxLegendScale\"[^>]*>[^<]*<img src=\"[^\"]*/images/stars/stars([0-9_]+)\\.gif\"");
    private static final Pattern PATTERN_TERRAIN = Pattern.compile(
        "<span id=\"ctl00_ContentBody_Localize[0-9]+\"[^>]*>[^<]*<img src=\"[^\"]*/images/stars/stars([0-9_]+)\\.gif\"");
    private static final Pattern PATTERN_SIZE = Pattern.compile("/icons/container/([a-z_]+)\\.");
    private static final Pattern PATTERN_IMAGE = Pattern.compile(
        "<img\\b[^>]*?\\bsrc\\s*=\\s*(['\"])(.*?)\\1[^>]*>", Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
    private static final Pattern PATTERN_SRCSET = Pattern.compile(
        "\\s+srcset\\s*=\\s*(['\"]).*?\\1", Pattern.CASE_INSENSITIVE | Pattern.DOTALL);

    private GcOfflineStore() {}

    private static File dir() {
        File d = new File(Utils.context().getFilesDir(), "offline_caches");
        if (!d.exists()) d.mkdirs();
        return d;
    }

    private static File fileFor(String code) {
        return new File(dir(), code.replaceAll("[^A-Za-z0-9]", "") + ".json");
    }

    private static final int MAX_AUTO_COPIES = 300;

    /** Saved on purpose (Add to list), as opposed to the automatic copy of every opened cache. */
    public static boolean isDownloaded(String code) {
        JSONObject saved = code == null ? null : load(code);
        return saved != null && !saved.optBoolean("auto", false);
    }

    /** Downloads one cache's full data from geocaching.com and keeps it. Returns true on success. */
    public static boolean download(String code) {
        return save(code, null, false);
    }

    /** Keeps an automatic offline copy of a cache that was just opened, from the page already fetched. */
    public static void remember(String code, String page) {
        new Thread(() -> {
            if (save(code, page, true)) pruneAutoCopies();
        }).start();
    }

    private static synchronized void pruneAutoCopies() {
        File[] files = dir().listFiles((d, n) -> n.endsWith(".json"));
        if (files == null || files.length <= MAX_AUTO_COPIES) return;
        java.util.List<JSONObject> auto = new java.util.ArrayList<>();
        for (File f : files) {
            JSONObject o = load(f.getName().replace(".json", ""));
            if (o != null && o.optBoolean("auto", false)) auto.add(o);
        }
        if (auto.size() <= MAX_AUTO_COPIES) return;
        java.util.Collections.sort(auto, (a, b) -> Long.compare(a.optLong("downloadedAt"), b.optLong("downloadedAt")));
        for (int i = 0; i < auto.size() - MAX_AUTO_COPIES; i++) delete(auto.get(i).optString("code"));
    }

    private static boolean save(String code, String fetchedPage, boolean auto) {
        if (code == null || code.isEmpty()) return false;
        try {
            JSONObject previous = load(code);
            String page = fetchedPage;
            if (page == null) {
                if (!GcLiveSession.ensureSession()) return false;
                page = GcLiveSession.get("https://www.geocaching.com/geocache/" + code);
            }

            JSONObject o = new JSONObject();
            o.put("code", code);
            o.put("auto", auto && (previous == null || previous.optBoolean("auto", false)));
            o.put("downloadedAt", previous != null && !o.optBoolean("auto")
                ? previous.optLong("downloadedAt", System.currentTimeMillis()) : System.currentTimeMillis());

            JSONObject cached = GcLiveSearch.cachedResult(code);
            String name = firstGroup(PATTERN_NAME, page);
            if (name == null) name = cached != null ? cached.optString("name", code) : code;
            o.put("name", decodeHtml(name));
            Matcher ownerMatch = PATTERN_OWNER.matcher(page);
            if (ownerMatch.find()) {
                o.put("ownerGuid", ownerMatch.group(1));
                o.put("owner", decodeHtml(ownerMatch.group(2)));
            }
            o.put("premiumOnly", page.contains("class=\"illustration lock-icon\"")
                || (cached != null && cached.optBoolean("premiumOnly", false)));

            // Prefer the search-result JSON (reliable); otherwise parse the page like c:geo.
            double difficulty = cached != null ? cached.optDouble("difficulty", 0) : parseStars(PATTERN_DIFFICULTY, page);
            double terrain = cached != null ? cached.optDouble("terrain", 0) : parseStars(PATTERN_TERRAIN, page);
            if (difficulty <= 0) difficulty = parseStars(PATTERN_DIFFICULTY, page);
            if (terrain <= 0) terrain = parseStars(PATTERN_TERRAIN, page);
            o.put("difficulty", difficulty > 0 ? difficulty : 1.0);
            o.put("terrain", terrain > 0 ? terrain : 1.0);

            int containerType = cached != null ? cached.optInt("containerType", 0) : 0;
            if (containerType <= 0) containerType = sizeNameToId(firstGroup(PATTERN_SIZE, page));
            o.put("containerType", containerType > 0 ? containerType : 8);

            o.put("geocacheType", cached != null ? cached.optInt("geocacheType", 2) : 2);
            if (cached != null) {
                o.put("favoritePoints", cached.optInt("favoritePoints", 0));
                o.put("trackableCount", cached.optInt("trackableCount", 0));
                o.put("placedDate", cached.optString("placedDate", ""));
                JSONObject owner = cached.optJSONObject("owner");
                if (owner != null) {
                    if (!o.has("owner")) o.put("owner", owner.optString("username", ""));
                    if (!o.has("ownerGuid")) o.put("ownerGuid", owner.optString("guid", ""));
                    o.put("ownerCode", owner.optString("code", ""));
                }
                JSONObject posted = cached.optJSONObject("postedCoordinates");
                if (posted != null) {
                    o.put("latitude", posted.optDouble("latitude", 0));
                    o.put("longitude", posted.optDouble("longitude", 0));
                }
            }
            double[] pageCoordinates = pageCoordinates(page);
            if (pageCoordinates != null && (o.optDouble("latitude", 0) == 0 || o.optDouble("longitude", 0) == 0)) {
                o.put("latitude", pageCoordinates[0]);
                o.put("longitude", pageCoordinates[1]);
            }
            if (o.optString("placedDate", "").isEmpty()) {
                String pageDate = pagePlacedDate(page);
                if (!pageDate.isEmpty()) o.put("placedDate", pageDate);
            }

            Map<String, String> images = new HashMap<>();
            boolean[] imagesComplete = {true};
            o.put("shortDescription", cacheImages(nullToEmpty(firstGroup(PATTERN_SHORTDESC, page)), images, imagesComplete));
            o.put("longDescription", cacheImages(nullToEmpty(firstGroup(PATTERN_DESC, page)), images, imagesComplete));
            o.put("imagesCached", imagesComplete[0]);
            String hint = firstGroup(PATTERN_HINT, page);
            o.put("hint", hint == null ? "" : decodeHint(hint));
            o.put("hintDecoded", true);

            byte[] bytes = o.toString().getBytes(StandardCharsets.UTF_8);
            File f = fileFor(code);
            try (FileOutputStream out = new FileOutputStream(f)) {
                out.write(bytes);
            }
            Utils.log((o.optBoolean("auto") ? "Kept offline copy of " : "Downloaded ") + code + " (" + bytes.length + " bytes)");
            return true;
        } catch (Throwable t) {
            Utils.logError("Offline download failed for " + code, t);
            return false;
        }
    }

    /** Refreshes older saved entries so their description images also work offline. */
    public static void cacheMissingImages() {
        JSONArray caches = all();
        for (int i = 0; i < caches.length(); i++) {
            JSONObject cache = caches.optJSONObject(i);
            if (cache != null && (!cache.optBoolean("imagesCached", false)
                || !cache.optBoolean("hintDecoded", false) || !cache.has("ownerGuid")
                || cache.optDouble("latitude", 0) == 0 || cache.optString("placedDate", "").isEmpty())) {
                download(cache.optString("code", ""));
            }
        }
    }

    private static String cacheImages(String html, Map<String, String> images, boolean[] complete) {
        Matcher matcher = PATTERN_IMAGE.matcher(html);
        StringBuffer result = new StringBuffer();
        while (matcher.find()) {
            String tag = matcher.group();
            String source = matcher.group(2).replace("&amp;", "&");
            try {
                String url = new URI("https://www.geocaching.com/geocache/").resolve(source).toString();
                // Older descriptions link images over http; the hosts serve the same files over https.
                if (url.startsWith("http://")) url = "https://" + url.substring(7);
                if (!url.startsWith("https://")) throw new IllegalArgumentException("Not a web image");
                String data = images.get(url);
                if (data == null) {
                    if (images.size() >= 20) throw new IllegalArgumentException("Too many images");
                    byte[] bytes = GcLiveSession.getImage(url);
                    String mime = bytes.length > 3 && bytes[0] == (byte) 0x89 && bytes[1] == 'P'
                        ? "image/png" : bytes.length > 3 && bytes[0] == 'G' && bytes[1] == 'I'
                        ? "image/gif" : bytes.length > 11 && bytes[0] == 'R' && bytes[8] == 'W'
                        ? "image/webp" : "image/jpeg";
                    data = "data:" + mime + ";base64," + android.util.Base64.encodeToString(bytes, android.util.Base64.NO_WRAP);
                    images.put(url, data);
                }
                tag = tag.substring(0, matcher.start(2) - matcher.start()) + data
                    + tag.substring(matcher.end(2) - matcher.start());
                tag = PATTERN_SRCSET.matcher(tag).replaceAll("");
            } catch (Exception e) {
                complete[0] = false;
                Utils.log("Offline copy skips image " + source + " (" + e.getMessage() + ")");
            }
            matcher.appendReplacement(result, Matcher.quoteReplacement(tag));
        }
        matcher.appendTail(result);
        return result.toString();
    }

    public static boolean delete(String code) {
        File f = fileFor(code);
        return f.exists() && f.delete();
    }

    public static JSONObject load(String code) {
        try {
            File f = fileFor(code);
            if (!f.exists()) return null;
            byte[] data = new byte[(int) f.length()];
            try (java.io.FileInputStream in = new java.io.FileInputStream(f)) {
                int read = 0;
                while (read < data.length) {
                    int n = in.read(data, read, data.length - read);
                    if (n < 0) break;
                    read += n;
                }
            }
            return new JSONObject(new String(data, StandardCharsets.UTF_8));
        } catch (Throwable t) {
            Utils.logError("Offline load failed for " + code, t);
            return null;
        }
    }

    /** All caches saved on purpose, as JSON objects (unsorted). */
    public static JSONArray all() {
        JSONArray arr = new JSONArray();
        File[] files = dir().listFiles((d, n) -> n.endsWith(".json"));
        if (files != null) {
            for (File f : files) {
                JSONObject o = load(f.getName().replace(".json", ""));
                if (o != null && !o.optBoolean("auto", false)) arr.put(o);
            }
        }
        return arr;
    }

    public static int count() {
        return all().length();
    }

    private static String firstGroup(Pattern pattern, String page) {
        Matcher m = pattern.matcher(page);
        return m.find() ? m.group(1) : null;
    }

    private static String nullToEmpty(String s) {
        return s == null ? "" : s;
    }

    public static String decode(String s) { return decodeHtml(s); }
    public static String pageOwnerGuid(String page) {
        Matcher match = PATTERN_OWNER.matcher(page);
        return match.find() ? match.group(1) : "";
    }
    public static String pageOwnerName(String page) {
        Matcher match = PATTERN_OWNER.matcher(page);
        return match.find() ? decodeHtml(match.group(2)) : "";
    }
    public static double[] pageCoordinates(String page) {
        Matcher match = PATTERN_LATLON.matcher(page);
        if (!match.find()) return null;
        Matcher values = PATTERN_DEGREES.matcher(decodeHtml(match.group(1)));
        if (!values.find()) return null;
        try {
            double lat = Double.parseDouble(values.group(2)) + Double.parseDouble(values.group(3).replace(',', '.')) / 60;
            double lon = Double.parseDouble(values.group(5)) + Double.parseDouble(values.group(6).replace(',', '.')) / 60;
            if (values.group(1).equalsIgnoreCase("S")) lat = -lat;
            if (values.group(4).equalsIgnoreCase("W")) lon = -lon;
            return new double[]{lat, lon};
        } catch (NumberFormatException e) {
            return null;
        }
    }
    public static String pagePlacedDate(String page) {
        Matcher match = PATTERN_PLACED.matcher(page);
        if (!match.find()) return "";
        String value = decodeHtml(match.group(1));
        try {
            java.text.SimpleDateFormat source = new java.text.SimpleDateFormat("M/d/yyyy", java.util.Locale.US);
            source.setLenient(false);
            java.text.SimpleDateFormat target = new java.text.SimpleDateFormat("yyyy-MM-dd'T'00:00:00'Z'", java.util.Locale.US);
            return target.format(source.parse(value));
        } catch (Exception e) {
            return "";
        }
    }
    public static String decodeHint(String html) {
        String value = decodeHtml(PATTERN_LINEBREAK.matcher(html).replaceAll("\n"));
        StringBuilder decoded = new StringBuilder(value.length());
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (c >= 'a' && c <= 'z') c = (char) ('a' + (c - 'a' + 13) % 26);
            else if (c >= 'A' && c <= 'Z') c = (char) ('A' + (c - 'A' + 13) % 26);
            decoded.append(c);
        }
        return decoded.toString();
    }
    public static double pageDifficulty(String page) { return parseStars(PATTERN_DIFFICULTY, page); }
    public static double pageTerrain(String page) { return parseStars(PATTERN_TERRAIN, page); }
    public static int pageSize(String page) { return sizeNameToId(firstGroup(PATTERN_SIZE, page)); }

    /** Decodes HTML entities (and strips any tags) from a short string like a cache name. */
    @SuppressWarnings("deprecation")
    private static String decodeHtml(String s) {
        if (s == null) return "";
        try {
            return android.text.Html.fromHtml(s).toString().trim();
        } catch (Throwable t) {
            return s.trim();
        }
    }

    /** "2" -> 2.0, "2_5" -> 2.5 (c:geo encodes the half-star with an underscore). */
    private static double parseStars(Pattern pattern, String page) {
        String raw = firstGroup(pattern, page);
        if (raw == null) return 0;
        try {
            return Double.parseDouble(raw.replace('_', '.'));
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private static int sizeNameToId(String name) {
        if (name == null) return 0;
        switch (name) {
            case "micro": return 2;
            case "regular": return 3;
            case "large": return 4;
            case "small": return 8;
            case "virtual": return 5;
            case "not_chosen": return 1;
            default: return 6; // other
        }
    }
}
