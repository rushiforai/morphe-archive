/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import androidx.annotation.Nullable;

/**
 * The quality reels, or video stories, start at: the same as every other video, the default, or a
 * {@link PlaybackQuality} of their own, Facebook's Auto included.
 *
 * <p>Like {@link PlaybackQuality}, this holds no Android type and reads no setting, and the name a
 * person reads is the settings screen's.
 */
public enum SurfaceQuality {
    SAME(null, "same"),
    AUTO(PlaybackQuality.AUTO),
    DATA_SAVER(PlaybackQuality.DATA_SAVER),
    P480(PlaybackQuality.P480),
    P720(PlaybackQuality.P720),
    HIGHEST(PlaybackQuality.HIGHEST);

    /** The quality this plays at, or null for the one every other video plays at. */
    @Nullable
    public final PlaybackQuality quality;

    /** What a settings file would hold for this choice. It never changes once written. */
    public final String fileValue;

    SurfaceQuality(PlaybackQuality quality) {
        this(quality, quality.fileValue);
    }

    SurfaceQuality(@Nullable PlaybackQuality quality, String fileValue) {
        this.quality = quality;
        this.fileValue = fileValue;
    }

    /** The choice a settings file names, or null when it names none this build knows. */
    @Nullable
    public static SurfaceQuality fromFile(@Nullable Object value) {
        if (!(value instanceof String)) return null;
        for (SurfaceQuality choice : values()) {
            if (choice.fileValue.equals(value)) return choice;
        }
        return null;
    }

    /** [base] for {@link #SAME}, else this choice's own quality. */
    public PlaybackQuality or(PlaybackQuality base) {
        return quality == null ? base : quality;
    }
}
