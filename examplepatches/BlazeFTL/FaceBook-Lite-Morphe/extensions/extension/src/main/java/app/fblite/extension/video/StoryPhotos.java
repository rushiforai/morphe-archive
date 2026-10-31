package app.fblite.extension.video;

import android.app.Activity;
import android.content.res.Resources;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.fblite.extension.settings.MorpheLog;

/**
 * Finds the photo of a story. A story photo is not a video, so the video scan never sees it. When the window
 * holds no video and no big list (a story fills the window, the feed and Reels are lists), the large views are
 * searched by value for picture addresses on Facebook's CDN, and the biggest one wins. Facebook Lite 530.0.0.8.106
 * is not known to keep it in a fixed place, so this is a search, and with Debug logging on it writes down every
 * candidate it saw and every large view, to settle where the address lives.
 */
final class StoryPhotos {
    private static final long INTERVAL_MS = 1200;
    private static final Pattern SIZE = Pattern.compile("[ps](\\d{2,4})x(\\d{2,4})");
    /** A story photo fills the screen; this keeps avatars and thumbnails out. */
    private static final int MIN_AREA = 600 * 1000;
    private static long lastRun;
    private static Photo last;
    private static String lastLogged = "";

    private StoryPhotos() {
    }

    static final class Photo {
        final View anchor;
        final String url;

        Photo(View anchor, String url) {
            this.anchor = anchor;
            this.url = url;
        }
    }

    /** The photo on screen, or null. Searches at most every 1.2 seconds and repeats the last answer in between. */
    static Photo find(Activity activity) {
        long now = SystemClock.uptimeMillis();
        if (now - lastRun < INTERVAL_MS) return last != null && last.anchor.isShown() ? last : null;
        lastRun = now;
        last = null;
        try {
            Resources r = activity.getResources();
            int screenWidth = r.getDisplayMetrics().widthPixels;
            int screenHeight = r.getDisplayMetrics().heightPixels;
            List<View> large = new ArrayList<>();
            boolean[] blocked = {false};
            walk(activity.getWindow().getDecorView(), screenWidth, screenHeight, large, blocked);
            if (blocked[0]) return null;

            String best = null;
            View bestView = null;
            long bestScore = -1;
            StringBuilder seen = new StringBuilder();
            for (View view : large) {
                ObjectScan scan = ObjectScan.run(new Object[] {view});
                for (ObjectScan.Hit hit : scan.urls) {
                    long score = score(hit.text);
                    if (score < 0) continue;
                    seen.append("  ").append(view.getClass().getName()).append(' ').append(hit.path).append(' ').append(MorpheLog.url(hit.text))
                            .append(" score=").append(score).append('\n');
                    if (score > bestScore) {
                        bestScore = score;
                        best = hit.text;
                        bestView = view;
                    }
                }
            }
            if (MorpheLog.enabled()) {
                StringBuilder views = new StringBuilder();
                for (View v : large) views.append(v.getClass().getName()).append(' ').append(v.getWidth()).append('x').append(v.getHeight()).append("; ");
                String key = views + "|" + seen;
                if (!key.equals(lastLogged)) {
                    lastLogged = key;
                    MorpheLog.log("story", "No video and no big list. Large views: " + views + (best == null ? " no picture address found" : "\n" + seen
                            + " picked " + MorpheLog.url(best)));
                }
            }
            if (best != null) last = new Photo(bestView, best);
        } catch (Throwable t) {
            VideoFeatures.log("Story photo search failed", t);
        }
        return last;
    }

    private static void walk(View view, int screenWidth, int screenHeight, List<View> large, boolean[] blocked) {
        if (view.getVisibility() != View.VISIBLE || blocked[0]) return;
        if (FeedItems.isPager(view)) {
            // A list the size of a screen (feed, Reels, Marketplace): not a story.
            if (view.getHeight() >= screenHeight * 0.3f) blocked[0] = true;
            return;
        }
        Class<?> video = VideoFeatures.videoViewClass();
        if (video != null && video.isInstance(view)) {
            // The video button covers this.
            if (view.getHeight() >= screenHeight * 0.3f) blocked[0] = true;
            return;
        }
        String name = view.getClass().getName();
        boolean container = name.startsWith("android.widget.LinearLayout") || name.startsWith("android.widget.FrameLayout")
                || name.startsWith("com.android.internal.") || name.equals("android.view.View");
        if (!container && view.getWidth() >= screenWidth * 0.9f && view.getHeight() >= screenHeight * 0.5f) large.add(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) walk(group.getChildAt(i), screenWidth, screenHeight, large, blocked);
        }
    }

    /** Larger is better; -1 for what is not a picture on Facebook's CDN. A picture with no size limit is the original and wins. */
    static long score(String url) {
        if (!(url.contains("fbcdn") || url.contains("scontent") || url.contains("fbsbx"))) return -1;
        if (url.contains(".mp4") || url.contains(".m4s")) return -1;
        String lower = url.toLowerCase(java.util.Locale.ROOT);
        if (!(lower.contains(".jpg") || lower.contains(".jpeg") || lower.contains(".png") || lower.contains(".webp"))) return -1;
        Matcher m = SIZE.matcher(url);
        long area = Long.MAX_VALUE / 2;
        while (m.find()) {
            long a = Long.parseLong(m.group(1)) * Long.parseLong(m.group(2));
            if (a < area) area = a;
        }
        return area < MIN_AREA ? -1 : area;
    }
}
