package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.content.Context;
import android.net.Uri;
import android.os.Environment;
import android.os.storage.StorageManager;
import android.os.storage.StorageVolume;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Locale;

import io.github.liongalahad.nuviotv.extension.settings.MorpheStoragePath;

/** Selects FAT32-compatible segmentation without exposing a user setting. */
final class LocalDownloadsStorageFormat {
    static final long SEGMENT_BYTES = 3_750_000_000L;

    enum Kind { FAT32, LARGE_FILE_CAPABLE, REMOVABLE_UNKNOWN, UNKNOWN }

    private LocalDownloadsStorageFormat() {}

    static boolean shouldSegment(Context context, Uri location, long expectedBytes) {
        Kind kind = classify(context, location);
        if (kind == Kind.FAT32 || kind == Kind.REMOVABLE_UNKNOWN) return true;
        // A document provider can hide the underlying removable filesystem. Use the rolling
        // writer defensively; it collapses a one-part result back to an ordinary video file.
        return kind == Kind.UNKNOWN && location != null &&
                "content".equalsIgnoreCase(location.getScheme());
    }

    static Kind classify(Context context, Uri location) {
        File root = MorpheStoragePath.selectedStorageRoot(context, location);
        if (root == null) return Kind.UNKNOWN;
        String type = filesystemType(root, readMountInfo());
        if (isFat32(type)) return Kind.FAT32;
        if (isKnownLargeFileType(type)) return Kind.LARGE_FILE_CAPABLE;
        if (same(root, Environment.getExternalStorageDirectory())) return Kind.LARGE_FILE_CAPABLE;
        return isRemovable(context, root) ? Kind.REMOVABLE_UNKNOWN : Kind.UNKNOWN;
    }

    static String readMountInfo() {
        StringBuilder value = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new FileReader("/proc/self/mountinfo"))) {
            String line;
            while ((line = reader.readLine()) != null) value.append(line).append('\n');
        } catch (IOException ignored) { }
        return value.toString();
    }

    static String filesystemType(File root, String mountInfo) {
        if (root == null || mountInfo == null) return "";
        String target;
        String original = root.getPath().replace('\\', '/');
        if (original.startsWith("/")) target = original;
        else {
            try { target = root.getCanonicalPath().replace('\\', '/'); }
            catch (IOException error) { target = root.getAbsolutePath().replace('\\', '/'); }
        }
        String bestMount = "";
        String bestType = "";
        for (String line : mountInfo.split("\\r?\\n")) {
            int separator = line.indexOf(" - ");
            if (separator < 0) continue;
            String[] left = line.substring(0, separator).split(" ");
            String[] right = line.substring(separator + 3).split(" ");
            if (left.length < 5 || right.length < 1) continue;
            String mount = decodeMountPath(left[4]);
            if (!(target.equals(mount) || target.startsWith(mount.endsWith("/")
                    ? mount : mount + "/"))) continue;
            if (mount.length() > bestMount.length()) {
                bestMount = mount;
                bestType = right[0].toLowerCase(Locale.ROOT);
            }
        }
        return bestType;
    }

    static boolean isFat32(String type) {
        if (type == null) return false;
        String normalized = type.toLowerCase(Locale.ROOT);
        return normalized.equals("vfat") || normalized.equals("fat") ||
                normalized.equals("fat32") || normalized.equals("msdos");
    }

    static boolean isKnownLargeFileType(String type) {
        if (type == null) return false;
        String normalized = type.toLowerCase(Locale.ROOT);
        return normalized.equals("exfat") || normalized.equals("ntfs") ||
                normalized.equals("ntfs3") || normalized.equals("f2fs") ||
                normalized.equals("xfs") || normalized.equals("btrfs") ||
                normalized.startsWith("ext");
    }

    private static boolean isRemovable(Context context, File root) {
        try {
            StorageManager manager = context.getSystemService(StorageManager.class);
            StorageVolume volume = manager == null ? null : manager.getStorageVolume(root);
            return volume != null && volume.isRemovable();
        } catch (RuntimeException ignored) {
            return !same(root, Environment.getExternalStorageDirectory());
        }
    }

    private static boolean same(File first, File second) {
        if (first == null || second == null) return false;
        try { return first.getCanonicalFile().equals(second.getCanonicalFile()); }
        catch (IOException error) { return first.getAbsolutePath().equals(second.getAbsolutePath()); }
    }

    private static String decodeMountPath(String value) {
        return value.replace("\\040", " ").replace("\\011", "\t")
                .replace("\\134", "\\").replace("\\043", "#");
    }
}
