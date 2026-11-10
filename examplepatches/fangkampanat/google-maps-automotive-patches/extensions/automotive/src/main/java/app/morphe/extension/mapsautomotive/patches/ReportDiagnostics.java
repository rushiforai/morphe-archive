package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;
import android.os.PowerManager;
import android.os.SystemClock;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Setup state for Send to car problems in the report (from 0.1.6), read by the app itself, with
 * no ADB and no new hook: whether MicroG-RE and the app are exempt from battery optimization (the
 * deviceidle whitelist that the README's ADB step sets), whether Maps holds a push token, the network
 * when the report is built, and when the head unit booted and how long it slept since. The main
 * process logs the network and the boot at each start. What MicroG-RE shows under Cloud messaging,
 * BYD's Disable Autostart and the phone's side cannot be read by an app.
 * <p>
 * The push token store is Firebase's, the one Maps' own Firebase Messaging reads and writes: shared
 * preferences "com.google.android.gms.appid", a key with "|T|" per token, the value a JSON object with
 * the token and, from Firebase, the time it was saved. Its file is read directly, read-only and again
 * for each report: SharedPreferences would keep one copy per process for the process's life (the report
 * screen's process outlives Maps' restarts) and may rename Maps' backup file on its first load. Only
 * the number of tokens and the newest one's age are reported, never a token, a key or a sender.
 */
final class ReportDiagnostics {
    // Joined at run time, so no rewrite of Google's names in the patch can change it; Maps' own literal
    // stays "com.google.android.gms.appid" in the patched APK.
    private static final String FIREBASE_STORE = String.join(".", "com", "google", "android", "gms", "appid");
    private static final String TOKEN_KEY = "|T|";
    private static final Pattern TIMESTAMP = Pattern.compile("\"timestamp\"\\s*:\\s*(\\d{1,19})");
    /** A string entry of a SharedPreferences file: name, then the value or nothing (an empty string). */
    private static final Pattern STRING_ENTRY = Pattern.compile("<string\\s+name=\"([^\"]*)\"\\s*(?:/>|>(.*?)</string>)", Pattern.DOTALL);
    private static final Pattern NUMERIC_ENTITY = Pattern.compile("&#(x[0-9A-Fa-f]{1,6}|[0-9]{1,7});");
    private static final int MAX_STORE_BYTES = 256 * 1024;
    /** A token saved later than now by more than this (a head-unit clock behind) gets no age. */
    private static final long FUTURE_TOLERANCE_MS = 5 * 60 * 1000;

    private ReportDiagnostics() {
    }

    /** True when the package is on the battery-optimization whitelist, null when unreadable. */
    static Object batteryOptimizationExempt(Context context, String packageName) {
        try {
            PowerManager power = context.getSystemService(PowerManager.class);
            return power == null ? JSONObject.NULL : power.isIgnoringBatteryOptimizations(packageName);
        } catch (RuntimeException error) {
            return JSONObject.NULL;
        }
    }

    /** The push token store's summary for the report, or null when it cannot be read. */
    static Object push(Context context) {
        long[] tokens = pushTokens(context);
        if (tokens == null) return JSONObject.NULL;
        try {
            return new JSONObject()
                    .put("fcm_tokens", tokens[0])
                    .put("newest_token_age_s", tokens[1] < 0 ? JSONObject.NULL : tokens[1]);
        } catch (JSONException error) {
            return JSONObject.NULL;
        }
    }

    /**
     * The number of push tokens and the newest one's age in seconds (-1 when unknown), or null when the
     * store cannot be read. While Android writes the store it keeps the previous file as ".bak", so the
     * backup, when there is one, is the complete version. No file: no token was ever saved.
     */
    static long[] pushTokens(Context context) {
        try {
            File folder = new File(context.getDataDir(), "shared_prefs");
            File file = new File(folder, FIREBASE_STORE + ".xml"), backup = new File(folder, FIREBASE_STORE + ".xml.bak");
            String xml = null;
            boolean sawBackup = backup.isFile();
            if (sawBackup) {
                try {
                    xml = read(backup);
                } catch (IOException gone) {
                    // The write finished and removed the backup in between: the file is complete now.
                }
            }
            if (xml == null && file.isFile()) xml = read(file);
            // No text although a backup was there: another write moved the file away meanwhile. Unknown, not 0.
            if (xml == null && sawBackup) return null;
            return xml != null ? tokenSummaryXml(xml, System.currentTimeMillis()) : new long[]{0, -1};
        } catch (IOException | RuntimeException error) {
            return null;
        }
    }

