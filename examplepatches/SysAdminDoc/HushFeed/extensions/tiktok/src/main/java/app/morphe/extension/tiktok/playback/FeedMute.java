/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.playback;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.blockauthor.Reflect;
import app.morphe.extension.tiktok.feedfilter.LiveFilter;
import app.morphe.extension.tiktok.settings.L10n;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.wellbeing.SessionPlaybackHold;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Mute feed videos: the feed plays silent until the reader turns the sound back on, without
 * touching the phone's volume, and other apps keep the audio while it is on.
 *
 * <p>A one-off {@code setVolume(0, 0)} doesn't stick, since every new video sets its own volume as
 * it prepares. What sticks is the feed player engine's own mute flag: TikTok never sets it on
 * these engines, and a native player created later is handed the stored flag. A new video can
 * come on a new engine, though, so the flag is set each time an engine starts playing a feed
 * video, at the top of its {@code play()}.
 *
 * <p>DMs, stories and LIVE replays play on the same engines. What tells a feed video apart is the
 * PlayerController that asked for it: this hears each controller play first, notes whether its
 * host is the feed activity and whether the video is a story or LIVE, and the engine's source id
 * (the video's id) is looked up in those notes when it plays. A video no feed controller asked
 * for, like one in a DM chat, has no note and keeps its sound.
 *
 * <p>TikTok takes the audio focus twice for a feed video: a lasting grant per player session and
 * a transient one each time a page resumes. While muted with a feed video in front both requests
 * are turned down, and the ones already held are given up when the mute is switched on.
 */
public final class FeedMute {
    private static final String HOOK_FAMILY = "Feed mute";
    /** Controller plays remembered, newest last; the feed keeps a few videos prepared ahead. */
    private static final int MAX_PLAYS = 64;

    /** Whether each video a PlayerController asked to play was a feed video, by aweme id. */
    private static final Map<String, Boolean> PLAYS = new LinkedHashMap<String, Boolean>(16, 0.75f, true) {
        @Override protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
            return size() > MAX_PLAYS;
        }
    };
    /** Engines that played a feed video, so a mute switched on mid-video reaches them. */
    private static final WeakHashMap<Object, Boolean> FEED_ENGINES = new WeakHashMap<>();
    /** Engines this muted, with the mute TikTok had on them before. */
    private static final WeakHashMap<Object, Boolean> MUTED = new WeakHashMap<>();
    /** Focus helpers seen asking for focus for a feed video. */
    private static final WeakHashMap<Object, Boolean> SESSION_HELPERS = new WeakHashMap<>();
    private static final WeakHashMap<Object, Boolean> PAGE_HELPERS = new WeakHashMap<>();
    private static volatile WeakReference<Object> lastSessionHelper = new WeakReference<>(null);
    private static volatile WeakReference<Object> lastPageHelper = new WeakReference<>(null);

    /** The feed's activity is the one in front. Main thread writes, any thread reads. */
    private static volatile boolean feedInFront;
    /** The last video a controller asked to play was a feed video. */
    private static volatile boolean lastPlayFeed;
    private static volatile Class<?> feedActivity;
    private static WeakReference<Application> followed = new WeakReference<>(null);

    private FeedMute() {
    }

    /** From the feed activity's onCreate, with the other activity hooks. */
    public static void install(Activity activity) {
        if (activity == null) return;
        feedActivity = activity.getClass();
        feedInFront = true;
        Application application = activity.getApplication();
        if (application == null || followed.get() == application) return;
        followed = new WeakReference<>(application);
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityResumed(Activity resumed) {
                if (resumed.getClass() == feedActivity) feedInFront = true;
            }

            @Override public void onActivityPaused(Activity paused) {
                if (paused.getClass() == feedActivity) feedInFront = false;
            }

            @Override public void onActivityCreated(Activity created, Bundle state) { }
            @Override public void onActivityStarted(Activity started) { }
            @Override public void onActivityStopped(Activity stopped) { }
            @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
            @Override public void onActivityDestroyed(Activity destroyed) { }
        });
    }

    public static boolean isMuted() {
        return SettingsStatus.feedMuteEnabled && Settings.FEED_MUTED.get();
    }

    /** The feed's button and the settings row. Main thread. */
    public static void setMuted(boolean muted) {
        if (!Settings.FEED_MUTED.save(muted)) {
            Utils.showToastLong(L10n.t("This change couldn't be saved. Try again."));
            return;
        }
        refresh();
    }

    /**
     * Brings the feed's engines and audio focus in line with the setting: on, the engines that
     * played feed videos go silent and the focus TikTok holds for them is given up; off, the
     * engines this silenced get TikTok's own state back and, with a feed video playing, the
     * focus it last held back is asked for again. Main thread.
     */
    public static void refresh() {
        try {
            boolean muted = isMuted();
            List<Object> engines = keys(muted ? FEED_ENGINES : MUTED);
            for (Object engine : engines) apply(engine);
            if (!feedInFront || !lastPlayFeed) return;
            Context context = Utils.getContext();
            if (muted) {
                for (Object helper : keys(SESSION_HELPERS)) abandonSessionFocus(helper);
                if (context != null) for (Object helper : keys(PAGE_HELPERS)) abandonPageFocus(helper, context);
                return;
            }
            if (!Boolean.TRUE.equals(SessionPlaybackHold.currentPlaying())) return;
            Object session = lastSessionHelper.get();
            if (session != null) requestSessionFocus(session);
            Object page = lastPageHelper.get();
            if (page != null && context != null) requestPageFocus(page, context);
        } catch (Throwable failure) {
            HookStatus.threw(HOOK_FAMILY, "refresh", failure);
            Logger.printException(() -> "Could not apply Mute feed videos", failure);
        }
    }

    /** PlayerController's play, before it starts anything. Main thread. */
    public static void onControllerPlay(Object controller, Object aweme) {
        if (!SettingsStatus.feedMuteEnabled) return;
        try {
            boolean feed = isFeedPlay(controller, aweme);
            lastPlayFeed = feed;
            String id = aweme instanceof Aweme ? ((Aweme) aweme).getAid() : null;
            if (id != null && !id.isEmpty()) {
                synchronized (PLAYS) {
                    PLAYS.put(id, feed);
                }
            }
            HookStatus.bound(HOOK_FAMILY, "controller play");
        } catch (Throwable failure) {
            HookStatus.threw(HOOK_FAMILY, "controller play", failure);
        }
    }

    /** A video on the feed's own activity, not a story and not LIVE. */
    static boolean isFeedPlay(Object controller, Object aweme) {
        if (!(aweme instanceof Aweme)) return false;
        Object host = Reflect.readField(controller, "activity");
        Class<?> feed = feedActivity;
        if (host == null || feed == null || host.getClass() != feed) return false;
        Aweme item = (Aweme) aweme;
        if (item.getIsTikTokStory()) return false;
        int type = item.getAwemeType();
        if (type == STORY_TYPE || type == STORY_TYPE_SHARED) return false;
        return !new LiveFilter().getFiltered(item);
    }

    /** Story aweme types, as Ghost mode reads them. */
    private static final int STORY_TYPE = 40;
    private static final int STORY_TYPE_SHARED = 45;

    /** The top of the feed engine's play(), on its player thread. */
    public static void onEnginePlay(Object engine) {
        if (engine == null || !SettingsStatus.feedMuteEnabled) return;
        try {
            String id = engineSourceId(engine);
            Boolean feed = null;
            if (id != null) {
                synchronized (PLAYS) {
                    feed = PLAYS.get(id);
                }
            }
            boolean isFeed = feedInFront && Boolean.TRUE.equals(feed);
            if (isFeed) {
                synchronized (FEED_ENGINES) {
                    FEED_ENGINES.put(engine, Boolean.TRUE);
                }
            } else {
                synchronized (FEED_ENGINES) {
                    FEED_ENGINES.remove(engine);
                }
            }
            apply(engine);
            HookStatus.bound(HOOK_FAMILY, "engine play");
        } catch (Throwable failure) {
            HookStatus.threw(HOOK_FAMILY, "engine play", failure);
        }
    }

    /** Silences the engine, or gives back TikTok's own state on one this silenced. */
    private static void apply(Object engine) {
        synchronized (FEED_ENGINES) {
            synchronized (MUTED) {
                // A swipe and a toggle can arrive on different threads. Decide while holding
                // both maps through the native call so an older decision cannot run last.
                boolean mute = FEED_ENGINES.containsKey(engine) && isMuted();
                Boolean before = MUTED.get(engine);
                if (mute) {
                    if (before == null) {
                        before = engineIsMute(engine);
                        MUTED.put(engine, before);
                    }
                    setEngineMute(engine, true);
                } else if (before != null) {
                    setEngineMute(engine, before);
                    MUTED.remove(engine);
                }
            }
        }
    }

    /** SimAudioFocusManager's per-session request. True turns it down. Any thread. */
    public static boolean holdSessionFocus(Object helper) {
        if (helper == null || !SettingsStatus.feedMuteEnabled || !feedInFront || !lastPlayFeed) return false;
        synchronized (SESSION_HELPERS) {
            SESSION_HELPERS.put(helper, Boolean.TRUE);
            lastSessionHelper = new WeakReference<>(helper);
        }
        return holdBack("session focus held back");
    }

    /** The page helper's transient request, made on each resume. True turns it down. Any thread. */
    public static boolean holdPageFocus(Object helper) {
        if (helper == null || !SettingsStatus.feedMuteEnabled || !feedInFront || !lastPlayFeed) return false;
        synchronized (PAGE_HELPERS) {
            PAGE_HELPERS.put(helper, Boolean.TRUE);
            lastPageHelper = new WeakReference<>(helper);
        }
        return holdBack("page focus held back");
    }

    private static boolean holdBack(String what) {
        if (!Settings.FEED_MUTED.get()) return false;
        HookStatus.bound(HOOK_FAMILY, what);
        return true;
    }

    /** The daily hold waits for TikTok's focus before resuming; while muted it never comes. */
    public static boolean isHoldingFocus() {
        return feedInFront && lastPlayFeed && isMuted();
    }

    private static List<Object> keys(WeakHashMap<Object, Boolean> map) {
        synchronized (map) {
            return new ArrayList<>(map.keySet());
        }
    }

    // TikTok's player members change name with every build, so the patch writes them into the
    // bodies of these bridges. What they do without the patch is for the tests.

    /** TikTok's members as the tests stand them in. */
    interface Native {
        String sourceId(Object engine);
        boolean isMute(Object engine);
        void setMute(Object engine, boolean mute);
        void abandonSession(Object helper);
        void requestSession(Object helper);
        void abandonPage(Object helper, Context context);
        void requestPage(Object helper, Context context);
    }

    static volatile Native nativeForTests;

    static String engineSourceId(Object engine) {
        Native stand = nativeForTests;
        return stand == null ? null : stand.sourceId(engine);
    }

    static boolean engineIsMute(Object engine) {
        Native stand = nativeForTests;
        return stand != null && stand.isMute(engine);
    }

    static void setEngineMute(Object engine, boolean mute) {
        Native stand = nativeForTests;
        if (stand != null) stand.setMute(engine, mute);
    }

    static void abandonSessionFocus(Object helper) {
        Native stand = nativeForTests;
        if (stand != null) stand.abandonSession(helper);
    }

    static void requestSessionFocus(Object helper) {
        Native stand = nativeForTests;
        if (stand != null) stand.requestSession(helper);
    }

    static void abandonPageFocus(Object helper, Context context) {
        Native stand = nativeForTests;
        if (stand != null) stand.abandonPage(helper, context);
    }

    static void requestPageFocus(Object helper, Context context) {
        Native stand = nativeForTests;
        if (stand != null) stand.requestPage(helper, context);
    }

    /** Clears everything this remembers. Tests only. */
    static void resetForTests() {
        synchronized (PLAYS) {
            PLAYS.clear();
        }
        for (WeakHashMap<Object, Boolean> map : Arrays.asList(FEED_ENGINES, MUTED, SESSION_HELPERS, PAGE_HELPERS)) {
            synchronized (map) {
                map.clear();
            }
        }
        lastSessionHelper = new WeakReference<>(null);
        lastPageHelper = new WeakReference<>(null);
        feedInFront = false;
        lastPlayFeed = false;
        feedActivity = null;
        nativeForTests = null;
    }
}
