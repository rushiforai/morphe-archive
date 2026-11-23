package nl.johninnl.deezer.auth;

/** Process-local, single-delivery mailbox shared by the Android flow and sequence tests. */
public final class DeferredConsentDelivery {
    public enum Kind { RESOLUTION, NATIVE_RESULT, ACTIVITY_RESULT }

    public static final class Event {
        public final Kind kind;
        public final Object payload;
        public final int requestCode;
        public final int resultCode;
        private Event(Kind kind, Object payload, int requestCode, int resultCode) {
            this.kind = kind;
            this.payload = payload;
            this.requestCode = requestCode;
            this.resultCode = resultCode;
        }
    }

    private final ConsentGeneration generation;
    private Event pending;

    public DeferredConsentDelivery(ConsentGeneration generation) { this.generation = generation; }

    public synchronized boolean offer(ConsentGeneration source, Kind kind, Object payload, int requestCode, int resultCode) {
        if (source != generation || !generation.isActive() || pending != null) return false;
        pending = new Event(kind, payload, requestCode, resultCode);
        return true;
    }

    public synchronized Event take(boolean hostReady) {
        if (!generation.isActive()) { pending = null; return null; }
        if (!hostReady) return null;
        Event result = pending;
        pending = null;
        return result;
    }

    public synchronized void clear() { pending = null; }
}
