package app.ayham.extension.music.features;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Animated covers' lookup: BitChord's AppleMusicCanvas ported to plain
 * Java. Scrapes the web player's anonymous token, searches the catalog, scores the hits the same
 * way (artist gate, title, album, edition words, compilations dropped) and returns the square
 * motion clip (HLS) of the song's album, or null.
 */
final class AppleCanvas {
    private static final String TAG = "Ayham";
    private static final String AMP = "https://amp-api.music.apple.com/v1/catalog/";
    private static final String UA = "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0 Mobile Safari/537.36";
    private static final int MIN_SCORE = 12;
    /** Any answer read: the web player's script bundles are a few MB, catalog JSON and pages far less. */
    private static final long MAX_ANSWER_BYTES = 32L * 1024 * 1024;
    private static final String[] EDITION = {"deluxe", "expanded", "remastered", "remix", "version", "edit", "mix", "bonus"};
    private static final String[] COMPILATION = {"playlist", "set list", "essentials", "dj mix", "mixed", "apple music", "today's hits", "session"};

    private static String token;
    private static long tokenExpires;
    private static long retryAfter;
    /** Tokens the catalog has refused (401). */
    private static final java.util.Set<String> rejected = new java.util.HashSet<>();

    private AppleCanvas() {
    }

    /**
     * Off the main thread. The clip to show and the other shape's ({preferred, alternate or null}):
     * the tall 3:4 one first when [tall] (full-screen art), else the square one; null when none.
     * Prism's rules: every credited artist must match, compilation albums are skipped for the next
     * hit, and without a token or a hit the public album page is read instead.
     */
    static String[] find(String title, String artist, String album, boolean tall) throws Exception {
        // the square art: Morphe's lookup (Morphe ships it: ours goes); the tall clip only ours has
        if (!tall && MorpheApple.available()) {
            String url = MorpheApple.find(title, artist, album);
            return url == null ? null : trustedPair(url, null);
        }
        String bearer = token();
        if (bearer == null) {
            String[] page = applePage(artist, title, tall);
            if (page != null) return page;
            throw new IllegalStateException("no Apple token"); // an error, not a miss: not saved
        }
        Log.i(TAG, "canvas: token ok (" + bearer.length() + " chars)");
        String store = Locale.getDefault().getCountry().length() == 2
                ? Locale.getDefault().getCountry().toLowerCase(Locale.ROOT) : "us";
        String term = term(title, artist, album);
        JSONObject root = new JSONObject(get(AMP + store + "/search?types=songs&limit=10&extend=editorialVideo&include=albums&term="
                + URLEncoder.encode(term, "UTF-8"), bearer));
        JSONObject songs = root.optJSONObject("results") == null ? null : root.optJSONObject("results").optJSONObject("songs");
        JSONArray hits = songs == null ? null : songs.optJSONArray("data");
        if (hits == null) {
            Log.i(TAG, "canvas: no Apple songs for '" + term + "' in store " + store);
            return applePage(artist, title, tall);
        }
        Log.i(TAG, "canvas: " + hits.length() + " Apple hits for '" + term + "' in store " + store);

        // every hit that passes, best first (ties in Apple's order)
        Integer[] scores = new Integer[hits.length()];
        for (int i = 0; i < hits.length(); i++) {
            JSONObject a = hits.getJSONObject(i).optJSONObject("attributes");
            scores[i] = a == null ? null : score(a.optString("name"), a.optString("artistName"), a.optString("albumName"), title, artist, album);
        }
        int[] passing = rank(scores);
        if (passing.length == 0) Log.i(TAG, "canvas: no Apple hit scored " + MIN_SCORE + "+ for '" + title + "'");
        int albumsRead = 0;
        for (int k = 0; k < passing.length && albumsRead < 3; k++) {
            JSONObject best = hits.getJSONObject(passing[k]);
            JSONObject attrs = best.getJSONObject("attributes");
            String[] urls = motion(attrs.optJSONObject("editorialVideo"), tall);
            if (urls != null) return urls;
            String albumId = null;
            JSONObject rel = best.optJSONObject("relationships");
            if (rel != null && rel.optJSONObject("albums") != null) {
                JSONArray d = rel.getJSONObject("albums").optJSONArray("data");
                if (d != null && d.length() > 0) albumId = d.getJSONObject(0).optString("id", null);
            }
            if (albumId == null) {
                Matcher m = Pattern.compile("/album/[^?]*/(\\d+)").matcher(attrs.optString("url"));
                if (m.find()) albumId = m.group(1);
            }
            Log.i(TAG, "canvas: hit '" + attrs.optString("name") + "' by " + attrs.optString("artistName")
                    + " (score " + scores[passing[k]] + "), album " + albumId + " / " + attrs.optString("albumName"));
            if (albumId == null || albumId.startsWith("pl.")) continue;
            albumsRead++;
            JSONObject record = new JSONObject(get(AMP + store + "/albums/" + albumId + "?extend=editorialVideo", bearer))
                    .getJSONArray("data").getJSONObject(0).getJSONObject("attributes");
            if (compilation(record.optString("name"))) {
                Log.i(TAG, "canvas: album '" + record.optString("name") + "' is a compilation, next hit");
                continue;
            }
            String[] clip = motion(record.optJSONObject("editorialVideo"), tall);
            Log.i(TAG, "canvas: album '" + record.optString("name") + "' " + (clip == null ? "has no motion art" : "has motion art"));
            if (clip != null) return clip;
        }
        return passing.length == 0 ? applePage(artist, title, tall) : null;
    }

