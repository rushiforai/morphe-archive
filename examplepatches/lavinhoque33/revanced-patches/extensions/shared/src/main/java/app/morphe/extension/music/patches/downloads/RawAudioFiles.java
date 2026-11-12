/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.regex.Pattern;

/**
 * Original itag bytes; the JSON is the commit record and is published last. All callers own a worker thread.
 *
 * <p>An entry is self-contained. It is either a stream-only copy (the private copy of Play downloads locally, with
 * no native track) or tied to a native track (written together with a local file); only a tied entry needs its
 * native track to still exist. The JSON names the origin ({@code "origin"}); earlier test builds wrote only tied
 * entries, with a {@code "muxed"} URI and no origin, and are read as tied.
 */
final class RawAudioFiles {
    /** {@code muxed} is the native track's URI for an entry tied to a native track, null for a stream-only copy. */
    record Entry(File file, int itag, String mime, long length, long modified, @Nullable String muxed,
                 String digest) {
        boolean tiedToNativeTrack() {
            return muxed != null;
        }
    }

    /** What a directory holds, for the management action: committed copies and the bytes they occupy. */
    record Stats(int count, long bytes) {}

    private static final String ORIGIN = "origin";
    private static final String ORIGIN_STREAM = "stream";
    private static final String ORIGIN_NATIVE = "native";
    /** True when the user downloaded this song itself, as opposed to a playlist or album that holds it. */
    private static final String INDIVIDUAL = "individual";
    /** The ids another page names this song by (the music video of a song downloaded from a video). */
    private static final String ALIASES = "aliases";

    private static final Pattern VIDEO_ID = Pattern.compile("[A-Za-z0-9_-]{1,20}");
    private static final long MAX_METADATA_BYTES = 4096;
    /** A committed copy together with the file state that was hashed: another length or mtime is hashed again. */
    private record Candidate(Entry entry, long fileLength, long fileModified) {}

    private final File directory;
    private final Map<String, Candidate> verified = new HashMap<>();

    RawAudioFiles(File directory) {
        this.directory = directory;
    }

    static boolean validId(String id) {
        return id != null && VIDEO_ID.matcher(id).matches();
    }

    /**
     * Publishes the copy. {@code muxed} is the native track's URI, or null for a stream-only copy.
     *
     * @param individual Whether the user downloaded this song itself and not as part of a playlist or album.
     * @return Whether the copy was published; false when the arguments cannot describe a playable copy.
     */
    boolean retain(String videoId, File temporary, int itag, String mime, long length,
                   long modified, @Nullable String muxed, boolean individual) throws Exception {
        if (!validId(videoId) || !StreamSwapLogic.supportedAudio(itag, mime) || length <= 0
                || modified <= 0 || temporary.length() != length || (muxed != null && muxed.isEmpty())) {
            return false;
        }
        // The temporary file is private to this download: hash it before taking the monitor playback needs.
        String digest = digest(temporary);
        JSONObject metadata = new JSONObject().put("itag", itag).put("mime", mime).put("length", length)
                .put("lmt", modified).put("sha256", digest)
                .put(ORIGIN, muxed == null ? ORIGIN_STREAM : ORIGIN_NATIVE);
        if (muxed != null) metadata.put("muxed", muxed);
        if (individual) metadata.put(INDIVIDUAL, true);
        synchronized (this) {
            publish(videoId, temporary, itag, metadata);
        }
        return true;
    }

    private void publish(String videoId, File temporary, int itag, JSONObject metadata) throws Exception {
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("No raw audio directory");

        verified.remove(videoId);
        File raw = new File(directory, videoId + "." + itag);
        File sidecar = new File(directory, videoId + ".json");
        File pending = new File(directory, videoId + ".json.part");
        // Invalidate a previous commit before replacing any bytes, even if the new write later fails.
        Files.deleteIfExists(sidecar.toPath());
        try {
            Files.write(pending.toPath(), metadata.toString().getBytes(StandardCharsets.UTF_8));
            Files.move(temporary.toPath(), raw.toPath(), StandardCopyOption.REPLACE_EXISTING);
            Files.move(pending.toPath(), sidecar.toPath(), StandardCopyOption.REPLACE_EXISTING);
        } catch (Exception ex) {
            Files.deleteIfExists(raw.toPath());
            throw ex;
        } finally {
            Files.deleteIfExists(pending.toPath());
        }
    }

