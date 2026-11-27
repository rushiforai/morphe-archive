package local.privacy;

import android.content.Context;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Locale;
import java.util.regex.Pattern;

/** Offline range hints from a community post, never an identity lookup. */
public final class IpInfo {
    private static volatile Map<String, String> prefixLabels;
    private static long retryAfter;

    /** Compile list-validation patterns once, only when the offline list is read. */
    private static final class ListPatterns {
        static final Pattern IPV6_RANGE = Pattern.compile("[0-9a-f]{1,4}:[0-9a-f]{1,4}::/32");
        static final Pattern IPV4 = Pattern.compile("[0-9]{1,3}\\.[0-9]{1,3}(?:\\.[0-9]{1,3}){0,2}");
        static final Pattern IPV6 = Pattern.compile("[0-9a-f]{1,4}:[0-9a-f]{1,4}");
    }

    private IpInfo() { }

    public static Spannable decorateRendered(Spannable rendered, String ip) {
        if (!SettingsState.get("show_ip_info") || rendered == null) return rendered;
        if (!rendered.toString().contains("(" + ip + ")")) return rendered;
        String estimate = prefixEstimate(ip);
        if (estimate == null) return rendered;
        return new SpannableStringBuilder(rendered).append(" · ").append(estimate).append('\u00a0');
    }

    public static String postMetadata(String ip) {
        if (!SettingsState.get("show_ip_info") || ip == null || ip.trim().isEmpty()) return null;
        String visible = ip.trim();
        String estimate = prefixEstimate(visible);
        return "IP: " + visible + (estimate == null ? "" : " · " + estimate);
    }

    /** Offline prefix estimate used next to author names in the app's native UI. */
    public static String estimateForIp(String ip) {
        return prefixEstimate(ip);
    }

    private static String prefixEstimate(String ip) {
        if (ip == null) return null;
        String visible = ip.trim().toLowerCase(Locale.ROOT);
        if (visible.indexOf(':') >= 0) {
            String[] groups = visible.split(":", -1);
            if (groups.length < 2 || !validHextet(groups[0]) || !validHextet(groups[1])) return null;
            return labels().get(groups[0] + ":" + groups[1]);
        }
        String[] parts = visible.split("\\.", -1);
        if (parts.length != 2 && parts.length != 4) return null;
        for (int i = 0; i < parts.length; i++) {
            if (parts[i].isEmpty() || parts[i].length() > 3) return null;
            try {
                int value = Integer.parseInt(parts[i]);
                if (value < 0 || value > 255) return null;
            } catch (NumberFormatException ignored) { return null; }
        }
        if (parts.length == 4) {
            String exact = labels().get(visible);
            if (exact != null) return exact;
        }
        return labels().get(parts[0] + "." + parts[1]);
    }

    private static boolean validHextet(String part) {
        int length = part.length();
        if (length == 0 || length > 4) return false;
        for (int i = 0; i < length; i++) {
            char digit = part.charAt(i);
            if ((digit < '0' || digit > '9') && (digit < 'a' || digit > 'f')) return false;
        }
        return true;
    }

    private static Map<String, String> labels() {
        Map<String, String> found = prefixLabels;
        if (found != null) return found;
        synchronized (IpInfo.class) {
            if (prefixLabels != null) return prefixLabels;
            if (android.os.SystemClock.elapsedRealtime() < retryAfter) return Collections.emptyMap();
            HashMap<String, LinkedHashSet<String>> entries = new HashMap<>();
            Context context = SettingsState.context();
            if (context == null) return Collections.emptyMap();
            boolean loaded = false;
            if (context != null) {
                int id = context.getResources().getIdentifier("lumi_ip_prefixes", "raw", context.getPackageName());
                if (id != 0) {
                    try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                            context.getResources().openRawResource(id), "UTF-8"))) {
                        String line;
                        while ((line = reader.readLine()) != null) {
                            int dash = line.indexOf('-');
                            if (dash <= 0 || dash >= line.length() - 1) continue;
                            String key = line.substring(0, dash).trim();
                            String value = line.substring(dash + 1).trim();
                            if (ListPatterns.IPV6_RANGE.matcher(key).matches()) {
                                key = key.substring(0, key.indexOf("::"));
                            }
                            if (!ListPatterns.IPV4.matcher(key).matches()
                                    && !ListPatterns.IPV6.matcher(key).matches()) continue;
                            if (value.isEmpty()) continue;
                            entries.computeIfAbsent(key, unused -> new LinkedHashSet<>()).add(value);
                        }
                        loaded = true;
                    } catch (Exception ignored) { loaded = false; }
                }
            }
            if (!loaded) {
                retryAfter = android.os.SystemClock.elapsedRealtime() + 30_000L;
                return Collections.emptyMap();
            }
            HashMap<String, String> result = new HashMap<>();
            for (Map.Entry<String, LinkedHashSet<String>> entry : entries.entrySet()) {
                StringBuilder joined = new StringBuilder();
                for (String value : entry.getValue()) {
                    if (joined.length() > 0) joined.append(" / ");
                    joined.append(value);
                }
                result.put(entry.getKey(), joined.toString());
            }
            prefixLabels = Collections.unmodifiableMap(result);
            return prefixLabels;
        }
    }
}
