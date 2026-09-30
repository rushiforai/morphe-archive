package com.feixiangdao.doubanplayerbridge;

import android.text.TextUtils;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URLEncoder;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

final class TmdbResolver {
    private static final String BASE = "https://api.themoviedb.org/3";
    private static final Pattern YEAR =
            Pattern.compile("\\b(18|19|20)\\d{2}\\b");

    static final class Result {
        final long tmdbId;
        final String type;
        final String title;
        final Integer year;
        final String imdbId;

        Result(long tmdbId, String type, String title, Integer year, String imdbId) {
            this.tmdbId = tmdbId;
            this.type = type;
            this.title = title;
            this.year = year;
            this.imdbId = imdbId;
        }

        Result withImdb(String value) {
            return new Result(tmdbId, type, title, year, value);
        }
    }

    static final class Lookup {
        final Result result;
        final String message;

        Lookup(Result result, String message) {
            this.result = result;
            this.message = message;
        }
    }

    private static final class Candidate {
        long id;
        String type;
        String title;
        String originalTitle;
        Integer year;
        int rank;
        int score;
    }

    private TmdbResolver() {}

    static boolean testCredential(String credential) throws Exception {
        if (TextUtils.isEmpty(credential)) return false;
        JSONObject root = getJson(BASE + "/configuration", credential);
        return root.has("images");
    }

    /**
     * Fast path: only resolve a TMDB meta id. No external-id request here.
     * Usually 1 request; at most 2 if the primary title yields no strict match.
     */
    static Lookup resolveFast(MediaInfo info, String credential) throws Exception {
        if (info == null || TextUtils.isEmpty(info.title)) {
            return new Lookup(null, "没有可用标题");
        }
        if (TextUtils.isEmpty(credential)) {
            return new Lookup(null, "TMDB Key 未设置");
        }

        LinkedHashSet<String> queries = new LinkedHashSet<>();
        addQuery(queries, info.title);
        for (String alias : info.aliases) {
            if (queries.size() >= 3) break;
            addQuery(queries, alias);
        }

        Candidate best = null;
        String bestQuery = null;
        int requestCount = 0;

        for (String query : queries) {
            if (requestCount >= 2) break;
            requestCount++;

            List<Candidate> candidates = searchMulti(query, credential);
            for (Candidate c : candidates) {
                c.score = score(c, info, query);
                if (best == null || c.score > best.score) {
                    best = c;
                    bestQuery = query;
                }
            }

            if (best != null && best.score >= 210) break;
        }

        if (best == null || best.score < 150) {
            return new Lookup(
                    null,
                    "TMDB 无可靠匹配" +
                            (best == null ? "" :
                                    "（最高分 " + best.score + "）")
            );
        }

        String type = "tv".equals(best.type) ? "series" : "movie";
        Result result = new Result(
                best.id,
                type,
                best.title,
                best.year,
                null
        );

        return new Lookup(
                result,
                "TMDB " + best.id +
                        " · " + best.title +
                        (best.year == null ? "" : " (" + best.year + ")") +
                        " · query=" + bestQuery +
                        " · score=" + best.score
        );
    }

    static String fetchImdbId(Result result, String credential) throws Exception {
        if (result == null || TextUtils.isEmpty(credential)) return null;

        String endpoint = "series".equals(result.type)
                ? BASE + "/tv/" + result.tmdbId + "/external_ids"
                : BASE + "/movie/" + result.tmdbId + "/external_ids";

        JSONObject root = getJson(endpoint, credential);
        String imdb = root.optString("imdb_id", "");
        return imdb.matches("tt\\d{5,12}") ? imdb : null;
    }

    private static void addQuery(LinkedHashSet<String> queries, String value) {
        if (TextUtils.isEmpty(value)) return;
        String q = value.trim();
        if (q.isEmpty()) return;

        // Strip a trailing year in case Douban exposes "The Odyssey (2026)"
        // as a single accessibility string.
        q = q.replaceAll(
                "\\s*[（(](?:18|19|20)\\d{2}[）)]\\s*$",
                ""
        ).trim();

        if (!q.isEmpty()) queries.add(q);
    }

