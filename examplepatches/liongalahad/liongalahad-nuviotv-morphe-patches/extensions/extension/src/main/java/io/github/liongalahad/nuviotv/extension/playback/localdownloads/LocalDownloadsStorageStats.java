package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.content.Context;
import android.net.Uri;
import android.os.StatFs;

import java.io.File;
import java.util.Locale;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;
import io.github.liongalahad.nuviotv.extension.settings.MorpheTranslations;
import io.github.liongalahad.nuviotv.extension.settings.MorpheStoragePath;

/** Capacity text and free space for the currently selected local-storage volume. */
final class LocalDownloadsStorageStats {
    private static final double GIB = 1_073_741_824.0;

    private LocalDownloadsStorageStats() {}

    static Snapshot snapshot() {
        Context context = MorpheSettingsRuntime.applicationContext();
        return context == null ? Snapshot.unavailable() : snapshot(context, MorpheStoragePath.uri());
    }

    static Snapshot snapshot(Context context, Uri location) {
        File root = MorpheStoragePath.selectedStorageRoot(context, location);
        return snapshot(root);
    }

    static Snapshot snapshot(File root) {
        if (root == null || !root.isDirectory()) return Snapshot.unavailable();
        try {
            StatFs stats = new StatFs(root.getAbsolutePath());
            long total = Math.max(0L, stats.getTotalBytes());
            long available = Math.max(0L, Math.min(total, stats.getAvailableBytes()));
            return new Snapshot(total - available, total, available);
        } catch (RuntimeException ignored) {
            return Snapshot.unavailable();
        }
    }

    static String caption() { return snapshot().caption(); }

    static final class Snapshot {
        final long usedBytes;
        final long totalBytes;
        final long availableBytes;

        Snapshot(long usedBytes, long totalBytes) {
            this(usedBytes, totalBytes, Math.max(0L, totalBytes - usedBytes));
        }

        Snapshot(long usedBytes, long totalBytes, long availableBytes) {
            this.usedBytes = Math.max(0L, usedBytes);
            this.totalBytes = Math.max(0L, totalBytes);
            this.availableBytes = Math.max(0L, Math.min(this.totalBytes, availableBytes));
        }

        static Snapshot unavailable() { return new Snapshot(0L, 0L, 0L); }

        boolean isAvailable() { return totalBytes > 0L; }

        String caption() {
            if (!isAvailable()) return MorpheTranslations.text("Selected storage usage unavailable");
            double percent = usedBytes * 100.0 / totalBytes;
            return MorpheTranslations.format("%.1f GB used / %.1f GB total (%.0f%% full)",
                    usedBytes / GIB, totalBytes / GIB, percent);
        }
    }
}
