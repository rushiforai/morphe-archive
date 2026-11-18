package app.afterglow.extension.playback;

import java.lang.ref.WeakReference;

/** Main-thread session identity for once-per-playback entry and delayed actions. */
public final class FullscreenSession {
    private WeakReference<Object> player = new WeakReference<>(null);
    private String video = "";
    private long generation;
    private boolean claimed;

    public long update(Object controller, String id) {
        String next = id == null ? "" : id;
        if (player.get() != controller || !video.equals(next)) {
            player = new WeakReference<>(controller);
            video = next;
            generation++;
            claimed = false;
        }
        return generation;
    }

    public long claimEntry() {
        if (claimed || player.get() == null || video.isEmpty()) return -1;
        claimed = true;
        return generation;
    }

    public boolean matches(long token, Object controller, String id) {
        return update(controller, id) == token && controller != null && !video.isEmpty();
    }

    public void clear() {
        player.clear();
        video = "";
        claimed = false;
        generation++;
    }
}