    /** BitChord's search term: the artist (unless the title holds it), the title, and the album (unless the title holds it). */
    static String term(String title, String artist, String album) {
        String lt = title.toLowerCase(Locale.ROOT);
        StringBuilder b = new StringBuilder();
        if (!lt.contains(artist.toLowerCase(Locale.ROOT))) b.append(artist).append(' ');
        b.append(title);
        if (album != null && !album.trim().isEmpty() && !lt.contains(album.toLowerCase(Locale.ROOT))) b.append(' ').append(album);
        return b.toString();
    }

    /** The hits to try, best score first (ties in Apple's order); a hit under MIN_SCORE (or rejected: null) ends the list. */
    static int[] rank(Integer[] scores) {
        java.util.List<Integer> order = new java.util.ArrayList<>();
        for (int i = 0; i < scores.length; i++) {
            if (scores[i] == null || scores[i] < MIN_SCORE) continue;
            int at = 0;
            while (at < order.size() && scores[order.get(at)] >= scores[i]) at++;
            order.add(at, i);
        }
        int[] out = new int[order.size()];
        for (int i = 0; i < out.length; i++) out[i] = order.get(i);
        return out;
    }

    /**
     * Prism's applePage: the iTunes search for the album (named [album], often the single's title)
     * by every credited artist, and the motion clips in its public page's markup.
     */
    private static String[] applePage(String artist, String album, boolean tall) {
        try {
            JSONArray results = new JSONObject(get("https://itunes.apple.com/search?media=music&entity=album&limit=5&term="
                    + URLEncoder.encode(artist + " " + album, "UTF-8"), null)).optJSONArray("results");
            if (results == null) return null;
            String want = norm(album.replaceAll("\\s*[(\\[].*?[)\\]]", ""));
            if (want.isEmpty()) return null;
            for (int i = 0; i < results.length(); i++) {
                JSONObject r = results.getJSONObject(i);
                String name = norm(r.optString("collectionName").replaceAll("\\s*[(\\[].*?[)\\]]", ""));
                if (compilation(r.optString("collectionName")) || !(name.equals(want) || name.startsWith(want + " "))) continue;
                if (!credited(artist, r.optString("artistName"))) continue;
                String page = r.optString("collectionViewUrl").replaceAll("\\?.*", "");
                if (page.isEmpty() || !ArtistHeader.trusted(page, null)) return null;
                String html = get(page, null).replace("\\u002F", "/").replace("\\/", "/");
                String square = grab(html, "motionDetailSquare"), tallUrl = grab(html, "motionDetailTall");
                if (square == null) square = grab(html, "motionSquareVideo1x1");
                if (tallUrl == null) tallUrl = grab(html, "motionTallVideo3x4");
                Log.i(TAG, "canvas: album page '" + r.optString("collectionName") + "': " + (square != null || tallUrl != null ? "motion art" : "none"));
                String[] p = pair(square, tallUrl, tall);
                return p == null ? null : trustedPair(p[0], p[1]);
            }
        } catch (Throwable t) {
            Log.w(TAG, "canvas: album page failed: " + t);
        }
        return null;
    }

