/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.live;

import app.morphe.extension.tiktok.settings.Settings;

/** What a LIVE recording is made from (#37): the room's own stream file, or the phone's screen. */
public final class LiveRecordSource {
    private LiveRecordSource() {
    }

    public static final String STREAM = "stream";
    public static final String SCREEN = "screen";

    public static final String[] LABELS = {"Stream only", "Screen"};
    public static final String[] VALUES = {STREAM, SCREEN};

    /** True when the stored choice is the screen; anything unknown is the stream, as before. */
    public static boolean screen(String value) {
        return SCREEN.equals(value);
    }

    /**
     * Whether the app's own sound can be part of a screen recording: playback capture exists from
     * Android 10, and it needs the microphone permission TikTok already declares to be granted.
     */
    public static boolean audioAllowed(int sdk, boolean microphoneGranted) {
        return sdk >= 29 && microphoneGranted;
    }

    /** The choice in effect now. */
    public static boolean screen() {
        return screen(Settings.LIVE_RECORD_SOURCE.get());
    }
}
