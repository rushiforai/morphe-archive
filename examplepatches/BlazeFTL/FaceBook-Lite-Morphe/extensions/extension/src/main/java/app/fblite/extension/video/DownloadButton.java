package app.fblite.extension.video;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Build;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.OvershootInterpolator;
import android.widget.FrameLayout;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

import app.fblite.extension.settings.MorpheLog;
import app.fblite.extension.settings.MorpheSettings;

/**
 * A floating button over the video that is playing, which saves it to Movies/Facebook Lite, see
 * {@link VideoDownloader}. A light, round, softly shadowed button with a thin arrow; it spins a ring while
 * a joined HD download is running. On Reels it sits in the column of Like, Comment and Share, one slot above Like.
 */
final class DownloadButton {
    /**
     * Reels layout, measured on a 702 px wide screenshot of the video area and scaled by width: the action
     * column is centered 35 px from the right edge, anchored to the bottom, and the Like icon starts 320 px
     * above the bottom. The button's center is one slot (about 96 px) above the Like icon.
     */
    private static final float REFERENCE_WIDTH = 702f;
    private static final float COLUMN_CENTER_FROM_RIGHT = 35f;
    private static final float BUTTON_CENTER_FROM_BOTTOM = 392f;
    private static final float REEL_BUTTON_SIZE = 50f;
    /** A video this much taller than wide is a Reel (feed videos are at most 4:5). */
    private static final float REEL_ASPECT = 1.5f;
    private static final float REEL_BUTTON_DP = 37.5f;
    private static final float FALLBACK_LIKE_ABOVE_VIDEO_BOTTOM_DP = 256f;
    private static final float FALLBACK_PITCH_DP = 72f;
    private static final float FALLBACK_ICON_CENTER_DP = 24f;
    /** One unit of the glyph grid; the glyph is 17 x 16 units, about 30 x 28 dp, like the app's own Like icon. */
    private static final float GLYPH_UNIT_DP = 1.75f;
    private static final float FALLBACK_CENTER_FROM_EDGE_DP = 26.3f;
    private static final long LIKE_RETRY_MS = 400;
    /** The column is looked up again this often even when the view found earlier still looks right (see {@link #likeOf}). */
    private static final long LIKE_REFRESH_MS = 600;
    private static final int LIKE_SCAN_NODES = 1500;
    private static final int[] LIKE_LOC = new int[2];
    private static WeakReference<View> likeVideo = new WeakReference<>(null);
    private static WeakReference<View> likeView = new WeakReference<>(null);
    private static long likeSearchedAt;
    /** Size of the Like group and the distance from its top to the next group's top, at the last lookup. */
    private static int likeW;
    private static int likeH;
    private static int likePitch;

    private static Icon button;
    private static boolean hiding;
    private static WeakReference<Activity> owner = new WeakReference<>(null);
    private static WeakReference<View> target = new WeakReference<>(null);
    private static final Rect RECT = new Rect();
    private static final int[] LOCATION = new int[2];
    private static boolean following;
    /** Where the button's center is in the window, set by {@link #place}. */
    private static float centerX;
    private static float centerY;
    private static long coverCheckedAt;
    private static boolean covered;
    private static final long COVER_CHECK_MS = 120;
    private static final Overlay.Probe PROBE = new Overlay.Probe();
    /** Set while the button is for a story photo instead of a video. */
    private static String photoUrl;
    private static String photoName;

    private DownloadButton() {
    }

    static void show(Activity activity, View video) {
        if (owner.get() != activity || button == null) create(activity);
        photoUrl = null;
        target = new WeakReference<>(video);
        if (!mostlyVisible(video)) {
            hide();
            return;
        }
        place(activity, video);
        if (coveredNow(video)) {
            hide();
            return;
        }
        reveal(button);
        button.bringToFront();
        follow();
    }

