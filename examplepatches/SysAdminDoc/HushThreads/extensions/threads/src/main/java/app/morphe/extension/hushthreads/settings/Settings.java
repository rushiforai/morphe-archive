/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.hushthreads.settings;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;

/**
 * The switches behind the hooks that ask before they act.
 *
 * <p>A switch's default is the second argument of its {@link BooleanSetting}. The patches that were
 * in Morphe Manager's default selection from the start keep their switches on. The ones that joined
 * it later (Block background-return feed refresh, Disable video autoplay, Max image quality, Disable
 * screenshot detection and Pure black dark mode) start off, so a build patched with the defaults acts
 * like Threads until a switch is turned on. While HushThreads is paused, safe mode included
 * ({@link app.morphe.extension.shared.settings.HushThreadsPause}), a switch answers off unless
 * {@link app.morphe.extension.shared.settings.Setting#keepWhenPaused} marks it, and the hook behind
 * it takes Threads' own path.
 */
@SuppressWarnings("unused")
public class Settings extends BaseSettings {
    /**
     * Posts Threads marks as ads, taken out of each page of the feed before it's cached or drawn:
     * a post whose media carries Threads' own ad data ("injected"), alone or as a post of a thread.
     */
    public static final BooleanSetting HIDE_ADS =
            new BooleanSetting("hushthreads_hide_ads", TRUE);

    /** Verified server cards suggesting accounts to follow, leaving ordinary posts visible. */
    public static final BooleanSetting HIDE_SUGGESTED_USERS =
            new BooleanSetting("hushthreads_hide_suggested_users", TRUE);

    /** Keep the current feed when returning to Threads within ten minutes. */
    public static final BooleanSetting BLOCK_RETURN_REFRESH =
            new BooleanSetting("hushthreads_block_return_refresh", FALSE);

    /** With the switch above, keep the feed however long Threads stayed in the background. */
    public static final BooleanSetting RETURN_REFRESH_NO_LIMIT =
            new BooleanSetting("hushthreads_return_refresh_no_limit", FALSE);

    /**
     * Feed videos wait for a tap: the video a feed post would start as you scroll stays on its
     * cover frame, and a tap opens it full screen, where it plays.
     */
    public static final BooleanSetting DISABLE_VIDEO_AUTOPLAY =
            new BooleanSetting("hushthreads_disable_video_autoplay", FALSE);

    /**
     * Photos load at the largest size the server sent instead of the one closest to the screen's
     * width ({@link app.morphe.extension.hushthreads.feed.ImageQuality}).
     */
    public static final BooleanSetting MAX_IMAGE_QUALITY =
            new BooleanSetting("hushthreads_max_image_quality", FALSE);

    /**
     * The tracking keys come off the post links Threads hands out when you copy or share one
     * (xmt, slof, igsh and the rest), with the rest of the link left as the server wrote it.
     */
    public static final BooleanSetting SANITIZE_SHARING_LINKS =
            new BooleanSetting("hushthreads_sanitize_sharing_links", TRUE);

    /**
     * A web link you tap opens in the phone's browser, or the app Android picks for it, instead of
     * Threads' own browser, and without Threads' click tracker. Meta's own sites stay in Threads.
     */
    public static final BooleanSetting OPEN_LINKS_EXTERNALLY =
            new BooleanSetting("hushthreads_open_links_externally", TRUE);

    /**
     * Threads' analytics uploads go to an address that answers nothing: the Pigeon event logger,
     * the graph.facebook.com event endpoint and the MQTT client's analytics endpoint.
     */
    public static final BooleanSetting DISABLE_ANALYTICS =
            new BooleanSetting("hushthreads_disable_analytics", TRUE);

    /**
     * Threads isn't told when you take a screenshot: its photo library and screenshot folder
     * watchers skip the new picture, and on Android 14 and newer it doesn't ask Android to report
     * screenshots of the feed ({@link app.morphe.extension.hushthreads.misc.ScreenshotDetection}).
     */
    public static final BooleanSetting DISABLE_SCREENSHOT_DETECTION =
            new BooleanSetting("hushthreads_disable_screenshot_detection", FALSE);

    /**
     * Dark mode's background is pure black instead of Threads' dark gray. Threads builds its colors
     * once a start, so a change waits for a restart.
     */
    public static final BooleanSetting PURE_BLACK =
            new BooleanSetting("hushthreads_pure_black", FALSE, true);

    /**
     * The Instagram button at the top of a profile isn't drawn, on your own profile or anyone
     * else's ({@link app.morphe.extension.hushthreads.profile.InstagramButton}). Threads keeps a
     * header it has drawn, so a change waits for a restart.
     */
    public static final BooleanSetting HIDE_INSTAGRAM_BUTTON =
            new BooleanSetting("hushthreads_hide_instagram_button", FALSE, true);

    /**
     * A post's menu gets a row that saves its photos and videos to the phone, every page of a
     * post with several in order, from the addresses Threads already holds
     * ({@link app.morphe.extension.hushthreads.download.PostSave}).
     */
    public static final BooleanSetting SAVE_MEDIA =
            new BooleanSetting("hushthreads_save_media", TRUE);

    /**
     * Video saves keep to what other apps open: H.264 video with AAC-LC or HE-AAC sound, within the
     * quality a save asks for
     * ({@link app.morphe.extension.hushthreads.download.SaveSettings#DOWNLOAD_QUALITY}), or the
     * app's single MP4 file when the manifest has no such pair. The sharpest version Meta streams
     * is often AV1 with xHE-AAC sound, which Gallery and VLC play and WhatsApp turns down. Off by
     * default, so a save keeps the sharpest.
     */
    public static final BooleanSetting DOWNLOAD_COMPATIBLE =
            new BooleanSetting("hushthreads_download_compatible", FALSE);

    /**
     * Once a day, when Threads starts, ask api.github.com whether a newer HushThreads release is
     * out, and say so on the settings screen ({@link ReleaseCheck}). It's the settings entry's own
     * switch rather than a patch's, so every build has it ({@link PatchFamily#ENTRY_SWITCHES}). Off
     * by default, and a settings file never carries it: a file shouldn't be able to put a phone
     * online.
     */
    public static final BooleanSetting CHECK_FOR_RELEASES =
            new BooleanSetting("hushthreads_check_releases", FALSE);
}
