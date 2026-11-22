package app.voidhack.extension.applemusic.library;

import java.io.IOException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;

final class LibraryMetadata {
    interface Progress { void update(String stage, int completed, int total); }
    final AtomicBoolean cancelled;
    final LibraryDaap cloud;

    LibraryMetadata(AtomicBoolean cancelled) throws IOException { this.cancelled = cancelled; cloud = new LibraryDaap(cancelled); }

    Scan scan(Progress progress) throws IOException {
        progress.update("reading", 0, 0);
        List<LibraryDaap.Track> tracks = cloud.tracks();
        Set<String> ids = new LinkedHashSet<>();
        for (LibraryDaap.Track track : tracks) if (!track.catalogId.isEmpty()) ids.add(track.catalogId);
        MetadataCatalog catalog = new MetadataCatalog(cancelled);
        progress.update("catalog", 0, ids.size());
        catalog.load("catalog", ids, count -> progress.update("catalog", count, ids.size()));
        Set<String> related = catalog.related(ids);
        progress.update("related", 0, related.size());
        catalog.load("related", related, count -> progress.update("related", count, related.size()));
        Set<String> albumArtists = catalog.related(related);
        catalog.load("album_artists", albumArtists, count -> progress.update("related", count, albumArtists.size()));
        Set<String> japaneseIds = new LinkedHashSet<>(ids);
        japaneseIds.addAll(catalog.albums(ids));
        progress.update("japanese", 0, japaneseIds.size());
        catalog.loadJapanese(japaneseIds, cloud, count -> progress.update("japanese", count, japaneseIds.size()));
        List<Candidate> candidates = new ArrayList<>();
        int unresolved = 0;
        for (LibraryDaap.Track track : tracks) {
            checkCancelled();
            Map<String, String> target = catalog.metadata(track.catalogId);
            if (target.isEmpty()) { unresolved++; continue; }
            Map<String, String> changes = differences(track.values, target);
            if (!changes.isEmpty()) candidates.add(new Candidate(track, changes));
        }
        return new Scan(candidates, tracks.size(), unresolved);
    }

    static Map<String, String> differences(Map<String, String> stored, Map<String, String> catalog) {
        boolean suspected = false;
        for (MetadataField field : MetadataField.values()) {
            String before = stored.getOrDefault(field.tag, "");
            String after = catalog.getOrDefault(field.tag, "");
            if (!field.integer && !before.isEmpty() && !same(before, after) && hasJapanese(after) && !hasJapanese(before)
                    && before.codePoints().anyMatch(Character::isLetter)) suspected = true;
        }
        if (!suspected) return Collections.emptyMap();
        Map<String, String> changes = new LinkedHashMap<>();
        for (MetadataField field : MetadataField.values()) {
            String value = catalog.get(field.tag);
            if (value != null && !value.isEmpty() && !same(stored.getOrDefault(field.tag, ""), value)) changes.put(field.tag, value);
        }
        return Collections.unmodifiableMap(changes);
    }

    static boolean romanized(Map<String, String> stored, Map<String, String> catalog) {
        for (String tag : new String[]{"minm", "asar", "asal"}) {
            String before = stored.getOrDefault(tag, ""), after = catalog.getOrDefault(tag, "");
            if (romanizedField(before, after)) return true;
        }
        return false;
    }

    static boolean romanizedField(String before, String after) {
        return hasJapanese(after) && !hasJapanese(before) && before.codePoints().anyMatch(
                code -> Character.UnicodeScript.of(code) == Character.UnicodeScript.LATIN);
    }

    private static boolean same(String a, String b) {
        return Normalizer.normalize(a, Normalizer.Form.NFC).equals(Normalizer.normalize(b, Normalizer.Form.NFC));
    }

    private static boolean hasJapanese(String text) {
        return text.codePoints().anyMatch(code -> Character.UnicodeScript.of(code) == Character.UnicodeScript.HIRAGANA
                || Character.UnicodeScript.of(code) == Character.UnicodeScript.KATAKANA || Character.UnicodeScript.of(code) == Character.UnicodeScript.HAN);
    }

    boolean repair(Candidate candidate) throws IOException {
        checkCancelled();
        cloud.repair(candidate.track, candidate.changes);
        try {
            cloud.verifyAccountForLocalRefresh();
            new MusicLibrary(new AtomicBoolean()).refreshCatalogItem(candidate.track.catalogId);
            return true;
        } catch (ReflectiveOperationException | IOException exception) {
            return false;
        }
    }
    private void checkCancelled() { if (cancelled.get()) throw new CancellationException(); }

