package app.afterglow.extension.playback;

import java.lang.ref.WeakReference;

/** Activation identity and stale-work protection for delayed native loop restoration. */
public final class LoopSession {
    private WeakReference<Object> player = new WeakReference<>(null);
    private String video = "";
    private long generation;
    private boolean eligible, pending, ready;

    public long update(Object controller, String id, boolean enabledAtActivation) {
        String next = id == null ? "" : id;
        if (player.get() != controller || !video.equals(next)) {
            player = new WeakReference<>(controller);
            video = next;
            generation++;
            eligible = enabledAtActivation;
            pending = ready = false;
        }
        return generation;
    }

    public long claim() {
        if (!eligible || pending || ready || player.get() == null || video.isEmpty()) return -1;
        pending = true;
        return generation;
    }

    public boolean matches(long token, Object controller, String id) {
        return token == generation && controller != null && player.get() == controller
                && !video.isEmpty() && video.equals(id);
    }

    public void finish(long token, boolean applied) {
        if (token == generation) { pending = false; ready = applied; }
    }

    public boolean canRecord(Object controller, String id) {
        return ready && matches(generation, controller, id);
    }

    public void invalidatePending() { generation++; pending = false; }

    public void clear() {
        player.clear(); video = ""; generation++;
        eligible = pending = ready = false;
    }
}
