package app.morphe.extension.chmate;

import android.net.Uri;
import java.io.File;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Resolves ChMate's numbered DAT copies using the thread ID from the archive folder. */
public final class NativeArchiveCopies {
    private static final Pattern THREAD_DIRECTORY = Pattern.compile("\\[([0-9]{9,13})\\]$");

    private NativeArchiveCopies() {}

    private static String datStem(File directory) {
        File board = directory == null ? null : directory.getParentFile();
        File archive = board == null ? null : board.getParentFile();
        if (archive == null || !"archive".equals(archive.getName())) return null;
        Matcher thread = THREAD_DIRECTORY.matcher(directory.getName());
        return thread.find() ? board.getName() + "_" + thread.group(1) : null;
    }

    private static boolean matchesCopy(String name, String stem) {
        if (!name.startsWith(stem) || !name.endsWith(".dat")) return false;
        int end = name.length() - 4;
        if (end == stem.length()) return true;
        if (end - stem.length() > 10 || name.charAt(stem.length()) == '0') return false;
        for (int i = stem.length(); i < end; i++)
            if (name.charAt(i) < '0' || name.charAt(i) > '9') return false;
        return true;
    }

    public static File[] listDatCopies(File directory) {
        File[] files = directory.listFiles();
        String stem = datStem(directory);
        if (files == null || stem == null) return files;
        File best = null;
        long modified = 0, size = 0;
        for (File candidate : files) {
            if (!matchesCopy(candidate.getName(), stem) || !candidate.isFile() || !candidate.canRead()) continue;
            long nextSize = candidate.length();
            if (nextSize == 0) continue;
            long nextModified = candidate.lastModified();
            if (best == null || nextModified > modified || nextModified == modified
                    && (nextSize > size || nextSize == size && candidate.getName().compareTo(best.getName()) < 0)) {
                best = candidate;
                modified = nextModified;
                size = nextSize;
            }
        }
        return best == null ? files : new File[]{best};
    }

    public static String threadDatName(Uri uri) {
        String name = uri.getLastPathSegment();
        String path = uri.getPath();
        if (name == null || path == null || !"file".equals(uri.getScheme())) return name;
        String stem = datStem(new File(path).getParentFile());
        return stem != null && matchesCopy(name, stem) ? stem + ".dat" : name;
    }
}