    /** Shows the button for a story photo, on the right edge like the Reels column. */
    static void showPhoto(Activity activity, View anchor, String url) {
        if (owner.get() != activity || button == null) create(activity);
        photoUrl = url;
        photoName = null;
        covered = false;
        target = new WeakReference<>(anchor);
        place(activity, anchor);
        reveal(button);
        button.bringToFront();
        follow();
    }

    /** True while at least half of the video is on screen. */
    private static boolean mostlyVisible(View video) {
        return video.getHeight() > 0 && video.getGlobalVisibleRect(RECT) && RECT.height() >= video.getHeight() * 0.5f;
    }

    /**
     * Puts the button on the video's own bounds (not on the part that is on screen, which is cut while a Reel
     * slides in) by translation, so it moves with the video frame by frame like the Like column does.
     */
    private static void place(Context context, View video) {
        video.getLocationInWindow(LOCATION);
        int width = video.getWidth();
        int height = video.getHeight();
        int size;
        int left;
        int top;
        if (photoUrl == null && isReel(video)) {
            float density = context.getResources().getDisplayMetrics().density;
            size = Math.max(dp(context, 30), Math.round(REEL_BUTTON_DP * density));
            // The button takes the slot above Like: same center line, same step as Like to Comment.
            View like = likeOf(video);
            int centerLeft;
            int centerTop;
            if (like != null) {
                like.getLocationInWindow(LIKE_LOC);
                int pitch = likePitch > 0 ? likePitch : like.getHeight() + Math.round(8 * density);
                centerLeft = LIKE_LOC[0] + like.getWidth() / 2;
                centerTop = LIKE_LOC[1] - pitch + Math.round(iconCenter(like));
            } else {
                int fromEdge = Math.round(FALLBACK_CENTER_FROM_EDGE_DP * density);
                centerLeft = rtl(context) ? LOCATION[0] + fromEdge : LOCATION[0] + width - fromEdge;
                centerTop = LOCATION[1] + height - Math.round(FALLBACK_LIKE_ABOVE_VIDEO_BOTTOM_DP * density)
                        - Math.round(FALLBACK_PITCH_DP * density) + Math.round(FALLBACK_ICON_CENTER_DP * density);
            }
            left = centerLeft - size / 2;
            top = centerTop - size / 2;
        } else if (photoUrl != null) {
            float unit = width / REFERENCE_WIDTH;
            size = Math.max(dp(context, 30), Math.round(REEL_BUTTON_SIZE * unit));
            int fromEdge = Math.round(COLUMN_CENTER_FROM_RIGHT * unit);
            // Right to left apps mirror the action column to the left edge.
            left = rtl(context) ? LOCATION[0] + fromEdge - size / 2 : LOCATION[0] + width - fromEdge - size / 2;
            top = LOCATION[1] + height - Math.round(BUTTON_CENTER_FROM_BOTTOM * unit) - size / 2;
        } else {
            size = dp(context, 40);
            int margin = dp(context, 12);
            // Right edge, a third of the way down: clear of the full screen player's controls.
            top = LOCATION[1] + Math.max(margin, Math.min(height / 3, height - size - margin));
            left = LOCATION[0] + width - size - margin;
        }
        ViewGroup.LayoutParams params = button.getLayoutParams();
        if (params.width != size || params.height != size) {
            params.width = size;
            params.height = size;
            button.setLayoutParams(params);
        }
        button.setTranslationX(left);
        button.setTranslationY(top);
        centerX = left + size / 2f;
        centerY = top + size / 2f;
    }

    private static final class Cand {
        final View view;
        final int l;
        final int t;
        final int w;
        final int h;

        Cand(View view, int l, int t, int w, int h) {
            this.view = view;
            this.l = l;
            this.t = t;
            this.w = w;
            this.h = h;
        }
    }

