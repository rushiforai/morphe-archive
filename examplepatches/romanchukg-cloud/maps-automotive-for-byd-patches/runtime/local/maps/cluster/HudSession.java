package local.maps.cluster;

/** Single-worker standalone session: journal before start, recover before any guidance. */
final class HudSession {
    interface Output {void send(String packet) throws Exception;}
    interface Store {boolean pending();boolean save(boolean value);}
    static final long KEEPALIVE=1000, STALE=30000;
    private final Output output;private final Store store;
    private boolean pending,recovering,enabled=true;
    private GuidanceFrame frame;private long freshAt,sentAt;
    private String sent;
    HudSession(Output output,Store store){this.output=output;this.store=store;pending=store.pending();recovering=pending;}
    void observe(GuidanceFrame value,long observedAt,long now){frame=value;freshAt=observedAt;tick(now);}
    void enable(boolean value,long now){enabled=value;tick(now);}
    void tick(long now) {
        try {
            if(recovering)clear();
            String packet=enabled&&now>=freshAt&&now-freshAt<STALE?HudPackets.guidance(frame):null;
            if(packet==null){clear();return;}
            if(!pending) {
                if(!store.save(true))return;
                pending=true;output.send(HudPackets.START);
            }
            if(!packet.equals(sent)||now-sentAt>=KEEPALIVE) {
                output.send(packet);sent=packet;sentAt=now;
            }
        } catch(Exception ignored) {
            recovering=pending;
            // A failed dispatch may have reached the receiver. Clear before retrying a start.
            try{clear();}catch(Exception unavailable){recovering=pending;}
        }
    }
    private void clear() throws Exception {
        if(!pending)return;
        recovering=true;output.send(HudPackets.END);
        if(!store.save(false))throw new IllegalStateException("HUD clear journal unavailable");
        pending=false;recovering=false;sent=null;sentAt=0;
    }
}
