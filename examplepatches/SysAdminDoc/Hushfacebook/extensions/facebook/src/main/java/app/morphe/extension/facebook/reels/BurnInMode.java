/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import androidx.annotation.Nullable;

/**
 * What Burn-in guard does on the Reels screen ({@link BurnInGuard}, #288): nothing, dims a reel's
 * controls once the screen goes untouched, or dims them and moves the screen a step every two minutes.
 */
public enum BurnInMode {
    OFF("off"),
    DIM("dim"),
    DIM_AND_SHIFT("dim_and_shift");

    /** What a settings file holds for this choice. It never changes once written. */
    public final String fileValue;

    BurnInMode(String fileValue) {
        this.fileValue = fileValue;
    }

    /** The choice a settings file names, or null when it names none this build knows. */
    @Nullable
    public static BurnInMode fromFile(@Nullable Object value) {
        if (!(value instanceof String)) return null;
        for (BurnInMode mode : values()) {
            if (mode.fileValue.equals(value)) return mode;
        }
        return null;
    }
}
