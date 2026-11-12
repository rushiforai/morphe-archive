/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.charset.StandardCharsets;
import java.nio.file.StandardCopyOption;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * The pages of the downloaded lists as the app received them: the browse response of every playlist and album page
 * a downloaded list was opened with while online, one compressed file per page (named by the page's id, without the
 * {@code VL} of a playlist page), replaced by each later online open. A page whose id is not the list's own (an album
 * page of a list downloaded under its audio playlist id) has a small file naming its list. With no network the app
 * answers the browse of such a page with the recorded response instead of an error, so the list opens as the page it
 * is online. {@link #has} is in memory; reading and writing belong to a worker thread.
 */
public final class OfflineBrowsePages {
    /** Added by the Downloads patch to the browse result the app's success callback receives. */
    public interface Bytes {
        /** The serialized browse response the result holds. */
        byte[] rvxBrowseBytes();
    }

    private static final String DIRECTORY = "rvx_offline_pages";
    private static final String SUFFIX = ".page";
    private static final String OWNER_SUFFIX = ".list";

    private static final Set<String> ids = ConcurrentHashMap.newKeySet();
    /** The list of the pages whose id is not the list's own, by page id. */
    private static final Map<String, String> owners = new ConcurrentHashMap<>();

    private OfflineBrowsePages() {}

    private static File directory() {
        return new File(Utils.getContext().getFilesDir(), DIRECTORY);
    }

    private static File fileOf(String pageId) {
        return new File(directory(), pageId + SUFFIX);
    }

    private static File ownerFileOf(String pageId) {
        return new File(directory(), pageId + OWNER_SUFFIX);
    }

    /** Learns which pages are recorded. A worker thread; the answers of {@link #has} are false until it ran. */
    static void load() {
        File[] files = directory().listFiles();
        if (files == null) return;

        for (File file : files) {
            String name = file.getName();
            if (name.endsWith(SUFFIX)) {
                ids.add(name.substring(0, name.length() - SUFFIX.length()));
            } else if (name.endsWith(OWNER_SUFFIX)) {
                readOwner(file, name.substring(0, name.length() - OWNER_SUFFIX.length()));
            }
        }
    }

    private static void readOwner(File file, String pageId) {
        try {
            owners.put(pageId, new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8));
        } catch (IOException ex) {
            Logger.printException(() -> "OfflineBrowsePages: could not read the list of the page " + pageId, ex);
        }
    }

    /** Whether a page is recorded under the id. In memory, so the main thread may ask; false until loaded. */
    static boolean has(String pageId) {
        return ids.contains(pageId);
    }

    /**
     * Records a page of the list, replacing the earlier one of the same id. A worker thread. Returns the compressed
     * size, which is what the file holds.
     */
    static int write(String pageId, String listId, byte[] response) throws IOException {
        Utils.verifyOffMainThread();
        if (!OfflineBrowsePagesLogic.isFileSafe(pageId)) throw new IOException("Not a file name: " + pageId);

        byte[] packed = OfflineBrowsePagesLogic.gzip(response);
        File directory = directory();
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("No pages directory");

        if (!listId.equals(pageId)) {
            replace(ownerFileOf(pageId), listId.getBytes(StandardCharsets.UTF_8));
            owners.put(pageId, listId);
        }
        replace(fileOf(pageId), packed);
        ids.add(pageId);
        return packed.length;
    }

    private static void replace(File file, byte[] content) throws IOException {
        File pending = new File(file.getPath() + ".part");
        try {
            Files.write(pending.toPath(), content);
            Files.move(pending.toPath(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        } finally {
            Files.deleteIfExists(pending.toPath());
        }
    }

    /** The recorded page under the id, or null when there is none or it cannot be read. */
    @Nullable
    static byte[] read(String pageId) {
        if (!ids.contains(pageId) || !OfflineBrowsePagesLogic.isFileSafe(pageId)) return null;

        try {
            return OfflineBrowsePagesLogic.gunzip(Files.readAllBytes(fileOf(pageId).toPath()));
        } catch (IOException ex) {
            Logger.printException(() -> "OfflineBrowsePages: could not read the page " + pageId, ex);
            return null;
        }
    }

    /** Forgets the pages of the lists that are no longer kept. A worker thread. */
    static void retainOnly(Set<String> listIds) {
        for (String id : Set.copyOf(ids)) {
            if (listIds.contains(owners.getOrDefault(id, id))) continue;

            try {
                Files.deleteIfExists(fileOf(id).toPath());
                Files.deleteIfExists(ownerFileOf(id).toPath());
                ids.remove(id);
                owners.remove(id);
            } catch (IOException ex) {
                Logger.printException(() -> "OfflineBrowsePages: could not delete the page " + id, ex);
            }
        }
    }
}
