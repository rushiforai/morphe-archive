package app.originisland.extension;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.animation.PathInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Docks the Apple Music player beside the app on wide windows, as on an unfolded foldable phone,
 * the way the docked Now Playing of the LastWave fork does on the same phone.
 *
 * <ul>
 *     <li>Closed, the player is the mini player of the app, in the middle of the bottom.</li>
 *     <li>Opened, it rises from there into a rounded card in the end column, and the app stays
 *     usable beside it as a second card. The black between them follows the status bar.</li>
 *     <li>A button on the player shows it full screen: the player slides to the start half and
 *     the queue of the app comes in on the end half, where songs can be dragged into another
 *     order as in the queue of the player itself.</li>
 * </ul>
 *
 * The player of the app takes some sizes only once, as it is first laid out: the size of the
 * player, which sizes its moving artwork, and the size of the cover. So the parts of the player
 * that show in the card are laid out as wide as the card from the start, and keep that width.
 *
 * Everything is done with the views of the app, found by the names of their ids, which the app
 * does not obfuscate. Only framework calls are made on them.
 */
@SuppressWarnings("unused")
public final class AppleMusicDockedPlayerPatch {

    private static final String TAG = "OriginIslandDocked";

    /**
     * The id of the column the queue goes in beside the full screen player. It is fixed, so
     * that the queue the app restores after the activity is made again finds its column.
     */
    public static final int SIDE_QUEUE_COLUMN_ID = 0x0A11E001;

    /**
     * The name of the method the patch adds to the player fragment, which adds the queue
     * to {@link #SIDE_QUEUE_COLUMN_ID} unless it is there already.
     */
    private static final String ADD_SIDE_QUEUE_METHOD = "originIslandAddSideQueue";
    private static final String ADD_SIDE_LYRICS_METHOD = "originIslandAddSideLyrics";
    public static final int SIDE_LYRICS_COLUMN_ID = 0x0A11E002;
    private static final String OWN_VIEW_TAG = "originIsland";
    private static final int TOUCH_BLOCKED_KEY = 0x0A11E0F1;
    private static final String NOTHING_UP_NEXT_TAG = OWN_VIEW_TAG + "NothingUpNext";
    private static final String HISTORY_BUTTON_TAG = OWN_VIEW_TAG + "HistoryButton";
    private static final float HISTORY_BUTTON_SIZE_DP = 36f;
    /** How long after the queue stops scrolling the background of the player moves again. */
    private static final long BACKGROUND_RESUME_MS = 500;
    /** How long a part beside the player is drawn at first, for it to connect to the player. */
    private static final long PART_CONNECT_MS = 1500;
    private static final float HISTORY_BUTTON_MARGIN_DP = 12f;

    /** If the queue beside the player shows the songs played before, which it hides at first. */
    private static boolean showHistory;

    /** If the full screen player shows the lyrics beside it instead of the queue. */
    private static boolean showLyrics;

    // The window sizes and the size of the end column, as in LastWave's PlayerSplit.
    private static final int MIN_WINDOW_WIDTH_DP = 640;
    private static final int MIN_WINDOW_HEIGHT_DP = 480;
    private static final int MIN_SIDE_WIDTH_DP = 360;
    private static final int MAX_SIDE_WIDTH_DP = 480;

    /**
     * Docked, the app and the player are rounded cards this far below the status bar
     * and twice this apart, flush with the sides of the window.
     */
    private static final float CARD_MARGIN_DP = 1.5f;
    private static final float CARD_CORNER_DP = 8f;

    /**
     * The tabs at the top of the app are as wide as a whole window. Beside the player they are
     * made smaller to fit their card, with this much room on each side.
     */
    private static final float TABS_MARGIN_DP = 10f;

    /**
     * The end of the tabs that holds their search button, cut off beside the docked player,
     * and where in it the button is.
     */
    private static final float SEARCH_CUT_DP = 52f;
    private static final float SEARCH_FROM_TABS_END_DP = 24f;

    /** The search button at the bottom of the app's card while the player is docked. */
    private static final float SEARCH_SIZE_DP = 52f;
    private static final float SEARCH_ICON_DP = 22f;
    private static final float SEARCH_BOTTOM_MARGIN_DP = 16f;

    private static final float TOGGLE_SIZE_DP = 36f;
    private static final float TOGGLE_ICON_DP = 18f;
    private static final float TOGGLE_MARGIN_DP = 14f;

    /**
     * Where the queue beside the full screen player starts, if the cover can not be found.
     */
    private static final float QUEUE_TOP_DP = 64f;

    private static final long FULL_SCREEN_ANIMATION_MS = 500;


    // Material Symbols "open_in_full" and "close_fullscreen", on a 24 unit square.
    private static final String ICON_FULL_SCREEN = "M3,21V13H5V17.6L17.6,5H13V3H21V11H19V6.4L6.4,19H11V21Z";
    private static final String ICON_DOCKED = "M3.4,22L2,20.6L8.6,14H4V12H12V20H10V15.4ZM12,12V4H14V8.6L20.6,2L22,3.4L15.4,10H20V12Z";

    private static WeakReference<Content> contentRef = new WeakReference<>(null);
    private static WeakReference<Player> playerRef = new WeakReference<>(null);

    /**
     * The views that tell the player its size, one for each view of a player.
     */
    private static final Map<View, View> sizeProbes = new WeakHashMap<>();

    /**
     * If the player is shown full screen. Kept for the views the app makes again, as when
     * the phone is folded and unfolded.
     */
    private static boolean fullScreen = true;

    /**
     * If the activity is made for a window as wide as the app's card beside the docked player,
     * so that the app lays its pages out as on a phone, and how wide that is.
     */
    private static boolean phoneLayout;
    private static int phoneWidthDp;

    /**
     * How long the player rests docked or closed before the activity is made again for it.
     */
    private static final long RELAYOUT_DELAY_MS = 120;

    /** How far below the screen the bottom tabs go behind the full screen player. */
    private static final float BOTTOM_NAV_HIDE_EXTRA_DP = 24f;

    /**
     * A picture of the window taken just before the activity is made again, shown over the new
     * one until it is laid out and then faded away, so the change of layout is a crossfade.
     */
    private static android.graphics.Bitmap relayoutSnapshot;
    private static final long SNAPSHOT_HOLD_MS = 350;
    private static final long SNAPSHOT_FADE_MS = 250;

    private AppleMusicDockedPlayerPatch() {
    }

    // region Injection points

    /**
     * Injection point. Called with the view of the fragment that holds the pages of the app,
     * the mini player and the player.
     */
    public static void onContentViewCreated(View view) {
        try {
            Content content = new Content((ViewGroup) view);
            contentRef = new WeakReference<>(content);
            content.attach();
            showRelayoutSnapshot(view);
        } catch (Exception ex) {
            Log.e(TAG, "onContentViewCreated failure", ex);
        }
    }

    /**
     * Injection point. Called with the player fragment and its view.
     */
    public static void onPlayerViewCreated(Object fragment, View view) {
        try {
            if (!(view instanceof ViewGroup)) return;
            Player player = new Player(fragment, (ViewGroup) view);
            playerRef = new WeakReference<>(player);
            Content content = contentRef.get();
            if (content != null) content.requestApply();
        } catch (Exception ex) {
            Log.e(TAG, "onPlayerViewCreated failure", ex);
        }
    }

    /**
     * Injection point. Called as the player is opened (1) and closed (0), and in between.
     */
    public static void onPlayerSlide(float offset) {
        try {
            Content content = contentRef.get();
            if (content != null) content.onSlide(Math.max(0f, Math.min(1f, offset)));
        } catch (Exception ex) {
            Log.e(TAG, "onPlayerSlide failure", ex);
        }
    }

    /**
     * Injection point. Called instead of the app darkening the window behind the player as it
     * opens. Docked, the app beside the player is not darkened.
     */
    public static void setPlayerDim(View view, int color) {
        Content content = contentRef.get();
        if (content != null && content.wide && content.coordinator == view) {
            color = Color.TRANSPARENT;
        }
        view.setBackgroundColor(color);
    }

    /**
     * Injection point. Called instead of the player taking its size once its view is laid out.
     *
     * @param view     The view of the player.
     * @param onLayout The function of the player that takes the size of the view it is given.
     */
    public static void measurePlayer(View view, Object onLayout) {
        try {
            Method invoke = onLayout.getClass().getMethod("invoke", Object.class);
            View probe = sizeProbe((ViewGroup) view);
            Geometry geometry = Geometry.of(view);
            setWidth(probe, geometry.wide ? geometry.sideWidth : ViewGroup.LayoutParams.MATCH_PARENT);

            Runnable measure = () -> {
                if (probe.getWidth() == 0 || probe.getHeight() == 0) return;
                try {
                    invoke.invoke(onLayout, probe);
                } catch (Exception ex) {
                    Log.e(TAG, "Could not tell the player its size", ex);
                }
            };
            probe.addOnLayoutChangeListener((v, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
                if (right - left != oldRight - oldLeft || bottom - top != oldBottom - oldTop) measure.run();
            });
            if (probe.isLaidOut() && !probe.isLayoutRequested()) measure.run();
        } catch (Exception ex) {
            Log.e(TAG, "measurePlayer failure", ex);
        }
    }

