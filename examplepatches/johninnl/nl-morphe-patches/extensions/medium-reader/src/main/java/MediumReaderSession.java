import nl.johninnl.medium.reader.ReaderArticle;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CancellationException;

/** Ephemeral display ownership follows a native article ViewModel, never a global post ID. */
final class MediumReaderSession {
    private static final ReferenceQueue<Object> COLLECTED = new ReferenceQueue<>();
    private static final Map<Key, MediumReaderSession> SESSIONS = new HashMap<>();
    private static final class Key extends WeakReference<Object> {
        final int hash;
        Key(Object owner, ReferenceQueue<Object> queue) { super(owner, queue); hash = System.identityHashCode(owner); }
        @Override public int hashCode() { return hash; }
        @Override public boolean equals(Object other) {
            return this == other || other instanceof Key && get() != null && get() == ((Key) other).get();
        }
    }
    static synchronized MediumReaderSession forOwner(Object owner) {
        if (owner == null) return new MediumReaderSession();
        Key collected; while ((collected = (Key) COLLECTED.poll()) != null) SESSIONS.remove(collected);
        Key key = new Key(owner, COLLECTED);
        MediumReaderSession session = SESSIONS.get(key);
        if (session == null) { session = new MediumReaderSession(); SESSIONS.put(key, session); }
        return session;
    }
    static synchronized void bind(Object query, Object screen) {
        // Repository refreshes reuse the query; native NetworkOnly refreshes
        // create another query within the same article ViewModel.
        SESSIONS.put(new Key(query, COLLECTED), forOwner(screen));
    }
    static final class Accepted {
        final Object envelope;
        final ReaderArticle article;
        final String revision;
        final Long updatedAt;
        Accepted(Object envelope, ReaderArticle article, String revision, Long updatedAt) {
            this.envelope = envelope; this.article = article; this.revision = revision; this.updatedAt = updatedAt;
        }
    }
    private long generation;
    private Accepted accepted;
    synchronized long begin() { return ++generation; }
    synchronized void check(long expected) {
        if (generation != expected) throw new CancellationException("A newer article refresh owns this display");
    }
    synchronized Accepted accepted() { return accepted; }
    synchronized void accept(long expected, Accepted value) { check(expected); accepted = value; }
}
