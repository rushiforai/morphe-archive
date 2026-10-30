package local.maps.cluster;

/** Serial state machine; independent of Android, the activity and map projection. */
final class GuidanceSession {
    static final long KEEPALIVE_MS=5000, STALE_MS=30000;
    interface Output { void send(GuidanceFrame frame) throws Exception; }
    interface Store { boolean shown(); boolean save(boolean shown); }
    private final Output output;
    private final Store store;
    private boolean shown, recovery, enabled=true;
    private GuidanceFrame current, sent;
    private long freshAt, sentAt;
    GuidanceSession(Output output,Store store) {
        this.output=output; this.store=store;
        shown=store.shown(); recovery=shown;
    }
    void observe(GuidanceFrame frame,long observedAt,long now) {
        current=frame; freshAt=observedAt; tick(now);
    }
    void enable(boolean enabled,long now){this.enabled=enabled;tick(now);}
    void tick(long now) {
        try {
            // Clear our previous process's output before allowing new guidance.
            if(recovery) { end(); recovery=false; }
            if(!enabled || current==null || now-freshAt>=STALE_MS) { end(); return; }
            if(!current.equals(sent) || !shown || now-sentAt>=KEEPALIVE_MS) {
                // A killed process must leave a durable recovery flag before any send.
                if(!shown) {
                    if(!store.save(true))return;
                    shown=true;
                }
                output.send(current); sent=current; sentAt=now;
            }
        } catch(Exception ignored) { /* Keep ownership/recovery state and retry on the next tick. */ }
    }
    private void end() throws Exception {
        if(!shown)return;
        output.send(null);
        if(!store.save(false))throw new IllegalStateException("Guidance recovery flag not saved");
        shown=false; sent=null;
    }
}
