/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.net.Uri;
import android.os.Environment;
import android.provider.DocumentsContract;

import androidx.annotation.Nullable;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.StringSetting;

/**
 * Where Download pins saves (#5): Download, Pinterest's own folder, or a folder picked by hand.
 *
 * <p>A folder is a path on the phone's own storage, such as {@code Pictures/Art}. Android's
 * DownloadManager writes the file there itself, so nothing is copied and no storage permission is
 * needed. It only writes into the standard public folders, and a picture or a video can go into
 * four of them, so a picked folder has to be one of those or inside one.
 */
public final class DownloadFolder {
    private DownloadFolder() {}

    /** The folder in Pictures that Pinterest's own image save writes to. */
    public static final String PINTEREST = Environment.DIRECTORY_PICTURES + "/100PINT/Pins";

    /** The top folders a picked folder can be in, spelled as Android spells them. */
    static final String[] ROOTS = {
            Environment.DIRECTORY_PICTURES, Environment.DIRECTORY_DCIM,
            Environment.DIRECTORY_DOWNLOADS, Environment.DIRECTORY_DOCUMENTS,
    };

    /** Longest folder path kept, so every history line stays short. */
    static final int MAX_LENGTH = 120;

    /**
     * The folder picked by hand, or empty for none. It stays out of settings files: a path picked on
     * one phone may not mean anything on another.
     */
    public static final StringSetting PICKED = new StringSetting("hushpinterest_download_folder", "", false, false);

    /** Who answers Android's folder picker for the phone's own storage. */
    static final String STORAGE_AUTHORITY = "com.android.externalstorage.documents";

    /**
     * The folder the next download goes to, or null for Download. Save in Pinterest's folder wins
     * while it's on; then a picked folder. Settings that can't be read keep Download.
     */
    @Nullable
    public static String current() {
        try {
            if (Settings.SAVE_IN_PINTEREST_FOLDER.get()) return PINTEREST;
            return normalize(PICKED.get());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "folder switch read", failure);
            return null;
        }
    }

    /** The picked folder, or null when there's none or it no longer reads as one. */
    @Nullable
    public static String picked() {
        try {
            return normalize(PICKED.get());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "picked folder read", failure);
            return null;
        }
    }

    /**
     * The folder a tree from Android's folder picker stands for, such as {@code Pictures/Art}.
     * Null for a tree on a memory card or USB drive, or outside the folders DownloadManager writes to.
     * The top of Download stands for Download itself, which is {@link #DOWNLOAD}.
     */
    @Nullable
    public static String fromTree(@Nullable Uri tree) {
        if (tree == null || !STORAGE_AUTHORITY.equals(tree.getAuthority())) return null;
        String id;
        try {
            id = DocumentsContract.getTreeDocumentId(tree);
        } catch (RuntimeException notATree) {
            return null;
        }
        if (id == null || !id.startsWith("primary:")) return null;
        String path = id.substring("primary:".length()).trim();
        while (path.endsWith("/")) path = path.substring(0, path.length() - 1);
        if (path.equalsIgnoreCase(Environment.DIRECTORY_DOWNLOADS)) return DOWNLOAD;
        return normalize(path);
    }

    /** What {@link #fromTree} gives for the top of Download. */
    public static final String DOWNLOAD = Environment.DIRECTORY_DOWNLOADS;

    /**
     * [path] as a folder DownloadManager can write into, with its top folder spelled the way Android
     * spells it, or null when it isn't one. The top of Download is null too: that's no folder at all.
     */
    @Nullable
    static String normalize(@Nullable String path) {
        if (path == null) return null;
        String trimmed = path.trim();
        while (trimmed.endsWith("/")) trimmed = trimmed.substring(0, trimmed.length() - 1);
        if (trimmed.isEmpty() || trimmed.length() > MAX_LENGTH) return null;
        String[] segments = trimmed.split("/", -1);
        String root = null;
        for (String known : ROOTS) {
            if (known.equalsIgnoreCase(segments[0])) root = known;
        }
        if (root == null) return null;
        StringBuilder folder = new StringBuilder(root);
        for (int i = 1; i < segments.length; i++) {
            if (!validSegment(segments[i])) return null;
            folder.append('/').append(segments[i]);
        }
        String result = folder.toString();
        return result.equals(Environment.DIRECTORY_DOWNLOADS) ? null : result;
    }

    private static boolean validSegment(String segment) {
        if (segment.isEmpty() || segment.equals(".") || segment.equals("..") || !segment.equals(segment.trim())) return false;
        for (int i = 0; i < segment.length(); i++) {
            char c = segment.charAt(i);
            // Characters FAT and Android's media storage refuse in a name.
            if (c < 0x20 || c == 0x7f || "\\:*?\"<>|".indexOf(c) >= 0) return false;
        }
        return true;
    }

    /** The public folder DownloadManager is handed for [folder], or Download for null. */
    static String directory(@Nullable String folder) {
        if (folder == null) return Environment.DIRECTORY_DOWNLOADS;
        int slash = folder.indexOf('/');
        return slash < 0 ? folder : folder.substring(0, slash);
    }

    /** The path under {@link #directory} for [fileName] in [folder]. */
    static String subPath(@Nullable String folder, String fileName) {
        int slash = folder == null ? -1 : folder.indexOf('/');
        return slash < 0 ? fileName : folder.substring(slash + 1) + "/" + fileName;
    }

    /**
     * The folder a request's local URI is in, or null for Download or a URI that says nothing. For a
     * public folder Android reports the requested destination there once the request has started; a
     * request it never started (held for a network that failed Android's check) reports none.
     */
    @Nullable
    static String of(@Nullable String localUri) {
        // Read as text, not through Uri: a path that isn't absolute would be taken for a host.
        if (localUri == null || !localUri.startsWith("file:")) return null;
        String path;
        try {
            path = trimSlashes(Uri.decode(localUri.substring("file:".length())));
        } catch (RuntimeException unreadable) {
            return null;
        }
        int end = path.lastIndexOf('/');
        if (end <= 0) return null;
        String parent = path.substring(0, end);
        // The phone's own storage first; another volume's top folders are found by name.
        String storage = trimSlashes(Environment.getExternalStorageDirectory().getPath());
        if (parent.startsWith(storage + "/")) return normalize(parent.substring(storage.length() + 1));
        String[] segments = parent.split("/");
        for (int i = 0; i < segments.length; i++) {
            for (String root : ROOTS) {
                if (root.equalsIgnoreCase(segments[i])) {
                    StringBuilder folder = new StringBuilder(segments[i]);
                    for (int j = i + 1; j < segments.length; j++) folder.append('/').append(segments[j]);
                    return normalize(folder.toString());
                }
            }
        }
        return null;
    }

    /**
     * [path] with forward slashes and none in front. A folder name never holds a backslash
     * (normalize refuses one), so any here separates folders.
     */
    private static String trimSlashes(String path) {
        String forward = path.replace('\\', '/');
        int start = 0;
        while (start < forward.length() && forward.charAt(start) == '/') start++;
        return forward.substring(start);
    }

    /** [folder] as it's kept in a history line, which commas separate. */
    static String encode(String folder) {
        return folder.replace("%", "%25").replace(",", "%2C");
    }

    /** The folder an {@link #encode}d history field holds, or null when it isn't one. */
    @Nullable
    static String decode(String field) {
        return normalize(field.replace("%2C", ",").replace("%25", "%"));
    }
}
