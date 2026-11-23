package nl.johninnl.deezer.queue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

/** Own only the exported session identity. Native positions, tracks and contexts remain native. */
public final class QueueHandles {
    private static final AtomicLong NEXT = new AtomicLong(0x100000000L);
    private static final ThreadLocal<Request> REQUEST = new ThreadLocal<>();
    private static final ThreadLocal<CommandFrame> COMMAND = new ThreadLocal<>();
    private static final int MAX_ROWS = 10000;
    private NativeQueue owner;
    private Object source, cursor, holder;
    private long epoch, sourceEpoch, mutationEpoch;
    private final Map<Long, Entry> handles = new HashMap<>();
    private final Map<Long, Entry> nativeIds = new HashMap<>();

    private static final class Entry {
        final long handle;
        final int position;
        final long rawId;
        final Object occurrence;
        Entry(long handle, int position, long rawId, Object occurrence) {
            this.handle = handle; this.position = position; this.rawId = rawId; this.occurrence = occurrence;
        }
    }
    private static final class Request {
        final QueueHandles session;
        final NativeQueue owner;
        final Entry entry;
        boolean consumed;
        Object command;
        Request(QueueHandles session, NativeQueue owner, Entry entry) {
            this.session = session; this.owner = owner; this.entry = entry;
        }
    }
    private static final class CommandFrame {
        final Request request;
        CommandFrame(Request request) { this.request = request; }
    }

    private String lastRejection;
    private String lastPublicationFailure;
    private void report(String reason) {
        if (reason.equals(lastRejection)) return;
        lastRejection = reason;
        try { android.util.Log.w("DeezerQueue", reason); } catch (RuntimeException unavailable) { }
    }
    private List<Long> reject(String reason) { lastPublicationFailure=reason; report(reason); return null; }

    public QueueHandles(NativeQueue owner) { this.owner = owner; }