    // endregion

    /**
     * Injection point. Called with the base context of the main activity as it is made.
     * Beside the docked player, the activity gets the configuration of a phone-wide window.
     */
    public static Context wrapActivityContext(Object activity, Context base) {
        try {
            if (!phoneLayout || phoneWidthDp <= 0 || base == null) return base;
            if (!"com.apple.android.music.common.MainActivity".equals(activity.getClass().getName())) return base;
            android.content.res.Configuration real = base.getResources().getConfiguration();
            // Folded, the window is narrow anyway.
            if (real.screenWidthDp < MIN_WINDOW_WIDTH_DP) {
                phoneLayout = false;
                return base;
            }
            android.content.res.Configuration phone = new android.content.res.Configuration(real);
            phone.screenWidthDp = phoneWidthDp;
            phone.smallestScreenWidthDp = Math.min(phoneWidthDp, real.screenHeightDp);
            phone.orientation = android.content.res.Configuration.ORIENTATION_PORTRAIT;
            return base.createConfigurationContext(phone);
        } catch (Exception ex) {
            Log.e(TAG, "wrapActivityContext failure", ex);
            return base;
        }
    }

    private static void recreateBehindSnapshot(android.app.Activity activity) {
        View decor = activity.getWindow().getDecorView();
        if (Build.VERSION.SDK_INT < 26 || decor.getWidth() == 0 || decor.getHeight() == 0) {
            activity.recreate();
            return;
        }
        try {
            android.graphics.Bitmap picture = android.graphics.Bitmap.createBitmap(
                    decor.getWidth(), decor.getHeight(), android.graphics.Bitmap.Config.ARGB_8888);
            android.view.PixelCopy.request(activity.getWindow(), picture, result -> {
                if (result == android.view.PixelCopy.SUCCESS) {
                    relayoutSnapshot = picture;
                } else {
                    picture.recycle();
                }
                if (!activity.isFinishing()) activity.recreate();
            }, new android.os.Handler(android.os.Looper.getMainLooper()));
        } catch (Exception ex) {
            Log.e(TAG, "Could not take a picture of the window", ex);
            activity.recreate();
        }
    }