    /**
     * The committed copy that may be played, or null. A stream-only copy needs nothing else. A copy tied to a native
     * track also needs that track to still exist: {@code currentMuxed} answers the native URI, and is only asked
     * for such a copy and never while the monitor is held, because it may query MediaStore and playback needs the
     * monitor. The SHA-256 is computed outside the monitor (it reads the whole file) and re-checked under it; an
     * unchanged file (path, length, mtime) is hashed only once.
     */
    Entry find(String videoId, Function<String, String> currentMuxed) {
        try {
            // Read without the monitor: the claim is re-read under it once the native lookup is done.
            Entry claimed = committed(videoId);
            if (claimed == null) return null;

            String muxed = claimed.tiedToNativeTrack() ? currentMuxed.apply(videoId) : null;
            Candidate candidate;
            synchronized (this) {
                candidate = candidate(videoId, muxed);
                if (candidate == null) return null;
                if (candidate.equals(verified.get(videoId))) return candidate.entry();
            }

            String actual = digest(candidate.entry().file());
            synchronized (this) {
                // A concurrent retain, delete or replacement while hashing makes this result stale.
                if (!candidate.equals(candidate(videoId, muxed))) return null;
                if (!candidate.entry().digest().equals(actual)) return null;

                verified.put(videoId, candidate);
                return candidate.entry();
            }
        } catch (Exception ignored) {
            return null;
        }
    }

    private Candidate candidate(String videoId, @Nullable String currentMuxed) throws Exception {
        Entry entry = committed(videoId);
        if (entry == null) return null;
        if (entry.tiedToNativeTrack() && !entry.muxed().equals(currentMuxed)) return null;

        return new Candidate(entry, entry.file().length(), entry.file().lastModified());
    }

    /**
     * Records that the user downloaded the song itself, so a playlist or album removal keeps its copy.
     *
     * @return Whether the song has a committed copy to record it on.
     */
    synchronized boolean markIndividual(String videoId) {
        return update(videoId, metadata -> {
            try {
                metadata.put(INDIVIDUAL, true);
            } catch (Exception ignored) {
                // The key is a constant: put cannot fail.
            }
        });
    }

    /**
     * Records that {@code alias} (the music video of the song) names the same song. The alias is deleted with the
     * copy: it lives in the copy's own commit record.
     *
     * @return Whether the song has a committed copy to record it on.
     */
    synchronized boolean addAlias(String videoId, String alias) {
        return update(videoId, metadata -> {
            try {
                JSONArray aliases = metadata.optJSONArray(ALIASES);
                if (aliases == null) aliases = new JSONArray();
                for (int index = 0; index < aliases.length(); index++) {
                    if (alias.equals(aliases.optString(index))) return;
                }
                metadata.put(ALIASES, aliases.put(alias));
            } catch (Exception ignored) {
                // The key is a constant: put cannot fail.
            }
        });
    }