    /** Each publication gets fresh IDs, including same-content reloads and A -> B -> A. */
    public List<Long> replace(Object producingSource, List<?> occurrences, List<Long> rawIds, long producingEpoch, long producingMutation) {
        NativeQueue nativeQueue = nativeOwner();
        if (nativeQueue == null) return null;
        synchronized (nativeQueue.queueLock()) {
            synchronized (this) {
                clear();
                if (owner != nativeQueue || producingSource == null) return reject("publication: missing source owner");
                if (nativeQueue.queueSource() != producingSource || nativeQueue.queueSourceEpoch() != producingEpoch)
                    return reject("publication: source identity changed");
                if (producingMutation < 0 || QueueMutation.version() != producingMutation)
                    return reject("publication: provider generation changed");
                if (nativeQueue.queueCursorStamp() != producingMutation || nativeQueue.queueSourceStamp() != producingMutation)
                    return reject("publication: cursor generation differs");
                if (occurrences == null || rawIds.size() != occurrences.size() || rawIds.isEmpty() || rawIds.size() > MAX_ROWS)
                    return reject("publication: invalid occurrence window");
                Object currentCursor = nativeQueue.queueCursor();
                long currentEpoch = nativeQueue.queueEpoch();
                if (currentCursor == null || currentEpoch < 0 || producingEpoch < 0) return reject("publication: playback cursor not ready");
                // Native 9002703 resolves hashed IDs over the FULL queue, not just its exported window.
                // Scan once so an off-window hash collision cannot redirect a valid-looking row.
                int count = nativeQueue.queueSize();
                if (count <= 0 || count > MAX_ROWS || !(producingSource instanceof List)) return reject("publication: unsupported native queue size/type ("+count+")");
                List<?> domain = (List<?>) producingSource;
                if (domain.size() > MAX_ROWS) return reject("publication: source queue exceeds mapping bound");
                Map<Long, Object> full = new HashMap<>();
                java.util.Set<Integer> domainPositions = new java.util.HashSet<>();
                for (Object row : domain) {
                    if (row == null) return reject("publication: null source occurrence");
                    int position = nativeQueue.queuePosition(row);
                    if (position < 0 || position >= count || !domainPositions.add(position)) return reject("publication: invalid source position ("+position+"/"+count+")");
                    long raw = nativeQueue.queueRawId(row);
                    if (raw == -1 || full.put(raw, row) != null) return reject("publication: ambiguous native queue IDs");
                }
                List<Long> ids = new ArrayList<>(rawIds.size());
                java.util.Set<Integer> seenPositions = new java.util.HashSet<>();
                for (int i = 0; i < rawIds.size(); i++) {
                    Long raw = rawIds.get(i);
                    Object provided = occurrences.get(i);
                    if (raw == null || raw == -1 || provided == null || nativeIds.containsKey(raw)) {
                        clear(); return null;
                    }
                    int position = nativeQueue.queuePosition(provided);
                    Object sourceOccurrence = full.get(raw);
                    Object actual = position < 0 || position >= count ? null : nativeQueue.queueItem(position);
                    if (!seenPositions.add(position) || actual == null || sourceOccurrence == null ||
                            nativeQueue.queueRawId(provided) != raw || nativeQueue.queueRawId(actual) != raw ||
                            !nativeQueue.queueSame(sourceOccurrence, provided) || !nativeQueue.queueSame(provided, actual)) {
                        clear(); return reject("publication: source and playback rows differ");
                    }
                    long id = NEXT.getAndIncrement();
                    if (id < 0x100000000L) { clear(); return null; }
                    Entry entry = new Entry(id, position, raw, actual);
                    handles.put(id, entry); nativeIds.put(raw, entry); ids.add(id);
                }
                if (currentCursor != nativeQueue.queueCursor() || currentEpoch != nativeQueue.queueEpoch() ||
                        producingEpoch != nativeQueue.queueSourceEpoch() || producingSource != nativeQueue.queueSource() ||
                        QueueMutation.version() != producingMutation || nativeQueue.queueCursorStamp() != producingMutation ||
                        nativeQueue.queueSourceStamp() != producingMutation) { clear(); return null; }
                source = producingSource; cursor = currentCursor; epoch = currentEpoch;
                sourceEpoch = producingEpoch; mutationEpoch = producingMutation;
                holder = nativeQueue.queueHolder();
                return ids;
            }
        }
    }

    private synchronized NativeQueue nativeOwner() { return owner; }
    private boolean live(NativeQueue nativeQueue) {
        return owner == nativeQueue && cursor != null && source == nativeQueue.queueSource() &&
            cursor == nativeQueue.queueCursor() && epoch == nativeQueue.queueEpoch() &&
            sourceEpoch == nativeQueue.queueSourceEpoch() && QueueMutation.version() == mutationEpoch &&
            nativeQueue.queueCursorStamp() == mutationEpoch && nativeQueue.queueSourceStamp() == mutationEpoch && !handles.isEmpty();
    }
    /** Mapping freshness is independent of native playback eligibility. */
    public String describe() {
        NativeQueue q=nativeOwner();if(q==null)return "retired";
        try { synchronized(q.queueLock()){ synchronized(this){
            return "entries="+handles.size()+" current="+live(q)+" eligible="+q.queueAllowed()+
                " lastPublicationFailure="+lastPublicationFailure+" readiness="+lastRejection+
                " provider="+QueueMutation.version()+" capturedProvider="+mutationEpoch+
                " targetStamp="+q.queueCursorStamp()+" sourceStamp="+q.queueSourceStamp()+
                " cursorEpoch="+epoch+"/"+q.queueEpoch()+" sourceEpoch="+sourceEpoch+"/"+q.queueSourceEpoch()+
                " cursorSame="+(cursor==q.queueCursor())+" sourceSame="+(source==q.queueSource())+" nativeSize="+q.queueSize();
        }}}catch(RuntimeException failure){return failure.getClass().getSimpleName()+(failure instanceof ClassCastException?": "+failure.getMessage():"");}
    }
    public boolean mapped() {
        NativeQueue nativeQueue = nativeOwner();
        if (nativeQueue == null) return false;
        synchronized (nativeQueue.queueLock()) {
            synchronized (this) { return live(nativeQueue); }
        }
    }
    public boolean ready() {
        NativeQueue nativeQueue = nativeOwner();
        if (nativeQueue == null) return false;
        synchronized (nativeQueue.queueLock()) {
            synchronized (this) {
                if (!live(nativeQueue)) { report("selection unavailable: no current queue snapshot"); return false; }
                boolean allowed = nativeQueue.queueAllowed();
                if (!allowed) report("selection unavailable: native policy or interruption");
                return allowed;
            }
        }
    }
    public long active(long rawId) {
        NativeQueue nativeQueue = nativeOwner();
        if (nativeQueue == null || rawId == -1) return -1;
        synchronized (nativeQueue.queueLock()) {
            synchronized (this) {
                Entry entry = nativeIds.get(rawId);
                Object current = nativeQueue.queueCurrent();
                return live(nativeQueue) && entry != null && current != null &&
                    nativeQueue.queueSame(entry.occurrence, current) ? entry.handle : -1;
            }
        }
    }

