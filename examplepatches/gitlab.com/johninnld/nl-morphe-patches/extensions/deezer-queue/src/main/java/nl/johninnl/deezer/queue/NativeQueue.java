package nl.johninnl.deezer.queue;

/** Implemented by the Kotlin patch using the inspected original 9002703 ABI. */
public interface NativeQueue {
    Object queueLock();
    Object queueHolder();
    Object queueCursor();
    Object queueSource();
    long queueSourceEpoch();
    long queueCursorStamp();
    long queueSourceStamp();
    long queueEpoch();
    Object queueItem(int position);
    int queuePosition(Object item);
    long queueRawId(Object item);
    int queueSize();
    boolean queueSame(Object left, Object right);
    boolean queueAllowed();
    Object queueCurrent();
    void queueDispatch(long rawId);
    void queueCommand(Object command);
}