    private static String grab(String html, String key) {
        Matcher m = Pattern.compile("\"" + key + "\"\\s*:\\s*\\{[^}]*?\"video\"\\s*:\\s*\"(https://[^\"]+?\\.m3u8)\"").matcher(html);
        return m.find() ? m.group(1) : null;
    }

    private static String[] pair(String square, String tallUrl, boolean tall) {
        String first = tall ? (tallUrl != null ? tallUrl : square) : (square != null ? square : tallUrl);
        if (first == null) return null;
        String other = first.equals(square) ? tallUrl : square;
        return new String[]{first, other};
    }

    /**
     * BitChord's score of a hit, or null to reject it outright: compilations out, every wanted artist
     * among the hit's, then 10, the title (brackets kept: +15 equal, +7 one holds the other, else
     * -10), the album when both sides have one (+20 equal, +10 one holds the other) and each edition
     * word (+5 on both sides, -3 only on the hit's).
     */
    static Integer score(String hitName, String hitArtist, String hitAlbum, String title, String artist, String album) {
        if (compilation(hitName) || compilation(hitAlbum)) return null;
        if (!credited(artist, hitArtist)) return null;
        int s = 10;
        String w = norm(title), h = norm(hitName);
        if (w.isEmpty()) return null;
        s += h.equals(w) ? 15 : (h.contains(w) || w.contains(h)) ? 7 : -10;
        if (album != null && !album.trim().isEmpty() && !hitAlbum.trim().isEmpty()) {
            String wa = norm(album), ha = norm(hitAlbum);
            s += ha.equals(wa) ? 20 : (ha.contains(wa) || wa.contains(ha)) ? 10 : 0;
        }
        for (String word : EDITION) {
            boolean inW = title.toLowerCase(Locale.ROOT).contains(word);
            boolean inH = hitName.toLowerCase(Locale.ROOT).contains(word);
            if (inW && inH) s += 5;
            else if (inH) s -= 3;
        }
        return s;
    }

    /** Every artist in [wanted] is among [credit]'s. */
    private static boolean credited(String wanted, String credit) {
        java.util.List<String> want = artists(wanted), got = artists(credit);
        return !want.isEmpty() && !got.isEmpty() && got.containsAll(want);
    }

    private static final Pattern SEPARATORS = Pattern.compile(
            "(?:\\s*,\\s*|\\s*&\\s*|\\s+×\\s+|\\s+x\\s+|\\bfeat\\.?\\b|\\bft\\.?\\b|\\bfeaturing\\b|\\bwith\\b)", Pattern.CASE_INSENSITIVE);

    /** BitChord's splitArtists: commas, &, ×, x, feat., ft., featuring and with (not "and"). */
    static java.util.List<String> artists(String s) {
        java.util.List<String> out = new java.util.ArrayList<>();
        for (String a : SEPARATORS.split(s, -1)) {
            String n = norm(a);
            if (!n.isEmpty()) out.add(n);
        }
        return out;
    }

    /**
     * BitChord's normalizeForMatch: accents removed, lower case, punctuation a space, spaces collapsed.
     * Letters of other scripts are kept (BitChord's own title rule), so a non-Latin name still compares.
     */
    static String norm(String s) {
        return Normalizer.normalize(s, Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "")
                .toLowerCase(Locale.ROOT).replaceAll("[^\\p{L}\\p{M}\\p{N}\\s]", " ").replaceAll("\\s+", " ").trim();
    }

    private static boolean compilation(String name) {
        String l = name.toLowerCase(Locale.ROOT);
        for (String c : COMPILATION) if (l.contains(c)) return true;
        return false;
    }

