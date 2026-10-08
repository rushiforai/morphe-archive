/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import androidx.annotation.Nullable;

/**
 * The reaction counts the News feed's ceiling can be set to. A post with more reactions than the
 * ceiling is hidden, which takes out the viral posts that have gathered thousands. Off is the
 * default and hides nothing.
 */
public enum ReactionCeiling {
    OFF(0, "off"),
    K1(1_000, "1000"),
    K5(5_000, "5000"),
    K10(10_000, "10000"),
    K50(50_000, "50000"),
    K100(100_000, "100000");

    /** The most reactions a post keeps. Meaningless for {@link #OFF}, which keeps every post. */
    public final int limit;

    /** What a settings file holds for this choice. It never changes once written. */
    public final String fileValue;

    ReactionCeiling(int limit, String fileValue) {
        this.limit = limit;
        this.fileValue = fileValue;
    }

    /** Whether a post with [count] reactions is above this ceiling. A negative count is unread, and never is. */
    public boolean exceeds(long count) {
        return this != OFF && count > limit;
    }

    /** The choice a settings file names, or null when it names none this build knows. */
    @Nullable
    public static ReactionCeiling fromFile(@Nullable Object value) {
        if (!(value instanceof String)) return null;
        for (ReactionCeiling ceiling : values()) {
            if (ceiling.fileValue.equals(value)) return ceiling;
        }
        return null;
    }
}
