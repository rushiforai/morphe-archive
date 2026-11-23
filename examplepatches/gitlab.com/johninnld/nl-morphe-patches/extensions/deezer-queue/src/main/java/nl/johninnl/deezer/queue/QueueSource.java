package nl.johninnl.deezer.queue;

import java.util.ArrayList;
import java.util.List;

/** Carry the actual objects used by the existing native mapper, without changing their data. */
public final class QueueSource extends ArrayList<Object> {
    public final Object source;
    private Object window;
    public final long mutation;
    public final List<Object> occurrences = new ArrayList<>();
    private final SourceEpoch owner;
    public final long version;
    private boolean sealed;
    private Object pending;
    public QueueSource(SourceEpoch owner) {
        this.owner = owner;
        long capturedVersion = -1, capturedMutation = -1;
        Object capturedSource = null;
        try {
            capturedVersion = owner.queueSourceVersion();
            capturedSource = owner.queueSourceList();
            capturedMutation = owner.queueSourceStamp();
        } catch (RuntimeException unavailable) { capturedVersion = -1; capturedSource = null; }
        version = capturedVersion; source = capturedSource; mutation = capturedMutation;
    }
    public QueueSource(int capacity, Object source, SourceEpoch owner) { this(owner); begin(source); }
    public void begin(Object window) { this.window = window; }
    public void seal() {
        try { sealed = live() && window instanceof List && ((List<?>) window).size() == size(); }
        catch (RuntimeException unavailable) { sealed = false; }
    }
    private boolean live() {
        try {
            return source != null && mutation >= 0 && QueueMutation.version() == mutation &&
                owner.queueSourceStamp() == mutation && owner.queueSourceVersion() == version && owner.queueSourceList() == source;
        } catch (RuntimeException unavailable) { return false; }
    }
    public boolean current() { return sealed && live(); }
    public void capture(Object occurrence) { pending = occurrence; }
    @Override public boolean add(Object item) {
        occurrences.add(pending); pending = null;
        return super.add(item);
    }
}
