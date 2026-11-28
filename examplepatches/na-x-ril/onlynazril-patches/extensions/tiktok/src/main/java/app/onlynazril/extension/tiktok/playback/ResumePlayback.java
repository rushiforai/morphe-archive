package app.onlynazril.extension.tiktok.playback;

import android.content.Context;

import java.util.Iterator;
import java.util.LinkedHashSet;

import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.internal.Reflect;
import app.onlynazril.extension.tiktok.settings.ResumePlaybackSettings;

/**
 * Lets TikTok's own progress-continue hand a video back at the position it stored.
 * <p>
 * The app keeps one position per item and only hands it back when two of its own gates agree: the
 * experiment's {@code enable} flag and a feed event allow list. The patch forces both open while
 * the switch is on, so the position comes from the app's own store and the player applies it
 * itself: no seek, no frame at zero, nothing to time.
 * <p>
 * The app would also hand back the last second of a video that already finished. That is what the
 * completed set prevents. A progress tick marks an item that ended, sat inside the end threshold,
 * or never passed the start threshold; the resume gate refuses those. A later tick outside the
 * thresholds clears the mark, so a video rewatched past the start resumes normally again.
 */
public final class ResumePlayback {
    /** The app's list is a ring, so the oldest mark may fall out once a newer item is refused. */
    private static final int MAX_COMPLETED = 32;

    /** Newest last; re-marking an item moves it to the young end. */
    private static final LinkedHashSet<String> COMPLETED = new LinkedHashSet<>();

    /** The item whose play request is being built, read by the continue gate and the resume gate. */
    private static volatile String requestAid;

    private static int allowed;
    private static int skipped;
    private static String last = "no resume request yet";

    private ResumePlayback() {}

    /** Whether TikTok's own progress-continue may hand a position back. */
    public static boolean shouldEnableContinue() {
        return ResumePlaybackSettings.isEnabled();
    }

    /** The item whose play request is being built, remembered so the gate can refuse a finished one. */
    public static synchronized void onResumeRequest(Object aweme) {
        requestAid = aweme == null ? null : Reflect.string(aweme, "getAid", "aid");
    }

    /**
     * The native resume gate. With the switch on, every feed may use the position TikTok stored;
     * a video that reached its end stays out until a tick outside the thresholds clears it.
     */
    public static synchronized boolean allowResumeInThisFeed(boolean appAllows) {
        if (!ResumePlaybackSettings.isEnabled()) return appAllows;

        String aid = requestAid;
        boolean finished = aid != null && COMPLETED.contains(aid);
        boolean allow = !finished;
        if (allow) {
            allowed++;
        } else {
            skipped++;
        }
        last = (aid == null ? "current item" : aid) + (allow ? " resumes" : " starts over");
        Debug.print("resume: " + last + " app=" + appAllows);
        return allow;
    }

    /**
     * Marks an item that must not resume: it reached the end, fell inside the end threshold, or
     * has not passed the start threshold yet. A later tick outside those bounds clears the mark.
     */
    public static synchronized void onProgress(
            Object controller, String sourceId, long positionMs, long durationMs) {
        Context ctx = ResumePlaybackSettings.appContext();
        if (!ResumePlaybackSettings.isEnabled(ctx)) return;
        if (durationMs <= 0 || positionMs < 0) return;

        String aid = aid(controller, sourceId);
        if (aid == null) return;

        long start = ResumePlaybackSettings.startSeconds(ctx) * 1000L;
        long end = ResumePlaybackSettings.endSeconds(ctx) * 1000L;
        boolean skip = positionMs >= durationMs
                || positionMs < start
                || durationMs - positionMs < end;
        if (skip) {
            markCompleted(aid);
        } else {
            COMPLETED.remove(aid);
        }
    }

    /** The video finished normally; the app must not hand back its last second. */
    public static synchronized void onCompleted(Object controller, String sourceId) {
        Context ctx = ResumePlaybackSettings.appContext();
        if (!ResumePlaybackSettings.isEnabled(ctx)) return;

        String aid = aid(controller, sourceId);
        if (aid == null) return;
        markCompleted(aid);
    }

    private static void markCompleted(String aid) {
        COMPLETED.remove(aid);
        COMPLETED.add(aid);
        while (COMPLETED.size() > MAX_COMPLETED) {
            Iterator<String> eldest = COMPLETED.iterator();
            if (!eldest.hasNext()) return;
            eldest.next();
            eldest.remove();
        }
    }

    private static String aid(Object controller, String sourceId) {
        // The callback's source id is the item the player prepared; the controller field is only a
        // fallback because it can still name the previous cell on a preloaded one.
        if (sourceId != null && !sourceId.isEmpty()) return sourceId;
        Object value = Reflect.readField(controller, "mCurrentAid");
        return value instanceof String && !((String) value).isEmpty() ? (String) value : null;
    }

    /** The screen's one line: what the gates have answered this run. */
    public static synchronized String summary() {
        return allowed + " resumed, " + skipped + " from the start, "
                + COMPLETED.size() + " finished \u00b7 " + last;
    }
}
