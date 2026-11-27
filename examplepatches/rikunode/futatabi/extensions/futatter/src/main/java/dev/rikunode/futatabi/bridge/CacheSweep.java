package dev.rikunode.futatabi.bridge;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

/** Cold-start only. Never edits the Flutter metadata or traverses another directory. */
final class CacheSweep {
    static final long BUDGET = 1024L * 1024 * 1024;
    static final long HOUR = 60L * 60 * 1000;
    static final long ORPHAN_GRACE = 24 * HOUR;
    static final int MAX_ENTRIES = 50_000;
    // Old flutter_cache_manager generates UUID v1 paths, not user filenames.
    static final String NAME_REGEX =
            "[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-1[0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}\\.[a-zA-Z0-9]{1,16}";
    private static final Pattern NAME = Pattern.compile(NAME_REGEX);
    private static final Pattern MEDIA = Pattern.compile(
            "(?i).+\\.(file|jpg|jpeg|png|gif|webp|bmp|avif|heic|heif|mp4|webm|mov|m4v|mkv|3gp|bin)");
    private static final Pattern IMAGE = Pattern.compile("(?i).+\\.(jpg|jpeg|png|gif|webp|bmp|avif|heic|heif)");
    private static final Pattern VIDEO = Pattern.compile("(?i).+\\.(mp4|webm|mov|m4v|mkv|3gp)");

    static final class Row {
        final long touched;
        final boolean remote;
        Row(long touched, String url) {
            this.touched = touched;
            this.remote = url.startsWith("https://") || url.startsWith("http://");
        }
    }

    static void addRow(Map<String, Row> rows, String path, long touched, String url) throws IOException {
        // Unknown but flat filenames remain protected by the ledger. Nested paths
        // and duplicate rows make the ledger ambiguous: refuse the whole sweep.
        if (path.isEmpty() || path.equals(".") || path.equals("..") ||
                path.indexOf('/') >= 0 || path.indexOf('\\') >= 0 ||
                rows.put(path, new Row(touched, url)) != null)
            throw new IOException("Ambiguous cache ledger");
    }

    static Map<String, Row> jsonRows(String data) throws Exception {
        JSONTokener parser = new JSONTokener(data);
        Object value = parser.nextValue();
        if (!(value instanceof JSONArray) || parser.nextClean() != 0)
            throw new IOException("Invalid cache ledger");
        JSONArray a = (JSONArray) value;
        if (a.length() > MAX_ENTRIES) throw new IOException("Cache ledger too large");
        Map<String, Row> rows = new HashMap<>();
        java.util.HashSet<Long> ids = new java.util.HashSet<>();
        java.util.HashSet<String> keys = new java.util.HashSet<>();
        for (int i = 0; i < a.length(); i++) {
            JSONObject o = a.getJSONObject(i);
            Object id = o.get("_id"), touched = o.get("touched"), valid = o.get("validTill");
            Object key = o.opt("key");
            Object rawUrl = o.get("url"), rawPath = o.get("relativePath");
            if (!(rawUrl instanceof String) || !(rawPath instanceof String))
                throw new IOException("Invalid cache ledger strings");
            String url = (String) rawUrl;
            if (!integer(id) || !integer(touched) || !integer(valid) ||
                    ((Number) id).longValue() <= 0 || !ids.add(((Number) id).longValue()) ||
                    (key != null && key != JSONObject.NULL && !(key instanceof String)) ||
                    !keys.add(key instanceof String ? (String) key : url))
                throw new IOException("Invalid cache ledger row");
            addRow(rows, (String) rawPath, ((Number) touched).longValue(), url);
        }
        return rows;
    }

    private static boolean integer(Object o) { return o instanceof Integer || o instanceof Long; }

    static final class Entry {
        final Path path;
        final BasicFileAttributes attrs;
        final long ageKey;
        final boolean orphan;
        final Snapshot owner;
        Entry(Path path, BasicFileAttributes attrs, long ageKey, boolean orphan, Snapshot owner) {
            this.path = path; this.attrs = attrs; this.ageKey = ageKey;
            this.orphan = orphan; this.owner = owner;
        }
    }
    static final class Snapshot {
        final String name;
        final List<Entry> candidates = new ArrayList<>();
        long bytes, registered, unlisted, protectedBytes, imageBytes, videoBytes, otherBytes, removed;
        long eligibleOrphanBytes, orphanRemovedBytes, budgetRemovedBytes;
        int files, deleted, failures;
        boolean complete = true, ledgerKnown;
        Snapshot(String name, boolean ledgerKnown) { this.name = name; this.ledgerKnown = ledgerKnown; }
        String report() {
            return name + ": files=" + files + " bytes=" + bytes + " registered=" + registered +
                    " unlisted=" + (ledgerKnown ? Long.toString(unlisted) : "unknown") +
                    " protected=" + protectedBytes + " image=" + imageBytes + " video=" + videoBytes +
                    " other=" + otherBytes + " eligibleOrphan=" + eligibleOrphanBytes +
                    " orphanRemoved=" + orphanRemovedBytes + " budgetRemoved=" + budgetRemovedBytes +
                    " removed=" + removed + " deleted=" + deleted +
                    " failed=" + failures + " complete=" + complete + " ledger=" + ledgerKnown;
        }
    }

