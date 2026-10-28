/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import androidx.annotation.Nullable;

/**
 * What the Reels tab sorts the reels Facebook has loaded by, while Newest reels first is on (#134).
 * Each is read from the reel's own story as it's ranked: its posting time or its reaction count. A
 * reel whose story doesn't carry the value keeps Facebook's place. There's no play count order:
 * the Reels tab's stories don't carry {@code play_count} on 584.
 *
 * <p>Like {@code CommentOrder}, this holds no Android type and reads no setting, and the label a
 * person reads is the settings screen's, in the phone's language.
 */
public enum ReelsOrder {
    NEWEST("newest"),
    MOST_LIKED("most_liked");

    /** What a settings file holds for this order, and what a log line calls it. It never changes once written. */
    public final String fileValue;

    ReelsOrder(String fileValue) {
        this.fileValue = fileValue;
    }

    /** The order a settings file names, or null when it names none this build knows. */
    @Nullable
    public static ReelsOrder fromFile(@Nullable Object value) {
        if (!(value instanceof String)) return null;
        for (ReelsOrder order : values()) {
            if (order.fileValue.equals(value)) return order;
        }
        return null;
    }
}