    /**
     * The first group of the Like, Comment, Share column. The app builds its reels from a pool of views and gives them
     * another job when it binds the next reel: the group that was Like can become a small button at the top of the
     * video. A view that is only attached and shown is therefore not trusted. It must keep the size it had at the
     * lookup and still look like a column group, and the column is looked up again every {@link #LIKE_REFRESH_MS}.
     */
    private static View likeOf(View video) {
        View cached = likeView.get();
        boolean sameVideo = likeVideo.get() == video;
        long now = SystemClock.uptimeMillis();
        boolean usable = sameVideo && cached != null && stillLike(video, cached);
        if (usable && now - likeSearchedAt < LIKE_REFRESH_MS) return cached;
        if (sameVideo && !usable && cached == null && now - likeSearchedAt < LIKE_RETRY_MS) return null;
        likeSearchedAt = now;
        likeVideo = new WeakReference<>(video);
        View found = null;
        try {
            found = findLike(video);
        } catch (Throwable t) {
            VideoFeatures.log("Like column search failed", t);
        }
        if (found == null && usable) return cached;
        if (found != cached && MorpheLog.enabled() && cached != null && sameVideo) {
            MorpheLog.log("video", "Like column changed: " + describeLike(cached) + " -> " + (found == null ? "none" : describeLike(found)));
        }
        likeView = new WeakReference<>(found);
        if (MorpheLog.enabled()) {
            if (found != null) {
                if (found != cached || !sameVideo) MorpheLog.log("video", "Like column found: " + describeLike(found) + " pitch=" + likePitch);
            } else if (!sameVideo || cached != null) {
                MorpheLog.log("video", "Like column not found, using the dp fallback");
            }
        }
        return found;
    }

    private static String describeLike(View v) {
        int[] at = new int[2];
        v.getLocationInWindow(at);
        return v.getClass().getName() + " " + v.getWidth() + "x" + v.getHeight() + "@" + at[0] + "," + at[1];
    }

    /** True when the view found earlier is still the same kind of view in the same place of the same video. */
    private static boolean stillLike(View video, View v) {
        if (!v.isAttachedToWindow() || !v.isShown() || v.getWidth() != likeW || v.getHeight() != likeH) return false;
        Context context = video.getContext();
        int[] at = new int[2];
        video.getLocationInWindow(at);
        return qualifies(v, at[0], at[1], video.getWidth(), at[1] + video.getHeight(), rtl(context),
                context.getResources().getDisplayMetrics().density);
    }

