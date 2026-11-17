/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;

import java.io.File;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Supplier;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Files you already have (#79). Telegram keeps a list, one per account, of where it put a named
 * file and a photo or video from a chat that allows saving. A file that isn't on the account's
 * list shows a download button, even when another account already put it in Telegram's folders,
 * or the list went away with a logout or a reinstall. A tap then finishes at once, since Telegram
 * finds the file there at the size it expects. With {@link Settings#KNOWN_FILES} on,
 * {@link #knownFile} makes that same check before the tap, so the file shows as downloaded and
 * opens. Telegram's servers don't send a hash of a file, so the name and exact size are what it
 * goes by, the same as Telegram's own check. Anything that doesn't match comes back as it came.
 */
public final class KnownFiles {
    /** How far Telegram's "name (1).pdf", "name (2).pdf" numbering is followed for a name another file already took. */
    static final int MAX_COPIES = 20;
    /** Telegram's folder for a file it keeps under the file's own name. */
    static final String FILES = "Telegram Files";
    /** The folder getPathToAttach names for any other document, under the downloader's name for it. */
    static final String DOCUMENTS = "Telegram Documents";
    /** Telegram's folder in Android/media, and the folders a photo or video from a chat that allows saving goes in there. */
    static final String TELEGRAM = "Telegram";
    static final String IMAGES = "Telegram Images";
    static final String VIDEO = "Telegram Video";
    /** The Android/media folders, where Telegram keeps photos and videos from chats that allow saving. */
    static Supplier<File[]> mediaFolders = () -> {
        Context context = Utils.getContext();
        return context == null ? new File[0] : context.getExternalMediaDirs();
    };

    /** What the extension reads from Telegram's objects, swapped out in tests. */
    interface Telegram {
        /** A document's own file name, or null for anything that isn't a document. */
        String documentName(Object attach);

        /** A document's or photo size's size in bytes, or 0 when it isn't one of those or has none. */
        long size(Object attach);
    }

    static Telegram telegram = new Telegram() {
        @Override
        public String documentName(Object attach) {
            return KnownFiles.documentName(attach);
        }

        @Override
        public long size(Object attach) {
            return KnownFiles.size(attach);
        }
    };

    private KnownFiles() {}

    /**
     * Called on the path FileLoader.getPathToAttach makes for a document, photo or video, right
     * before it hands it back, after the storage folder has had its say. A missing file gives the
     * one Telegram already has of the same name and size: a named file in Telegram Files, in this
     * folder or one Telegram's folder moved from, or a photo or video in Android/media. Anything
     * else comes back as it came, so a new download still goes where Telegram puts it.
     */
    public static File knownFile(Object attach, File file) {
        HookStatus.invoked(FamilyNames.SAVE_DOWNLOADS);
        if (attach == null || file == null) return file;
        try {
            if (!Settings.KNOWN_FILES.get() || file.exists()) return file;
            File known = find(attach, file);
            if (known == null) return file;
            HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, "known file");
            return known;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "known file", t);
            return file;
        }
    }

    /** The file Telegram already has for [attach], whose own path [file] is missing, or null. */
    static File find(Object attach, File file) {
        File folder = file.getParentFile();
        File root = folder == null ? null : folder.getParentFile();
        if (root == null) return null;
        long size = telegram.size(attach);
        if (size <= 0) return null;
        String kind = folder.getName();
        if (DOCUMENTS.equals(kind)) {
            String name = telegram.documentName(attach);
            if (name == null || name.isEmpty()) return null;
            for (File each : roots(root)) {
                File copy = named(new File(each, FILES), name, size);
                if (copy != null) return copy;
            }
            return null;
        }
        if (!IMAGES.equals(kind) && !VIDEO.equals(kind)) return null;
        File[] media = mediaFolders.get();
        if (media == null) return null;
        for (File each : media) {
            if (each == null) continue;
            File copy = new File(new File(new File(each, TELEGRAM), kind), file.getName());
            if (copy.isFile() && copy.length() == size) return copy;
        }
        return null;
    }

    /** [root], then the folders Telegram's own moved from or was moved to before, each once. */
    static List<File> roots(File root) {
        Set<String> seen = new LinkedHashSet<>();
        List<File> roots = new ArrayList<>();
        seen.add(root.getPath());
        roots.add(root);
        File[] places = StorageFolder.moved;
        if (places != null) {
            for (File place : places) {
                if (place != null && seen.add(place.getPath())) roots.add(place);
            }
        }
        return roots;
    }

    /**
     * The file in [folder] under [name] at [size], or under the "name (1).ext" Telegram gives a
     * later download whose name was taken, up to the first number that isn't there. Null when none.
     */
    static File named(File folder, String name, long size) {
        int dot = name.lastIndexOf('.');
        for (int n = 0; n <= MAX_COPIES; n++) {
            String each = n == 0 ? name
                    : dot > 0 ? name.substring(0, dot) + " (" + n + ")" + name.substring(dot) : name + " (" + n + ")";
            File copy = new File(folder, each);
            if (!copy.exists()) {
                if (n > 0) return null;
                continue;
            }
            if (copy.isFile() && copy.length() == size) return copy;
        }
        return null;
    }

    // Stubs: the patch writes their bodies, which read Telegram's own objects.

    /** {@code attach instanceof TLRPC.Document ? FileLoader.getDocumentFileName(attach) : null}. */
    public static String documentName(Object attach) { return null; }

    /** {@code TLRPC.Document.size}, or {@code TLRPC.PhotoSize.size}, or 0 for anything else. */
    public static long size(Object attach) { return 0L; }
}