    /** Reject before native EventBus/pause; never hold a native lock across external callbacks. */
    public boolean select(long handle) {
        NativeQueue nativeQueue = nativeOwner();
        if (nativeQueue == null) return false;
        final Entry entry;
        try {
        synchronized (nativeQueue.queueLock()) {
            synchronized (this) {
                entry = handles.get(handle);
                if (!live(nativeQueue) || entry == null || !nativeQueue.queueAllowed() ||
                        !nativeQueue.queueSame(entry.occurrence, nativeQueue.queueItem(entry.position))) return false;
            }
        }
        } catch (RuntimeException failure) { invalidate(); return false; }
        Request previous = REQUEST.get();
        Request request = new Request(this, nativeQueue, entry);
        REQUEST.set(request);
        try {
            nativeQueue.queueDispatch(entry.rawId);
            if (!request.consumed) report("selection dispatch did not reach selected-row consumption");
            return request.consumed;
        } finally {
            if (previous == null) REQUEST.remove(); else REQUEST.set(previous);
        }
    }

    /** Scope the actual native command; a reentrant independent command gets no selection guard. */
    public static void command(NativeQueue owner, Object command) {
        CommandFrame previous = COMMAND.get();
        Request selected = REQUEST.get();
        COMMAND.set(new CommandFrame(selected != null && selected.owner == owner && selected.command == command
            ? selected : null));
        try { owner.queueCommand(command); }
        finally { if (previous == null) COMMAND.remove(); else COMMAND.set(previous); }
    }

    /** Bind exactly the object invoked by the original queue callback, after its EventBus event. */
    public static void selectedCommand(NativeQueue owner, Object command) {
        Request selected = REQUEST.get();
        if (selected == null || selected.owner != owner) return;
        Object previous = selected.command;
        selected.command = command;
        try { command(owner, command); }
        finally { selected.command = previous; }
    }

    /** Hook ONLY the authoritative selected-row consumption, never the shared cursor getter. */
    public static boolean consume(Object actualHolder, Object actualRow) {
        CommandFrame frame = COMMAND.get();
        Request request = frame == null ? null : frame.request;
        if (request == null) return true;
        QueueHandles session = request.session;
        NativeQueue nativeQueue = request.owner;
        try {
        synchronized (nativeQueue.queueLock()) {
            synchronized (session) {
                if (!session.live(nativeQueue) || session.handles.get(request.entry.handle) != request.entry || session.holder != actualHolder || request.consumed ||
                        !nativeQueue.queueAllowed() || actualRow == null ||
                        !nativeQueue.queueSame(request.entry.occurrence, actualRow)) return false;
                request.consumed = true;
                return true;
            }
        }
        } catch (RuntimeException failure) { session.invalidate(); return false; }
    }

    private void clear() { handles.clear(); nativeIds.clear(); source = null; cursor = null; holder = null; }
    public synchronized void invalidate() { clear(); }
    public synchronized void retire() { clear(); owner = null; }
}