    /** Vertical center of the icon inside a column group (the tallest child; the count label is the other one). */
    private static float iconCenter(View like) {
        if (like instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) like;
            View icon = null;
            for (int i = 0; i < group.getChildCount(); i++) {
                View c = group.getChildAt(i);
                if (c.getVisibility() == View.VISIBLE && c.getHeight() > 0 && (icon == null || c.getHeight() > icon.getHeight())) icon = c;
            }
            if (icon != null) return icon.getTop() + icon.getHeight() / 2f;
        }
        return like.getHeight() * (FALLBACK_ICON_CENTER_DP / (FALLBACK_PITCH_DP - 8f));
    }

    private static View findLike(View video) {
        View pager = FeedItems.pagerOf(video);
        View scope = pager != null ? FeedItems.childOf(pager, video) : null;
        if (scope == null) scope = video.getRootView();
        Context context = video.getContext();
        float density = context.getResources().getDisplayMetrics().density;
        int[] at = new int[2];
        video.getLocationInWindow(at);
        int vLeft = at[0];
        int vTop = at[1];
        int vWidth = video.getWidth();
        int vBottom = vTop + video.getHeight();
        List<Cand> cands = new ArrayList<>();
        int[] budget = {LIKE_SCAN_NODES};
        collectColumn(scope, vLeft, vTop, vWidth, vBottom, rtl(context), density, cands, budget);
        Collections.sort(cands, new Comparator<Cand>() {
            @Override
            public int compare(Cand a, Cand b) {
                return a.t != b.t ? Integer.compare(a.t, b.t) : Integer.compare(a.l, b.l);
            }
        });
        int tol = Math.max(3, Math.round(2 * density));
        int gap = Math.round(24 * density);
        boolean[] used = new boolean[cands.size()];
        List<Cand> best = null;
        for (int i = 0; i < cands.size(); i++) {
            if (used[i]) continue;
            used[i] = true;
            List<Cand> chain = new ArrayList<>();
            Cand cur = cands.get(i);
            chain.add(cur);
            for (int j = i + 1; j < cands.size(); j++) {
                if (used[j]) continue;
                Cand next = cands.get(j);
                if (Math.abs(next.l - cur.l) > tol || Math.abs(next.w - cur.w) > tol) continue;
                int curBottom = cur.t + cur.h;
                if (next.t < curBottom - tol || next.t - curBottom > gap) continue;
                used[j] = true;
                chain.add(next);
                cur = next;
            }
            if (chain.size() >= 3 && (best == null || chain.size() > best.size())) best = chain;
        }
        if (best == null) return null;
        likeW = best.get(0).w;
        likeH = best.get(0).h;
        likePitch = best.get(1).t - best.get(0).t;
        return best.get(0).view;
    }

    /** A clickable view of the size of a column group (24 dp or wider, 28 to 110 dp tall) in the video's right quarter. */
    private static boolean qualifies(View v, int vLeft, int vTop, int vWidth, int vBottom, boolean rtl, float density) {
        if (!v.isClickable()) return false;
        int[] at = new int[2];
        v.getLocationInWindow(at);
        int w = v.getWidth();
        int h = v.getHeight();
        float cx = at[0] + w / 2f;
        boolean right = rtl ? cx <= vLeft + vWidth * 0.25f : cx >= vLeft + vWidth * 0.75f;
        return right && w >= 24 * density && w <= vWidth * 0.25f && h >= 28 * density && h <= 110 * density
                && at[1] >= vTop && at[1] < vBottom;
    }

    private static void collectColumn(View v, int vLeft, int vTop, int vWidth, int vBottom, boolean rtl, float density,
                                      List<Cand> out, int[] budget) {
        if (budget[0]-- <= 0 || v.getVisibility() != View.VISIBLE) return;
        if (v.getClass().getName().startsWith("app.fblite.extension.")) return;
        if (qualifies(v, vLeft, vTop, vWidth, vBottom, rtl, density)) {
            int[] at = new int[2];
            v.getLocationInWindow(at);
            out.add(new Cand(v, at[0], at[1], v.getWidth(), v.getHeight()));
        }
        if (!(v instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) v;
        for (int i = 0; i < group.getChildCount(); i++) {
            collectColumn(group.getChildAt(i), vLeft, vTop, vWidth, vBottom, rtl, density, out, budget);
        }
    }

    /**
     * True while a view of another layer (the comment sheet, a menu, a dim layer) is drawn over the button's spot.
     * Only for Reels and for videos in a list (the opened player): a story's tap zones are views of the same screen
     * that would be taken for a cover. The result is kept for 120 ms, and every change is written to the debug log.
     */
    private static boolean coveredNow(View video) {
        long now = SystemClock.uptimeMillis();
        if (now - coverCheckedAt < COVER_CHECK_MS) return covered;
        coverCheckedAt = now;
        boolean result = false;
        String why = null;
        try {
            Activity activity = owner.get();
            if (photoUrl == null && activity != null
                    && MorpheSettings.isEnabled(activity, MorpheSettings.HIDE_OVER_COMMENTS)) {
                View hit = PROBE.covering(video, FeedItems.pagerOf(video), centerX, centerY);
                if (hit != null) {
                    result = true;
                    if (MorpheLog.enabled()) why = Overlay.chain(hit);
                }
            }
        } catch (Throwable t) {
            VideoFeatures.log("Cover check failed", t);
        }
        if (result != covered) {
            covered = result;
            if (MorpheLog.enabled()) {
                MorpheLog.log("cover", result ? "Button hidden: covered at " + Math.round(centerX) + "," + Math.round(centerY)
                        + " by " + why + " | video " + Overlay.describe(video)
                        : "Button allowed again: nothing covers it");
            }
        }
        return covered;
    }

    private static final Runnable FOLLOW = new Runnable() {
        @Override
        public void run() {
            following = false;
            Icon view = button;
            View video = target.get();
            Activity activity = owner.get();
            if (view == null || video == null || activity == null || hiding || view.getVisibility() != View.VISIBLE
                    || !video.isAttachedToWindow()) {
                return;
            }
            if (!mostlyVisible(video)) {
                hide();
                return;
            }
            place(activity, video);
            if (coveredNow(video)) {
                hide();
                return;
            }
            following = true;
            view.postOnAnimation(this);
        }
    };

    private static void follow() {
        if (following || button == null) return;
        following = true;
        button.postOnAnimation(FOLLOW);
    }

    /** Fades the button out. */
    static void hide() {
        if (!covered) PROBE.reset();
        final Icon view = button;
        if (view == null || view.getVisibility() != View.VISIBLE || hiding) return;
        if (!view.isAttachedToWindow()) {
            view.setVisibility(View.GONE);
            return;
        }
        hiding = true;
        view.animate().cancel();
        view.animate().alpha(0f).scaleX(0.85f).scaleY(0.85f).setDuration(120).setInterpolator(null)
                .withEndAction(() -> {
                    if (hiding) {
                        view.setVisibility(View.GONE);
                        hiding = false;
                    }
                }).start();
    }

    /** Hides the button without animation (the activity is going away). */
    static void hideNow() {
        if (button == null) return;
        button.removeCallbacks(FOLLOW);
        following = false;
        button.animate().cancel();
        button.setVisibility(View.GONE);
        hiding = false;
        covered = false;
        PROBE.reset();
    }

    static void forget(Activity activity) {
        if (owner.get() == activity) {
            if (button != null) button.removeCallbacks(FOLLOW);
            owner = new WeakReference<>(null);
            button = null;
            hiding = false;
            following = false;
            covered = false;
            PROBE.reset();
        }
    }

    /** Shows a ring turning round the arrow while a joined HD download runs. */
    static void setBusy(final boolean busy) {
        VideoFeatures.MAIN.post(() -> {
            if (button != null) button.setBusy(busy);
        });
    }

    private static void reveal(View view) {
        if (view.getVisibility() == View.VISIBLE && !hiding) return;
        hiding = false;
        view.animate().cancel();
        if (view.getVisibility() != View.VISIBLE) {
            view.setAlpha(0f);
            view.setScaleX(0.85f);
            view.setScaleY(0.85f);
            view.setVisibility(View.VISIBLE);
        }
        view.animate().alpha(1f).scaleX(1f).scaleY(1f).setDuration(170).setInterpolator(new DecelerateInterpolator()).start();
    }

    private static void create(final Activity activity) {
        int size = dp(activity, 40);
        Icon view = Overlay.mark(new Icon(activity));
        view.setContentDescription(vi() ? "Tải video" : "Download video");
        view.setOnClickListener(v -> download(activity));
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.LEFT);
        params.setMargins(0, 0, 0, 0);
        ((ViewGroup) activity.getWindow().getDecorView()).addView(view, params);
        view.setVisibility(View.GONE);
        button = view;
        hiding = false;
        owner = new WeakReference<>(activity);
    }

    private static void download(Activity activity) {
        View video = target.get();
        if (video == null) return;
        if (photoUrl != null) {
            if (photoName == null) photoName = FileNames.base(Stories.owner(activity), "Story");
            PhotoDownloader.start(activity, photoUrl, photoName);
            photoName = null;
            return;
        }
        try {
            if (Build.VERSION.SDK_INT < 29 && activity.checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE)
                    != PackageManager.PERMISSION_GRANTED) {
                activity.requestPermissions(new String[] {Manifest.permission.WRITE_EXTERNAL_STORAGE}, 0x4d6f);
                return;
            }
            VideoDownloader.Source source = source(video);
            if (source == null) {
                MorpheLog.log("video", "Download tapped: live video or no source");
                toast(activity, vi() ? "Không lấy được link video này" : "This video has no downloadable link");
                return;
            }
            String type = typeOf(video);
            String ownerName = "Story".equals(type) ? Stories.owner(activity) : ownerOf(video, source);
            source.baseName = FileNames.base(ownerName, type);
            source.owner = ownerName;
            source.type = type;
            MorpheLog.log("video", "File name " + source.baseName + " (owner " + ownerName + ", type " + type + ")");
            VideoProbe.onDownload(video, source.roots, source.id);
            VideoDownloader.start(activity, source);
        } catch (Throwable t) {
            VideoFeatures.log("Download failed", t);
            toast(activity, vi() ? "Tải video thất bại" : "Download failed");
        }
    }

    /** What the player holds for the video: its props, the full screen player's show-video command and the player. */
    static Object[] roots(View video) {
        Class<?> videoView = VideoFeatures.videoViewClass();
        Object props = null;
        Object command = null;
        Object player = null;
        try {
            props = VideoFeatures.field(video, videoView, "A0F");
        } catch (Throwable ignored) {
        }
        for (Class<?> c = video.getClass(); c != null && c != videoView; c = c.getSuperclass()) {
            if (c.getName().endsWith("FBFullScreenVideoView")) {
                try {
                    command = VideoFeatures.field(video, c, "A05");
                } catch (Throwable ignored) {
                }
            }
        }
        try {
            player = VideoFeatures.field(video, videoView, "A0G");
        } catch (Throwable ignored) {
        }
        return new Object[] {props, command, player, video};
    }

    /** The progressive MP4 URL, the video id the server sent and the objects that may hold a DASH manifest. Live videos give null. */
    private static VideoDownloader.Source source(View video) throws Exception {
        Class<?> videoView = VideoFeatures.videoViewClass();
        if (Boolean.TRUE.equals(VideoFeatures.field(video, videoView, "A0m"))) return null;
        Object[] roots = roots(video);
        Object props = roots[0];
        Object command = roots[1];
        String url = null;
        String id = null;
        if (command != null) {
            url = text(ObjectScan.field(command, "A0G"));
            id = text(ObjectScan.field(command, "A0D"));
        }
        if (props != null && isEmpty(url)) url = text(ObjectScan.field(props, "A0c"));
        if (props != null && isEmpty(id)) id = text(ObjectScan.field(props, "A0b"));
        if (isEmpty(url) || !url.startsWith("http")) url = null;
        return new VideoDownloader.Source(url, id, roots);
    }

    /**
     * Where the button is offered: Reels (a video in the paging list), the full screen player and stories (a video that
     * fills the window). Not for videos playing inline while the feed is scrolled; open the post first.
     */
    static boolean allowed(View video) {
        for (Class<?> c = video.getClass(); c != null; c = c.getSuperclass()) {
            if (c.getName().endsWith("FBFullScreenVideoView")) return true;
        }
        View pager = FeedItems.pagerOf(video);
        if (pager != null) return FeedItems.isSnapping(pager);
        View root = video.getRootView();
        return root != null && video.getHeight() >= root.getHeight() * 0.75f;
    }

    /** Reel in the paging list, Story when the video fills the window outside any list, else Video. */
    private static String typeOf(View video) {
        View pager = FeedItems.pagerOf(video);
        if (pager != null) return FeedItems.isSnapping(pager) ? "Reel" : "Video";
        for (Class<?> c = video.getClass(); c != null; c = c.getSuperclass()) {
            if (c.getName().endsWith("FBFullScreenVideoView")) return "Video";
        }
        View root = video.getRootView();
        return root != null && video.getHeight() >= root.getHeight() * 0.8f ? "Story" : "Video";
    }

    /**
     * The name of the page or person that posted the video, read from the component tree of the list item the
     * video view belongs to. That item is asked from the list itself (adapter position of the view's item view).
     * The list's "current index" is not used first: it moved to another reel when the list grew while a reel was
     * watched, and the name of the next reel was taken.
     */
    private static String ownerOf(View video, VideoDownloader.Source source) {
        try {
            View pager = FeedItems.pagerOf(video);
            String name = null;
            String how = "none";
            int position = -1;
            int current = -1;
            int count = 0;
            if (pager != null) {
                Object[] items = FeedItems.items(pager);
                count = items.length;
                current = FeedItems.currentIndex(pager);
                position = FeedItems.positionOf(pager, FeedItems.childOf(pager, video));
                if (position >= 0 && position < items.length) {
                    Object tree = FeedItems.treeOf(items[position]);
                    name = tree == null ? null : FeedItems.ownerName(tree);
                    how = "item of the video view (position " + position + ")";
                }
                if (name == null) {
                    name = ownerByProps(items, source);
                    if (name != null) how = "search by the video's props";
                }
                if (MorpheLog.enabled()) {
                    Object atCurrent = current >= 0 && current < items.length ? FeedItems.treeOf(items[current]) : null;
                    MorpheLog.log("video", "Owner " + name + " from " + how + "; adapter position " + position + ", current index " + current
                            + " (its owner would be " + (atCurrent == null ? null : FeedItems.ownerName(atCurrent)) + "), items " + count);
                }
            }
            if (name == null) {
                // The full screen player is not inside a list of its own: look in every list of the window for the item
                // whose tree refers to this video.
                for (View other : FeedItems.pagersIn(video.getRootView())) {
                    if (other == pager) continue;
                    name = ownerByProps(FeedItems.items(other), source);
                    if (name != null) {
                        how = "search by the video's props in another list";
                        break;
                    }
                }
                if (MorpheLog.enabled()) MorpheLog.log("video", "Owner " + name + " from " + how + " (video is not in a list of its own)");
            }
            return name;
        } catch (Throwable t) {
            VideoFeatures.log("Owner name failed", t);
            return null;
        }
    }

    /** The owner of the item whose tree refers to this video's props, id or tracking text. */
    private static String ownerByProps(Object[] items, VideoDownloader.Source source) {
        Object json = null;
        try {
            json = ObjectScan.field(source.roots[0], "A0a");
        } catch (Throwable ignored) {
        }
        Object found = FeedItems.findTree(items, source.roots[0], source.id, json);
        return found == null ? null : FeedItems.ownerName(found);
    }

    private static boolean isReel(View video) {
        if (video.getWidth() <= 0 || video.getHeight() < video.getWidth() * REEL_ASPECT) return false;
        for (Class<?> c = video.getClass(); c != null; c = c.getSuperclass()) {
            if (c.getName().endsWith("FBFullScreenVideoView")) return false;
        }
        return true;
    }

    private static String text(Object value) {
        return value instanceof String ? (String) value : null;
    }

    private static boolean isEmpty(String s) {
        return s == null || s.isEmpty();
    }

    private static boolean vi() {
        return "vi".equals(Locale.getDefault().getLanguage());
    }

    private static void toast(Context context, String text) {
        Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
    }

    private static boolean rtl(Context context) {
        return context.getResources().getConfiguration().getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    /**
     * The button itself, drawn like the app's own Like, Comment and Share icons: a white outline glyph (arrow into a tray)
     * with rounded ends, no disc behind it and a soft dark shade so it reads on a bright video. While a joined HD download
     * runs, the glyph dims and a blue ring turns round it.
     */
    private static final class Icon extends View {
        private final Paint shade = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint ring = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path glyph = new Path();
        private final RectF arc = new RectF();
        private final float density;
        private boolean busy;
        private long busySince;

        Icon(Context context) {
            super(context);
            density = context.getResources().getDisplayMetrics().density;
            for (Paint p : new Paint[] {shade, stroke}) {
                p.setStyle(Paint.Style.STROKE);
                p.setStrokeCap(Paint.Cap.ROUND);
                p.setStrokeJoin(Paint.Join.ROUND);
            }
            shade.setColor(0x38000000);
            ring.setStyle(Paint.Style.STROKE);
            ring.setStrokeCap(Paint.Cap.ROUND);
            ring.setColor(0xFF1877F2);
            // Only for the drawing order above the app's views: no outline, so no shadow box.
            setElevation(5 * density);
            setClickable(true);
        }

        void setBusy(boolean value) {
            if (busy == value) return;
            busy = value;
            busySince = SystemClock.uptimeMillis();
            invalidate();
        }

        /** Arrow and tray on a grid centered on (12, 11.5), (cx, cy) being that point, u px per unit. */
        private void buildGlyph(float cx, float cy, float u) {
            glyph.reset();
            glyph.moveTo(cx, cy + (3.5f - 11.5f) * u);
            glyph.lineTo(cx, cy + (14.5f - 11.5f) * u);
            glyph.moveTo(cx + (7f - 12f) * u, cy + (10f - 11.5f) * u);
            glyph.lineTo(cx, cy + (14.5f - 11.5f) * u);
            glyph.lineTo(cx + (17f - 12f) * u, cy + (10f - 11.5f) * u);
            glyph.moveTo(cx + (3.5f - 12f) * u, cy + (14.5f - 11.5f) * u);
            glyph.lineTo(cx + (3.5f - 12f) * u, cy + (17f - 11.5f) * u);
            glyph.quadTo(cx + (3.5f - 12f) * u, cy + (19.5f - 11.5f) * u, cx + (6f - 12f) * u, cy + (19.5f - 11.5f) * u);
            glyph.lineTo(cx + (18f - 12f) * u, cy + (19.5f - 11.5f) * u);
            glyph.quadTo(cx + (20.5f - 12f) * u, cy + (19.5f - 11.5f) * u, cx + (20.5f - 12f) * u, cy + (17f - 11.5f) * u);
            glyph.lineTo(cx + (20.5f - 12f) * u, cy + (14.5f - 11.5f) * u);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float cx = getWidth() / 2f;
            float cy = getHeight() / 2f;
            float u = Math.min(GLYPH_UNIT_DP * density, Math.min(getWidth(), getHeight()) / 18f);
            float width = 1.4f * u;
            buildGlyph(cx, cy, u);

            canvas.save();
            canvas.translate(0f, 0.9f * density);
            shade.setStrokeWidth(width + 1.2f * density);
            canvas.drawPath(glyph, shade);
            canvas.restore();

            stroke.setStrokeWidth(width);
            stroke.setColor(busy ? 0x99FFFFFF : 0xFFFFFFFF);
            canvas.drawPath(glyph, stroke);

            if (busy) {
                float r = Math.min(getWidth(), getHeight()) / 2f;
                ring.setStrokeWidth(2.2f * r / 22f);
                float pad = 2.6f * r / 22f;
                arc.set(pad, pad, getWidth() - pad, getHeight() - pad);
                float angle = ((SystemClock.uptimeMillis() - busySince) % 900L) / 900f * 360f;
                canvas.drawArc(arc, angle, 110f, false, ring);
                postInvalidateOnAnimation();
            }
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    animate().cancel();
                    animate().scaleX(0.88f).scaleY(0.88f).setDuration(90).start();
                    break;
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    animate().cancel();
                    animate().scaleX(1f).scaleY(1f).setDuration(180).setInterpolator(new OvershootInterpolator(2f)).start();
                    break;
                default:
                    break;
            }
            return super.onTouchEvent(event);
        }
    }
}
