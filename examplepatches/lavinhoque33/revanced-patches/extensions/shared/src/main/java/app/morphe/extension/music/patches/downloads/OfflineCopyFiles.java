/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * The stored player response, metadata and optional cover of each stream copy, in a directory of its own beside
 * the raw copies. A copy is {@code <id>.resp}, {@code <id>.thumb} (optional) and {@code <id>.json}; the JSON is the
 * commit record and is published last, and names the byte lengths of the other two. Every file is written to a
 * {@code .part} file and renamed. The ids of the committed copies, with where each response came from, are kept in
 * memory once {@link #ensureLoaded} has run, so that {@link #has} never touches the disk. All disk access
 * belongs to a worker thread.
 */
final class OfflineCopyFiles {
    /** What a stored copy holds. {@code thumbnail} is null when no cover was stored. */
    record Stored(OfflineCopyMetadata metadata, byte[] response, @Nullable byte[] thumbnail) {}

    /** The sizes of what {@link #write} stored; {@code thumbnailBytes} is 0 when no cover was stored. */
    record Written(int responseBytes, int thumbnailBytes) {}

    /** The commit record as read: the metadata and the lengths it promises for the other files. */
    private record Commit(OfflineCopyMetadata metadata, long responseBytes, long thumbnailBytes) {}

    /** A trimmed response is a few kilobytes; a larger one is not what was meant to be stored. */
    static final int MAX_RESPONSE_BYTES = 64 * 1024;
    /** A larger cover is simply not cached: the url stays in the metadata. */
    static final int MAX_THUMBNAIL_BYTES = 256 * 1024;

    private static final String RESPONSE = ".resp";
    private static final String THUMBNAIL = ".thumb";
    private static final String COMMIT = ".json";
    private static final String PENDING = ".part";
    private static final long MAX_COMMIT_BYTES = 8192;

    private final File directory;
    private final Map<String, String> responseSources = new ConcurrentHashMap<>();
    private volatile boolean loaded;

    OfflineCopyFiles(File directory) {
        this.directory = directory;
    }

    /** Reads the committed ids off the disk once. Safe to call again; later calls do nothing. */
    synchronized void ensureLoaded() {
        if (loaded) return;

        File[] files = directory.listFiles();
        if (files != null) {
            for (File file : files) {
                String name = file.getName();
                if (!name.endsWith(COMMIT)) continue;

                String id = idOf(name);
                try {
                    Commit commit = committed(id);
                    if (commit != null) responseSources.put(id, commit.metadata().responseSource());
                } catch (IOException | JSONException ignored) {
                    // A malformed commit is not a stored copy; the orphan cleanup removes its files.
                }
            }
        }
        loaded = true;
    }

    /** The file of the stored cover of a copy, or null when it has none. */
    @Nullable
    File thumbnailFile(String videoId) {
        File file = file(videoId, THUMBNAIL);
        return file.isFile() && file.length() > 0 ? file : null;
    }

    /** Whether the copy has stored data. False until {@link #ensureLoaded} has finished. No disk access. */
    boolean has(String videoId) {
        return responseSources.containsKey(videoId);
    }

    /** Whether the stored response is the app's own one. False until loaded or when absent. No disk access. */
    boolean hasOnlineResponse(String videoId) {
        return OfflineCopyMetadata.SOURCE_ONLINE.equals(responseSources.get(videoId));
    }

    /** The ids that have stored data. No disk access. */
    Set<String> ids() {
        return new HashSet<>(responseSources.keySet());
    }

    /**
     * Publishes the data of a copy, replacing what was stored. A cover over {@link #MAX_THUMBNAIL_BYTES} is
     * dropped.
     *
     * @return The stored sizes, or null with nothing written when the response is empty or over
     * {@link #MAX_RESPONSE_BYTES} or the id is not a video id; a failed write throws and leaves no commit record.
     */
    @Nullable
    synchronized Written write(OfflineCopyMetadata metadata, byte[] response, @Nullable byte[] thumbnail)
            throws IOException, JSONException {
        String id = metadata.videoId();
        if (!RawAudioFiles.validId(id) || response.length == 0 || response.length > MAX_RESPONSE_BYTES) {
            return null;
        }
        byte[] cover = thumbnail != null && thumbnail.length > 0 && thumbnail.length <= MAX_THUMBNAIL_BYTES
                ? thumbnail : null;
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("No offline directory");

        JSONObject commit = metadata.toJson().put("responseBytes", response.length)
                .put("thumbnailBytes", cover == null ? 0 : cover.length);
        File responseFile = file(id, RESPONSE);
        File thumbnailFile = file(id, THUMBNAIL);
        File commitFile = file(id, COMMIT);
        File pendingResponse = file(id, RESPONSE + PENDING);
        File pendingThumbnail = file(id, THUMBNAIL + PENDING);
        File pendingCommit = file(id, COMMIT + PENDING);
        // Invalidate the previous commit before replacing any bytes, even if the new write later fails.
        responseSources.remove(id);
        Files.deleteIfExists(commitFile.toPath());
        try {
            Files.write(pendingResponse.toPath(), response);
            if (cover != null) Files.write(pendingThumbnail.toPath(), cover);
            Files.write(pendingCommit.toPath(), commit.toString().getBytes(StandardCharsets.UTF_8));
            move(pendingResponse, responseFile);
            if (cover != null) move(pendingThumbnail, thumbnailFile);
            else Files.deleteIfExists(thumbnailFile.toPath());
            move(pendingCommit, commitFile);
        } catch (IOException | RuntimeException ex) {
            Files.deleteIfExists(responseFile.toPath());
            Files.deleteIfExists(thumbnailFile.toPath());
            throw ex;
        } finally {
            Files.deleteIfExists(pendingResponse.toPath());
            Files.deleteIfExists(pendingThumbnail.toPath());
            Files.deleteIfExists(pendingCommit.toPath());
        }
        responseSources.put(id, metadata.responseSource());
        return new Written(response.length, cover == null ? 0 : cover.length);
    }

    /** The stored data of a copy, or null when it has none or its commit does not match its files. */
    @Nullable
    synchronized Stored read(String videoId) {
        try {
            Commit commit = committed(videoId);
            if (commit == null) return null;

            byte[] response = Files.readAllBytes(file(videoId, RESPONSE).toPath());
            byte[] thumbnail = commit.thumbnailBytes() > 0
                    ? Files.readAllBytes(file(videoId, THUMBNAIL).toPath()) : null;
            return new Stored(commit.metadata(), response, thumbnail);
        } catch (IOException | JSONException ex) {
            return null;
        }
    }

    /** The metadata of a copy that has committed stored data, or null. Does not read the response. */
    @Nullable
    OfflineCopyMetadata metadata(String videoId) {
        try {
            Commit commit = committed(videoId);
            return commit == null ? null : commit.metadata();
        } catch (IOException | JSONException ex) {
            return null;
        }
    }

    /** The metadata of every copy that has committed stored data. */
    List<OfflineCopyMetadata> allMetadata() {
        List<OfflineCopyMetadata> all = new ArrayList<>();
        for (String id : ids()) {
            OfflineCopyMetadata metadata = metadata(id);
            if (metadata != null) all.add(metadata);
        }
        return all;
    }

    synchronized void delete(String videoId) {
        if (!RawAudioFiles.validId(videoId)) return;

        responseSources.remove(videoId);
        File[] files = directory.listFiles((parent, name) -> name.startsWith(videoId + "."));
        if (files != null) for (File file : files) file.delete();
    }

    /** Removes every file of the directory, stored data and leftovers alike. */
    synchronized void clear() {
        responseSources.clear();
        File[] files = directory.listFiles();
        if (files != null) for (File file : files) file.delete();
    }

    /**
     * Removes the files of every copy that is not in {@code copyIds}, and any leftover or uncommitted file. Files
     * modified after {@code notAfterMillis} are kept: they were published after {@code copyIds} was read.
     */
    synchronized void retainOnly(Set<String> copyIds, long notAfterMillis) {
        File[] files = directory.listFiles();
        if (files == null) return;

        for (File file : files) {
            String id = idOf(file.getName());
            boolean liveCopy = copyIds.contains(id) && file(id, COMMIT).isFile();
            if (liveCopy && isCopyFile(file.getName())) continue;
            if (file.lastModified() > notAfterMillis) continue;

            // A leftover of a live copy (an interrupted write) goes, the copy's stored data stays.
            if (!liveCopy) responseSources.remove(id);
            file.delete();
        }
    }

    /** The commit record when it is well formed and its files have the recorded lengths, otherwise null. */
    @Nullable
    private Commit committed(String videoId) throws IOException, JSONException {
        if (!RawAudioFiles.validId(videoId)) return null;

        File commitFile = file(videoId, COMMIT);
        if (!commitFile.isFile() || commitFile.length() > MAX_COMMIT_BYTES) return null;

        JSONObject json = new JSONObject(new String(Files.readAllBytes(commitFile.toPath()), StandardCharsets.UTF_8));
        OfflineCopyMetadata metadata = OfflineCopyMetadata.fromJson(json);
        long responseBytes = json.getLong("responseBytes");
        long thumbnailBytes = json.optLong("thumbnailBytes");
        if (!videoId.equals(metadata.videoId()) || responseBytes <= 0
                || file(videoId, RESPONSE).length() != responseBytes) return null;
        if (thumbnailBytes > 0 && file(videoId, THUMBNAIL).length() != thumbnailBytes) return null;

        return new Commit(metadata, responseBytes, thumbnailBytes);
    }

    private File file(String videoId, String suffix) {
        return new File(directory, videoId + suffix);
    }

    private static void move(File from, File to) throws IOException {
        Files.move(from.toPath(), to.toPath(), StandardCopyOption.REPLACE_EXISTING);
    }

    private static boolean isCopyFile(String name) {
        return name.endsWith(RESPONSE) || name.endsWith(THUMBNAIL) || name.endsWith(COMMIT);
    }

    private static String idOf(String fileName) {
        int dot = fileName.indexOf('.');
        return dot < 0 ? fileName : fileName.substring(0, dot);
    }
}