    static String diagnostic(String stage, int completed, int total, Throwable error) {
        StringBuilder out = new StringBuilder();
        out.append("stage=").append(stage == null || stage.isEmpty() ? "unknown" : stage);
        if (total > 0) out.append(" (").append(completed).append('/').append(total).append(')');
        out.append(" | ");
        if (error instanceof LibraryDaap.Failure) {
            LibraryDaap.Failure failure = (LibraryDaap.Failure) error;
            out.append(failure.kind);
            if (failure.status != 0) out.append(" (").append(failure.status).append(')');
            if (!failure.detail.isEmpty()) out.append(" [").append(failure.detail).append(']');
        } else if (error instanceof DaapCodec.FormatException) {
            out.append(error.getMessage());
        } else {
            out.append(causeName(error));
        }
        return out.toString();
    }

    static String causeName(Throwable error) {
        if (error == null) return "UnknownError";
        String first = error.getClass().getSimpleName();
        Throwable root = error;
        int depth = 0;
        while (root.getCause() != null && root.getCause() != root && depth++ < 8) root = root.getCause();
        String leaf = root.getClass().getSimpleName();
        return first.equals(leaf) ? first : first + " <- " + leaf;
    }

    static String stackSummary(Throwable error) {
        if (error == null) return "";
        StringBuilder out = new StringBuilder();
        Throwable current = error;
        int depth = 0;
        while (current != null && depth++ < 4) {
            if (out.length() > 0) out.append(" | caused by ");
            out.append(current.getClass().getName());
            StackTraceElement[] frames = current.getStackTrace();
            int shown = 0;
            for (StackTraceElement frame : frames) {
                if (shown >= 6) break;
                out.append("\n  at ").append(frame.getClassName()).append('.').append(frame.getMethodName())
                        .append('(').append(frame.getFileName() == null ? "unknown" : frame.getFileName())
                        .append(':').append(frame.getLineNumber()).append(')');
                shown++;
            }
            Throwable next = current.getCause();
            current = next == current ? null : next;
        }
        return out.toString();
    }

    int lastRawTrackCount() { return cloud.lastRawTrackCount(); }
    int lastLibraryTrackCount() { return cloud.lastLibraryTrackCount(); }

    static String formatLogReport(String timestampUtc, String appInfo, String androidInfo, String locale,
                                  String action, int rawTracks, int libraryTracks, List<String> events,
                                  String diagnostic, Throwable error) {
        StringBuilder out = new StringBuilder();
        out.append("Nich87 Patches - Metadata Repair Diagnostic Log\n");
        out.append("timestamp=").append(safeField(timestampUtc)).append('\n');
        out.append("app=").append(safeField(appInfo)).append('\n');
        out.append("android=").append(safeField(androidInfo)).append('\n');
        out.append("locale=").append(safeField(locale)).append('\n');
        out.append("action=").append(safeField(action)).append('\n');
        if (rawTracks >= 0) out.append("tracks_raw=").append(rawTracks).append('\n');
        if (libraryTracks >= 0) out.append("tracks_library=").append(libraryTracks).append('\n');
        out.append("diagnostic=").append(safeField(diagnostic)).append('\n');
        if (events != null && !events.isEmpty()) {
            out.append("\n[timeline]\n");
            for (String event : events) out.append(event).append('\n');
        }
        String stack = stackSummary(error);
        if (!stack.isEmpty()) {
            out.append("\n[stack]\n").append(stack).append('\n');
        }
        return out.toString();
    }

    private static String safeField(String value) {
        return value == null || value.isEmpty() ? "unknown" : value.replace('\r', ' ').replace('\n', ' ');
    }

    static final class Candidate {
        final LibraryDaap.Track track;
        final Map<String, String> changes;
        final boolean romanized;
        Candidate(LibraryDaap.Track track, Map<String, String> changes) {
            this.track = track;
            this.changes = changes;
            this.romanized = romanized(track.values, changes);
        }
    }

    static final class Scan {
        final List<Candidate> candidates;
        final int total, unresolved;
        Scan(List<Candidate> candidates, int total, int unresolved) {
            this.candidates = Collections.unmodifiableList(candidates);
            this.total = total;
            this.unresolved = unresolved;
        }
    }
}