    private static String read(File file) throws IOException {
        if (file.length() > MAX_STORE_BYTES) throw new IOException("store too large");
        try (InputStream input = new FileInputStream(file)) {
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int count;
            while ((count = input.read(buffer)) > 0) {
                bytes.write(buffer, 0, count);
                if (bytes.size() > MAX_STORE_BYTES) throw new IOException("store too large");
            }
            return new String(bytes.toByteArray(), StandardCharsets.UTF_8);
        }
    }

    /**
     * The token summary of a SharedPreferences XML file, or null when it is not a complete file (a write
     * cut short). Only string entries are read; names and values are unescaped as Android writes them.
     * Plain Java, so it can be checked off the device.
     */
    static long[] tokenSummaryXml(String xml, long nowMs) {
        if (xml == null) return null;
        String text = xml.trim();
        int start = text.indexOf("<map");
        boolean complete = start >= 0 && (text.endsWith("</map>") || text.endsWith("<map />") || text.endsWith("<map/>"));
        if (!complete) return null;
        Map<String, String> entries = new LinkedHashMap<>();
        Matcher match = STRING_ENTRY.matcher(text.substring(start));
        while (match.find()) entries.put(unescape(match.group(1)), match.group(2) == null ? "" : unescape(match.group(2)));
        return tokenSummary(entries, nowMs);
    }

    /** XML entities as Android's serializer writes them: the five named ones and numeric ones. */
    static String unescape(String text) {
        if (text.indexOf('&') < 0) return text;
        Matcher numeric = NUMERIC_ENTITY.matcher(text);
        StringBuffer out = new StringBuffer();
        while (numeric.find()) {
            String value = numeric.group(1);
            int codePoint;
            try {
                codePoint = value.startsWith("x") ? Integer.parseInt(value.substring(1), 16) : Integer.parseInt(value);
            } catch (NumberFormatException error) {
                codePoint = -1;
            }
            String replacement = Character.isValidCodePoint(codePoint) ? new String(Character.toChars(codePoint)) : numeric.group();
            numeric.appendReplacement(out, Matcher.quoteReplacement(replacement));
        }
        numeric.appendTail(out);
        return out.toString().replace("&quot;", "\"").replace("&apos;", "'").replace("&lt;", "<").replace("&gt;", ">")
                .replace("&amp;", "&");
    }

    /**
     * The number of token entries (keys with "|T|") and the age in seconds of the newest one that has a
     * time no more than 5 minutes ahead of the clock (a head-unit clock behind), -1 when there is none.
     * Plain Java, so it can be checked off the device.
     */
    static long[] tokenSummary(Map<String, ?> entries, long nowMs) {
        long count = 0, newest = -1;
        if (entries != null) {
            for (Map.Entry<String, ?> entry : entries.entrySet()) {
                String key = entry.getKey();
                if (key == null || !key.contains(TOKEN_KEY)) continue;
                count++;
                Object value = entry.getValue();
                long saved = value instanceof String ? savedAt((String) value) : -1;
                if (saved > 0 && saved - nowMs <= FUTURE_TOLERANCE_MS && saved > newest) newest = saved;
            }
        }
        return new long[]{count, newest > 0 ? Math.max(0, (nowMs - newest) / 1000) : -1};
    }

