/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.privacy;

import java.net.URL;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public final class NetworkTrafficDashboard {

    private static final int MAX_DOMAINS = 200;

    private static final Map<String, long[]> DOMAIN_STATS =
            Collections.synchronizedMap(new LinkedHashMap<String, long[]>(64, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, long[]> eldest) {
                    return size() > MAX_DOMAINS;
                }
            });

    private static final AtomicLong TOTAL_REQUESTS = new AtomicLong();

    public static void recordRequest(String urlString, long requestBytes, long responseBytes) {
        TOTAL_REQUESTS.incrementAndGet();
        try {
            String host = new URL(urlString).getHost();
            if (host == null || host.isEmpty()) return;
            synchronized (DOMAIN_STATS) {
                long[] stats = DOMAIN_STATS.get(host);
                if (stats == null) {
                    stats = new long[3];
                    DOMAIN_STATS.put(host, stats);
                }
                stats[0]++;
                stats[1] += requestBytes;
                stats[2] += responseBytes;
            }
        } catch (Exception ignored) {}
    }

    public static String report() {
        StringBuilder sb = new StringBuilder();
        sb.append("Network traffic: ").append(TOTAL_REQUESTS.get()).append(" requests to ")
                .append(DOMAIN_STATS.size()).append(" domains\n");
        synchronized (DOMAIN_STATS) {
            for (Map.Entry<String, long[]> entry : DOMAIN_STATS.entrySet()) {
                long[] stats = entry.getValue();
                sb.append("  ").append(entry.getKey())
                        .append(": ").append(stats[0]).append(" req, ")
                        .append(formatBytes(stats[1])).append(" sent, ")
                        .append(formatBytes(stats[2])).append(" received\n");
            }
        }
        return sb.toString();
    }

    private static String formatBytes(long bytes) {
        if (bytes < 1024) return bytes + " B";
        if (bytes < 1024 * 1024) return String.format("%.1f KB", bytes / 1024.0);
        return String.format("%.1f MB", bytes / (1024.0 * 1024.0));
    }

    private NetworkTrafficDashboard() {}
}
