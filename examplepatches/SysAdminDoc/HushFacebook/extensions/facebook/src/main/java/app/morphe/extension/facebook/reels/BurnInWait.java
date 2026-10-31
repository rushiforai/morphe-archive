/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import androidx.annotation.Nullable;

/** Dim after: how long the Reels screen goes untouched before Burn-in guard dims it ({@link BurnInGuard}, #288). */
public enum BurnInWait {
    AT_ONCE(0L, "at_once"),
    TWO_SECONDS(2_000L, "2s"),
    FIVE_SECONDS(5_000L, "5s"),
    TEN_SECONDS(10_000L, "10s");

    public final long millis;
    /** What a settings file holds for this choice. It never changes once written. */
    public final String fileValue;

    BurnInWait(long millis, String fileValue) {
        this.millis = millis;
        this.fileValue = fileValue;
    }

    /** The choice a settings file names, or null when it names none this build knows. */
    @Nullable
    public static BurnInWait fromFile(@Nullable Object value) {
        if (!(value instanceof String)) return null;
        for (BurnInWait wait : values()) {
            if (wait.fileValue.equals(value)) return wait;
        }
        return null;
    }
}
