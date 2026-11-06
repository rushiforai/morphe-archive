package dev.twitchpatches.extension.reload;

final class ReloadGesture {
    enum Result { HINT, RELOAD, IGNORE }
    private Object identity;
    private long firstTap = -1;
    private long lastReload = -1;

    Result tap(Object current, long now, boolean enabled) {
        if (!enabled || current == null) {
            reset();
            return Result.IGNORE;
        }
        if (identity != current) {
            reset();
            identity = current;
        }
        if (lastReload >= 0 && now - lastReload < 800) return Result.IGNORE;
        if (firstTap >= 0 && now >= firstTap && now - firstTap <= 500) {
            firstTap = -1;
            lastReload = now;
            return Result.RELOAD;
        }
        firstTap = now;
        return Result.HINT;
    }

    void reset() {
        identity = null;
        firstTap = -1;
        lastReload = -1;
    }
}
