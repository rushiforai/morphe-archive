package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.os.Environment;
import android.os.StatFs;

import java.util.Locale;

/** Internal-storage capacity text owned by Local Downloads. */
final class LocalDownloadsStorageStats {
    private static final double GIB = 1_073_741_824.0;

    private LocalDownloadsStorageStats() {}

    static Snapshot snapshot() {
        try {
            StatFs stats = new StatFs(Environment.getDataDirectory().getAbsolutePath());
            long total = Math.max(0L, stats.getTotalBytes());
            long available = Math.max(0L, stats.getAvailableBytes());
            long used = Math.max(0L, total - Math.min(total, available));
            return new Snapshot(used, total);
        } catch (RuntimeException ignored) {
            return new Snapshot(0L, 0L);
        }
    }

    static String caption() { return snapshot().caption(); }

    static final class Snapshot {
        final long usedBytes;
        final long totalBytes;

        Snapshot(long usedBytes, long totalBytes) {
            this.usedBytes = Math.max(0L, usedBytes);
            this.totalBytes = Math.max(0L, totalBytes);
        }

        String caption() {
            if (totalBytes <= 0L) return "Internal storage usage unavailable";
            double percent = usedBytes * 100.0 / totalBytes;
            return String.format(Locale.US, "%.1f GB used / %.1f GB total (%.0f%% full)",
                    usedBytes / GIB, totalBytes / GIB, percent);
        }
    }
}
