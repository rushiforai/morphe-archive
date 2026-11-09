/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.os.Environment;
import android.text.format.Formatter;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import java.io.File;
import java.io.IOException;
import java.nio.file.NoSuchFileException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * Clear from cache (#53): stops a running download of a video or file, deletes what Telegram kept of
 * it (finished and partial files) and puts the download arrow back on the message. Only Telegram's
 * own cache and media folders are touched, and never a standard public folder such as Downloads or
 * Pictures, where a saved copy lives.
 */
final class CacheClear {
    private CacheClear() {}

    /** Telegram's folders by their numbers: images, audio, video, documents and cache. */
    private static final int FIRST_FOLDER = 0;
    private static final int LAST_FOLDER = 4;

    /** A cancelled download can leave or recreate a partial file a moment later, so the folders are swept twice. */
    static long secondSweepMillis = 1200;

    /** The endings Telegram gives a download's finished file, partial file, key file, parts list and preload. */
    static final String[] ENDINGS = {"", ".enc", ".temp", ".temp.enc", "_64.iv", "_64.iv.enc", "_64.pt", "_64.preload"};

    /** Sweeps run here one at a time, off the main thread. Tests swap in a direct one. */
    static Executor work = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "HushTelegram CacheClear");
        thread.setDaemon(true);
        return thread;
    });

    /** Where Telegram keeps its folders, and the standard public folders that are never touched. Tests swap in their own. */
    interface Folders {
        List<File> telegram();

        List<File> publicStorage();
    }

    static Folders folders = new Folders() {
        @Override
        public List<File> telegram() {
            List<File> roots = new ArrayList<>();
            for (int type = FIRST_FOLDER; type <= LAST_FOLDER; type++) {
                File root = MessageMenuTools.directory(type);
                if (root != null) roots.add(root);
            }
            return roots;
        }

        @Override
        public List<File> publicStorage() {
            List<File> roots = new ArrayList<>();
            for (String type : new String[]{Environment.DIRECTORY_DOWNLOADS, Environment.DIRECTORY_PICTURES, Environment.DIRECTORY_DCIM,
                    Environment.DIRECTORY_MOVIES, Environment.DIRECTORY_MUSIC, Environment.DIRECTORY_DOCUMENTS,
                    Environment.DIRECTORY_PODCASTS, Environment.DIRECTORY_RINGTONES, Environment.DIRECTORY_ALARMS,
                    Environment.DIRECTORY_NOTIFICATIONS, "Audiobooks"}) {
                roots.add(Environment.getExternalStoragePublicDirectory(type));
            }
            return roots;
        }
    };

    /**
     * Whether the file is inside one of Telegram's folders and outside every public one. Paths are
     * resolved first, so a link or a ".." can't point out of a folder.
     */
    static boolean allowed(File file, List<File> telegram, List<File> publicStorage) {
        String path = resolve(file);
        if (path == null) return false;
        for (File root : publicStorage) {
            String resolved = resolve(root);
            if (resolved != null && within(path, resolved)) return false;
        }
        for (File root : telegram) {
            String resolved = resolve(root);
            if (resolved != null && !path.equals(resolved) && within(path, resolved)) return true;
        }
        return false;
    }

    private static boolean within(String path, String root) {
        return path.equals(root) || path.startsWith(root.endsWith(File.separator) ? root : root + File.separator);
    }

    private static String resolve(File file) {
        if (file == null) return null;
        try {
            try {
                return file.toPath().toRealPath().toString();
            } catch (NoSuchFileException missing) {
                return file.getCanonicalPath();
            }
        } catch (IOException failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "resolve cache path", failure);
            return null;
        }
    }

    /** The name without its extension, which is what the partial files are named from. */
    static String base(String name) {
        int dot = name.lastIndexOf('.');
        return dot > 0 ? name.substring(0, dot) : name;
    }

    /** Every file Telegram could hold for the download: the finished one Telegram names, and each ending in each folder. */
    static List<File> candidates(String name, File finished, List<File> telegram) {
        Set<File> found = new LinkedHashSet<>();
        if (finished != null) found.add(finished);
        if (name != null && !name.isEmpty() && name.indexOf('/') < 0 && name.indexOf('\\') < 0 && !name.contains("..")) {
            String base = base(name);
            for (File root : telegram) {
                found.add(new File(root, name));
                for (String ending : ENDINGS) found.add(new File(root, base + ending));
            }
        }
        return new ArrayList<>(found);
    }

    /** Deletes what the check allows and returns the bytes freed. */
    static long sweep(List<File> files, List<File> telegram, List<File> publicStorage) {
        long freed = 0;
        for (File file : files) {
            if (!file.isFile() || !allowed(file, telegram, publicStorage)) continue;
            long size = file.length();
            if (file.delete()) freed += size;
            else HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "delete cached file", new IOException("Couldn't delete " + file.getName()));
        }
        return freed;
    }

    static void clear(Context context, Object message) {
        work.execute(() -> {
            try {
                String name = MessageMenuTools.attachName(message);
                MessageMenuTools.cancelLoad(message);
                List<File> telegram = folders.telegram();
                List<File> publicStorage = folders.publicStorage();
                List<File> files = candidates(name, MessageMenu.photoFile(message), telegram);
                long freed = sweep(files, telegram, publicStorage);
                refresh(message, name);
                if (secondSweepMillis > 0) Thread.sleep(secondSweepMillis);
                freed += sweep(files, telegram, publicStorage);
                refresh(message, name);
                String said = freed > 0
                        ? L10n.f(context, "Cleared %1$s", Formatter.formatShortFileSize(context, freed))
                        : L10n.t(context, "Nothing to clear");
                MessageMenu.feedback(context, said);
                if (freed > 0) HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "cache cleared");
            } catch (InterruptedException cancelled) {
                Thread.currentThread().interrupt();
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "clear from cache", failure);
                MessageMenu.feedback(context, L10n.t(context, "Couldn't clear that. Try again."));
            }
        });
    }

    /** Tells the open chat the file is gone, so the cell shows its download arrow again. */
    private static void refresh(Object message, String name) {
        if (name == null) return;
        Utils.runOnMainThread(() -> {
            try {
                MessageMenuTools.refreshMedia(message, name);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "refresh cleared message", failure);
            }
        });
    }
}
