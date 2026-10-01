/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.misc;

import android.app.ActivityManager;

import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;

/**
 * Keeps TikTok's own background play on (#52).
 *
 * <p>TikTok reads the server value {@code background_play_enable} once a process: 0 is no
 * background play, 1 lets the long-press menu turn it on for one video, and 2 lets the menu turn
 * it on for good, which TikTok remembers as {@code long_term_bg_play_enable} in its
 * {@code background_play_repo} store. The server moves accounts between those values, which is
 * why the menu's switch comes and goes and why 2 set in the Feature Gate Lab can still fall back.
 * With Keep playing in the background on, the value reads as 2 and the remembered switch reads
 * as on, and TikTok does the rest: its player keeps going, its media notification pauses and
 * resumes, and it gives way when another app takes audio focus. Hushfeed starts no service of
 * its own. Which posts may play on stays TikTok's call too, with two exceptions: TikTok leaves
 * out photo posts and the videos on your own profile (where your private videos play), and the
 * switch lets both through. Ads, LIVE and paid posts still stop.
 */
public final class BackgroundPlay {
    /** The Feature Gate Lab key the switch decides while it's on. */
    public static final String GATE_KEY = "background_play_enable";
    /** TikTok's value for background play the menu can leave on for good. */
    static final int ALWAYS = 2;
    /** The event type TikTok gives the videos you open from your own profile. */
    static final String OWN_PROFILE = "personal_homepage";

    private BackgroundPlay() {}

    /**
     * The {@code background_play_enable} value TikTok acts on. TikTok keeps the first answer for
     * the life of the process, so the switch applies from the next start.
     */
    public static int mode(int served) {
        return Settings.BACKGROUND_PLAY.get() ? ALWAYS : served;
    }

    /** Whether TikTok's remembered background play switch reads as on. */
    public static boolean remembered(boolean stored) {
        return stored || Settings.BACKGROUND_PLAY.get();
    }

    /**
     * Whether background play may start on the page {@code eventType} names. TikTok's list has
     * the For You and Following feeds, search and other people's profiles, and leaves out your
     * own profile, the only place your private videos play.
     */
    public static boolean scene(boolean listed, String eventType) {
        return listed || (OWN_PROFILE.equals(eventType) && Settings.BACKGROUND_PLAY.get());
    }

    /** Whether a photo post counts as one for background play, which TikTok leaves out. */
    public static boolean photoMode(boolean photo) {
        return photo && !Settings.BACKGROUND_PLAY.get();
    }

    /**
     * Whether a page's claim on the sound is skipped. TikTok takes transient audio focus when one
     * of its pages resumes, and at a cold start it holds the feed's resume back until the feed's
     * first page loads. Leaving before then had the claim land in the background, where TikTok's
     * own background player took it for another app's sound and paused the first video. While
     * the switch is on, a claim made with none of TikTok's screens showing is skipped.
     */
    public static boolean skipsPageFocus() {
        if (!Settings.BACKGROUND_PLAY.get()) return false;
        try {
            ActivityManager.RunningAppProcessInfo state = new ActivityManager.RunningAppProcessInfo();
            ActivityManager.getMyMemoryState(state);
            return hidden(state.importance);
        } catch (RuntimeException e) {
            return false;
        }
    }

    /**
     * Whether a process of this importance has none of its screens showing. A screen that shows,
     * picture in picture included, keeps the process at the foreground importance, and TikTok
     * playing in the background with its media notification sits just below it.
     */
    static boolean hidden(int importance) {
        return importance > ActivityManager.RunningAppProcessInfo.IMPORTANCE_FOREGROUND;
    }

    /** Whether the switch is deciding {@code key} right now, which the Lab shows on that key. */
    public static boolean decidesGate(String key) {
        return SettingsStatus.backgroundPlayEnabled && GATE_KEY.equals(key) && Settings.BACKGROUND_PLAY.get();
    }
}