    /** The "timestamp" of a token entry's JSON value in milliseconds, -1 when it has none. */
    static long savedAt(String value) {
        if (value == null || !value.trim().startsWith("{")) return -1;
        Matcher match = TIMESTAMP.matcher(value);
        if (!match.find()) return -1;
        try {
            return Long.parseLong(match.group(1));
        } catch (NumberFormatException error) {
            return -1;
        }
    }

    /** The default network now: its type and whether Android validated it (reached the internet). */
    static final class NetworkState {
        final String type;
        final boolean validated;

        NetworkState(String type, boolean validated) {
            this.type = type;
            this.validated = validated;
        }

        /** No network to use: none, or Android keeps this app off it. */
        boolean absent() {
            return "none".equals(type) || "blocked".equals(type);
        }
    }

    /**
     * The default network, or null when unreadable. "blocked": there is one, but Android keeps this app off
     * it (Doze, background restrictions), so getActiveNetwork() reads as none.
     */
    static NetworkState readNetwork(Context context) {
        try {
            ConnectivityManager connectivity = context.getSystemService(ConnectivityManager.class);
            NetworkCapabilities capabilities = capabilities(connectivity);
            return new NetworkState(networkType(connectivity, capabilities), capabilities != null
                    && capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED));
        } catch (RuntimeException error) {
            return null;
        }
    }

    /** The default network when the report is built, or null when unreadable. */
    static Object network(Context context) {
        NetworkState state = readNetwork(context);
        if (state == null) return JSONObject.NULL;
        try {
            return new JSONObject().put("type", state.type).put("validated", state.validated);
        } catch (JSONException error) {
            return JSONObject.NULL;
        }
    }

    private static NetworkCapabilities capabilities(ConnectivityManager connectivity) {
        if (connectivity == null) return null;
        Network network = connectivity.getActiveNetwork();
        return network == null ? null : connectivity.getNetworkCapabilities(network);
    }

    @SuppressWarnings("deprecation")
    private static String networkType(ConnectivityManager connectivity, NetworkCapabilities capabilities) {
        if (capabilities == null) {
            // getActiveNetwork() is null both without a network and when this app is blocked from it.
            NetworkInfo info = connectivity == null ? null : connectivity.getActiveNetworkInfo();
            return info != null && info.getDetailedState() == NetworkInfo.DetailedState.BLOCKED ? "blocked" : "none";
        }
        if (capabilities.hasTransport(NetworkCapabilities.TRANSPORT_VPN)) return "vpn";
        if (capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI)) return "wifi";
        if (capabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR)) return "cellular";
        if (capabilities.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET)) return "ethernet";
        if (capabilities.hasTransport(NetworkCapabilities.TRANSPORT_BLUETOOTH)) return "bluetooth";
        return "other";
    }

    /**
     * The boot time (now minus the time since boot) and the time asleep since then (the time since boot
     * minus the time awake). A head unit that sleeps while the car is off keeps its boot time.
     */
    static void putBoot(JSONObject device) throws JSONException {
        long sinceBoot = SystemClock.elapsedRealtime(), awake = SystemClock.uptimeMillis();
        device.put("booted_at", ReportBuilder.formatUtc(System.currentTimeMillis() - sinceBoot))
                .put("asleep_since_boot_s", Math.max(0, (sinceBoot - awake) / 1000));
    }

    /** From the main process's start, off the main thread: one line with the network and the boot. */
    static void logStart(Context context) {
        try {
            NetworkState state = readNetwork(context);
            String network = state == null ? "unreadable"
                    : state.absent() ? state.type : state.type + (state.validated ? " validated" : " not validated");
            long sinceBoot = SystemClock.elapsedRealtime(), asleep = Math.max(0, sinceBoot - SystemClock.uptimeMillis());
            ReportLog.i(ReportPatch.TAG, "Start: network " + network + "; booted " + minutes(sinceBoot)
                    + " ago, asleep " + minutes(asleep) + " of it");
        } catch (Throwable error) {
            ReportLog.w(ReportPatch.TAG, "start state not logged", error);
        }
    }

    static String minutes(long millis) {
        return (Math.max(0, millis) / 60_000) + " min";
    }
}
