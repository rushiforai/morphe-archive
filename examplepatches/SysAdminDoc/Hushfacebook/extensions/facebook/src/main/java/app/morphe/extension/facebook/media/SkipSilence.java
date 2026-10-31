/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import android.content.Context;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Skip silent parts (#144). Facebook plays videos, reels and stories through ExoPlayer, and each
 * of its audio sinks runs the sound through ExoPlayer's chain of audio processors, one of which
 * cuts out the silent stretches when it's told to (SilenceSkippingAudioProcessor). Facebook never
 * tells it to. Each time a sink starts sound, after a seek or a new track too, it hands the chain
 * its skip-silence flag, and that hand-off asks here first. While the switch is on the answer is
 * yes. The chain then counts the frames it cut, and the sink's clock, which the picture follows,
 * moves on by them, so the video keeps up with its sound.
 *
 * <p>ExoPlayer skips silence in plain PCM sound only. Sound handed to the phone undecoded
 * (passthrough) or through a tunneled decoder plays as Facebook sends it whatever this answers.
 * The sink keeps the flag Facebook gave it, so a change shows from the next seek or video. Nothing
 * here may throw into Facebook's player: off, paused, before the settings are ready or when
 * anything here fails, the chain gets Facebook's flag unchanged.
 *
 * <p>While the switch is on, a video's menu (a post's three-dot menu, a reel's More sheet) gets a
 * row that keeps the silent parts in that one video. It learns which video plays from Resume long
 * videos' hook first thing in FbGrootPlayer's maybeTrackVideoStart ({@link #started}), the one
 * Recently watched shares, so without that patch there's no row. The row's video keeps its silent
 * parts while it's the one started last, the start of another video ends that, and the setting
 * itself never changes. A pick seeks the playing video to where it is, since a sink asks again only
 * when its sound restarts, so the change is heard at once.
 *
 * <p>Each skip moves the clock on past frames the picture never shows, and Facebook's own dav1d
 * decoder (meta.dav1d.av1.decoder) watches its drop rate at normal speed only. Over its limit it
 * takes a reel down to its SD file a few seconds in, and the Quality row goes with it (#286). The
 * health check already leaves sped-up playback alone, so while silent parts are skipped it's told
 * the speed isn't normal ({@link #healthSpeed}). Facebook's other checks on dropped frames look at
 * any speed, so their switches, thresholds and recovery read as off then ({@link #dropFallback},
 * {@link #dropThreshold}, {@link #dropRecovery}). Decode errors still fall back as before.
 */
public final class SkipSilence {
    /** Counted under the patch's name each time a sink's sound starts with silent parts skipped. */
    static final String SKIPPING = "Sound set to skip silent parts";

    /** Counted each time a sink's sound keeps its silent parts because its video's row said so. */
    static final String LEFT_IN = "Silent parts kept for one video";

    /** Counted each time a video's menu gets the row. */
    static final String ROW_ADDED = "Menu with the Skip silent parts row";

    /** Counted each time Facebook's decoder health check starts being left out while silence is skipped. */
    static final String HEALTH_LEFT_OUT = "Decoder health check left out";

    private static final String FAMILY = FamilyNames.SKIP_SILENCE;

    /**
     * The player that started last: its video id, the player itself for the seek in place, and the
     * trigger its start carried. One object, so a menu tap never reads one start's id with
     * another's player.
     */
    private static final class Start {
        final String videoId;
        final WeakReference<Object> player;
        @Nullable
        final Object trigger;

        Start(String videoId, Object player, @Nullable Object trigger) {
            this.videoId = videoId;
            this.player = new WeakReference<>(player);
            this.trigger = trigger;
        }
    }

    /** The last start with a video id, or null before one, or since one came while the switch was off. */
    @Nullable
    private static volatile Start last;

    /** The video whose silent parts a row kept, until another video starts. */
    @Nullable
    private static volatile String keptWhole;

    /** Facebook's decoder health check was last left out, so a change is logged once. */
    private static volatile boolean healthLeftOut;

    private SkipSilence() {
    }

    /**
     * Injection point, right before each audio sink hands its processor chain the skip-silence
     * flag [asked]. Answers the flag the chain gets: yes while the switch is on, else [asked]. The
     * video a row kept whole gets [asked] while it's the one started last.
     */
    public static boolean skipSilence(boolean asked) {
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, "audio sink");
            if (asked || !on()) return asked;
            String whole = keptWhole;
            if (whole != null && whole.equals(playing())) {
                HookStatus.counted(FAMILY, LEFT_IN);
                return asked;
            }
            HookStatus.counted(FAMILY, SKIPPING);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "audio sink", failure);
            return asked;
        }
    }

    /** Whether silent parts are skipped: the switch on, not paused, and the settings ready. */
    private static boolean on() {
        return Utils.settingsReady() && Settings.SKIP_SILENT_PARTS.get();
    }

    /** The video id of the player that started last, or null. */
    @Nullable
    private static String playing() {
        Start start = last;
        return start == null ? null : start.videoId;
    }

    /** Whether the playing video's silent parts are skipped: the switch on and no row keeping them. */
    private static boolean skipping() {
        if (!on()) return false;
        String whole = keptWhole;
        return whole == null || !whole.equals(playing());
    }

    // ------------------------------------------------------------------ Facebook's decoder health check

    /**
     * Injection point, Facebook's Meta dav1d decoder health check, on the playback speed [speed] it
     * reads before deciding whether to look at the dropped frames. It looks only at normal speed,
     * so while silent parts are skipped a normal speed is answered as sped up, and the frames the
     * skips drop never take the video down to its SD file (#286). Never throws.
     */
    public static float healthSpeed(float speed) {
        try {
            HookStatus.bound(FAMILY, "decoder health");
            boolean skip = skipping();
            noteHealth(skip);
            return skip && Math.abs(speed - 1f) < 0.01f ? speed + 1f : speed;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "decoder health", failure);
            return speed;
        }
    }

    /**
     * Injection point, each read of a server flag [enabled] that turns on one of Facebook's dav1d
     * fallbacks on dropped frames at any speed: the drop-rate one it uses when the health check
     * isn't set up, and the low render rate one, which slows the video down before it falls back.
     * Off while silent parts are skipped, for the same reason as {@link #healthSpeed}. Never throws.
     */
    public static boolean dropFallback(boolean enabled) {
        try {
            HookStatus.bound(FAMILY, "drop fallback");
            boolean skip = skipping();
            noteHealth(skip);
            return enabled && !skip;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "drop fallback", failure);
            return enabled;
        }
    }

    /**
     * Injection point, each read of a dropped frame count [threshold] past which Facebook reports a
     * video issue that plays the SD file. None is reached while silent parts are skipped, and a
     * threshold that's off (0 or less) stays off. Never throws.
     */
    public static long dropThreshold(long threshold) {
        try {
            HookStatus.bound(FAMILY, "drop threshold");
            boolean skip = skipping();
            noteHealth(skip);
            return threshold > 0 && skip ? Long.MAX_VALUE : threshold;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "drop threshold", failure);
            return threshold;
        }
    }

    /**
     * Injection point, each read of what dav1d's own frame drop warnings make Facebook do
     * [action]. Nothing (0) while silent parts are skipped. Never throws.
     */
    public static long dropRecovery(long action) {
        try {
            HookStatus.bound(FAMILY, "drop recovery");
            boolean skip = skipping();
            noteHealth(skip);
            return skip ? 0 : action;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "drop recovery", failure);
            return action;
        }
    }

    /** Logs and counts the checks being left out while silent parts are skipped, or back, once per change. */
    private static void noteHealth(boolean leftOut) {
        if (healthLeftOut == leftOut) return;
        healthLeftOut = leftOut;
        if (leftOut) HookStatus.counted(FAMILY, HEALTH_LEFT_OUT);
        Logger.printDebug(() -> leftOut
                ? "Skip silent parts: Facebook's decoder health check left out while silent parts are skipped"
                : "Skip silent parts: Facebook's decoder health check runs again");
    }

    // ------------------------------------------------------------------ the row

    /**
     * From {@link ResumePlayback#started}: [started] began playing with [trigger]. It becomes the
     * playing video, and a row's pick for another video ends. Off, everything kept is forgotten,
     * so turning the switch back on never offers a row for a video from before. Never throws.
     */
    static void started(@Nullable Object started, @Nullable Object trigger) {
        try {
            if (started == null) return;
            if (!on()) {
                forget();
                return;
            }
            ResumePlayback.Facts facts = ResumePlayback.facts(started);
            String id = facts == null ? null : facts.videoId;
            last = id == null ? null : new Start(id, started, trigger);
            String whole = keptWhole;
            if (whole != null && !whole.equals(id)) {
                keptWhole = null;
                Logger.printDebug(() -> "Skip silent parts: back on, another video started");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "player start", failure);
        }
    }

    /** Whether a menu may get the row: the switch on and a video started. Never throws. */
    public static boolean offersRow() {
        try {
            return last != null && on();
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "menu row", failure);
            return false;
        }
    }

    /**
     * The video a menu's row is for: [videoId], the menu's own, or the video started last when the
     * menu names none. Null, and no row, while the switch is off or paused, before the settings
     * are ready, or before any video started. Never throws.
     */
    @Nullable
    public static String rowFor(@Nullable String videoId) {
        try {
            String playing = playing();
            if (!on() || playing == null) return null;
            String target = videoId == null || videoId.isEmpty() ? playing : videoId;
            HookStatus.counted(FAMILY, ROW_ADDED);
            return target;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "menu row", failure);
            return null;
        }
    }

    /** The row's title for [target]: what its silent parts do now. */
    public static String rowTitle(String target) {
        return target.equals(keptWhole)
                ? L10n.t("Skip silent parts: off for this video")
                : L10n.t("Skip silent parts: on");
    }

    /**
     * A tap on the row for [target]: its silent parts are kept, or skipped again, and the playing
     * video, when it's [target], seeks to where it is so its sound takes it now. A toast says which.
     * Never throws: it runs inside Facebook's menu dispatch.
     */
    public static void flip(@Nullable Context context, String target) {
        try {
            if (!on()) return;
            boolean whole = !target.equals(keptWhole);
            keptWhole = whole ? target : null;
            boolean now = askAgain(target);
            Logger.printDebug(() -> "Skip silent parts: " + (whole ? "kept the silent parts" : "skipping again")
                    + (now ? ", heard now" : ", from the next seek or start"));
            Utils.showToastShort(whole ? L10n.t(context, "Silent parts play in this video")
                    : L10n.t(context, "Skipping silent parts again"));
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "menu row tap", failure);
        }
    }

    /**
     * Seeks the player started last to where it is when it plays [target], so its sinks restart
     * their sound and ask again. False when it plays another video, it's gone, or the seek or the
     * position isn't patched.
     */
    static boolean askAgain(String target) {
        Start start = last;
        Object held = start == null ? null : start.player.get();
        if (held == null || !target.equals(start.videoId)) return false;
        Object trigger = ResumePlayback.seekTrigger(start.trigger);
        if (trigger == null) return false;
        int at = ResumePlayback.access.position(held);
        if (at == ResumePlayback.NOT_PATCHED_TIME || at < 0) return false;
        return ResumePlayback.access.seek(held, trigger, at);
    }

    /** Forgets the playing video and any row's pick. */
    static void forget() {
        last = null;
        keptWhole = null;
        healthLeftOut = false;
    }
}
