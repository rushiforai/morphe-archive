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
        catalog.load(ids, count -> progress.update("catalog", count, ids.size()));
        Set<String> related = catalog.related(ids);
        progress.update("related", 0, related.size());
        catalog.load(related, count -> progress.update("related", count, related.size()));
        Set<String> albumArtists = catalog.related(related);
        catalog.load(albumArtists, count -> progress.update("related", count, albumArtists.size()));
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
