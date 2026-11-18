/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-17.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.function.BooleanSupplier;
import java.util.function.Function;
import java.util.zip.GZIPOutputStream;

/**
 * The playlists and albums downloaded with stream copies: id, title, subtitle, cover url and the track ids in
 * order, persisted in one JSON file (written to a temporary file and renamed). Readers see an immutable snapshot
 * and never wait for a write; writers take the monitor. Disk access belongs to a worker thread.
 */
final class OfflineSourceStore {
    enum Kind { ALBUM, PLAYLIST }

    /** A downloaded playlist or album. Title, subtitle and thumbnail are empty while unknown. */
    record Source(String id, String title, String subtitle, String thumbnailUrl, List<String> videoIds,
                  long updatedAt, @Nullable String browsePage, boolean explicitStream) {
        Source(String id, String title, String subtitle, String thumbnailUrl, List<String> videoIds, long updatedAt) {
            this(id, title, subtitle, thumbnailUrl, videoIds, updatedAt, null, false);
        }

        /** A guess from the id's prefix: audio playlists of an album (OLAK5uy_) and album pages are albums. */
        Kind kind() {
            return id.startsWith("OLAK5uy_") || id.startsWith("MPREb_") ? Kind.ALBUM : Kind.PLAYLIST;
        }
    }

    /**
     * A track of a source that has a stream copy. {@code stored} is null when the copy has no stored data yet:
     * it is not available offline until it has played online once with the setting on.
     */
    record Track(String videoId, @Nullable OfflineCopyMetadata stored) {
        boolean availableOffline() {
            return stored != null;
        }
    }

    private final File file;
    private volatile Map<String, Source> sources = Collections.emptyMap();
    private volatile boolean loaded;

    OfflineSourceStore(File file) {
        this.file = file;
    }

    /** Reads the file once. Safe to call again; later calls do nothing. A missing or broken file is empty. */
    synchronized void ensureLoaded() {
        if (loaded) return;

        Map<String, Source> read = new HashMap<>();
        try {
            if (file.isFile()) {
                JSONObject json = new JSONObject(new String(Files.readAllBytes(file.toPath()),
                        StandardCharsets.UTF_8));
                Iterator<String> ids = json.keys();
                while (ids.hasNext()) {
                    String id = ids.next();
                    read.put(id, fromJson(id, json.getJSONObject(id)));
                }
            }
        } catch (IOException | JSONException ex) {
            read.clear();
        }
        sources = read;
        loaded = true;
        removeUnusedBrowsePages(read);
    }

    /** Whether the source is remembered but its title is not known yet. False until loaded. No disk access. */
    boolean needsHeader(String sourceId) {
        Source source = sources.get(sourceId);
        return source != null && source.title().isEmpty();
    }

    /**
     * Remembers a downloaded source with its tracks in order. A {@code null} header keeps what is known of the
     * header; an {@link SourceHeader#EMPTY} one never replaces a known title.
     */
    synchronized void remember(String sourceId, @Nullable SourceHeader header, List<String> videoIds, long now)
            throws IOException, JSONException {
        remember(sourceId, header, videoIds, now, false);
    }

    synchronized void remember(String sourceId, @Nullable SourceHeader header, List<String> videoIds, long now,
                               boolean explicitStream) throws IOException, JSONException {
        ensureLoaded();
        Source previous = sources.get(sourceId);
        SourceHeader kept = header != null && header.hasTitle() ? header : headerOf(previous);
        Map<String, Source> next = new HashMap<>(sources);
        next.put(sourceId, new Source(sourceId, kept.title(), kept.subtitle(), kept.thumbnailUrl(),
                List.copyOf(videoIds), now, null, explicitStream));
        publish(next);
    }

