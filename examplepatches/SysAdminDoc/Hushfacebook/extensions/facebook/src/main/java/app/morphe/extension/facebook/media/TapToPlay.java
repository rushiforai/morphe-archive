/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;

import androidx.annotation.Nullable;

import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicLong;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Tap to play: videos, reels, stories and songs wait for a tap.
 *
 * <p>Nearly every Facebook surface starts its media through FbGrootPlayer's play, and the older
 * Rich Video Player through its playback controller's. The patch asks {@link #allowStart} first
 * thing in the one and {@link #allowLegacyStart} in the other, and a no makes the player return
 * before it does anything. Each start carries Facebook's EventTriggerType, an enum whose constant
 * names Facebook keeps. The name alone can't tell a tap from an automatic start: Marketplace's React
 * Native screens start with BY_USER whenever their script decides to, and a Story opened with a tap
 * or a paused note's song start with BY_AUTOPLAY. So a start goes ahead when one of these holds:
 *
 * <ul>
 *   <li>The player is armed: it made a start this gate let through, and it hasn't been paused or
 *       given a new video since. That keeps what a tap started going through Facebook's own
 *       restarts, such as a play it replays once the video is bound.</li>
 *   <li>The trigger is one only something you did sends: {@link #CONTROLS}.</li>
 *   <li>A tap ended no more than {@link #TAP_WINDOW_MS} ago ({@link TapClock}) and the trigger isn't
 *       one Facebook sends because something came into view or came back ({@link #visibilityDriven}).
 *       BY_AUTOPLAY is let through here, since the Story you tap starts with it.</li>
 *   <li>A link another app handed Facebook opened a screen no more than {@link #LINK_WINDOW_MS}
 *       ago, the trigger is BY_USER, and nothing else has let a start through or moved on since
 *       ({@link #activityCreated}). Facebook's video player opens a shared video from a browser
 *       with BY_USER and no tap, and it has no play button of its own to tap.</li>
 * </ul>
 *
 * <p>Every other start is held, and the player stays where it was, showing its first frame or its
 * cover. Facebook's own Autoplay setting reads Off while the switch is on ({@link #autoplaySetting}),
 * so the surfaces that ask it draw their play button, and the Reels controls show theirs up front
 * ({@link #showReelPlayButton}). Off, paused, before the settings are ready, or
 * when anything here throws, every start goes ahead and the setting reads what you chose, as it
 * would unpatched.
 */
public final class TapToPlay {
    /** How long after a tap ends a start still counts as that tap's. */
    static final long TAP_WINDOW_MS = 1000;

    /**
     * How long a start keeps its player armed through a new bind. FbGrootPlayer can bind its video
     * inside the very play the gate let through, or replay a bind it put off, and neither should
     * disarm that play. A non-tap gesture expires this grace before another video can bind.
     */
    static final long BIND_GRACE_MS = 2000;

    /**
     * How long after a link from another app opens a Facebook screen the first BY_USER start still
     * counts as the one that link asked for. A cold start and a slow network both fit.
     */
    static final long LINK_WINDOW_MS = 15_000;

    /** The trigger Facebook's player gets when it opens a video a link asked for. */
    private static final String BY_USER = "BY_USER";

    /** No link waiting: none came, or a BY_USER start took it. */
    private static final long NO_LINK = Long.MIN_VALUE;

    /**
     * Triggers that go ahead with no tap, because only something you did sends them: the media
     * controls in the notification and on the lock screen, the seek bar, whose drag moves too far to
     * be a tap, and BY_MUSIC_PLAYER, which only the music picker you open while making a post or a
     * story sends, to loop the song you picked (no other start in 580 or 577 carries it).
     */
    static final Set<String> CONTROLS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "BY_MEDIA_SESSION_CONTROLS", "BY_SEEKBAR_CONTROLLER", "BY_MUSIC_PLAYER")));

    /** How many decisions get a line of their own before the log sums them up. */
    static final int LOGGED_ONE_BY_ONE = 40;

    /** How many decisions each summary line covers after that. */
    static final int SUMMED_UP_BY = 50;

    private static final String SOURCE = "TapToPlay";
    private static final String OFF = "OFF";

    private static final ArmedPlayers ARMED = new ArmedPlayers();
    /** When a link from another app last opened a Facebook screen, on the uptime clock. */
    private static final AtomicLong LINK_OPENED_AT = new AtomicLong(NO_LINK);
    private static final Object LOG_LOCK = new Object();
    private static int decisions;
    private static int allowedSinceSummary;
    private static int heldSinceSummary;
    private static boolean reelButtonLogged;
    private static final Set<String> SETTINGS_LOGGED = new HashSet<>();
    private static final Map<Class<?>, Object> OFF_BY_TYPE = new HashMap<>();

    /** Makes the next decision throw, once. For tests. */
    @Nullable
    static volatile RuntimeException failNext;

    private TapToPlay() { }

    /** The hook, first thing in FbGrootPlayer's play. False, and the play returns at once. */
    public static boolean allowStart(Object player, Object trigger) {
        return allow(player, trigger, "player start", "");
    }

    /** The hook, first thing in the older Rich Video Player's playback controller play. */
    public static boolean allowLegacyStart(Object player, Object trigger) {
        return allow(player, trigger, "older player start", " (older player)");
    }

    /** The hook, first thing in each player's pause. A paused player waits for a tap again. */
    public static void paused(Object player) {
        try {
            HookStatus.invoked(FamilyNames.TAP_TO_PLAY);
            HookStatus.bound(FamilyNames.TAP_TO_PLAY, "player pause");
            ARMED.disarm(player);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAP_TO_PLAY, "player pause", failure);
        }
    }

    /** The hook, first thing where FbGrootPlayer binds a video. A new video waits for a tap. */
    public static void rebound(Object player) {
        try {
            HookStatus.invoked(FamilyNames.TAP_TO_PLAY);
            HookStatus.bound(FamilyNames.TAP_TO_PLAY, "player rebind");
            ARMED.disarmUnlessArmedSince(player, SystemClock.uptimeMillis() - BIND_GRACE_MS);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAP_TO_PLAY, "player rebind", failure);
        }
    }

    /**
     * Hushfacebook's activity watcher, as each Facebook screen is created. A screen made fresh, not
     * brought back, for a link (a VIEW intent with a link in it) that some app other than Facebook
     * sent records that link, so the first BY_USER start within {@link #LINK_WINDOW_MS} that would
     * otherwise be held plays. One link plays one start, and only before anything else happens: a
     * start a tap or a control let through, or a swipe, drops it, so a link the opened video didn't
     * need can't reach the next one.
     */
    public static void activityCreated(Activity activity, @Nullable Bundle state) {
        try {
            if (state != null || !on()) return;
            Intent intent = activity.getIntent();
            if (intent == null || !Intent.ACTION_VIEW.equals(intent.getAction()) || intent.getData() == null) return;
            Uri referrer = activity.getReferrer();
            if (referrer != null && activity.getPackageName().equals(referrer.getHost())) return;
            linkOpened(SystemClock.uptimeMillis());
            // The referrer can be a website's address, so the log leaves it out.
            String screen = activity.getClass().getSimpleName();
            Logger.diagnosticDebug(DiagnosticCategory.OTHER, SOURCE, () -> "Tap to play: a link from another app opened "
                    + screen + ", so the first BY_USER start in the next " + LINK_WINDOW_MS / 1000 + " s plays");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAP_TO_PLAY, "link opened", failure);
        }
    }

    /** Records a link from another app opening a screen at [now]. */
    static void linkOpened(long now) {
        LINK_OPENED_AT.set(now);
    }

    /**
     * Whether a link is waiting at [now] for a BY_USER start. Taking it leaves none, and so does a
     * link past its window. A start whose clock was read before the link came isn't the link's.
     */
    private static boolean takeLink(long now) {
        long at = LINK_OPENED_AT.get();
        if (at == NO_LINK || now < at || !LINK_OPENED_AT.compareAndSet(at, NO_LINK)) return false;
        return now - at <= LINK_WINDOW_MS;
    }

    /** Forgets a waiting link: something else started, or the person moved on. */
    private static void dropLink() {
        LINK_OPENED_AT.set(NO_LINK);
    }

    /**
     * A swipe keeps the current video armed, but the next bind must wait for its own start, and a
     * link still waiting is dropped: the person moved on from what it opened.
     */
    static void nonTapGesture() {
        ARMED.expireBindGrace();
        dropLink();
    }

    /**
     * The hook at each return of Facebook's Autoplay setting reader (VideoAutoPlaySettingsChecker).
     * While the switch is on it answers Off, the constant of the same enum named OFF, so the
     * surfaces that ask Facebook's setting draw their own play button. The stored setting is never
     * written, so turning the switch off shows what you chose again.
     */
    public static Object autoplaySetting(Object answer) {
        try {
            HookStatus.invoked(FamilyNames.TAP_TO_PLAY);
            if (!(answer instanceof Enum) || !on()) return answer;
            Enum<?> chosen = (Enum<?>) answer;
            Object off = offConstant(chosen.getDeclaringClass());
            HookStatus.bound(FamilyNames.TAP_TO_PLAY, "Autoplay setting");
            logSettingOnce(chosen.name());
            return off;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAP_TO_PLAY, "Autoplay setting", failure);
            return answer;
        }
    }

    /**
     * The hook, first thing in the Reels controls' check of whether a reel starts with autoplay off,
     * which decides whether the reel shows its play button before anything plays. While the switch
     * is on it answers yes, so a reel the gate holds shows that button and one tap on it plays the
     * reel (the button's tap starts the player with BY_USER). [excluded] is the flag Facebook hands
     * the check first, which makes Facebook's own answer no whatever the setting (an ad break's
     * video), and it stays no. False lets Facebook's own check run.
     */
    public static boolean showReelPlayButton(boolean excluded) {
        try {
            HookStatus.invoked(FamilyNames.TAP_TO_PLAY);
            RuntimeException failure = failNext;
            if (failure != null) {
                failNext = null;
                throw failure;
            }
            if (excluded || !on()) return false;
            HookStatus.bound(FamilyNames.TAP_TO_PLAY, "Reels play button");
            logReelButtonOnce();
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAP_TO_PLAY, "Reels play button", failure);
            return false;
        }
    }

    /**
     * Runs only in the Reels PLAYING event branch. Facebook normally clears the initial overlay
     * only for certain viewer configurations. Our forced autoplay-off state needs that same
     * cleanup for every viewer once playback actually starts. Other control states stay native.
     */
    public static boolean clearReelPlayButton(boolean original, Object control) {
        try {
            HookStatus.invoked(FamilyNames.TAP_TO_PLAY);
            if (original || !on() || !(control instanceof Enum)) return original;
            HookStatus.bound(FamilyNames.TAP_TO_PLAY, "Reels playback controls");
            return "AUTOPLAY_OFF_INIT_STATE".equals(((Enum<?>) control).name());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAP_TO_PLAY, "Reels playback controls", failure);
            return original;
        }
    }

    private static void logReelButtonOnce() {
        synchronized (LOG_LOCK) {
            if (reelButtonLogged) return;
            reelButtonLogged = true;
        }
        Logger.diagnosticDebug(DiagnosticCategory.OTHER, SOURCE,
                () -> "Tap to play: Reels show their play button until a tap");
    }

    private static boolean allow(Object player, Object trigger, String hook, String path) {
        try {
            HookStatus.invoked(FamilyNames.TAP_TO_PLAY);
            RuntimeException failure = failNext;
            if (failure != null) {
                failNext = null;
                throw failure;
            }
            if (!on()) return true;
            HookStatus.bound(FamilyNames.TAP_TO_PLAY, hook);
            return decide(player, trigger instanceof Enum ? ((Enum<?>) trigger).name() : null,
                    SystemClock.uptimeMillis(), path);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAP_TO_PLAY, hook, failure);
            return true;
        }
    }

    private static boolean on() {
        return Utils.settingsReady() && Settings.TAP_TO_PLAY.get();
    }

    /** The rule, with the clock passed in. Arms the player when it lets the start through. */
    static boolean decide(Object player, @Nullable String trigger, long now, String path) {
        boolean armed = ARMED.armed(player);
        long sinceTap = TapClock.msSinceTap(now);
        boolean control = trigger != null && CONTROLS.contains(trigger);
        boolean tapped = sinceTap >= 0 && sinceTap <= TAP_WINDOW_MS && !visibilityDriven(trigger);
        // A tap or a control is the person at work, so a link waiting is no longer what started
        // this. An armed player's own restart leaves it for the player the link opened.
        if (tapped || control) dropLink();
        boolean linked = !armed && !control && !tapped && BY_USER.equals(trigger) && takeLink(now);
        boolean allowed = armed || control || linked || tapped;
        if (allowed && (!armed || control)) ARMED.arm(player, now);
        logDecision(allowed, trigger, sinceTap, armed, linked ? path + " (a link asked for it)" : path);
        return allowed;
    }

    /**
     * Whether Facebook sends [trigger] because something came into view or came back, never
     * because of a tap: BY_SHORT_FORM_VIDEO_FULLY_VISIBLE, which starts every reel you land on, and
     * the other _VISIBLE ones; BY_SHORT_FORM_VIDEO_ONRESUME, BY_SURFACE_ON_RESUME and the other
     * resume ones; BY_FRAGMENT_RESUME; and BY_FLYOUT, which Facebook's onResume and visibility hint
     * paths pass. A tap on the Reels tab, say, must not start the reel it lands on.
     */
    static boolean visibilityDriven(@Nullable String trigger) {
        if (trigger == null) return false;
        return trigger.endsWith("_VISIBLE") || trigger.endsWith("_ONRESUME") || trigger.endsWith("_ON_RESUME")
                || trigger.equals("BY_FRAGMENT_RESUME") || trigger.equals("BY_FLYOUT");
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static Object offConstant(Class<?> type) {
        synchronized (OFF_BY_TYPE) {
            Object off = OFF_BY_TYPE.get(type);
            if (off == null) {
                off = Enum.valueOf((Class) type, OFF);
                OFF_BY_TYPE.put(type, off);
            }
            return off;
        }
    }

    private static void logSettingOnce(String chosen) {
        synchronized (LOG_LOCK) {
            if (!SETTINGS_LOGGED.add(chosen)) return;
        }
        Logger.diagnosticDebug(DiagnosticCategory.OTHER, SOURCE,
                () -> "Tap to play: Facebook's Autoplay setting " + chosen + " reads " + OFF);
    }

    private static void logDecision(boolean allowed, @Nullable String trigger, long sinceTap, boolean armed, String path) {
        String line;
        synchronized (LOG_LOCK) {
            decisions++;
            if (decisions <= LOGGED_ONE_BY_ONE) {
                line = "Tap to play: " + (allowed ? "allowed " : "held ") + (trigger == null ? "no trigger" : trigger)
                        + " " + (sinceTap < 0 ? "no tap" : sinceTap + " ms") + " armed " + (armed ? "yes" : "no") + path;
            } else {
                if (allowed) allowedSinceSummary++;
                else heldSinceSummary++;
                if (allowedSinceSummary + heldSinceSummary < SUMMED_UP_BY) return;
                line = "Tap to play: " + SUMMED_UP_BY + " more starts, " + allowedSinceSummary + " allowed, "
                        + heldSinceSummary + " held";
                allowedSinceSummary = 0;
                heldSinceSummary = 0;
            }
        }
        final String logged = line;
        Logger.diagnosticDebug(DiagnosticCategory.OTHER, SOURCE, () -> logged);
    }

    /** Forgets every armed player and the log's counts. For tests. */
    static void forget() {
        ARMED.clear();
        LINK_OPENED_AT.set(NO_LINK);
        synchronized (LOG_LOCK) {
            decisions = 0;
            allowedSinceSummary = 0;
            heldSinceSummary = 0;
            SETTINGS_LOGGED.clear();
            reelButtonLogged = false;
        }
        failNext = null;
    }

    static boolean armed(Object player) {
        return ARMED.armed(player);
    }

    static int armedCount() {
        return ARMED.size();
    }

    /**
     * The players a start was let through on, by identity and weakly: a player Facebook drops is
     * forgotten with it, and one whose equals says it's another player is still itself.
     */
    static final class ArmedPlayers {
        private final Map<Key, Long> armedAt = new HashMap<>();
        private final ReferenceQueue<Object> gone = new ReferenceQueue<>();

        synchronized void arm(Object player, long now) {
            purge();
            if (player != null) armedAt.put(new Key(player, gone), now);
        }

        synchronized boolean armed(Object player) {
            purge();
            return player != null && armedAt.containsKey(new Key(player, null));
        }

        synchronized void disarm(Object player) {
            purge();
            if (player != null) armedAt.remove(new Key(player, null));
        }

        synchronized void expireBindGrace() {
            purge();
            armedAt.replaceAll((player, at) -> Long.MIN_VALUE);
        }

        /** Disarms [player] unless its start came at or after [since]. */
        synchronized void disarmUnlessArmedSince(Object player, long since) {
            purge();
            if (player == null) return;
            Key key = new Key(player, null);
            Long at = armedAt.get(key);
            if (at != null && at < since) armedAt.remove(key);
        }

        synchronized int size() {
            purge();
            return armedAt.size();
        }

        synchronized void clear() {
            armedAt.clear();
            purge();
        }

        private void purge() {
            Reference<?> cleared;
            while ((cleared = gone.poll()) != null) {
                armedAt.remove(cleared);
            }
        }

        private static final class Key extends WeakReference<Object> {
            private final int hash;

            Key(Object player, @Nullable ReferenceQueue<Object> queue) {
                super(player, queue);
                hash = System.identityHashCode(player);
            }

            @Override
            public int hashCode() {
                return hash;
            }

            @Override
            public boolean equals(Object other) {
                if (other == this) return true;
                if (!(other instanceof Key)) return false;
                Object mine = get();
                return mine != null && mine == ((Key) other).get();
            }
        }
    }
}
