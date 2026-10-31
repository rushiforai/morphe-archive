package app.xposed.extension;

import android.util.Log;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * Client for the X-Posed community cache (https://x-posed-cache.xaitax.workers.dev),
 * following the extension's protocol. Worker thread only.
 */
final class CloudCache {
    static final int BATCH_SIZE = 100;

    private static final String API_URL = "https://x-posed-cache.xaitax.workers.dev";
    private static final String USER_AGENT = "xposed-patches/1.0 (Morphe; X for Android)";
    private static final int TIMEOUT_MS = 5000;
    private static final long MAX_AGE_MS = TimeUnit.DAYS.toMillis(60); // Same as Lookup.FRESH_MS.
    private static final long FAILURE_COOLDOWN_MS = TimeUnit.MINUTES.toMillis(2);
    private static final int CONTRIBUTE_BATCH_SIZE = 200;
    private static final long CONTRIBUTE_DELAY_MS = 10_000;
    private static final long CONTRIBUTE_DEDUP_MS = TimeUnit.HOURS.toMillis(24);
    private static final int MAX_FIELD_LENGTH = 100;

    private static long cooldownUntil;
    private static final Map<String, JSONObject> contributions = new LinkedHashMap<>();
    private static final Map<String, Long> contributed = new HashMap<>();
    private static boolean contributeScheduled;

    private CloudCache() {
    }

    /** Hits for the given lowercase handles, or null when the cache is unreachable. */
    static Map<String, AccountInfo> lookup(List<String> handles) {
        if (!Settings.communityCache() || System.currentTimeMillis() < cooldownUntil) return null;
        try {
            String users = URLEncoder.encode(String.join(",", handles), "UTF-8");
            Stats.add(Stats.CLOUD_REQUESTED, handles.size());
            JSONObject response = new JSONObject(request("GET", API_URL + "/lookup?users=" + users, null));
            JSONObject results = response.optJSONObject("results");
            Map<String, AccountInfo> hits = new HashMap<>();
            if (results == null) return hits;

            long now = System.currentTimeMillis();
            for (Iterator<String> it = results.keys(); it.hasNext(); ) {
                String user = it.next();
                String handle = user.toLowerCase(Locale.ROOT);
                // The server once returned unrequested users (extension issue #23).
                if (!handles.contains(handle)) continue;
                JSONObject entry = results.optJSONObject(user);
                if (entry == null) continue;

                long observedAt = entry.optLong("t", 0) * 1000;
                if (observedAt <= 0 || now - observedAt > MAX_AGE_MS) continue;
                String location = sanitize(AccountInfo.optString(entry, "l"));
                String source = sanitize(AccountInfo.optString(entry, "d"));
                if (location == null && source == null) continue;

                hits.put(handle, new AccountInfo(
                        location,
                        source,
                        entry.optBoolean("a", true),
                        sanitize(AccountInfo.optString(entry, "af")),
                        observedAt,
                        AccountInfo.ORIGIN_CLOUD,
                        parseId(AccountInfo.optString(entry, "id"))
                ));
            }
            Stats.add(Stats.CLOUD_HITS, hits.size());
            return hits;
        } catch (Exception e) {
            cooldownUntil = System.currentTimeMillis() + FAILURE_COOLDOWN_MS;
            Log.w(Hooks.TAG, "Community cache lookup failed: " + e);
            return null;
        }
    }

    /**
     * Queues a fresh X observation for upload. Only English data is shared, since X
     * answers in the app language and the cache stores the extension's English names.
     */
    static void contribute(String handle, AccountInfo info) {
        if (!Settings.communityCache() || !AccountInfo.ORIGIN_X.equals(info.origin) || info.isEmpty()) return;
        if (!"en".equals(Locale.getDefault().getLanguage())) return;
        if (info.location != null && !Countries.isKnownEnglish(info.location)) return;

        long now = System.currentTimeMillis();
        Long last = contributed.get(handle);
        if (last != null && now - last < CONTRIBUTE_DEDUP_MS) return;

        try {
            JSONObject entry = new JSONObject();
            entry.putOpt("l", info.location);
            entry.putOpt("d", info.source);
            entry.put("a", !Boolean.FALSE.equals(info.locationAccurate));
            entry.putOpt("af", info.affiliation);
            if (info.userId != 0) entry.put("id", String.valueOf(info.userId));
            contributions.put(handle, entry);
        } catch (Exception e) {
            return;
        }

        if (contributions.size() >= CONTRIBUTE_BATCH_SIZE) {
            flushContributions();
        } else if (!contributeScheduled) {
            contributeScheduled = true;
            Lookup.schedule(CloudCache::flushContributions, CONTRIBUTE_DELAY_MS);
        }
    }

    private static void flushContributions() {
        contributeScheduled = false;
        if (contributions.isEmpty()) return;
        try {
            JSONObject entries = new JSONObject();
            for (Map.Entry<String, JSONObject> e : contributions.entrySet()) entries.put(e.getKey(), e.getValue());
            String body = request("POST", API_URL + "/contribute", new JSONObject().put("entries", entries).toString());
            Stats.add(Stats.CONTRIBUTED, contributions.size());
            Stats.add(Stats.CONTRIBUTED_ACCEPTED, new JSONObject(body).optInt("accepted", contributions.size()));

            long now = System.currentTimeMillis();
            if (contributed.size() > 10_000) contributed.clear();
            for (String handle : contributions.keySet()) contributed.put(handle, now);
        } catch (Exception e) {
            Log.w(Hooks.TAG, "Community cache contribution failed: " + e);
        }
        contributions.clear();
    }

    private static String request(String method, String url, String body) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        try {
            c.setRequestMethod(method);
            c.setConnectTimeout(TIMEOUT_MS);
            c.setReadTimeout(TIMEOUT_MS);
            c.setRequestProperty("Accept", "application/json");
            c.setRequestProperty("User-Agent", USER_AGENT);
            if (body != null) {
                c.setDoOutput(true);
                c.setRequestProperty("Content-Type", "application/json");
                try (OutputStream out = c.getOutputStream()) {
                    out.write(body.getBytes(StandardCharsets.UTF_8));
                }
            }
            int code = c.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) throw new IllegalStateException("HTTP " + code);
            try (InputStream in = c.getInputStream()) {
                ByteArrayOutputStream buf = new ByteArrayOutputStream();
                byte[] chunk = new byte[8192];
                int n;
                while ((n = in.read(chunk)) > 0) buf.write(chunk, 0, n);
                return buf.toString("UTF-8");
            }
        } finally {
            c.disconnect();
        }
    }

    private static long parseId(String id) {
        if (id == null || !id.matches("[0-9]{1,20}")) return 0;
        try {
            return Long.parseLong(id);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    /** Community data is untrusted: drop control characters and oversized values. */
    private static String sanitize(String value) {
        if (value == null) return null;
        String s = value.replaceAll("\\p{Cntrl}", "").trim();
        if (s.isEmpty() || s.length() > MAX_FIELD_LENGTH) return null;
        return s;
    }
}