    /** Rewrites a committed record in place: the copy stays valid, only its notes change. */
    private boolean update(String videoId, Consumer<JSONObject> change) {
        try {
            if (committed(videoId) == null) return false;

            File sidecar = new File(directory, videoId + ".json");
            JSONObject metadata = new JSONObject(
                    new String(Files.readAllBytes(sidecar.toPath()), StandardCharsets.UTF_8));
            change.accept(metadata);
            File pending = new File(directory, videoId + ".json.part");
            try {
                Files.write(pending.toPath(), metadata.toString().getBytes(StandardCharsets.UTF_8));
                Files.move(pending.toPath(), sidecar.toPath(), StandardCopyOption.REPLACE_EXISTING);
            } finally {
                Files.deleteIfExists(pending.toPath());
            }
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    /** The ids of the copies the user downloaded itself. Read-only, never takes the monitor playback needs. */
    Set<String> individualIds() {
        Set<String> ids = new HashSet<>();
        for (String id : committedIds()) {
            JSONObject metadata = metadataOf(id);
            if (metadata != null && metadata.optBoolean(INDIVIDUAL)) ids.add(id);
        }
        return ids;
    }

    /** The alias of every copy that has one, alias to song id. Read-only, as {@link #individualIds}. */
    Map<String, String> aliases() {
        Map<String, String> aliases = new HashMap<>();
        for (String id : committedIds()) {
            JSONObject metadata = metadataOf(id);
            JSONArray names = metadata == null ? null : metadata.optJSONArray(ALIASES);
            for (int index = 0; names != null && index < names.length(); index++) {
                String alias = names.optString(index);
                if (validId(alias) && !alias.equals(id)) aliases.put(alias, id);
            }
        }
        return aliases;
    }

    private JSONObject metadataOf(String videoId) {
        try {
            File sidecar = new File(directory, videoId + ".json");
            if (!sidecar.isFile() || sidecar.length() > MAX_METADATA_BYTES) return null;

            return new JSONObject(new String(Files.readAllBytes(sidecar.toPath()), StandardCharsets.UTF_8));
        } catch (Exception ex) {
            return null;
        }
    }

    /** The sidecar's claim, checked only structurally: bytes of the recorded length exist. Never hashes. */
    private Entry committed(String videoId) throws Exception {
        if (!validId(videoId)) return null;
        File sidecar = new File(directory, videoId + ".json");
        if (!sidecar.isFile() || sidecar.length() > MAX_METADATA_BYTES) return null;

        JSONObject metadata = new JSONObject(new String(Files.readAllBytes(sidecar.toPath()), StandardCharsets.UTF_8));
        int itag = metadata.getInt("itag");
        String mime = metadata.getString("mime");
        long length = metadata.getLong("length");
        long modified = metadata.getLong("lmt");
        String checksum = metadata.getString("sha256");
        String muxed = metadata.optString("muxed", null);
        // No origin is an earlier test build: those only wrote copies tied to a native track.
        boolean streamOnly = ORIGIN_STREAM.equals(metadata.optString(ORIGIN, ORIGIN_NATIVE));
        if (streamOnly) muxed = null;
        else if (muxed == null || muxed.isEmpty()) return null;

        File raw = new File(directory, videoId + "." + itag);
        if (!StreamSwapLogic.supportedAudio(itag, mime) || length <= 0 || modified <= 0
                || !raw.isFile() || raw.length() != length) return null;

        return new Entry(raw, itag, mime, length, modified, muxed, checksum);
    }

    /**
     * The ids of every structurally committed copy, stream-only or tied: what Play downloads locally holds.
     * Read-only and tolerant of concurrent writes, so it never takes the monitor playback needs.
     */
    Set<String> committedIds() {
        Set<String> ids = new HashSet<>();
        File[] files = directory.listFiles();
        if (files == null) return ids;

        for (File file : files) {
            if (!isSidecar(file)) continue;

            String id = idOf(file.getName());
            try {
                if (committed(id) != null) ids.add(id);
            } catch (Exception ignored) {
                // A malformed commit is not a copy.
            }
        }
        return ids;
    }

    /** The committed copies and the bytes of their audio. */
    Stats stats() {
        int count = 0;
        long bytes = 0;
        File[] files = directory.listFiles();
        if (files == null) return new Stats(0, 0);

        for (File file : files) {
            if (!isSidecar(file)) continue;

            try {
                Entry entry = committed(idOf(file.getName()));
                if (entry == null) continue;

                count++;
                bytes += entry.length();
            } catch (Exception ignored) {
                // A malformed commit is not a copy.
            }
        }
        return new Stats(count, bytes);
    }

    /** Removes every file of the directory, copies and leftovers alike. @return How many copies were committed. */
    synchronized int clear() {
        int count = stats().count();
        verified.clear();
        File[] files = directory.listFiles();
        if (files != null) for (File file : files) file.delete();
        return count;
    }

    synchronized void delete(String videoId) {
        if (!validId(videoId)) return;
        verified.remove(videoId);
        File[] files = directory.listFiles((parent, name) -> name.startsWith(videoId + "."));
        if (files != null) for (File file : files) file.delete();
    }

    /**
     * Deletes the files of a track whose native track is gone, unless the copy is a committed stream-only copy,
     * which never belonged to the native track.
     *
     * @return Whether anything was deleted.
     */
    synchronized boolean deleteUnlessStreamOnly(String videoId) {
        if (!validId(videoId)) return false;
        try {
            Entry entry = committed(videoId);
            if (entry != null && !entry.tiedToNativeTrack()) return false;
        } catch (Exception ignored) {
            // A malformed commit is deleted with the rest.
        }
        delete(videoId);
        return true;
    }

    /**
     * Remove uncommitted and structurally broken entries, interrupted download leftovers, and the copies tied to a
     * native track that is confirmed gone. A stream-only copy is never an orphan. Entries are NOT hashed here (that
     * is left to {@link #find}): this runs after every media change and must stay cheap. The native lookups run
     * before the monitor is taken because playback needs it too, and only for copies tied to a native track.
     */
    void cleanup(Function<String, String> currentMuxed) {
        File[] snapshot = directory.listFiles();
        if (snapshot == null) return;

        Map<String, String> nativeUris = new HashMap<>();
        for (File file : snapshot) {
            if (!isSidecar(file)) continue;

            String id = idOf(file.getName());
            try {
                Entry entry = committed(id);
                if (entry != null && entry.tiedToNativeTrack()) nativeUris.put(id, currentMuxed.apply(id));
            } catch (Exception ignored) {
                // Judged again under the monitor.
            }
        }

        synchronized (this) {
            File[] files = directory.listFiles();
            if (files == null) return;

            Set<String> retained = new HashSet<>();
            for (File sidecar : files) {
                if (!isSidecar(sidecar)) continue;
                String id = idOf(sidecar.getName());
                try {
                    Entry entry = committed(id);
                    if (entry == null) continue;
                    // A tied commit published after the snapshot has no lookup yet: keep it for the next pass.
                    if (entry.tiedToNativeTrack() && nativeUris.containsKey(id)
                            && !entry.muxed().equals(nativeUris.get(id))) continue;
                    retained.add(sidecar.getName());
                    retained.add(entry.file().getName());
                } catch (Exception ignored) {
                    // A malformed or incomplete commit cannot authorize playback.
                }
            }
            for (File file : files) {
                if (!file.isFile() || retained.contains(file.getName())) continue;
                verified.remove(idOf(file.getName()));
                file.delete();
            }
        }
    }

    private static boolean isSidecar(File file) {
        return file.getName().endsWith(".json");
    }

    private static String idOf(String fileName) {
        int dot = fileName.indexOf('.');
        return dot < 0 ? fileName : fileName.substring(0, dot);
    }

    private static String digest(File file) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        try (FileInputStream input = new FileInputStream(file)) {
            byte[] buffer = new byte[64 * 1024];
            int count;
            while ((count = input.read(buffer)) != -1) digest.update(buffer, 0, count);
        }
        byte[] bytes = digest.digest();
        char[] hex = new char[bytes.length * 2];
        String digits = "0123456789abcdef";
        for (int index = 0; index < bytes.length; index++) {
            hex[index * 2] = digits.charAt((bytes[index] & 0xff) >>> 4);
            hex[index * 2 + 1] = digits.charAt(bytes[index] & 15);
        }
        return new String(hex);
    }
}