    /**
     * Shows the picture of the window before the activity was made again over the new one,
     * and fades it away once the new one is laid out.
     */
    private static void showRelayoutSnapshot(View content) {
        android.graphics.Bitmap picture = relayoutSnapshot;
        relayoutSnapshot = null;
        if (picture == null) return;
        android.app.Activity activity = activityOf(content.getContext());
        if (activity == null) {
            picture.recycle();
            return;
        }
        ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
        ImageView cover = new ImageView(activity);
        cover.setImageBitmap(picture);
        cover.setScaleType(ImageView.ScaleType.FIT_XY);
        cover.setElevation(1000f);
        cover.setClickable(true);
        decor.addView(cover, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        cover.postDelayed(() -> cover.animate().alpha(0f).setDuration(SNAPSHOT_FADE_MS)
                .withEndAction(() -> {
                    decor.removeView(cover);
                    picture.recycle();
                }).start(), SNAPSHOT_HOLD_MS);
    }

    private static android.app.Activity activityOf(Context context) {
        while (context instanceof android.content.ContextWrapper) {
            if (context instanceof android.app.Activity) return (android.app.Activity) context;
            context = ((android.content.ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    /** The history each queue was last given by the app. */
    private static final Map<Object, java.util.List<?>> histories = new WeakHashMap<>();

    /**
     * Injection point. Called with the history the app gives a queue. On wide windows the queue
     * beside the player only gets it while it is asked for with the history button, so that
     * its rows are not laid out otherwise.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static java.util.List historyFor(Object queue, java.util.List history) {
        try {
            histories.put(queue, history);
            Content content = contentRef.get();
            if (content != null && content.wide && !showHistory) return new java.util.ArrayList();
        } catch (Exception ex) {
            Log.e(TAG, "historyFor failure", ex);
        }
        return history;
    }

    /** Gives every queue its history again, or takes it away, as the history button asks. */
    private static void giveHistories() {
        for (Map.Entry<Object, java.util.List<?>> entry : new java.util.ArrayList<>(histories.entrySet())) {
            try {
                Method update = entry.getKey().getClass().getMethod("updateHistory", java.util.List.class);
                update.invoke(entry.getKey(), entry.getValue());
            } catch (Exception ex) {
                Log.e(TAG, "Could not give the queue its history", ex);
            }
        }
    }

    // region Content

    /**
     * The views of the fragment that holds the pages of the app and the player.
     */
    private static final class Content implements View.OnLayoutChangeListener {
        private final ViewGroup root;
        private final float density;

        /** The pages and what is drawn over them, which make up the app's card. */
        private final View[] appViews;
        private final View topTabs;
        private final View topTabsBlur;
        /** The tabs at the bottom, which the app has as on a phone beside the docked player. */
        private final View[] bottomNav;
        private final int[] bottomNavMargins;
        private boolean keepBottomNav;
        /** The size of the window the player was last laid out for. */
        private int appliedWidth;
        private int appliedHeight;
        /** The height of the navigation bar, taken as the views are laid out, not on every frame. */
        private int navigationBar;
        final View coordinator;

        private final Drawable rootBackground;
        private final Drawable pagesBackground;
        private final Drawable appBackground;
        private final ImageView search;
        private final TabsOutline tabsOutline = new TabsOutline();
        private final TabsOutline tabsBlurOutline = new TabsOutline();

        private final CardOutline appOutline = new CardOutline();
        private final CardOutline playerOutline = new CardOutline();

        /** How far the player is opened, 0 to 1. */
        private float opened;
        /** How far the player is shown full screen, 0 to 1. */
        private float fullScreenProgress = fullScreen ? 1f : 0f;
        private ValueAnimator fullScreenAnimator;
        /** The width of the tabs at the top as the app lays them out. */
        private int tabsWidth;
        boolean wide;
        private boolean applyPosted;

        Content(ViewGroup root) {
            this.root = root;
            this.density = root.getResources().getDisplayMetrics().density;

            appViews = new View[]{find(root, "blur_target"), find(root, "top_and_bottom_gradients")};
            topTabs = find(root, "top_nav_tabs");
            topTabsBlur = find(root, "top_nav_blur");
            bottomNav = new View[]{find(root, "bottom_nav_view"), find(root, "bottom_nav_blur")};
            bottomNavMargins = new int[]{marginStart(bottomNav[0]), marginEnd(bottomNav[0]),
                    marginStart(bottomNav[1]), marginEnd(bottomNav[1])};
            // The app slides its bottom tabs away as the player opens. Beside the docked player
            // they stay, so the app can still be used.
            // As the window changes size, as when the phone is turned, the player is laid out for
            // the new size before the next frame is drawn, instead of one frame later, which drew
            // frames in the middle of the turn with the layout of the old size.
            root.getViewTreeObserver().addOnPreDrawListener(() -> {
                int width = root.getWidth();
                int height = root.getHeight();
                if (width > 0 && height > 0 && (width != appliedWidth || height != appliedHeight)) {
                    appliedWidth = width;
                    appliedHeight = height;
                    apply();
                    return false;
                }
                return true;
            });
            // Full screen, they slide away under the player again, as the app does.
            root.getViewTreeObserver().addOnPreDrawListener(() -> {
                Player player = playerRef.get();
                if (wide && player != null && player.isIn(root)) {
                    if (opened >= 1f) {
                        player.fitMotionArtwork(Geometry.of(root).sideWidth);
                    } else {
                        // As the player opens or closes, the artwork moves to and from the mini
                        // player in the middle of the window, so its end is not faded then.
                        player.clearMotionFade();
                    }
                }
                float hide = wide && opened > 0f ? fullScreenProgress : 0f;
                if (keepBottomNav || hide > 0f) {
                    for (View view : bottomNav) {
                        if (view == null) continue;
                        float y = (view.getHeight() + navigationBar
                                + BOTTOM_NAV_HIDE_EXTRA_DP * density) * hide;
                        if (view.getTranslationY() != y) view.setTranslationY(y);
                    }
                }
                return true;
            });
            coordinator = find(root, "player_coordinator");
            rootBackground = root.getBackground();
            pagesBackground = appViews[0] == null ? null : appViews[0].getBackground();
            appBackground = windowBackground(root);

            search = new ImageView(root.getContext());
            boolean night = (root.getResources().getConfiguration().uiMode
                    & android.content.res.Configuration.UI_MODE_NIGHT_MASK)
                    == android.content.res.Configuration.UI_MODE_NIGHT_YES;
            search.setImageDrawable(new SearchDrawable(Math.round(SEARCH_ICON_DP * density),
                    night ? Color.WHITE : Color.BLACK, density));
            search.setScaleType(ImageView.ScaleType.CENTER);
            GradientDrawable circle = new GradientDrawable();
            circle.setShape(GradientDrawable.OVAL);
            circle.setColor(night ? 0xF2303033 : 0xF7FFFFFF);
            search.setBackground(circle);
            search.setElevation(6 * density);
            search.setContentDescription("Search");
            search.setVisibility(View.GONE);
            search.setOnClickListener(v -> tapTabsSearch());
            int size = Math.round(SEARCH_SIZE_DP * density);
            root.addView(search, new ViewGroup.LayoutParams(size, size));
        }

        /**
         * The search button of the tabs is cut off beside the docked player, and has its own
         * button at the bottom of the app's card instead. That button taps the one of the tabs.
         */
        private void tapTabsSearch() {
            if (topTabs == null || topTabsBlur == null) return;
            float x = topTabsBlur.getLeft() - topTabs.getLeft() + topTabsBlur.getWidth()
                    - SEARCH_FROM_TABS_END_DP * density;
            float y = topTabsBlur.getTop() - topTabs.getTop() + topTabsBlur.getHeight() / 2f;
            if (root.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL) {
                x = topTabsBlur.getLeft() - topTabs.getLeft() + SEARCH_FROM_TABS_END_DP * density;
            }
            long now = android.os.SystemClock.uptimeMillis();
            android.view.MotionEvent down = android.view.MotionEvent.obtain(now, now,
                    android.view.MotionEvent.ACTION_DOWN, x, y, 0);
            android.view.MotionEvent up = android.view.MotionEvent.obtain(now, now + 50,
                    android.view.MotionEvent.ACTION_UP, x, y, 0);
            topTabs.dispatchTouchEvent(down);
            topTabs.dispatchTouchEvent(up);
            down.recycle();
            up.recycle();
        }

        void attach() {
            root.addOnLayoutChangeListener(this);
            requestApply();
        }

        @Override
        public void onLayoutChange(View v, int left, int top, int right, int bottom,
                                   int oldLeft, int oldTop, int oldRight, int oldBottom) {
            if (right - left != oldRight - oldLeft || bottom - top != oldBottom - oldTop) {
                requestApply();
            }
        }

        void requestApply() {
            if (applyPosted) return;
            applyPosted = true;
            root.post(() -> {
                applyPosted = false;
                if (opened == 0f) opened = estimateOpened();
                apply();
            });
        }

        /**
         * The app only tells how far the player is opened as it moves. A player that was open
         * as the views were made again is at the top of its column.
         */
        private float estimateOpened() {
            Player player = playerRef.get();
            if (player == null || coordinator == null || coordinator.getAlpha() == 0f) return 0f;
            View sheet = (View) player.root.getParent();
            return sheet != null && sheet.getHeight() > 0 && sheet.getTop() <= 0 ? 1f : 0f;
        }

        void onSlide(float offset) {
            if (offset == opened) return;
            float before = opened;
            opened = offset;
            // The full screen player opens and closes as one, straight up and down, and stays
            // full screen for the next time. Only a toggle that is still moving is finished.
            if (fullScreenAnimator != null && offset < before) {
                stopFullScreenAnimation();
                fullScreenProgress = fullScreen ? 1f : 0f;
            }
            apply();
            scheduleRelayout();
        }

        private final Runnable relayout = this::relayout;

        /**
         * Once the player rests docked, the app is made again as on a phone, and once it rests
         * closed, as on the whole window again.
         */
        private void scheduleRelayout() {
            // Only the docked player needed the app laid out as on a phone.
            if (fullScreen) return;
            root.removeCallbacks(relayout);
            boolean wantPhone = wide && opened >= 1f && !fullScreen;
            boolean wantWindow = opened == 0f;
            if ((wantPhone && !phoneLayout) || (wantWindow && phoneLayout)) {
                root.postDelayed(relayout, RELAYOUT_DELAY_MS);
            }
        }

        private void relayout() {
            boolean wantPhone = wide && opened >= 1f && !fullScreen;
            boolean wantWindow = opened == 0f;
            if (wantPhone == phoneLayout && !(wantWindow && phoneLayout)) return;
            android.app.Activity activity = activityOf(root.getContext());
            if (activity == null || activity.isFinishing()) return;
            if (wantPhone) {
                Geometry geometry = Geometry.of(root);
                phoneWidthDp = Math.round(geometry.appWidth / density);
                phoneLayout = true;
            } else if (wantWindow) {
                phoneLayout = false;
            } else {
                return;
            }
            recreateBehindSnapshot(activity);
        }

        void toggleFullScreen() {
            if (!wide || opened < 1f) return;
            fullScreen = !fullScreen;
            stopFullScreenAnimation();
            ValueAnimator animator = ValueAnimator.ofFloat(fullScreenProgress, fullScreen ? 1f : 0f);
            animator.setDuration(FULL_SCREEN_ANIMATION_MS);
            // Emphasized decelerate as the player swoops in, and emphasized accelerate as it leaves.
            animator.setInterpolator(fullScreen
                    ? new PathInterpolator(0.2f, 0f, 0f, 1f)
                    : new PathInterpolator(0.2f, 0f, 0f, 1f));
            animator.addUpdateListener(a -> {
                fullScreenProgress = (float) a.getAnimatedValue();
                apply();
            });
            animator.addListener(new AnimatorListenerAdapter() {
                @Override
                public void onAnimationEnd(Animator animation) {
                    if (fullScreenAnimator == animation) fullScreenAnimator = null;
                }
            });
            fullScreenAnimator = animator;
            animator.start();
        }

        private void stopFullScreenAnimation() {
            ValueAnimator animator = fullScreenAnimator;
            fullScreenAnimator = null;
            if (animator != null) animator.cancel();
        }

        void apply() {
            if (coordinator == null) return;
            Geometry geometry = Geometry.of(root);
            if (!geometry.wide) {
                if (wide) {
                    reset();
                    wide = false;
                    giveHistories();
                }
                wide = false;
                phoneLayout = false;
                return;
            }
            if (!wide) {
                wide = true;
                // The history given to the queue before the window was known to be wide.
                giveHistories();
            }

            boolean rtl = root.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
            int width = geometry.width;
            int height = geometry.height;
            int sideWidth = geometry.sideWidth;
            int appWidth = geometry.appWidth;
            int statusBar = statusBarHeight(root);
            navigationBar = navigationBarHeight(root);
            float margin = CARD_MARGIN_DP * density;
            float corner = CARD_CORNER_DP * density;
            float docked = opened;
            boolean card = docked > 0f;
            float full = card ? fullScreenProgress : 0f;
            // Docked, the player moves from the middle to its column quickly at first, as it rises.
            float eased = 1f - (1f - docked) * (1f - docked);
            // The app is laid out narrower only once the player is docked, and while it opens or
            // closes it is cut off instead, so its pages are not laid out again on every frame.
            boolean split = card && full < 1f;
            boolean narrow = split && docked >= 1f;

            // The black between the cards only shows while the player is docked. The pages are
            // see-through, so the app's card gets the background the window had.
            if (split) {
                if (!(root.getBackground() instanceof ColorDrawable)
                        || ((ColorDrawable) root.getBackground()).getColor() != Color.BLACK) {
                    root.setBackgroundColor(Color.BLACK);
                }
                if (appViews[0] != null && appViews[0].getBackground() != appBackground) {
                    appViews[0].setBackground(appBackground);
                }
            } else {
                if (root.getBackground() != rootBackground) root.setBackground(rootBackground);
                if (appViews[0] != null && appViews[0].getBackground() != pagesBackground) {
                    appViews[0].setBackground(pagesBackground);
                }
            }

            // The app gives up the end column as the player opens, and becomes a card.
            int laidOut = narrow ? appWidth : width;
            float shown = split ? width - sideWidth * eased : width;
            for (View view : appViews) {
                if (view == null) continue;
                setMargins(view, rtl ? width - laidOut : 0, rtl ? 0 : width - laidOut);
                if (split) {
                    float inset = margin * docked;
                    float right = Math.min(laidOut, shown);
                    appOutline.set(rtl ? laidOut - right + inset : 0, (statusBar + margin) * docked,
                            rtl ? laidOut : right - inset, height, corner * docked);
                    clip(view, appOutline);
                } else {
                    unclip(view);
                }
            }
            transformTabs(split, docked, Math.round(shown), width, rtl);
            for (int i = 0; i < bottomNav.length; i++) {
                int spare = split ? width - laidOut : 0;
                setMargins(bottomNav[i], bottomNavMargins[2 * i] + (rtl ? spare : 0),
                        bottomNavMargins[2 * i + 1] + (rtl ? 0 : spare));
            }
            keepBottomNav = narrow;

            // Closed, the player is the mini player of the whole window. Opened, its column
            // rises from the middle, where the mini player is, to the end of the window.
            int centered = (width - sideWidth) / 2;
            if (!card) {
                setMargins(coordinator, 0, 0);
                coordinator.setTranslationX(0f);
                unclip(coordinator);
            } else if (full > 0f) {
                setMargins(coordinator, 0, 0);
                float left = 1f - full;
                coordinator.setTranslationX((rtl ? -appWidth : appWidth) * left);
                playerOutline.set(rtl ? 0 : margin * left, (statusBar + margin) * left,
                        rtl ? width - margin * left : width, height, corner * left);
                if (left > 0f) {
                    clip(coordinator, playerOutline);
                } else {
                    unclip(coordinator);
                }
            } else {
                setMargins(coordinator, rtl ? 0 : appWidth, rtl ? appWidth : 0);
                int laidOutAt = rtl ? 0 : appWidth;
                coordinator.setTranslationX((centered - laidOutAt) * (1f - eased));
                playerOutline.set(rtl ? 0 : margin, statusBar + margin,
                        rtl ? sideWidth - margin : sideWidth, height, corner);
                clip(coordinator, playerOutline);
            }

            // The full screen player covers the app, which is still drawn under it on every frame,
            // with live blurs of its pages, so it is not drawn while the player is open.
            setAppCovered(false);

            Player player = playerRef.get();
            if (player != null && player.isIn(root)) {
                player.apply(geometry, card, docked, full, statusBar, rtl);
            }
        }

        /**
         * The tabs at the top are laid out for the whole window. Beside the player they move to
         * the middle of the app's card, and are made smaller if they do not fit it.
         */
        private void transformTabs(boolean card, float docked, int appNow, int width, boolean rtl) {
            if (topTabs == null) return;
            // The tabs view spans the window; the pill of tabs is as wide as its blurred backdrop.
            View pill = topTabsBlur != null ? topTabsBlur : topTabs;
            if (!card) {
                if (pill.getWidth() > 0) tabsWidth = pill.getWidth();
                transform(topTabs, 0f, 1f);
                transform(topTabsBlur, 0f, 1f);
                unclip(topTabs);
                if (topTabsBlur != null) unclip(topTabsBlur);
                if (search.getVisibility() != View.GONE) search.setVisibility(View.GONE);
                return;
            }
            int natural = tabsWidth > 0 ? tabsWidth : pill.getWidth();
            if (natural == 0) return;

            // Beside the player the tabs keep their size, and the search button at their end
            // moves to the bottom of the app's card.
            float cut = SEARCH_CUT_DP * density;
            float kept = natural - cut;
            float available = appNow - 2 * TABS_MARGIN_DP * density;
            float scale = kept > available ? available / kept : 1f;
            float keptLeft = rtl ? pill.getLeft() + cut : pill.getLeft();
            float keptCenter = keptLeft + kept / 2f;
            float columnCenter = rtl ? width - appNow / 2f : appNow / 2f;
            // The views scale about their centres, which are the centre of the whole pill.
            float pillCenter = pill.getLeft() + natural / 2f;
            float dx = columnCenter - pillCenter - (keptCenter - pillCenter) * scale;
            transform(topTabs, dx, scale);
            transform(topTabsBlur, dx, scale);

            float keptStart = rtl ? cut : 0;
            int pillHeight = pill.getHeight();
            if (topTabsBlur != null) {
                tabsBlurOutline.set(keptStart, 0, keptStart + kept, pillHeight, pillHeight / 2f);
                clip(topTabsBlur, tabsBlurOutline);
            }
            float offset = pill.getLeft() - topTabs.getLeft();
            // The tabs draw their own white pill, so they are cut with the same rounded end.
            float pillTop = pill.getTop() - topTabs.getTop();
            tabsOutline.set(offset + keptStart, pillTop, offset + keptStart + kept, pillTop + pillHeight,
                    pillHeight / 2f);
            clip(topTabs, tabsOutline);

            int size = Math.round(SEARCH_SIZE_DP * density);
            float columnLeft = rtl ? width - appNow : 0;
            search.setTranslationX(columnLeft + (appNow - size) / 2f);
            search.setTranslationY(root.getHeight() - navigationBarHeight(root) - size
                    - SEARCH_BOTTOM_MARGIN_DP * density);
            search.setAlpha(docked);
            if (search.getVisibility() != View.VISIBLE) search.setVisibility(View.VISIBLE);
        }

        /** The views of the app hidden under the open player, and how they were before. */
        private final Map<View, Integer> coveredViews = new java.util.HashMap<>();

        private void setAppCovered(boolean covered) {
            if (covered) {
                if (!coveredViews.isEmpty()) return;
                for (View view : new View[]{appViews[0], appViews[1], topTabs, topTabsBlur,
                        find(root, "mini_player_blur")}) {
                    if (view == null || view.getVisibility() != View.VISIBLE) continue;
                    coveredViews.put(view, view.getVisibility());
                    view.setVisibility(View.INVISIBLE);
                }
            } else if (!coveredViews.isEmpty()) {
                for (Map.Entry<View, Integer> entry : coveredViews.entrySet()) {
                    if (entry.getKey().getVisibility() == View.INVISIBLE) {
                        entry.getKey().setVisibility(entry.getValue());
                    }
                }
                coveredViews.clear();
            }
        }

        private void reset() {
            setAppCovered(false);
            stopFullScreenAnimation();
            fullScreenProgress = 0f;
            root.setBackground(rootBackground);
            for (View view : appViews) {
                if (view == null) continue;
                setMargins(view, 0, 0);
                unclip(view);
            }
            transform(topTabs, 0f, 1f);
            transform(topTabsBlur, 0f, 1f);
            if (topTabs != null) unclip(topTabs);
            if (topTabsBlur != null) unclip(topTabsBlur);
            search.setVisibility(View.GONE);
            keepBottomNav = false;
            for (int i = 0; i < bottomNav.length; i++) {
                setMargins(bottomNav[i], bottomNavMargins[2 * i], bottomNavMargins[2 * i + 1]);
            }
            if (appViews[0] != null) appViews[0].setBackground(pagesBackground);
            setMargins(coordinator, 0, 0);
            if (coordinator != null) {
                coordinator.setTranslationX(0f);
                unclip(coordinator);
            }
            Player player = playerRef.get();
            if (player != null && player.isIn(root)) player.reset();
        }
    }

    // endregion

    // region Player

    /**
     * The views of the player fragment.
     */
    private static final class Player {
        private final WeakReference<Object> fragmentRef;
        final ViewGroup root;
        private final float density;
        private final View probe;
        private final View background;
        private final View fragmentsHost;

        /** The queue and the lyrics, beside the full screen player. */
        private final SideColumn queue;
        private final SideColumn lyrics;
        /** Takes the taps of the lyrics button of the full screen player. */
        private final View lyricsButtonCover;
        private final ImageView toggle;
        private final IconDrawable toggleIcon;

        Player(Object fragment, ViewGroup root) {
            this.fragmentRef = new WeakReference<>(fragment);
            this.root = root;
            this.density = root.getResources().getDisplayMetrics().density;
            probe = sizeProbe(root);
            background = find(root, "background_layers");
            fragmentsHost = find(root, "player_fragments_host");

            Context context = root.getContext();
            queue = new SideColumn(root, SIDE_QUEUE_COLUMN_ID, ADD_SIDE_QUEUE_METHOD, true);
            lyrics = new SideColumn(root, SIDE_LYRICS_COLUMN_ID, ADD_SIDE_LYRICS_METHOD, false);

            lyricsButtonCover = new View(context);
            lyricsButtonCover.setVisibility(View.GONE);
            lyricsButtonCover.setContentDescription("Lyrics");
            lyricsButtonCover.setOnClickListener(v -> {
                showLyrics = !showLyrics;
                Content content = contentRef.get();
                if (content != null) content.apply();
            });
            root.addView(lyricsButtonCover, new ViewGroup.LayoutParams(1, 1));

            toggle = new ImageView(context);
            toggleIcon = new IconDrawable(ICON_FULL_SCREEN, Math.round(TOGGLE_ICON_DP * density));
            toggle.setImageDrawable(toggleIcon);
            toggle.setScaleType(ImageView.ScaleType.CENTER);
            GradientDrawable glass = new GradientDrawable();
            glass.setShape(GradientDrawable.OVAL);
            glass.setColor(0x33FFFFFF);
            glass.setStroke(Math.max(1, Math.round(density)), 0x26FFFFFF);
            toggle.setBackground(glass);
            toggle.setVisibility(View.GONE);
            toggle.setOnClickListener(v -> {
                Content content = contentRef.get();
                if (content != null) content.toggleFullScreen();
            });
            int size = Math.round(TOGGLE_SIZE_DP * density);
            root.addView(toggle, new ViewGroup.LayoutParams(size, size));

            // The parts of the player in the card are laid out as wide as the card before
            // anything in them is laid out, as they take their sizes then.
            Geometry geometry = Geometry.of(root);
            if (geometry.wide) {
                setWidth(probe, geometry.sideWidth);
                int spare = geometry.width - geometry.sideWidth;
                boolean rtl = root.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
                setMargins(fragmentsHost, rtl ? spare : 0, rtl ? 0 : spare);
                setWidth(background, geometry.width);
            }
        }

        boolean isIn(View content) {
            for (ViewParent parent = root.getParent(); parent != null; parent = parent.getParent()) {
                if (parent == content) return true;
            }
            return false;
        }

        void apply(Geometry geometry, boolean card, float docked, float full, int statusBar, boolean rtl) {
            int width = geometry.width;
            int sideWidth = geometry.sideWidth;
            setWidth(probe, sideWidth);

            // The song, its lyrics and its queue are as wide as the card, wherever the player is.
            int playerWidth = card && full == 0f ? sideWidth : width;
            int spare = playerWidth - sideWidth;
            setMargins(fragmentsHost, rtl ? spare : 0, rtl ? 0 : spare);
            unclipCover();
            // The background is laid out as wide as the window once, and the card shows the start
            // of it, so going full screen only shows more of it instead of drawing it again.
            setMargins(background, 0, 0);
            setWidth(background, width);

            // The queue is made and connected as soon as the player is docked, beside the card
            // where it is cut off, so that going full screen only has to show it. It fades in
            // once the player has made room for it. The lyrics are made the first time they show.
            boolean split = full > 0f;
            // The parts connect to the player only once it is fully open, as they do not while it
            // settles open after a tap. Once shown, they stay until the player is closed.
            boolean ready = card && (docked >= 1f || queue.isShown());
            float shown = Math.max(0f, Math.min(1f, (full - 0.35f) / 0.65f));
            // As the player closes, the app moves its cover across to the mini player, under the
            // queue, so the queue fades away first.
            shown *= Math.max(0f, Math.min(1f, (docked - 0.75f) / 0.25f));
            int top = queueTop(statusBar);
            queue.apply(ready, !showLyrics, shown, width - sideWidth, rtl ? 0 : sideWidth, top);
            // The lyrics are made with the queue, so they follow the song while hidden and show
            // the line that is sung as soon as they are asked for.
            lyrics.apply(ready, showLyrics, shown, width - sideWidth,
                    rtl ? 0 : sideWidth, top);
            hideQueueButton(split);
            coverLyricsButton(split && full >= 1f);

            // The button that shows the player full screen, in the top end corner of its card.
            int size = Math.round(TOGGLE_SIZE_DP * density);
            int margin = Math.round(TOGGLE_MARGIN_DP * density);
            toggle.setTranslationX(rtl ? spare + margin : sideWidth - size - margin);
            toggle.setTranslationY(statusBar + margin);
            toggle.setAlpha(docked);
            // The player is always full screen with its queue beside it, so there is nothing to toggle.
            int visibility = View.GONE;
            if (toggle.getVisibility() != visibility) toggle.setVisibility(visibility);
            toggle.setContentDescription(fullScreen ? "Dock the player" : "Full screen player");
            toggleIcon.setPath(fullScreen ? ICON_DOCKED : ICON_FULL_SCREEN);
        }

        /**
         * As the player closes, the app moves its cover to the mini player in the middle of the
         * window, past the end of the half the song is laid out in, which would cut it off there.
         */
        private void unclipCover() {
            View cover = find(fragmentsHost, "artwork_container");
            if (cover == null) return;
            for (ViewParent parent = cover.getParent(); parent instanceof ViewGroup; parent = parent.getParent()) {
                ViewGroup group = (ViewGroup) parent;
                if (group.getClipChildren()) group.setClipChildren(false);
                if (group.getClipToPadding()) group.setClipToPadding(false);
                if (group == fragmentsHost) break;
            }
            // The half itself is cut off at its edges by the player around it.
            if (fragmentsHost != null && fragmentsHost.getParent() instanceof ViewGroup) {
                ViewGroup player = (ViewGroup) fragmentsHost.getParent();
                if (player.getClipChildren()) player.setClipChildren(false);
            }
        }

        /**
         * The moving artwork of a song fills the top of the player edge to edge. The app sizes it
         * only while the player opens, which leaves it narrower and moved over beside the
         * queue, so once the player is open it is made as wide as the player's half again.
         */
        void fitMotionArtwork(int sideWidth) {
            View motion = find(root, "motion_switcher");
            if (motion == null || motion.getWidth() == 0 || motion.getHeight() == 0) return;
            if (motion.getTranslationX() != 0f) motion.setTranslationX(0f);
            if (motion.getTranslationY() != 0f) motion.setTranslationY(0f);
            ViewGroup.LayoutParams params = motion.getLayoutParams();
            if (params != null && params.width != sideWidth) {
                params.height = Math.round(motion.getHeight() * (float) sideWidth / motion.getWidth());
                params.width = sideWidth;
                motion.setLayoutParams(params);
            }
        }

        void clearMotionFade() {
        }

        void reset() {
            setWidth(probe, ViewGroup.LayoutParams.MATCH_PARENT);
            clearMotionFade();
            setMargins(fragmentsHost, 0, 0);
            setMargins(background, 0, 0);
            setWidth(background, ViewGroup.LayoutParams.MATCH_PARENT);
            queue.hide();
            lyrics.hide();
            toggle.setVisibility(View.GONE);
            lyricsButtonCover.setVisibility(View.GONE);
            hideQueueButton(false);
        }

        /**
         * The queue beside the full screen player starts level with the cover of the player.
         */
        private int queueTop(int statusBar) {
            View cover = fragmentsHost instanceof ViewGroup ? find(fragmentsHost, "artwork_container") : null;
            if (cover != null && cover.isLaidOut() && cover.getHeight() > 0) {
                int[] coverLocation = new int[2];
                int[] rootLocation = new int[2];
                cover.getLocationInWindow(coverLocation);
                root.getLocationInWindow(rootLocation);
                int top = coverLocation[1] - rootLocation[1];
                if (top > statusBar) return top;
            }
            return statusBar + Math.round(QUEUE_TOP_DP * density);
        }

        /**
         * Full screen, the lyrics button of the player shows the lyrics in place of the queue
         * beside it, instead of in place of the cover.
         */
        private void coverLyricsButton(boolean cover) {
            View button = find(fragmentsHost, "player_lyrics");
            if (!cover || button == null || !button.isShown()) {
                if (lyricsButtonCover.getVisibility() != View.GONE) lyricsButtonCover.setVisibility(View.GONE);
                return;
            }
            int[] buttonLocation = new int[2];
            int[] rootLocation = new int[2];
            button.getLocationInWindow(buttonLocation);
            root.getLocationInWindow(rootLocation);
            ViewGroup.LayoutParams params = lyricsButtonCover.getLayoutParams();
            if (params.width != button.getWidth() || params.height != button.getHeight()) {
                params.width = button.getWidth();
                params.height = button.getHeight();
                lyricsButtonCover.setLayoutParams(params);
            }
            lyricsButtonCover.setTranslationX(buttonLocation[0] - rootLocation[0]);
            lyricsButtonCover.setTranslationY(buttonLocation[1] - rootLocation[1]);
            if (lyricsButtonCover.getVisibility() != View.VISIBLE) lyricsButtonCover.setVisibility(View.VISIBLE);
            button.setActivated(showLyrics);
        }

        /**
         * The queue is already beside the full screen player, so its button would only
         * show it a second time.
         */
        private void hideQueueButton(boolean hide) {
            View button = find(fragmentsHost, "player_queue");
            if (button == null) return;
            button.setAlpha(hide ? 0f : 1f);
            button.setClickable(!hide);
        }

        /**
         * A column beside the full screen player that holds a part of the player of the app:
         * its queue or its lyrics.
         */
        private final class SideColumn {
            final FrameLayout column;
            final String addMethod;
            boolean added;
            /** What the queue shows when nothing plays after the song. */
            private final View nothingUpNext;
            /** Shows and hides the songs played before. */
            private ImageView historyButton;
            private boolean scrollWatched;

            private ImageView makeHistoryButton(Context context) {
                ImageView button = new ImageView(context);
                button.setTag(HISTORY_BUTTON_TAG);
                button.setImageDrawable(new ClockDrawable(Math.round(18 * density), density));
                button.setScaleType(ImageView.ScaleType.CENTER);
                button.setContentDescription("History");
                // The queue lays its own hidden row of buttons over this one, so this one is above it.
                button.setTranslationZ(20 * density);
                button.setOnClickListener(v -> {
                    showHistory = !showHistory;
                    styleHistoryButton();
                    giveHistories();
                    hideHistory();
                    View list = find(column, "queue_main_content");
                    if (showHistory && list != null) {
                        // The history is added above what plays next once the app has its rows,
                        // and the list keeps its place, so it is scrolled up to it after.
                        Runnable toTop = () -> list.scrollBy(0, -list.getHeight() * 50);
                        list.postDelayed(toTop, 150);
                        list.postDelayed(toTop, 450);
                    }
                    updateNothingUpNext();
                });
                styleHistoryButton(button);
                return button;
            }

            private void styleHistoryButton() {
                if (historyButton != null) styleHistoryButton(historyButton);
            }

            private void styleHistoryButton(ImageView button) {
                GradientDrawable glass = new GradientDrawable();
                glass.setShape(GradientDrawable.OVAL);
                glass.setColor(showHistory ? 0x66FFFFFF : 0x26FFFFFF);
                button.setBackground(glass);
                button.setSelected(showHistory);
            }

            /**
             * The history button sits above the end of the queue's buttons.
             */
            private void placeHistoryButton() {
                if (historyButton == null) return;
                int size = Math.round(HISTORY_BUTTON_SIZE_DP * density);
                int margin = Math.round(HISTORY_BUTTON_MARGIN_DP * density);
                float x = column.getWidth() - size - Math.round(24 * density);
                float y = Math.max(0, column.getPaddingTop() - size - margin);
                if (historyButton.getTranslationX() != x) historyButton.setTranslationX(x);
                if (historyButton.getTranslationY() != y) historyButton.setTranslationY(y);
            }

            /**
             * Unless the history is asked for, the queue starts at what plays next, and does not
             * scroll up into the songs played before.
             */
            private void hideHistory() {
                View list = find(column, "queue_main_content");
                if (!(list instanceof ViewGroup)) return;
                if (!scrollWatched) {
                    scrollWatched = true;
                    list.setOnScrollChangeListener((v, x, y, oldX, oldY) -> pauseBackgroundWhileScrolling());
                }
                // Pulling past the end of the list stretches it, which redraws the whole list into
                // a stretched picture on every frame and made pulling at its top hitch.
                if (list.getOverScrollMode() != View.OVER_SCROLL_NEVER) list.setOverScrollMode(View.OVER_SCROLL_NEVER);
                showAllDragHandles((ViewGroup) list);
                // The app keeps its header of the history pinned above the list even when the
                // history is empty. Hidden, it takes no room, so the list starts under the buttons.
                View sticky = find(column, "sticky_header_clip_container");
                int visibility = showHistory ? View.VISIBLE : View.GONE;
                if (sticky != null && sticky.getVisibility() != visibility) sticky.setVisibility(visibility);
            }

            /**
             * Makes a hidden view and everything in it let taps through to what is under it.
             */
            private void blockTouches(ViewGroup group) {
                for (int i = 0; i < group.getChildCount(); i++) {
                    View child = group.getChildAt(i);
                    child.setClickable(false);
                    child.setLongClickable(false);
                    child.setFocusable(false);
                    child.setOnTouchListener((v, event) -> false);
                    if (child instanceof ViewGroup) blockTouches((ViewGroup) child);
                }
                group.setClickable(false);
                group.setFocusable(false);
            }

            private final Runnable resumeBackground = () -> setBackgroundAnimating(true);

            /**
             * The moving background of the player draws its picture again on every frame while it
             * moves, which leaves too little of each frame for scrolling the queue. So it holds
             * still while the queue scrolls, and moves again a moment after.
             */
            private void pauseBackgroundWhileScrolling() {
                setBackgroundAnimating(false);
                column.removeCallbacks(resumeBackground);
                column.postDelayed(resumeBackground, BACKGROUND_RESUME_MS);
            }

            private final java.util.List<android.animation.Animator> pausedAnimators = new java.util.ArrayList<>();

            private void setBackgroundAnimating(boolean animating) {
                if (animating) {
                    for (android.animation.Animator animator : pausedAnimators) {
                        if (animator.isPaused()) animator.resume();
                    }
                    pausedAnimators.clear();
                    return;
                }
                if (!pausedAnimators.isEmpty() || background == null) return;
                try {
                    for (Class<?> type = background.getClass(); type != null && type != View.class; type = type.getSuperclass()) {
                        for (java.lang.reflect.Field field : type.getDeclaredFields()) {
                            if (!android.animation.Animator.class.isAssignableFrom(field.getType())) continue;
                            field.setAccessible(true);
                            android.animation.Animator animator = (android.animation.Animator) field.get(background);
                            if (animator != null && animator.isRunning() && !animator.isPaused()) {
                                animator.pause();
                                pausedAnimators.add(animator);
                            }
                        }
                    }
                } catch (Exception ex) {
                    Log.e(TAG, "Could not hold the background still", ex);
                }
            }

            /**
             * The app only tells the queue that its songs can be moved after it has laid out its
             * first rows, which then lack the handle they are dragged by. If any row has it, every
             * row gets it.
             */
            private void showAllDragHandles(ViewGroup list) {
                int handleId = idOf(list, "list_right_icon");
                boolean editable = false;
                for (int i = 0; i < list.getChildCount() && !editable; i++) {
                    View handle = list.getChildAt(i).findViewById(handleId);
                    editable = handle != null && handle.getVisibility() == View.VISIBLE;
                }
                if (!editable) return;
                for (int i = 0; i < list.getChildCount(); i++) {
                    View handle = list.getChildAt(i).findViewById(handleId);
                    if (handle != null && handle.getVisibility() == View.INVISIBLE) handle.setVisibility(View.VISIBLE);
                }
            }

            private int idOf(View view, String name) {
                Integer id = idsByName.get(name);
                if (id == null) {
                    id = view.getResources().getIdentifier(name, "id", view.getContext().getPackageName());
                    idsByName.put(name, id);
                }
                return id;
            }

            SideColumn(ViewGroup root, int id, String addMethod, boolean isQueue) {
                this.addMethod = addMethod;
                // The column is there even while it is not shown, so that the part the app
                // restores always finds it.
                column = new FrameLayout(root.getContext());
                column.setId(id);
                column.setVisibility(View.GONE);
                column.setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() {
                    @Override
                    public void onChildViewAdded(View parent, View child) {
                        tidy();
                        child.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> tidy());
                    }

                    @Override
                    public void onChildViewRemoved(View parent, View child) {
                    }
                });
                root.addView(column, new ViewGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

                if (isQueue) {
                    nothingUpNext = makeNothingUpNext(root.getContext());
                    column.addView(nothingUpNext, new FrameLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
                    column.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
                        hideHistory();
                        updateNothingUpNext();
                        placeHistoryButton();
                    });
                    historyButton = makeHistoryButton(root.getContext());
                    column.getViewTreeObserver().addOnPreDrawListener(() -> {
                        hideHistory();
                        return true;
                    });
                    int size = Math.round(HISTORY_BUTTON_SIZE_DP * density);
                    column.addView(historyButton, new FrameLayout.LayoutParams(size, size));
                } else {
                    nothingUpNext = null;
                }
            }

            private View makeNothingUpNext(Context context) {
                android.widget.LinearLayout box = new android.widget.LinearLayout(context);
                box.setTag(NOTHING_UP_NEXT_TAG);
                box.setOrientation(android.widget.LinearLayout.VERTICAL);
                box.setGravity(android.view.Gravity.CENTER_HORIZONTAL);
                int padding = Math.round(32 * density);
                box.setPadding(padding, 0, padding, 0);
                box.setVisibility(View.GONE);

                android.widget.TextView title = new android.widget.TextView(context);
                title.setText("Nothing Up Next");
                title.setTextColor(0xE6FFFFFF);
                title.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, 22);
                title.setTypeface(android.graphics.Typeface.create("sans-serif-medium", android.graphics.Typeface.NORMAL));
                title.setGravity(android.view.Gravity.CENTER);
                box.addView(title);

                android.widget.TextView hint = new android.widget.TextView(context);
                hint.setText("Turn on Autoplay to keep the music going with similar songs, or add songs with Play Next.");
                hint.setTextColor(0x99FFFFFF);
                hint.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, 16);
                hint.setGravity(android.view.Gravity.CENTER);
                hint.setLineSpacing(0, 1.15f);
                android.widget.LinearLayout.LayoutParams hintParams = new android.widget.LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                hintParams.topMargin = Math.round(8 * density);
                box.addView(hint, hintParams);
                return box;
            }

            /**
             * Shows that nothing plays after the song under the history, when the queue ends
             * without anything up next, as for a song played on its own.
             */
            private void updateNothingUpNext() {
                if (nothingUpNext == null) return;
                View list = find(column, "queue_main_content");
                boolean show = false;
                float y = 0;
                if (list instanceof ViewGroup && list.getVisibility() == View.INVISIBLE && !showHistory) {
                    // The history is hidden and nothing plays next: the note takes the list's place.
                    int[] listLocation = new int[2];
                    int[] columnLocation = new int[2];
                    list.getLocationInWindow(listLocation);
                    column.getLocationInWindow(columnLocation);
                    show = true;
                    y = listLocation[1] - columnLocation[1] - 24 * density;
                } else if (list instanceof ViewGroup && list.isShown() && !list.canScrollVertically(1)) {
                    ViewGroup items = (ViewGroup) list;
                    int upNext = idOf(list, "upnext_item_container");
                    int upNextHeader = idOf(list, "header_up_next_container");
                    show = true;
                    int bottom = 0;
                    for (int i = 0; i < items.getChildCount(); i++) {
                        View item = items.getChildAt(i);
                        if (item.getId() == upNext || item.getId() == upNextHeader) {
                            show = false;
                            break;
                        }
                        bottom = Math.max(bottom, item.getBottom());
                    }
                    if (show) {
                        int[] listLocation = new int[2];
                        int[] columnLocation = new int[2];
                        list.getLocationInWindow(listLocation);
                        column.getLocationInWindow(columnLocation);
                        y = listLocation[1] - columnLocation[1] + bottom + 56 * density;
                    }
                }
                int visibility = show ? View.VISIBLE : View.GONE;
                if (nothingUpNext.getVisibility() != visibility) nothingUpNext.setVisibility(visibility);
                if (show && nothingUpNext.getTranslationY() != y) nothingUpNext.setTranslationY(y);
            }

            /** Where the top of the cover is, from the top of the player. */
            private int coverTop;
            private boolean alignListening;

            /**
             * Moves the part so the first thing in it, the buttons of the queue or the top of the
             * lyrics, starts level with the top of the cover beside it.
             */
            private void alignWithCover() {
                if (coverTop <= 0 || column.getVisibility() != View.VISIBLE) return;
                View part = part();
                if (part == null || !part.isLaidOut()) return;
                View first = find(column, "player_action_buttons");
                if (first == null || !first.isShown() || first.getHeight() == 0) {
                    first = find(column, "lyrics_main_content");
                }
                if (first == null || first.getHeight() == 0) return;
                int[] firstLocation = new int[2];
                int[] rootLocation = new int[2];
                first.getLocationInWindow(firstLocation);
                root.getLocationInWindow(rootLocation);
                int off = coverTop - (firstLocation[1] - rootLocation[1]);
                if (Math.abs(off) <= 1) return;
                int padding = Math.max(0, column.getPaddingTop() + off);
                if (padding != column.getPaddingTop()) column.setPadding(0, padding, 0, 0);
                placeHistoryButton();
            }

            /** The part of the player in the column, beside the views of the patch. */
            private View part() {
                for (int i = 0; i < column.getChildCount(); i++) {
                    View child = column.getChildAt(i);
                    if (!(child.getTag() instanceof String && ((String) child.getTag()).startsWith(OWN_VIEW_TAG))) return child;
                }
                return null;
            }

            boolean isShown() {
                return column.getVisibility() == View.VISIBLE;
            }

            void apply(boolean ready, boolean selected, float shown, int width, int x, int top) {
                if (!ready) {
                    hide();
                    return;
                }
                boolean appearing = column.getVisibility() != View.VISIBLE;
                ensureAdded();
                setWidth(column, width);
                column.setTranslationX(x);
                // The buttons at the top of the part are level with the top of the cover. Where
                // they end up is measured after every layout, as the part moves itself around.
                coverTop = top;
                if (!alignListening) {
                    alignListening = true;
                    column.getViewTreeObserver().addOnPreDrawListener(() -> {
                        alignWithCover();
                        return true;
                    });
                }
                if (column.getPaddingTop() == 0) column.setPadding(0, top, 0, 0);
                alignWithCover();
                float alpha = selected ? shown : 0f;
                // The part fades in once the player is open.
                if (appearing) column.setAlpha(0f);
                if (column.getAlpha() != alpha) {
                    column.animate().cancel();
                    // Switching between the queue and the lyrics fades between them.
                    if (shown >= 1f && Math.abs(column.getAlpha() - alpha) > 0.05f) {
                        column.animate().alpha(alpha).setDuration(200).start();
                    } else {
                        column.setAlpha(alpha);
                    }
                }
                // A column that is not shown takes no taps.
                column.setTranslationZ(selected ? 1f : 0f);
                this.selected = selected;
                if (column.getVisibility() == View.GONE) column.setVisibility(View.VISIBLE);
                updateDrawn();
                tidy();
            }

            private boolean selected;
            private long partSince;

            /**
             * A part that is not shown is not drawn either, once it has had time to connect to the
             * player, which it only does once it is drawn. It still follows the song.
             */
            private void updateDrawn() {
                if (column.getVisibility() == View.GONE && !isReadyToShow()) return;
                View part = part();
                long now = android.os.SystemClock.uptimeMillis();
                if (part == null) {
                    partSince = 0;
                } else if (partSince == 0) {
                    partSince = now;
                    column.postDelayed(this::updateDrawn, PART_CONNECT_MS + 50);
                }
                boolean connected = partSince != 0 && now - partSince >= PART_CONNECT_MS;
                boolean draw = selected || !connected || column.getAlpha() > 0.01f;
                int visibility = draw ? View.VISIBLE : View.INVISIBLE;
                if (column.getVisibility() != visibility) column.setVisibility(visibility);
                if (!selected && column.getAlpha() > 0.01f) {
                    // Hidden once it has faded away.
                    column.postDelayed(this::updateDrawn, 250);
                }
            }

            private boolean isReadyToShow() {
                return column.getVisibility() != View.GONE;
            }

            void hide() {
                column.animate().cancel();
                selected = false;
                if (column.getVisibility() != View.GONE) column.setVisibility(View.GONE);
            }

            private void ensureAdded() {
                if (added) return;
                Object fragment = fragmentRef.get();
                if (fragment == null) return;
                added = true;
                try {
                    Method add = fragment.getClass().getMethod(addMethod, int.class);
                    add.invoke(fragment, column.getId());
                } catch (Exception ex) {
                    Log.e(TAG, "Could not add a part beside the player", ex);
                }
            }

            /**
             * The part does without what the player beside it shows: the playing song above
             * it, and the controls under it.
             *
             * The part only connects to the player once the small video view of its playing
             * song is drawn, so that one is kept as the app lays it out, only see-through, and the
             * part is moved up over it. Nothing the app lays out itself is changed, as the part
             * loads again whenever that video view is made again.
             */
            private void tidy() {
                View part = part();
                if (part == null) return;
                View playing = find(column, "current_player_item");
                // The part sizes the fade at the end of its list by where its controls are, so
                // they stay laid out, only see-through and pushed below the bottom of the window.
                int below = 0;
                for (String name : new String[]{"controls", "controls_tap_target"}) {
                    View view = find(column, name);
                    if (view == null) continue;
                    if (view.getVisibility() == View.GONE) view.setVisibility(View.VISIBLE);
                    if (view.getAlpha() != 0f) view.setAlpha(0f);
                    if (view.getImportantForAccessibility() != View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS) {
                        view.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
                    }
                    if ("controls".equals(name)) below = view.getHeight();
                }
                int hidden = 0;
                if (playing != null) {
                    if (playing.getAlpha() != 0f) playing.setAlpha(0f);
                    if (playing.getImportantForAccessibility() != View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS) {
                        playing.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
                    }
                    // The hidden row takes no taps.
                    if (!(playing.getTag(TOUCH_BLOCKED_KEY) instanceof Boolean)) {
                        playing.setTag(TOUCH_BLOCKED_KEY, Boolean.TRUE);
                        if (playing instanceof ViewGroup) {
                            blockTouches((ViewGroup) playing);
                        }
                    }
                    hidden = playing.getBottom();
                }
                if (part.getTranslationY() != -hidden) part.setTranslationY(-hidden);
                int available = column.getHeight() - column.getPaddingTop();
                ViewGroup.LayoutParams params = part.getLayoutParams();
                int height = available + hidden + below;
                if (available > 0 && params != null && params.height != height) {
                    params.height = height;
                    part.setLayoutParams(params);
                }
            }
        }
    }

    // endregion

    // region Helpers

    /**
     * The size of the window and of its columns.
     */
    private static final class Geometry {
        final int width;
        final int height;
        final boolean wide;
        final int sideWidth;
        final int appWidth;

        private Geometry(int width, int height, float density) {
            this.width = width;
            this.height = height;
            wide = width / density >= MIN_WINDOW_WIDTH_DP && height / density >= MIN_WINDOW_HEIGHT_DP;
            // The player keeps the same width whichever way the phone is turned, as it takes the
            // sizes of its cover and moving artwork only once, so it is half the shorter side.
            sideWidth = Math.round(Math.max(MIN_SIDE_WIDTH_DP * density,
                    Math.min(MAX_SIDE_WIDTH_DP * density, Math.min(width, height) / 2f)));
            appWidth = width - sideWidth;
        }

        /**
         * The size of the window the view is in. Before the views are laid out, the size of the
         * window is asked, as the content of the app fills it.
         */
        static Geometry of(View view) {
            float density = view.getResources().getDisplayMetrics().density;
            View content = contentOf(view);
            if (content != null && content.getWidth() > 0 && content.getHeight() > 0) {
                return new Geometry(content.getWidth(), content.getHeight(), density);
            }
            Rect bounds = windowBounds(view.getContext());
            return new Geometry(bounds.width(), bounds.height(), density);
        }

        /**
         * The view of the fragment that holds the pages and the player, which fills the window.
         */
        private static View contentOf(View view) {
            Content content = contentRef.get();
            if (content == null) return null;
            for (View v = view; v != null; v = v.getParent() instanceof View ? (View) v.getParent() : null) {
                if (v == content.root) return v;
            }
            return null;
        }

        private static Rect windowBounds(Context context) {
            if (Build.VERSION.SDK_INT >= 30) {
                WindowManager windowManager = context.getSystemService(WindowManager.class);
                if (windowManager != null) return windowManager.getCurrentWindowMetrics().getBounds();
            }
            DisplayMetrics metrics = context.getResources().getDisplayMetrics();
            return new Rect(0, 0, metrics.widthPixels, metrics.heightPixels);
        }
    }

    /**
     * The view the player is measured by: the whole player, or docked, as wide as its card.
     */
    private static View sizeProbe(ViewGroup root) {
        View probe = sizeProbes.get(root);
        if (probe == null) {
            probe = new View(root.getContext());
            probe.setVisibility(View.INVISIBLE);
            probe.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            root.addView(probe, 0, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            sizeProbes.put(root, probe);
        }
        return probe;
    }

    /** The ids of the views of the app by their names, which take a while to look up. */
    private static final Map<String, Integer> idsByName = new java.util.HashMap<>();

    /**
     * The views found under each view, as views are looked for on every frame, and looking
     * through the whole player each time made scrolling the queue hitch.
     */
    private static final Map<View, Map<String, WeakReference<View>>> foundViews = new WeakHashMap<>();
    private static final Map<View, Map<String, Long>> notFoundAt = new WeakHashMap<>();
    private static final long LOOK_AGAIN_AFTER_MS = 500;

    private static View find(View parent, String name) {
        if (parent == null) return null;
        Map<String, WeakReference<View>> found = foundViews.get(parent);
        if (found != null) {
            WeakReference<View> ref = found.get(name);
            View view = ref == null ? null : ref.get();
            if (view != null && isUnder(view, parent)) return view;
        }
        Map<String, Long> missing = notFoundAt.get(parent);
        long now = android.os.SystemClock.uptimeMillis();
        if (missing != null) {
            Long at = missing.get(name);
            if (at != null && now - at < LOOK_AGAIN_AFTER_MS) return null;
        }

        Integer id = idsByName.get(name);
        if (id == null) {
            id = parent.getResources().getIdentifier(name, "id", parent.getContext().getPackageName());
            idsByName.put(name, id);
        }
        View view = id == 0 ? null : parent.findViewById(id);
        if (view != null) {
            if (found == null) {
                found = new java.util.HashMap<>();
                foundViews.put(parent, found);
            }
            found.put(name, new WeakReference<>(view));
        } else {
            if (missing == null) {
                missing = new java.util.HashMap<>();
                notFoundAt.put(parent, missing);
            }
            missing.put(name, now);
        }
        return view;
    }

    private static boolean isUnder(View view, View parent) {
        if (view == parent) return true;
        for (ViewParent p = view.getParent(); p != null; p = p.getParent()) {
            if (p == parent) return true;
        }
        return false;
    }

    /**
     * Sets the start and end margins, which the layouts of the app use for these views,
     * only as they change, as every change lays the views out again.
     */
    private static void setMargins(View view, int start, int end) {
        if (view == null || !(view.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return;
        ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        if (params.getMarginStart() == start && params.getMarginEnd() == end) return;
        params.setMarginStart(start);
        params.setMarginEnd(end);
        view.setLayoutParams(params);
    }

    private static int marginStart(View view) {
        if (view == null || !(view.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return 0;
        return ((ViewGroup.MarginLayoutParams) view.getLayoutParams()).getMarginStart();
    }

    private static int marginEnd(View view) {
        if (view == null || !(view.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return 0;
        return ((ViewGroup.MarginLayoutParams) view.getLayoutParams()).getMarginEnd();
    }

    private static void setWidth(View view, int width) {
        if (view == null || view.getLayoutParams() == null) return;
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (params.width == width) return;
        params.width = width;
        view.setLayoutParams(params);
    }

    private static void transform(View view, float translationX, float scale) {
        if (view == null) return;
        if (view.getTranslationX() != translationX) view.setTranslationX(translationX);
        if (view.getScaleX() != scale) view.setScaleX(scale);
        if (view.getScaleY() != scale) view.setScaleY(scale);
    }

    private static int statusBarHeight(View view) {
        WindowInsets insets = view.getRootWindowInsets();
        if (insets == null) return 0;
        if (Build.VERSION.SDK_INT >= 30) {
            return insets.getInsets(WindowInsets.Type.statusBars()).top;
        }
        return insets.getSystemWindowInsetTop();
    }

    private static int navigationBarHeight(View view) {
        WindowInsets insets = view.getRootWindowInsets();
        if (insets == null) return 0;
        if (Build.VERSION.SDK_INT >= 30) {
            return insets.getInsets(WindowInsets.Type.navigationBars()).bottom;
        }
        return insets.getSystemWindowInsetBottom();
    }

    /**
     * The background of the window, which shows through the see-through pages of the app.
     */
    private static Drawable windowBackground(View view) {
        android.util.TypedValue value = new android.util.TypedValue();
        Context context = view.getContext();
        if (context.getTheme().resolveAttribute(android.R.attr.windowBackground, value, true)) {
            if (value.type >= android.util.TypedValue.TYPE_FIRST_COLOR_INT
                    && value.type <= android.util.TypedValue.TYPE_LAST_COLOR_INT) {
                return new ColorDrawable(value.data);
            }
            if (value.resourceId != 0) {
                try {
                    Drawable drawable = context.getDrawable(value.resourceId);
                    if (drawable != null) return drawable;
                } catch (Exception ignored) {
                }
            }
        }
        if (context.getTheme().resolveAttribute(android.R.attr.colorBackground, value, true)) {
            return new ColorDrawable(value.data);
        }
        return new ColorDrawable(Color.BLACK);
    }

    /**
     * A rounded rectangle, the part of the tabs kept beside the docked player.
     */
    private static final class TabsOutline extends ViewOutlineProvider {
        private float left, top, right, bottom, radius;

        void set(float left, float top, float right, float bottom, float radius) {
            this.left = left;
            this.top = top;
            this.right = right;
            this.bottom = bottom;
            this.radius = radius;
        }

        @Override
        public void getOutline(View view, Outline outline) {
            outline.setRoundRect(Math.round(left), Math.round(top), Math.round(right), Math.round(bottom), radius);
        }
    }

    /**
     * A clock, for the history.
     */
    private static final class ClockDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int size;

        ClockDrawable(int size, float density) {
            this.size = size;
            paint.setColor(Color.WHITE);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeWidth(2f * density);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            float cx = bounds.exactCenterX();
            float cy = bounds.exactCenterY();
            float radius = size * 0.45f;
            canvas.drawCircle(cx, cy, radius, paint);
            canvas.drawLine(cx, cy, cx, cy - radius * 0.6f, paint);
            canvas.drawLine(cx, cy, cx + radius * 0.45f, cy + radius * 0.3f, paint);
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * A magnifying glass.
     */
    private static final class SearchDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int size;

        SearchDrawable(int size, int color, float density) {
            this.size = size;
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeWidth(2.4f * density);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            float left = bounds.left + (bounds.width() - size) / 2f;
            float top = bounds.top + (bounds.height() - size) / 2f;
            float radius = size * 0.34f;
            float cx = left + size * 0.42f;
            float cy = top + size * 0.42f;
            canvas.drawCircle(cx, cy, radius, paint);
            float d = radius * 0.7071f;
            canvas.drawLine(cx + d, cy + d, left + size * 0.9f, top + size * 0.9f, paint);
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    private static void clip(View view, ViewOutlineProvider outline) {
        if (view.getOutlineProvider() != outline) {
            view.setOutlineProvider(outline);
        }
        if (!view.getClipToOutline()) view.setClipToOutline(true);
        view.invalidateOutline();
    }

    private static void unclip(View view) {
        if (view.getOutlineProvider() instanceof CardOutline || view.getOutlineProvider() instanceof TabsOutline) {
            view.setClipToOutline(false);
            view.setOutlineProvider(ViewOutlineProvider.BACKGROUND);
        }
    }

    /**
     * A rounded card whose bottom corners are below the bottom of the window.
     */
    private static final class CardOutline extends ViewOutlineProvider {
        private float left, top, right, bottom, radius;

        void set(float left, float top, float right, float bottom, float radius) {
            this.left = left;
            this.top = top;
            this.right = right;
            this.bottom = bottom;
            this.radius = radius;
        }

        @Override
        public void getOutline(View view, Outline outline) {
            outline.setRoundRect(Math.round(left), Math.round(top), Math.round(right),
                    Math.round(bottom + radius), radius);
        }
    }

    /**
     * A white icon from the path of a Material Symbol, which only uses absolute moves and lines.
     */
    private static final class IconDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final Path scaled = new Path();
        private final Matrix matrix = new Matrix();
        private final int size;
        private String pathData;

        IconDrawable(String pathData, int size) {
            this.size = size;
            paint.setColor(Color.WHITE);
            paint.setStyle(Paint.Style.FILL);
            setPath(pathData);
        }

        void setPath(String pathData) {
            if (pathData.equals(this.pathData)) return;
            this.pathData = pathData;
            parse(pathData, path);
            invalidateSelf();
        }

        private static int numberEnd(String data, int start) {
            int i = start;
            while (i < data.length() && (Character.isDigit(data.charAt(i)) || data.charAt(i) == '.'
                    || (i == start && data.charAt(i) == '-'))) {
                i++;
            }
            return i;
        }

        private static void parse(String data, Path path) {
            path.reset();
            float x = 0, y = 0;
            char command = 'M';
            int i = 0;
            int length = data.length();
            while (i < length) {
                char c = data.charAt(i);
                if (Character.isLetter(c)) {
                    command = c;
                    i++;
                    if (command == 'Z' || command == 'z') path.close();
                    continue;
                }
                if (c == ',' || c == ' ') {
                    i++;
                    continue;
                }
                int end = numberEnd(data, i);
                float value = Float.parseFloat(data.substring(i, end));
                i = end;
                switch (command) {
                    case 'H':
                        x = value;
                        path.lineTo(x, y);
                        break;
                    case 'V':
                        y = value;
                        path.lineTo(x, y);
                        break;
                    case 'M':
                    case 'L': {
                        while (i < length && (data.charAt(i) == ',' || data.charAt(i) == ' ')) i++;
                        int second = numberEnd(data, i);
                        x = value;
                        y = Float.parseFloat(data.substring(i, second));
                        i = second;
                        if (command == 'M') {
                            path.moveTo(x, y);
                            command = 'L';
                        } else {
                            path.lineTo(x, y);
                        }
                        break;
                    }
                    default:
                        break;
                }
            }
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            float scale = size / 24f;
            matrix.setScale(scale, scale);
            matrix.postTranslate(bounds.left + (bounds.width() - size) / 2f, bounds.top + (bounds.height() - size) / 2f);
            path.transform(matrix, scaled);
            canvas.drawPath(scaled, paint);
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    // endregion
}