    private static List<Candidate> searchMulti(
            String query,
            String credential
    ) throws Exception {
        String encoded = URLEncoder.encode(query, "UTF-8")
                .replace("+", "%20");

        String endpoint = BASE +
                "/search/multi?query=" + encoded +
                "&include_adult=false&language=zh-CN&page=1";

        JSONObject root = getJson(endpoint, credential);
        JSONArray results = root.optJSONArray("results");
        List<Candidate> out = new ArrayList<>();
        if (results == null) return out;

        int rank = 0;
        for (int i = 0; i < Math.min(20, results.length()); i++) {
            JSONObject o = results.optJSONObject(i);
            if (o == null) continue;

            String mediaType = o.optString("media_type", "");
            if (!"movie".equals(mediaType) && !"tv".equals(mediaType)) {
                continue;
            }

            long id = o.optLong("id", 0L);
            if (id <= 0L) continue;

            Candidate c = new Candidate();
            c.id = id;
            c.type = mediaType;
            c.title = "movie".equals(mediaType)
                    ? o.optString("title", "")
                    : o.optString("name", "");
            c.originalTitle = "movie".equals(mediaType)
                    ? o.optString("original_title", "")
                    : o.optString("original_name", "");
            c.year = parseYear(
                    "movie".equals(mediaType)
                            ? o.optString("release_date", "")
                            : o.optString("first_air_date", "")
            );
            c.rank = rank++;
            out.add(c);
        }
        return out;
    }

    private static int score(Candidate c, MediaInfo info, String query) {
        int score = 0;

        if (info.year != null) {
            if (c.year == null) {
                score -= 25;
            } else {
                int delta = Math.abs(info.year - c.year);
                if (delta == 0) score += 95;
                else if (delta == 1) score += 35;
                else return Integer.MIN_VALUE / 4;
            }
        }

        int titleScore = 0;
        titleScore = Math.max(
                titleScore,
                compareTitle(query, c.title, c.originalTitle)
        );
        titleScore = Math.max(
                titleScore,
                compareTitle(info.title, c.title, c.originalTitle)
        );
        for (String alias : info.aliases) {
            titleScore = Math.max(
                    titleScore,
                    compareTitle(alias, c.title, c.originalTitle)
            );
        }
        score += titleScore;

        String expectedType = "series".equals(info.preferredType)
                ? "tv" : "movie";
        if (expectedType.equals(c.type)) score += 22;

        score += Math.max(0, 12 - c.rank);
        return score;
    }

    private static int compareTitle(
            String source,
            String localized,
            String original
    ) {
        String q = normalize(source);
        String a = normalize(localized);
        String b = normalize(original);

        if (q.isEmpty()) return 0;
        if (q.equals(a) || q.equals(b)) return 120;

        // Only allow containment for reasonably long strings.
        if (q.length() >= 4) {
            if (!a.isEmpty() && (q.contains(a) || a.contains(q))) return 65;
            if (!b.isEmpty() && (q.contains(b) || b.contains(q))) return 65;
        }
        return 0;
    }

    private static JSONObject getJson(String url, String credential)
            throws Exception {
        String token = credential == null ? "" : credential.trim();
        boolean bearer = token.startsWith("eyJ") || token.length() > 64;

        if (!bearer) {
            url += (url.contains("?") ? "&" : "?") +
                    "api_key=" + URLEncoder.encode(token, "UTF-8");
        }

        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        c.setConnectTimeout(4000);
        c.setReadTimeout(5000);
        c.setRequestProperty("Accept", "application/json");
        c.setRequestProperty("User-Agent", "DoubanPlayerBridge/0.2.1");
        if (bearer) {
            c.setRequestProperty("Authorization", "Bearer " + token);
        }

        int code = c.getResponseCode();
        InputStream input = code >= 200 && code < 300
                ? c.getInputStream() : c.getErrorStream();
        String body = readAll(input);
        c.disconnect();

        if (code < 200 || code >= 300) {
            throw new IllegalStateException(
                    "TMDB HTTP " + code +
                            (TextUtils.isEmpty(body) ? "" : " " + body)
            );
        }

        return new JSONObject(body);
    }

    private static String normalize(String raw) {
        if (raw == null) return "";
        return Normalizer.normalize(raw, Normalizer.Form.NFKC)
                .toLowerCase(Locale.US)
                .replaceAll("[^\\p{L}\\p{N}]+", "")
                .trim();
    }

    private static Integer parseYear(String value) {
        if (TextUtils.isEmpty(value)) return null;
        Matcher m = YEAR.matcher(value);
        if (!m.find()) return null;
        try {
            return Integer.parseInt(m.group());
        } catch (Exception e) {
            return null;
        }
    }

    private static String readAll(InputStream in) throws Exception {
        if (in == null) return "";
        BufferedReader r = new BufferedReader(
                new InputStreamReader(in, StandardCharsets.UTF_8));
        StringBuilder b = new StringBuilder();
        char[] buf = new char[4096];
        int n;
        while ((n = r.read(buf)) != -1) {
            b.append(buf, 0, n);
            if (b.length() > 2_000_000) break;
        }
        return b.toString();
    }
}
