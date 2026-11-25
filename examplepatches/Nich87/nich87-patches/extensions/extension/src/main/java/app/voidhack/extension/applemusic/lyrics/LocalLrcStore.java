package app.voidhack.extension.applemusic.lyrics;

import android.content.Context;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/**
 * App-private persistent storage for per-song manually imported local LRC files.
 */
final class LocalLrcStore {
    private static final String TAG = "AppleMusicLrclib";
    private static final String DIR_NAME = "voidhack_local_lrc";

    private LocalLrcStore() {}

    static File storeDir(Context context) {
        File dir = new File(context.getApplicationContext().getFilesDir(), DIR_NAME);
        if (!dir.exists()) dir.mkdirs();
        return dir;
    }

    private static File fileForTrack(Context context, String trackKey) {
        return new File(storeDir(context), fileNameForTrack(trackKey));
    }

    private static String fileNameForTrack(String trackKey) {
        return "track_" + sha256Hex(trackKey) + ".lrc";
    }

    static boolean saveTrackLrc(Context context, String trackKey, String content) {
        if (context == null || trackKey == null || trackKey.isEmpty() || content == null || content.trim().isEmpty()) {
            return false;
        }
        File target = fileForTrack(context, trackKey);
        File tmp = new File(target.getParentFile(), target.getName() + ".tmp");
        try {
            byte[] bytes = content.getBytes(StandardCharsets.UTF_8);
            try (FileOutputStream out = new FileOutputStream(tmp)) {
                out.write(bytes);
            }
            if (!tmp.renameTo(target)) {
                try (FileOutputStream out = new FileOutputStream(target)) {
                    out.write(bytes);
                }
                tmp.delete();
            }
            return true;
        } catch (IOException e) {
            tmp.delete();
            Log.w(TAG, "Failed saving per-track local LRC file", e);
            return false;
        }
    }

    static String readTrackLrc(Context context, String trackKey) {
        if (context == null || trackKey == null || trackKey.isEmpty()) return null;
        File file = fileForTrack(context, trackKey);
        if (!file.isFile()) return null;
        try (FileInputStream in = new FileInputStream(file)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            int n;
            int total = 0;
            while ((n = in.read(buf)) != -1) {
                total += n;
                if (total > LocalLrcParser.MAX_LRC_BYTES) return null;
                out.write(buf, 0, n);
            }
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        } catch (IOException e) {
            Log.w(TAG, "Failed reading per-track local LRC file", e);
            return null;
        }
    }

    static boolean hasTrackLrc(Context context, String trackKey) {
        if (context == null || trackKey == null || trackKey.isEmpty()) return false;
        return fileForTrack(context, trackKey).isFile();
    }

    static void deleteTrackLrc(Context context, String trackKey) {
        if (context == null || trackKey == null || trackKey.isEmpty()) return;
        File file = fileForTrack(context, trackKey);
        if (file.exists()) file.delete();
    }

    static void pruneUnused(Context context, Set<String> activeLocalTrackKeys) {
        if (context == null) return;
        Set<String> keepFileNames = new HashSet<>();
        if (activeLocalTrackKeys != null) {
            for (String key : activeLocalTrackKeys) {
                if (key != null && !key.isEmpty()) {
                    keepFileNames.add(fileNameForTrack(key));
                }
            }
        }
        File[] files = storeDir(context).listFiles();
        if (files == null) return;
        for (File f : files) {
            String name = f.getName();
            if (name.startsWith("track_") && name.endsWith(".lrc") && !keepFileNames.contains(name)) {
                f.delete();
            }
        }
    }

    private static String sha256Hex(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] digest = md.digest(input.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder(digest.length * 2);
            for (byte b : digest) {
                sb.append(String.format(Locale.ROOT, "%02x", b));
            }
            return sb.toString();
        } catch (Exception e) {
            return Integer.toHexString(input.hashCode());
        }
    }
}
