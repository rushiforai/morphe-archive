package app.fblite.extension.video;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.Canvas;
import android.graphics.Outline;
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
import android.view.ViewOutlineProvider;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.OvershootInterpolator;
import android.widget.FrameLayout;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.Locale;

import app.fblite.extension.settings.MorpheLog;

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

    private static Icon button;
    private static boolean hiding;
    private static WeakReference<Activity> owner = new WeakReference<>(null);
    private static WeakReference<View> target = new WeakReference<>(null);
    private static final Rect RECT = new Rect();
    private static final int[] LOCATION = new int[2];
    private static boolean following;
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
        reveal(button);
        button.bringToFront();
        follow();
    }

    /** Shows the button for a story photo, on the right edge like the Reels column. */
    static void showPhoto(Activity activity, View anchor, String url) {
        if (owner.get() != activity || button == null) create(activity);
        photoUrl = url;
        photoName = null;
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
        if (photoUrl != null || isReel(video)) {
            float unit = width / REFERENCE_WIDTH;
            size = Math.max(dp(context, 30), Math.round(REEL_BUTTON_SIZE * unit));
            left = LOCATION[0] + width - Math.round(COLUMN_CENTER_FROM_RIGHT * unit) - size / 2;
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
    }

    static void forget(Activity activity) {
        if (owner.get() == activity) {
            if (button != null) button.removeCallbacks(FOLLOW);
            owner = new WeakReference<>(null);
            button = null;
            hiding = false;
            following = false;
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
        Icon view = new Icon(activity);
        view.setContentDescription(vi() ? "Tải video" : "Download video");
        view.setOnClickListener(v -> download(activity));
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.START);
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

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    /** The button itself: a frosted white disc, a thin dark arrow into a tray, a blue ring while busy. */
    private static final class Icon extends View {
        private final Paint surface = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint edge = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint ring = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path arrow = new Path();
        private final RectF arc = new RectF();
        private final float density;
        private boolean busy;
        private long busySince;

        Icon(Context context) {
            super(context);
            density = context.getResources().getDisplayMetrics().density;
            surface.setStyle(Paint.Style.FILL);
            surface.setColor(0xF2FFFFFF);
            edge.setStyle(Paint.Style.STROKE);
            edge.setStrokeWidth(density);
            edge.setColor(0x14000000);
            stroke.setStyle(Paint.Style.STROKE);
            stroke.setStrokeCap(Paint.Cap.ROUND);
            stroke.setStrokeJoin(Paint.Join.ROUND);
            ring.setStyle(Paint.Style.STROKE);
            ring.setStrokeCap(Paint.Cap.ROUND);
            ring.setColor(0xFF1877F2);
            setElevation(5 * density);
            setOutlineProvider(new ViewOutlineProvider() {
                @Override
                public void getOutline(View view, Outline outline) {
                    outline.setOval(0, 0, view.getWidth(), view.getHeight());
                    outline.setAlpha(0.9f);
                }
            });
            setClickable(true);
        }

        void setBusy(boolean value) {
            if (busy == value) return;
            busy = value;
            busySince = SystemClock.uptimeMillis();
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float cx = getWidth() / 2f;
            float cy = getHeight() / 2f;
            float r = Math.min(getWidth(), getHeight()) / 2f;
            float inset = density * 0.5f;
            canvas.drawCircle(cx, cy, r - inset, surface);
            canvas.drawCircle(cx, cy, r - inset, edge);

            // Drawn on a grid where the disc has radius 22.
            float u = r / 22f;
            stroke.setStrokeWidth(2f * u);
            stroke.setColor(busy ? 0x801C1E21 : 0xFF1C1E21);
            arrow.reset();
            arrow.moveTo(cx, cy - 9f * u);
            arrow.lineTo(cx, cy + 3.5f * u);
            arrow.moveTo(cx - 6f * u, cy - 2.5f * u);
            arrow.lineTo(cx, cy + 3.5f * u);
            arrow.lineTo(cx + 6f * u, cy - 2.5f * u);
            arrow.moveTo(cx - 8f * u, cy + 9f * u);
            arrow.lineTo(cx + 8f * u, cy + 9f * u);
            canvas.drawPath(arrow, stroke);

            if (busy) {
                ring.setStrokeWidth(2.2f * u);
                float pad = 2.6f * u;
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