    static Snapshot inspect(Path root, String name, Map<String, Row> rows, Set<String> pins,
                            long now, long deadline) throws IOException {
        Snapshot out = new Snapshot(name, rows != null);
        Path dir = root.resolve(name);
        if (Files.notExists(dir, LinkOption.NOFOLLOW_LINKS)) return out;
        if (!Files.isDirectory(dir, LinkOption.NOFOLLOW_LINKS)) {
            out.complete = false; return out;
        }
        // Flat namespace: symlinks, subdirectories, unusual files are never removed.
        try (DirectoryStream<Path> stream = Files.newDirectoryStream(dir)) {
            int seen = 0;
            for (Path path : stream) {
                if (++seen > MAX_ENTRIES || System.nanoTime() >= deadline) {
                    out.complete = false; break;
                }
                BasicFileAttributes attr;
                try { attr = Files.readAttributes(path, BasicFileAttributes.class, LinkOption.NOFOLLOW_LINKS); }
                catch (IOException ex) { out.complete = false; continue; }
                if (!attr.isRegularFile()) { out.complete = false; continue; }
                String file = path.getFileName().toString();
                long size = attr.size(), modified = attr.lastModifiedTime().toMillis();
                out.files++; out.bytes += size;
                if (IMAGE.matcher(file).matches()) out.imageBytes += size;
                else if (VIDEO.matcher(file).matches()) out.videoBytes += size;
                else out.otherBytes += size;
                Row row = rows == null ? null : rows.get(file);
                if (row != null) out.registered += size;
                else if (rows != null) out.unlisted += size;
                // No deletion if a persisted draft may refer to the filename.
                if (rows == null || pins == null || pins.contains(file.toLowerCase(java.util.Locale.ROOT)) ||
                        !NAME.matcher(file).matches() || !MEDIA.matcher(file).matches() ||
                        modified <= 0 || modified > now ||
                        (row == null ? now - modified < ORPHAN_GRACE :
                                !row.remote || row.touched <= 0 || row.touched > now ||
                                now - Math.max(modified, row.touched) < HOUR)) {
                    out.protectedBytes += size; continue;
                }
                if (row == null) out.eligibleOrphanBytes += size;
                out.candidates.add(new Entry(path, attr, row == null ? modified :
                        Math.max(modified, row.touched), row == null, out));
            }
        }
        return out;
    }

    /** Orphans first; then oldest registered files only to reduce observed excess.
     * A partial/ambiguous scan is never used to evict registered files. */
    static void apply(List<Snapshot> snapshots, long budget, long deadline) {
        List<Entry> orphans = new ArrayList<>(), registered = new ArrayList<>();
        long total = 0;
        for (Snapshot s : snapshots) {
            // Unknown/partial namespaces cannot impose pressure on a different,
            // healthy cache. Enforce the shared budget on fully classified ones.
            boolean budgetable = s.complete && s.ledgerKnown;
            if (budgetable) total += s.bytes;
            for (Entry e : s.candidates) {
                if (e.orphan) orphans.add(e);
                else if (budgetable) registered.add(e);
            }
        }
        Comparator<Entry> oldest = Comparator.comparingLong(e -> e.ageKey);
        orphans.sort(oldest); registered.sort(oldest);
        for (Entry e : orphans) {
            if (System.nanoTime() >= deadline) return;
            long removed = remove(e);
            if (e.owner.complete && e.owner.ledgerKnown) total -= removed;
        }
        for (Entry e : registered) {
            if (total <= budget || System.nanoTime() >= deadline) return;
            total -= remove(e);
        }
    }

    private static long remove(Entry e) {
        try {
            // Refuse directory replacement or a modified/replaced entry.
            if (!Files.isDirectory(e.path.getParent(), LinkOption.NOFOLLOW_LINKS)) {
                e.owner.failures++; return 0;
            }
            BasicFileAttributes a = Files.readAttributes(e.path, BasicFileAttributes.class, LinkOption.NOFOLLOW_LINKS);
            if (!a.isRegularFile() || a.size() != e.attrs.size() ||
                    !a.lastModifiedTime().equals(e.attrs.lastModifiedTime()) ||
                    !java.util.Objects.equals(a.fileKey(), e.attrs.fileKey())) {
                e.owner.failures++; return 0;
            }
            if (Files.deleteIfExists(e.path)) {
                e.owner.deleted++; e.owner.removed += a.size();
                if (e.orphan) e.owner.orphanRemovedBytes += a.size();
                else e.owner.budgetRemovedBytes += a.size();
                return a.size();
            }
        } catch (IOException | RuntimeException ignored) { e.owner.failures++; }
        return 0;
    }
}
