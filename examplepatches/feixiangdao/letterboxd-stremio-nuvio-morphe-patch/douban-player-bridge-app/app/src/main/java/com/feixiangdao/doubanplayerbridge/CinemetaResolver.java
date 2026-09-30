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

final class CinemetaResolver {
    private static final Pattern IMDB =
            Pattern.compile("^tt\\d{5,12}$", Pattern.CASE_INSENSITIVE);
    private static final Pattern YEAR =
            Pattern.compile("\\b(18|19|20)\\d{2}\\b");

    static final class Result {
        final String imdbId;
        final String type;
        final String name;
        final Integer year;

        Result(String imdbId, String type, String name, Integer year) {
            this.imdbId = imdbId;
            this.type = type;
            this.name = name;
            this.year = year;
        }
    }

    private CinemetaResolver() {}

    static Result resolve(MediaInfo info) throws Exception {
        LinkedHashSet<String> queries = new LinkedHashSet<>();
        if (!TextUtils.isEmpty(info.title)) {
            if (info.year != null) {
                queries.add(info.title.trim() + " " + info.year);
            }
            queries.add(info.title.trim());
        }
        for (String alias : info.aliases) {
            if (TextUtils.isEmpty(alias)) continue;
            if (info.year != null) {
                queries.add(alias.trim() + " " + info.year);
            }
            queries.add(alias.trim());
            if (queries.size() >= 6) break;
        }
        if (queries.isEmpty()) return null;

        String[] order = "series".equals(info.preferredType)
                ? new String[]{"series", "movie"}
                : new String[]{"movie", "series"};

        Candidate best = null;
        int queryIndex = 0;

        for (String query : queries) {
            if (queryIndex++ >= 5) break;

            for (String type : order) {
                List<Candidate> list = search(type, query);
                for (int rank = 0; rank < list.size(); rank++) {
                    Candidate c = list.get(rank);

                    // Fail closed on an obvious release-year mismatch.
                    if (info.year != null && c.year != null &&
                            Math.abs(info.year - c.year) > 2) {
                        continue;
                    }

                    c.score = score(c, query, info, type, rank);
                    if (best == null || c.score > best.score) best = c;
                }
                if (best != null && best.score >= 125) break;
            }
            if (best != null && best.score >= 125) break;
        }

        if (best == null || best.score < 80) return null;
        return new Result(best.imdbId, best.type, best.name, best.year);
    }

    private static List<Candidate> search(String type, String query)
            throws Exception {
        String encoded = URLEncoder.encode(query, "UTF-8")
                .replace("+", "%20");
        URL url = new URL(
                "https://v3-cinemeta.strem.io/catalog/" +
                        type + "/top/search=" + encoded + ".json");

        HttpURLConnection c = (HttpURLConnection) url.openConnection();
        c.setConnectTimeout(5000);
        c.setReadTimeout(6500);
        c.setInstanceFollowRedirects(true);
        c.setRequestProperty("Accept", "application/json");
        c.setRequestProperty("User-Agent", "DoubanPlayerBridge/0.1");

        int code = c.getResponseCode();
        if (code < 200 || code >= 300) {
            c.disconnect();
            return new ArrayList<>();
        }

        String body;
        try (InputStream in = c.getInputStream()) {
            body = readAll(in);
        } finally {
            c.disconnect();
        }

        JSONArray metas = new JSONObject(body).optJSONArray("metas");
        List<Candidate> out = new ArrayList<>();
        if (metas == null) return out;

        for (int i = 0; i < Math.min(12, metas.length()); i++) {
            JSONObject o = metas.optJSONObject(i);
            if (o == null) continue;

            String id = o.optString("id", "");
            if (!IMDB.matcher(id).matches()) continue;

            String name = o.optString("name", "");
            Integer year = parseYear(o.optString("releaseInfo", ""));
            if (year == null) {
                Object y = o.opt("year");
                if (y != null) year = parseYear(String.valueOf(y));
            }

            String resultType = normalizeType(o.optString("type", type));
            out.add(new Candidate(
                    id.toLowerCase(Locale.US),
                    resultType,
                    name,
                    year));
        }
        return out;
    }

    private static int score(
            Candidate c,
            String query,
            MediaInfo info,
            String requestedType,
            int rank
    ) {
        int score = 0;
        String q = normalize(query);
        String n = normalize(c.name);

        if (!q.isEmpty() && q.equals(n)) score += 90;
        else if (!q.isEmpty() && !n.isEmpty() &&
                (q.contains(n) || n.contains(q))) score += 50;
        else score += tokenOverlap(q, n);

        if (info.year != null && c.year != null) {
            int delta = Math.abs(info.year - c.year);
            if (delta == 0) score += 60;
            else if (delta == 1) score += 30;
            else if (delta <= 2) score += 10;
            else return Integer.MIN_VALUE / 4;
        }

        if (requestedType.equals(c.type)) score += 15;
        if (info.preferredType.equals(c.type)) score += 15;
        score += Math.max(0, 12 - rank);
        return score;
    }

    private static int tokenOverlap(String a, String b) {
        if (a.isEmpty() || b.isEmpty()) return 0;
        String[] aa = a.split(" ");
        String[] bb = b.split(" ");
        int common = 0;
        for (String x : aa) {
            if (x.isEmpty()) continue;
            for (String y : bb) {
                if (x.equals(y)) {
                    common++;
                    break;
                }
            }
        }
        int denom = Math.max(aa.length, bb.length);
        return denom == 0 ? 0 : (int) Math.round(common * 40.0 / denom);
    }

    private static String normalize(String raw) {
        if (raw == null) return "";
        return Normalizer.normalize(raw, Normalizer.Form.NFKD)
                .toLowerCase(Locale.US)
                .replaceAll("[^\\p{L}\\p{N}]+", " ")
                .trim()
                .replaceAll("\\s+", " ");
    }

    private static String normalizeType(String raw) {
        String s = raw == null ? "" : raw.toLowerCase(Locale.US);
        return (s.contains("series") || s.contains("show") || s.contains("tv"))
                ? "series" : "movie";
    }

    private static Integer parseYear(String text) {
        if (TextUtils.isEmpty(text)) return null;
        Matcher m = YEAR.matcher(text);
        if (!m.find()) return null;
        try {
            int y = Integer.parseInt(m.group());
            return y >= 1800 && y <= 2100 ? y : null;
        } catch (Exception e) {
            return null;
        }
    }

    private static String readAll(InputStream in) throws Exception {
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

    private static final class Candidate {
        final String imdbId;
        final String type;
        final String name;
        final Integer year;
        int score;

        Candidate(String imdbId, String type, String name, Integer year) {
            this.imdbId = imdbId;
            this.type = type;
            this.name = name;
            this.year = year;
        }
    }
}