    /** The clip for the art's shape and the one to try when it won't play: {preferred, alternate or null}, or null. */
    private static String[] motion(JSONObject video, boolean tall) {
        if (video == null) return null;
        String[] m = motionUrls((key, field) -> {
            JSONObject asset = video.optJSONObject(key);
            return asset == null ? null : asset.optString(field, null);
        });
        if (m == null) return null;
        // full-screen art: the tall clip, with the square one (BitChord's url) to fall back on
        if (tall && m[2] != null) return trustedPair(m[2], m[2].equals(m[0]) ? m[1] : m[0]);
        return trustedPair(m[0], m[1]);
    }

    /**
     * A fresh clip link passes the same trust check as everything else (https on 443, no user info,
     * Apple's media hosts: canvas.md §4 rule 6's idea): an untrusted one is dropped, the other moves up.
     */
    static String[] trustedPair(String preferred, String alternate) {
        String p = preferred != null && ArtistHeader.trusted(preferred, null) ? preferred : null;
        String a = alternate != null && ArtistHeader.trusted(alternate, null) ? alternate : null;
        if (p == null) {
            p = a;
            a = null;
        }
        return p == null ? null : new String[]{p, a};
    }

    /**
     * BitChord's motionUrls and tallUrl, over [field] (an asset key and a field name to its value):
     * {primary, alternate or null, tall or null}, or null without motion art. Primary: the square
     * clip, else the raw one, else the tall one; alternate: the next of those that differs.
     */
    static String[] motionUrls(java.util.function.BiFunction<String, String, String> field) {
        String square = link(field, "motionDetailSquare"), raw = link(field, "motionDetailRaw"), tall = link(field, "motionDetailTall");
        if (square == null) square = link(field, "motionSquareVideo1x1");
        if (tall == null) tall = link(field, "motionTallVideo3x4");
        String primary = square != null ? square : raw != null ? raw : tall;
        if (primary == null) return null;
        String alternate = null;
        for (String u : new String[]{square, raw, tall})
            if (alternate == null && u != null && !u.equals(primary)) alternate = u;
        return new String[]{primary, alternate, tall};
    }

    private static String link(java.util.function.BiFunction<String, String, String> field, String key) {
        for (String f : new String[]{"video", "videoUrl", "hlsUrl", "url"}) {
            String u = field.apply(key, f);
            if (u != null && !u.trim().isEmpty()) return u;
        }
        return null;
    }

    /** Apple's catalog at [path] ("us/artists/123?..."), with the web player's token. */
    static JSONObject catalog(String path) throws Exception {
        String bearer = token();
        if (bearer == null) throw new IllegalStateException("no web player token");
        return new JSONObject(get(AMP + path, bearer));
    }

    private static synchronized String token() throws Exception {
        long now = System.currentTimeMillis();
        if (token != null && now < tokenExpires - 60_000) return token;
        if (token == null) {
            // the backup copy from an earlier run, until it expires or gets a 401
            String[] saved = CanvasCache.token();
            long savedExpires;
            try {
                savedExpires = saved == null ? 0 : Long.parseLong(saved[1]);
            } catch (NumberFormatException e) {
                savedExpires = 0; // a damaged copy: scraped afresh instead of failing every lookup
            }
            if (saved != null && now < savedExpires - 60_000 && !rejected.contains(saved[0])) {
                token = saved[0];
                tokenExpires = savedExpires;
                Log.i(TAG, "canvas: token from the backup copy");
                return token;
            }
        }
        if (now < retryAfter) return null;
        retryAfter = now + 2 * 60_000L; // the network failed: tried again soon
        String html = get("https://music.apple.com/us/browse", null);
        Matcher js = Pattern.compile("/assets/index(?:-legacy)?[~-][A-Za-z0-9_-]+\\.js").matcher(html);
        // the web player's own token from any bundle wins; another bundle's unlabelled one only
        // when no bundle has it (a stray JWT in the first must not hide the real one in the next)
        String fallback = null;
        while (js.find()) {
            String script = get("https://music.apple.com" + js.group(), null);
            Matcher jwt = Pattern.compile("ey[A-Za-z0-9_-]+\\.ey[A-Za-z0-9_-]+\\.[A-Za-z0-9_-]+").matcher(script);
            java.util.List<String> found = new java.util.ArrayList<>();
            while (jwt.find()) if (!found.contains(jwt.group())) found.add(jwt.group());
            int pick = pickToken(found, now, rejected);
            if (pick < 0) continue;
            if (webPlayer(found.get(pick))) return use(found.get(pick));
            if (fallback == null) fallback = found.get(pick);
        }
        if (fallback != null) return use(fallback);
        // every bundle read and none has one: not asked again for a while (a failed read above
        // threw, and leaves the 2 minute retry)
        retryAfter = now + 30 * 60_000L;
        Log.w(TAG, "canvas: no web player token found");
        return null;
    }

