package app.morphe.extension.syncforreddit.http.undelete;

import androidx.annotation.Nullable;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Remembers what was put back, so that the line under an author can say so.
 *
 * <p>Only the remembering is here. Where it is said is shared with anything else that has
 * something to add to that line, and is asked for this as the line draws.
 *
 * @noinspection unused
 */
public final class RestoredNotes {
    /** Bounded: a thread's worth of notes is all that is ever needed at once. */
    private static final int CACHE_SIZE = 512;

    private static final Map<String, String> notes =
            new LinkedHashMap<String, String>(CACHE_SIZE, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
                    return size() > CACHE_SIZE;
                }
            };

    private RestoredNotes() {}

    static void remember(String id, String note) {
        if (id == null || id.isEmpty() || note == null || note.isEmpty()) {
            return;
        }
        synchronized (notes) {
            notes.put(id, note);
        }
    }

    /** @return What to say about this one, or null where nothing of it was put back. */
    @Nullable
    public static String noteFor(String id) {
        if (id == null || id.isEmpty()) {
            return null;
        }
        synchronized (notes) {
            return notes.get(id);
        }
    }
}