    /** The unreferenced renderer can be written without blocking store readers or source mutations. */
    File stageBrowsePage(byte[] response) throws IOException {
        ensureLoaded();
        File directory = browseDirectory();
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("No synced pages directory");

        File staged = File.createTempFile("playlist-", ".gz", directory);
        try (FileOutputStream raw = new FileOutputStream(staged);
             GZIPOutputStream output = new GZIPOutputStream(raw)) {
            output.write(response);
            output.finish();
            raw.getFD().sync();
            return staged;
        } catch (IOException | RuntimeException ex) {
            staged.delete();
            throw ex;
        }
    }

    /** One rename publishes membership and the renderer of exactly that revision. */
    synchronized boolean replacePlaylist(Source expected, List<String> tracks, File staged, long now,
                                         BooleanSupplier allowed) throws IOException, JSONException {
        if (sources.get(expected.id()) != expected) return false;
        Map<String, Source> next = new HashMap<>(sources);
        next.put(expected.id(), new Source(expected.id(), expected.title(), expected.subtitle(),
                expected.thumbnailUrl(), tracks, now, staged.getName(), true));
        return publish(next, allowed);
    }

    @Nullable
    byte[] readBrowsePage(String sourceId) throws IOException {
        Source source = sources.get(sourceId);
        while (source != null && source.browsePage() != null) {
            try {
                return OfflineBrowsePagesLogic.gunzip(
                        Files.readAllBytes(new File(browseDirectory(), source.browsePage()).toPath()));
            } catch (IOException ex) {
                Source current = sources.get(sourceId);
                if (current == source) throw ex;
                source = current;
            }
        }
        return null;
    }

    private File browseDirectory() {
        return new File(file.getParentFile(), "rvx_offline_sync");
    }

    private void removeUnusedBrowsePages(Map<String, Source> current) {
        File[] files = browseDirectory().listFiles();
        if (files == null) return;
        Set<String> retained = new HashSet<>();
        for (Source source : current.values()) retained.add(source.browsePage());
        for (File page : files) {
            if (page.getName().startsWith("playlist-") && !retained.contains(page.getName())) page.delete();
        }
    }

    /** Whether no source is remembered. False until loaded. No disk access. */
    boolean isEmpty() {
        return sources.isEmpty();
    }

    /** Fills in the header of a remembered source. Nothing happens for an unknown source or a header without title. */
    synchronized void updateHeader(String sourceId, SourceHeader header, long now) throws IOException, JSONException {
        ensureLoaded();
        Source previous = sources.get(sourceId);
        if (previous == null || !header.hasTitle()) return;

        Map<String, Source> next = new HashMap<>(sources);
        next.put(sourceId, new Source(sourceId, header.title(), header.subtitle(), header.thumbnailUrl(),
                previous.videoIds(), now, previous.browsePage(), previous.explicitStream()));
        publish(next);
    }

    /**
     * The saved track lists that are not remembered here yet and have tracks, in id order: the playlists and albums
     * downloaded before the offline store existed.
     */
    static Map<String, List<String>> adoptable(Map<String, List<String>> saved, Set<String> known) {
        Map<String, List<String>> adopted = new TreeMap<>();
        for (Map.Entry<String, List<String>> entry : saved.entrySet()) {
            if (!known.contains(entry.getKey()) && !entry.getValue().isEmpty()) {
                adopted.put(entry.getKey(), entry.getValue());
            }
        }
        return adopted;
    }

    /** The ids of the remembered sources. No disk access. */
    Set<String> ids() {
        return sources.keySet();
    }

    /** Every remembered source, the most recently updated first. */
    List<Source> sources() {
        List<Source> all = new ArrayList<>(sources.values());
        all.sort(Comparator.comparingLong(Source::updatedAt).reversed().thenComparing(Source::id));
        return all;
    }

    @Nullable
    Source get(String sourceId) {
        return sources.get(sourceId);
    }

    /**
     * The tracks of a source that still have a stream copy ({@code copyIds}), in the source's order. A track whose
     * copy is gone is left out; a track whose copy has no stored data is listed without it.
     */
    static List<Track> tracksOf(Source source, Set<String> copyIds, Function<String, OfflineCopyMetadata> stored) {
        return tracksOf(source, copyIds, stored, Function.identity());
    }

