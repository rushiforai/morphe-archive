/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.live;

/** The LIVE recording quality choices, shared by the settings page and the LIVE share sheet row (#203). */
public final class LiveRecordQuality {
    private LiveRecordQuality() {
    }

    public static final String[] LABELS = {"Same as the room", "Highest", "Lowest", "Original", "1080p", "720p", "540p", "360p"};
    public static final String[] VALUES = {"room", "highest", "lowest", "origin", "uhd", "hd", "sd", "ld"};

    /** The position of a stored value in {@link #VALUES}, or 0 (the room's own quality) for anything unknown. */
    public static int indexOf(String value) {
        for (int i = 0; i < VALUES.length; i++) {
            if (VALUES[i].equals(value)) return i;
        }
        return 0;
    }
}