    private static String use(String t) {
        token = t;
        tokenExpires = expiry(t);
        retryAfter = 0;
        CanvasCache.token(token, tokenExpires);
        return token;
    }

    /** The JWT's header kid says WebPlayKid or its payload iss AMPWebPlay (pickToken's first choice). */
    private static boolean webPlayer(String t) {
        try {
            String[] parts = t.split("\\.");
            String header = new String(java.util.Base64.getUrlDecoder().decode(parts[0]), StandardCharsets.UTF_8);
            String payload = new String(java.util.Base64.getUrlDecoder().decode(parts[1]), StandardCharsets.UTF_8);
            return header.contains("WebPlayKid") || payload.contains("AMPWebPlay");
        } catch (RuntimeException e) {
            return false;
        }
    }

    /**
     * BitChord's pick among a bundle's JWTs: the first unexpired one not refused before whose header
     * kid says WebPlayKid or payload iss AMPWebPlay (the web player's own); else the first unexpired
     * one, so a relabel on Apple's side is not fatal. -1 when none.
     */
    static int pickToken(java.util.List<String> jwts, long now, java.util.Set<String> refused) {
        int first = -1;
        for (int i = 0; i < jwts.size(); i++) {
            String t = jwts.get(i);
            if (refused.contains(t) || expiry(t) <= now) continue;
            try {
                String[] parts = t.split("\\.");
                String header = new String(java.util.Base64.getUrlDecoder().decode(parts[0]), StandardCharsets.UTF_8);
                String payload = new String(java.util.Base64.getUrlDecoder().decode(parts[1]), StandardCharsets.UTF_8);
                if (header.contains("WebPlayKid") || payload.contains("AMPWebPlay")) return i;
            } catch (IllegalArgumentException ignored) {
                // not readable: only a fallback
            }
            if (first < 0) first = i;
        }
        return first;
    }

    /** A JWT's exp in ms, or 0 when it isn't one we can read (not a JWT, just something shaped like one). */
    private static long expiry(String jwt) {
        try {
            String payload = new String(java.util.Base64.getUrlDecoder().decode(jwt.split("\\.")[1]), StandardCharsets.UTF_8);
            Matcher exp = Pattern.compile("\"exp\"\\s*:\\s*(\\d+)").matcher(payload);
            return exp.find() ? Long.parseLong(exp.group(1)) * 1000 : 0;
        } catch (RuntimeException e) {
            return 0;
        }
    }

    private static String get(String url, String bearer) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        try {
            c.setConnectTimeout(10_000);
            c.setReadTimeout(15_000);
            c.setRequestProperty("User-Agent", UA);
            if (bearer != null) {
                c.setRequestProperty("Authorization", "Bearer " + bearer);
                c.setRequestProperty("Origin", "https://music.apple.com");
                c.setRequestProperty("Referer", "https://music.apple.com/");
            }
            int code = c.getResponseCode();
            if (code == 401 && bearer != null) {
                synchronized (AppleCanvas.class) {
                    rejected.add(bearer); // never picked again (BitChord's rejected set)
                    token = null;
                    retryAfter = 0;
                    CanvasCache.token(null, 0);
                    Log.i(TAG, "canvas: token refused (401), scraping again next time");
                }
            }
            if (code >= 400) throw new IllegalStateException("http " + code + " for " + url.replaceAll("\\?.*", ""));
            try (InputStream in = c.getInputStream()) {
                ByteArrayOutputStream buf = new ByteArrayOutputStream();
                HlsClip.capped(in, buf, MAX_ANSWER_BYTES);
                return buf.toString("UTF-8");
            }
        } finally {
            c.disconnect();
        }
    }
}