    static List<Track> tracksOf(Source source, Set<String> copyIds, Function<String, OfflineCopyMetadata> stored,
                                Function<String, String> canonical) {
        List<Track> tracks = new ArrayList<>();
        for (String videoId : source.videoIds()) {
            String id = copyIds.contains(videoId) ? videoId : canonical.apply(videoId);
            if (copyIds.contains(id)) tracks.add(new Track(id, stored.apply(id)));
        }
        return tracks;
    }

    /** Forgets one source; its tracks are not touched. */
    synchronized void remove(String sourceId) throws IOException, JSONException {
        ensureLoaded();
        if (!sources.containsKey(sourceId)) return;

        Map<String, Source> next = new HashMap<>(sources);
        next.remove(sourceId);
        publish(next);
    }

    /** Forgets every source none of whose tracks has a stream copy any more. */
    synchronized void retainWithCopies(Set<String> copyIds) throws IOException, JSONException {
        ensureLoaded();
        Map<String, Source> next = new HashMap<>(sources);
        boolean changed = next.values().removeIf(source -> Collections.disjoint(source.videoIds(), copyIds));
        if (changed) publish(next);
    }

    synchronized void clear() throws IOException {
        Files.deleteIfExists(file.toPath());
        sources = Collections.emptyMap();
        loaded = true;
        removeUnusedBrowsePages(sources);
    }

    private static SourceHeader headerOf(@Nullable Source source) {
        return source == null ? SourceHeader.EMPTY
                : new SourceHeader(source.title(), source.subtitle(), source.thumbnailUrl());
    }

    private void publish(Map<String, Source> next) throws IOException, JSONException {
        publish(next, () -> true);
    }

    private boolean publish(Map<String, Source> next, BooleanSupplier allowed) throws IOException, JSONException {
        JSONObject json = new JSONObject();
        for (Source source : next.values()) json.put(source.id(), toJson(source));

        File parent = file.getParentFile();
        if (parent != null && !parent.isDirectory() && !parent.mkdirs()) throw new IOException("No offline directory");

        File pending = new File(file.getPath() + ".part");
        try {
            Files.write(pending.toPath(), json.toString().getBytes(StandardCharsets.UTF_8));
            if (!allowed.getAsBoolean()) return false;
            Files.move(pending.toPath(), file.toPath(), StandardCopyOption.ATOMIC_MOVE,
                    StandardCopyOption.REPLACE_EXISTING);
        } finally {
            Files.deleteIfExists(pending.toPath());
        }
        Map<String, Source> previous = sources;
        sources = next;
        for (Source source : previous.values()) {
            Source replacement = next.get(source.id());
            if (source.browsePage() != null
                    && (replacement == null || !source.browsePage().equals(replacement.browsePage()))) {
                new File(browseDirectory(), source.browsePage()).delete();
            }
        }
        return true;
    }

    private static JSONObject toJson(Source source) throws JSONException {
        return new JSONObject().put("title", source.title())
                .put("subtitle", source.subtitle()).put("thumbnailUrl", source.thumbnailUrl())
                .put("videoIds", new JSONArray(source.videoIds())).put("updatedAt", source.updatedAt())
                .put("browsePage", source.browsePage()).put("explicitStream", source.explicitStream());
    }

    private static Source fromJson(String id, JSONObject json) throws JSONException {
        JSONArray array = json.getJSONArray("videoIds");
        List<String> videoIds = new ArrayList<>(array.length());
        for (int i = 0; i < array.length(); i++) videoIds.add(array.getString(i));
        String page = json.optString("browsePage", "");
        boolean validPage = page.startsWith("playlist-") && page.endsWith(".gz")
                && OfflineBrowsePagesLogic.isFileSafe(page.substring(0, page.length() - 3));
        return new Source(id, json.optString("title"), json.optString("subtitle"), json.optString("thumbnailUrl"),
                Collections.unmodifiableList(videoIds), json.optLong("updatedAt"), validPage ? page : null,
                json.optBoolean("explicitStream"));
    }
}
