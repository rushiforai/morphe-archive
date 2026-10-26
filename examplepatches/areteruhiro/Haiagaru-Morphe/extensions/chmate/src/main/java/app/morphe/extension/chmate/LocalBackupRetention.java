package app.morphe.extension.chmate;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

/** Only explicitly tracked documents may be removed; never scans a user's folder. */
final class LocalBackupRetention {
    enum Presence { OWNED, MISSING, UNVERIFIED }
    interface Documents {
        Presence inspect(String uri);
        boolean delete(String uri);
    }
    static final class Result {
        final List<String> retained;
        final int unresolved;
        Result(List<String> retained, int unresolved) {
            this.retained = retained;
            this.unresolved = unresolved;
        }
    }
    static Result prune(List<String> tracked, int keep, Documents documents) {
        List<String> existing = new ArrayList<>();
        List<Presence> states = new ArrayList<>();
        int unresolved = 0;
        LinkedHashSet<String> unique = new LinkedHashSet<>();
        for (String uri : tracked) { unique.remove(uri); unique.add(uri); }
        for (String uri : unique) {
            Presence state = documents.inspect(uri);
            if (state == Presence.MISSING) continue;
            if (state == Presence.UNVERIFIED) unresolved++;
            existing.add(uri);
            states.add(state);
        }
        // Protect the newest N existing records, even when an older deletion fails.
        // An inaccessible old record must not cause deletion of a newer backup.
        int excess = Math.max(0, existing.size() - Math.max(1, Math.min(100, keep)));
        List<String> retained = new ArrayList<>();
        for (int i = 0; i < existing.size(); i++) {
            String uri = existing.get(i);
            if (i < excess && states.get(i) == Presence.OWNED) {
                if (documents.delete(uri)) continue;
                unresolved++;
            }
            retained.add(uri);
        }
        return new Result(retained, unresolved);
    }
    private LocalBackupRetention() { }
}
