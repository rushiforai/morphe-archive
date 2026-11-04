package app.wordfeudwordfinder.extension.ui;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LightingColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import app.wordfeudwordfinder.extension.core.WfError;
import app.wordfeudwordfinder.extension.core.WordFinder;
import app.wordfeudwordfinder.extension.game.BoardLayout;
import app.wordfeudwordfinder.extension.game.GameState;
import app.wordfeudwordfinder.extension.game.RawGame;
import app.wordfeudwordfinder.extension.game.Ruleset;
import app.wordfeudwordfinder.extension.hooks.RouteTap;
import app.wordfeudwordfinder.extension.play.FlutterBridge;
import app.wordfeudwordfinder.extension.play.MoveSubmitter;
import app.wordfeudwordfinder.extension.play.Refresher;
import app.wordfeudwordfinder.extension.solver.Move;
import app.wordfeudwordfinder.extension.solver.Rules;
import app.wordfeudwordfinder.extension.solver.SortMode;
import app.wordfeudwordfinder.extension.ui.Strings.Key;
import app.wordfeudwordfinder.extension.words.WordGraph;
import app.wordfeudwordfinder.extension.words.WordListManager;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * The floating button and the overlay (spec section 9), hook H3. {@link #attach} is called at the start of
 * {@code MainActivity.onCreate} and defers all work to the main looper. One controller per activity; it is dropped when that activity is destroyed.
 *
 * <p>Threading: every view is touched on the main thread only. Listener calls from {@code GameStore},
 * {@code RouteTap} and the word list manager arrive on other threads and are posted to the main thread. Move
 * generation runs on one background executor; a new computation cancels the previous one through
 * {@link Computations}. Nothing in here may throw into the app: every entry point catches Throwable.
 */
public final class OverlayController {

    // ---- layout constants (dp / sp) ----
    private static final int PANEL_MARGIN_DP = 8;
    private static final int PANEL_PADDING_DP = 12;
    private static final int PANEL_RADIUS_DP = 16;
    private static final int HEADER_HEIGHT_DP = 44;
    private static final int RACK_TILE_DP = 36;
    private static final int RACK_GAP_DP = 3;
    private static final int SECTION_GAP_DP = 8;
    private static final int BUTTON_HEIGHT_DP = Widgets.BUTTON_HEIGHT_DP;
    private static final int FAB_ELEVATION_DP = 6;
    /** The preview board takes at most this share of the panel height, so the list always keeps some room. */
    private static final float BOARD_MAX_HEIGHT_FRACTION = 0.5f;
    private static final int SCRIM = 0x99000000;

    /**
     * Created lazily (not in the static initializer): attach() runs inside the app's onCreate, and an error thrown
     * while initialising this class would escape attach()'s try/catch.
     */
    private static volatile Handler main;
    private static final AtomicBoolean LISTENERS_ADDED = new AtomicBoolean(false);
    private static volatile ExecutorService executor;
    /** The controller of the live MainActivity; null when none. Main thread writes only. */
    private static volatile OverlayController current;

    // ---- per activity ----
    private Activity activity;
    private final WordFinder wf;
    private final float density;
    private final Computations computations = new Computations();
    /** Play button state; per activity, so a pending MV-NET block also holds for a reopened overlay. */
    private final PlayState play = new PlayState();
    private final Application.ActivityLifecycleCallbacks lifecycle;
    private FrameLayout layer;
    private View fab;
    /** Makes the button look as if it lies under Wordfeud's menus, and reads the board colours; null before build(). */
    private ScreenSampler sampler;
    /** Rows of the button not covered by a Wordfeud menu, and whether it takes touches (not under a scrim). */
    private ScreenShade.Cover fabCover = new ScreenShade.Cover(Integer.MAX_VALUE, 1f);
    /** The part of the button not under a Wordfeud menu, or null when nothing is cut. */
    private android.graphics.Path fabClip;
    private Long sampledGameId;
    private boolean fabTouchable = true;
    private final View.OnLayoutChangeListener fabRelayout = (v, l, t, r, b, ol, ot, or, ob) -> positionFab();

    // ---- open overlay session (main thread) ----
    private boolean open;
    /** Incremented on every open and close; late callbacks from an earlier session compare against it. */
    private int session;
    private long gameId;
    private GameState state;
    private RawGame game;
    private Ruleset ruleset;
    private BoardLayout layout;
    private String lang = "en";
    private Theme theme = Theme.DARK;
    private SortMode sort = SortMode.SCORE;
    /** The sorted list shown, or null while it is (re)computed. */
    private List<Move> moves;
    private Move selected;
    private WordGraph readyGraph;
    private int readyGraphRuleset = -1;
    private boolean wordListRequested;
    /** Counts ensureForOverlay calls; callbacks of an earlier attempt (before a Retry) are ignored. */
    private int wordListAttempt;
    /** The word list error of this open overlay; it stays shown (no automatic retry) until Retry or reopen. */
    private WfError wordListError;
    private Object backCallback;
    private View focusBeforeOpen;

    // ---- overlay views (null while closed) ----
    private FrameLayout overlayRoot;
    private LinearLayout panel;
    private LinearLayout rackRow;
    private BoardPreviewView board;
    private DownloadProgress progress;
    private ErrorPanel errorPanel;
    private LinearLayout infoRow;
    private TextView infoWord;
    private TextView infoDetail;
    private TextView infoScore;
    private TextView playButton;
    private TextView notYourTurn;
    private LinearLayout sortRow;
    private final TextView[] sortButtons = new TextView[SortMode.values().length];
    private ListView list;
    private MoveListAdapter adapter;

    private OverlayController(Activity a, WordFinder wf) {
        this.activity = a;
        this.wf = wf;
        this.density = a.getResources().getDisplayMetrics().density;
        this.lifecycle = new Lifecycle(this);
    }

    // =====================================================================================================
    // Entry point
    // =====================================================================================================

    /**
     * Hook H3, called at the START of {@code MainActivity.onCreate} (before super.onCreate). It must only post:
     * nothing here may touch the window or the content view synchronously. The posted work runs after onCreate
     * has returned. Never throws; on any failure the app is left as it is.
     */
    public static void attach(Activity a) {
        try {
            if (a == null) return;
            // Called before super.onCreate: build the views later, once onCreate has returned and the content
            // view is in place.
            main().post(() -> {
                try {
                    attachNow(a);
                } catch (Throwable ignored) {
                    // the app keeps working without the word finder
                }
            });
        } catch (Throwable ignored) {
            // hooks never change app behaviour
        }
    }

    private static void attachNow(Activity a) {
        if (a.isFinishing() || a.isDestroyed()) return;
        OverlayController old = current;
        if (old != null) {
            if (old.activity == a) return;
            old.detach();
        }
        WordFinder wf = WordFinder.get();
        if (wf == null) return;
        ViewGroup content = a.findViewById(android.R.id.content);
        if (content == null) return;
        OverlayController c = new OverlayController(a, wf);
        try {
            c.build(content);
            a.getApplication().registerActivityLifecycleCallbacks(c.lifecycle);
        } catch (Throwable t) {
            c.detach();
            return;
        }
        current = c;
        // Refresher sends its platform messages to this activity's Flutter engine (Task 15); never throws.
        FlutterBridge.install(a);
        if (LISTENERS_ADDED.compareAndSet(false, true)) {
            // GameStore and RouteTap have no removeListener, so these are added once and forward to `current`.
            Runnable r = OverlayController::postRefreshCurrent;
            wf.gameStore().addListener(r);
            RouteTap.addListener(r);
        }
        c.refresh();
    }

    private static void postRefreshCurrent() {
        main().post(() -> {
            OverlayController c = current;
            if (c != null) c.refresh();
        });
    }

    private static Handler main() {
        Handler h = main;
        if (h == null) {
            h = new Handler(Looper.getMainLooper());
            main = h;
        }
        return h;
    }

    private static ExecutorService executor() {
        ExecutorService ex = executor;
        if (ex == null) {
            synchronized (OverlayController.class) {
                if (executor == null) {
                    ThreadPoolExecutor t = new ThreadPoolExecutor(1, 1, 30, TimeUnit.SECONDS,
                            new LinkedBlockingQueue<>(), r -> {
                                Thread th = new Thread(r, "wfwf-overlay");
                                th.setDaemon(true);
                                return th;
                            });
                    t.allowCoreThreadTimeOut(true);
                    executor = t;
                }
                ex = executor;
            }
        }
        return ex;
    }

    /** Runs {@code r} on the background executor, swallowing everything it throws. */
    private static void background(Runnable r) {
        executor().execute(() -> {
            try {
                r.run();
            } catch (Throwable ignored) {
                // a failed computation only leaves the overlay without a list
            }
        });
    }

    /** Runs {@code r} on the main thread if this controller is still attached, swallowing everything it throws. */
    private void ui(Runnable r) {
        main().post(() -> {
            if (activity == null) return;
            try {
                r.run();
            } catch (Throwable ignored) {
                // UI failures never reach the app
            }
        });
    }

    // =====================================================================================================
    // Layer and floating button
    // =====================================================================================================

    private void build(ViewGroup content) {
        Context ctx = activity;
        layer = new FrameLayout(ctx) {
            @Override
            public boolean dispatchTouchEvent(MotionEvent e) {
                // Only notices touches: the layer consumes nothing, so they still reach the game underneath.
                if (e.getActionMasked() == MotionEvent.ACTION_DOWN && sampler != null) sampler.onTouch();
                return super.dispatchTouchEvent(e);
            }
        };
        // The layer itself never consumes touches, so the game underneath stays usable while the overlay is closed.
        layer.setClickable(false);
        layer.setFocusable(false);
        content.addView(layer, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        int size = FabPlacement.dp(density, FabPlacement.FAB_SIZE_DP);
        View b = new View(ctx) {
            @Override
            public boolean dispatchTouchEvent(MotionEvent e) {
                // Under a menu or scrim the button lets touches through to Wordfeud, as if it lay beneath them.
                if (!fabTouchable || e.getY() >= fabCover.rowsAt((int) e.getX())) return false;
                return super.dispatchTouchEvent(e);
            }

            @Override
            public void draw(Canvas c) {
                android.graphics.Path clip = fabClip;
                if (clip == null) {
                    super.draw(c);
                    return;
                }
                int save = c.save();
                c.clipPath(clip);
                super.draw(c);
                c.restoreToCount(save);
            }
        };
        b.setBackground(new FabDrawable(theme));
        b.setElevation(dp(FAB_ELEVATION_DP));
        b.setContentDescription(Strings.get(language(), Key.TITLE));
        b.setClickable(true);
        b.setOnClickListener(v -> {
            try {
                openOverlay();
            } catch (Throwable ignored) {
                // a broken overlay must not crash the game
            }
        });
        b.setVisibility(View.GONE);
        fab = b;
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(size, size, Gravity.BOTTOM | Gravity.END);
        layer.addView(fab, lp);
        sampler = new ScreenSampler(activity, fab, density, this::applyCover);
        layer.addOnLayoutChangeListener(fabRelayout);
        layer.setOnApplyWindowInsetsListener((v, insets) -> {
            ui(this::positionFab);
            return insets;
        });
    }

    /** Main thread: button visibility and position, and closes the overlay when its game is no longer shown. */
    private void refresh() {
        if (activity == null || layer == null) return;
        Long id = RouteTap.currentGameId();
        GameState st = id == null ? null : wf.gameStore().state(id);
        boolean visible = OverlayVisibility.fabVisible(id, st);
        if (open) {
            if (!visible || id == null || id != gameId) {
                close();
            } else if (st == null && state == null) {
                // still loading (a new game): keep showing GAME_LOADING until the store has the game
            } else if (!MovePipeline.sameInput(state, st)) {
                state = st;
                loadGame();
            } else {
                state = st;
                updatePlayEnabled();
            }
        }
        boolean eligible = visible && !open;
        fab.setVisibility(eligible ? View.VISIBLE : View.GONE);
        if (sampler != null) {
            if (!java.util.Objects.equals(id, sampledGameId)) {
                sampledGameId = id;
                sampler.resetScrim();
            }
            sampler.setAppDark(RouteTap.isDark());
            sampler.setContentTop(contentTopInWindow());
            sampler.setActive(eligible);
        }
        positionFab();
    }

    /** Main thread (sampler callbacks): cut off and darken the button like the Wordfeud menu over it. */
    private void applyCover(ScreenShade.Cover c) {
        if (fab == null) return;
        int h = fab.getHeight();
        boolean untouched = h <= 0 || c.untouched(h);
        fabCover = c;
        fabTouchable = untouched;
        fabClip = clipPath(c, fab.getWidth(), h);
        fab.invalidate();
        Drawable d = fab.getBackground();
        if (d != null) {
            int g = Math.round(Math.max(0f, Math.min(1f, c.factor)) * 255);
            d.setColorFilter(c.factor < 0.98f ? new LightingColorFilter(0xFF000000 | g << 16 | g << 8 | g, 0) : null);
        }
        // The shadow is drawn outside the clip; drop it while anything lies over the button.
        fab.setElevation(untouched ? dp(FAB_ELEVATION_DP) : 0);
    }

    private void positionFab() {
        if (fab == null || layer == null) return;
        Insets in = insets();
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) fab.getLayoutParams();
        int right = FabPlacement.dp(density, FabPlacement.FAB_MARGIN_RIGHT_DP);
        int bottom = FabPlacement.bottomMarginPx(density, in.bottom, RouteTap.bannerVisible());
        if (lp.rightMargin != right || lp.bottomMargin != bottom) {
            lp.rightMargin = right;
            lp.bottomMargin = bottom;
            fab.setLayoutParams(lp);
        }
    }

    /** The region above a menu's edge, per pixel column; null when no column is cut. */
    private static android.graphics.Path clipPath(ScreenShade.Cover c, int w, int h) {
        if (c.visibleRows >= h || w <= 0) return null;
        android.graphics.Path p = new android.graphics.Path();
        p.moveTo(0, 0);
        p.lineTo(w, 0);
        for (int x = w - 1; x >= 0; x--) {
            float y = Math.min(h, Math.max(0, c.rowsAt(x)));
            p.lineTo(x + 1, y);
            p.lineTo(x, y);
        }
        p.close();
        return p;
    }

    /** Window y where the app draws below the status bar: the top of Wordfeud's app bar. */
    private int contentTopInWindow() {
        int[] loc = new int[2];
        layer.getLocationInWindow(loc);
        return loc[1] + insets().top;
    }

    /** The parts of the system bar insets that lie over the layer (zero when the app is not drawn edge to edge). */
    private Insets insets() {
        int top = 0;
        int bottom = 0;
        WindowInsets wi = Build.VERSION.SDK_INT >= 23 ? layer.getRootWindowInsets() : null;
        if (wi != null) {
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets sb = wi.getInsets(WindowInsets.Type.systemBars());
                top = sb.top;
                bottom = sb.bottom;
            } else {
                top = legacyTop(wi);
                bottom = legacyBottom(wi);
            }
        }
        int[] loc = new int[2];
        layer.getLocationInWindow(loc);
        View root = layer.getRootView();
        int windowHeight = root == null ? 0 : root.getHeight();
        Insets out = new Insets();
        if (windowHeight > 0 && layer.getHeight() > 0) {
            out.bottom = FabPlacement.effectiveBottomInset(bottom, windowHeight, loc[1] + layer.getHeight());
            out.top = FabPlacement.effectiveTopInset(top, loc[1]);
        }
        return out;
    }

    @SuppressWarnings("deprecation")
    private static int legacyTop(WindowInsets wi) {
        return wi.getSystemWindowInsetTop();
    }

    @SuppressWarnings("deprecation")
    private static int legacyBottom(WindowInsets wi) {
        return wi.getSystemWindowInsetBottom();
    }

    private static final class Insets {
        int top;
        int bottom;
    }

    // =====================================================================================================
    // Open / close
    // =====================================================================================================

    private void openOverlay() {
        if (open || activity == null) return;
        Long id = RouteTap.currentGameId();
        GameState st = id == null ? null : wf.gameStore().state(id);
        if (!OverlayVisibility.fabVisible(id, st)) return;
        open = true;
        session++;
        gameId = id;
        state = st;
        sort = SortMode.SCORE;
        moves = null;
        selected = null;
        readyGraph = null;
        readyGraphRuleset = -1;
        wordListRequested = false;
        wordListError = null;
        lang = language();
        boolean appDark = RouteTap.isDark();
        theme = Theme.of(appDark, sampler == null ? appDark : sampler.boardDark(appDark));
        focusBeforeOpen = activity.getCurrentFocus();
        buildOverlay();
        layer.addView(overlayRoot, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        overlayRoot.requestFocus();
        registerBack();
        fab.setVisibility(View.GONE);
        loadGame();
    }

    /** Closes the overlay (X, swipe, back, success, or its game left the screen). Main thread; idempotent. */
    private void close() {
        if (!open) return;
        open = false;
        session++;
        computations.cancel();
        unregisterBack();
        if (overlayRoot != null && layer != null) layer.removeView(overlayRoot);
        clearOverlayViews();
        moves = null;
        selected = null;
        state = null;
        game = null;
        readyGraph = null;
        View f = focusBeforeOpen;
        focusBeforeOpen = null;
        if (f != null && f.isAttachedToWindow()) f.requestFocus();
        refresh();
    }

    private void detach() {
        try {
            close();
        } catch (Throwable ignored) {
            // continue tearing down
        }
        if (sampler != null) sampler.stop();
        sampler = null;
        try {
            if (layer != null) {
                layer.removeOnLayoutChangeListener(fabRelayout);
                layer.setOnApplyWindowInsetsListener(null);
                ViewGroup parent = (ViewGroup) layer.getParent();
                if (parent != null) parent.removeView(layer);
            }
        } catch (Throwable ignored) {
            // the activity is going away anyway
        }
        try {
            if (activity != null) activity.getApplication().unregisterActivityLifecycleCallbacks(lifecycle);
        } catch (Throwable ignored) {
            // nothing more to release
        }
        if (current == this) current = null;
        layer = null;
        fab = null;
        activity = null;
    }

    /** Detaches when its activity is destroyed, so the activity is never leaked. */
    private static final class Lifecycle implements Application.ActivityLifecycleCallbacks {
        private final OverlayController c;

        Lifecycle(OverlayController c) {
            this.c = c;
        }

        @Override
        public void onActivityDestroyed(Activity a) {
            try {
                if (a == c.activity) c.detach();
            } catch (Throwable ignored) {
                // never affects the app
            }
        }

        @Override
        public void onActivityCreated(Activity a, Bundle b) {}

        @Override
        public void onActivityStarted(Activity a) {}

        @Override
        public void onActivityResumed(Activity a) {}

        @Override
        public void onActivityPaused(Activity a) {}

        @Override
        public void onActivityStopped(Activity a) {}

        @Override
        public void onActivitySaveInstanceState(Activity a, Bundle b) {}
    }

    // ---- back button ----

    private void registerBack() {
        if (Build.VERSION.SDK_INT >= 33 && backCallback == null) {
            try {
                backCallback = Back33.register(activity, () -> ui(this::close));
            } catch (Throwable ignored) {
                backCallback = null; // the key event path below still works
            }
        }
    }

    private void unregisterBack() {
        Object cb = backCallback;
        backCallback = null;
        if (cb != null && activity != null && Build.VERSION.SDK_INT >= 33) {
            try {
                Back33.unregister(activity, cb);
            } catch (Throwable ignored) {
                // already gone
            }
        }
    }

    /**
     * API 33+ back handling, in its own class so older devices never load {@code OnBackInvokedCallback}. When the
     * app has opted in to predictive back the system calls this callback and sends no KEYCODE_BACK; otherwise
     * the key event reaches the focused overlay view instead ({@link OverlayRoot#dispatchKeyEvent}).
     */
    private static final class Back33 {
        static Object register(Activity a, Runnable onBack) {
            OnBackInvokedCallback cb = onBack::run;
            a.getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                    OnBackInvokedDispatcher.PRIORITY_OVERLAY, cb);
            return cb;
        }

        static void unregister(Activity a, Object cb) {
            a.getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback((OnBackInvokedCallback) cb);
        }
    }

    /** Full-screen scrim that holds the panel, swallows touches and closes on KEYCODE_BACK while focused. */
    private final class OverlayRoot extends FrameLayout {
        OverlayRoot(Context ctx) {
            super(ctx);
        }

        @Override
        public boolean dispatchKeyEvent(KeyEvent e) {
            try {
                if (e.getKeyCode() == KeyEvent.KEYCODE_BACK) {
                    if (e.getAction() == KeyEvent.ACTION_UP && !e.isCanceled()) close();
                    return true;
                }
            } catch (Throwable ignored) {
                // fall through to the default handling
            }
            return super.dispatchKeyEvent(e);
        }
    }

    // =====================================================================================================
    // Overlay views
    // =====================================================================================================

    private void buildOverlay() {
        Context ctx = activity;
        overlayRoot = new OverlayRoot(ctx);
        overlayRoot.setBackgroundColor(SCRIM);
        overlayRoot.setClickable(true); // touches outside the panel do not reach the game
        overlayRoot.setFocusable(true);
        overlayRoot.setFocusableInTouchMode(true);

        panel = new LinearLayout(ctx) {
            @Override
            protected void onMeasure(int widthSpec, int heightSpec) {
                sizeBoard(MeasureSpec.getSize(widthSpec), MeasureSpec.getSize(heightSpec));
                super.onMeasure(widthSpec, heightSpec);
            }
        };
        panel.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(PANEL_PADDING_DP);
        panel.setPadding(pad, 0, pad, pad);
        panel.setBackground(Widgets.rounded(theme.background, dp(PANEL_RADIUS_DP)));
        panel.setClickable(true);
        Insets in = insets();
        int m = dp(PANEL_MARGIN_DP);
        FrameLayout.LayoutParams plp = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT);
        plp.setMargins(m, m + in.top, m, m + in.bottom);
        overlayRoot.addView(panel, plp);

        panel.addView(header(ctx), new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                dp(HEADER_HEIGHT_DP)));

        rackRow = new LinearLayout(ctx);
        rackRow.setOrientation(LinearLayout.HORIZONTAL);
        rackRow.setGravity(Gravity.CENTER);
        rackRow.setContentDescription(Strings.get(lang, Key.YOUR_TILES));
        panel.addView(rackRow, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                dp(RACK_TILE_DP)));

        board = new BoardPreviewView(ctx, theme);
        board.setLanguage(lang);
        LinearLayout.LayoutParams blp = new LinearLayout.LayoutParams(0, 0);
        blp.gravity = Gravity.CENTER_HORIZONTAL;
        blp.topMargin = dp(SECTION_GAP_DP);
        panel.addView(board, blp);

        progress = new DownloadProgress(ctx, theme, lang, density);
        LinearLayout.LayoutParams plp2 = matchWrap();
        plp2.topMargin = dp(SECTION_GAP_DP);
        panel.addView(progress, plp2);

        errorPanel = new ErrorPanel(ctx, theme, lang, density);
        LinearLayout.LayoutParams elp = matchWrap();
        elp.topMargin = dp(SECTION_GAP_DP);
        panel.addView(errorPanel, elp);

        infoRow = infoRow(ctx);
        LinearLayout.LayoutParams ilp = matchWrap();
        ilp.topMargin = dp(SECTION_GAP_DP);
        panel.addView(infoRow, ilp);

        sortRow = sortRow(ctx);
        LinearLayout.LayoutParams srlp = matchWrap();
        srlp.topMargin = dp(SECTION_GAP_DP);
        panel.addView(sortRow, srlp);

        adapter = new MoveListAdapter(ctx, theme, lang);
        list = new ListView(ctx);
        list.setAdapter(adapter);
        list.setDivider(null);
        list.setBackgroundColor(theme.surface);
        list.setOnItemClickListener((parent, view, position, id) -> {
            try {
                // A rejection message stays until the user picks another move (or plays)
                if (errorPanel.isShowingRejection() && MovePipeline.indexOf(moves, selected) != position) {
                    errorPanel.hide();
                }
                select(position, false);
            } catch (Throwable ignored) {
                // keep the overlay alive
            }
        });
        LinearLayout.LayoutParams llp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        llp.topMargin = dp(SECTION_GAP_DP);
        panel.addView(list, llp);
    }

    /** Square board, at most the panel's inner width and {@link #BOARD_MAX_HEIGHT_FRACTION} of its height. */
    private void sizeBoard(int panelWidth, int panelHeight) {
        if (board == null) return;
        int inner = panelWidth - panel.getPaddingLeft() - panel.getPaddingRight();
        int size = Math.max(0, Math.min(inner, (int) (panelHeight * BOARD_MAX_HEIGHT_FRACTION)));
        ViewGroup.LayoutParams lp = board.getLayoutParams();
        if (lp != null) {
            lp.width = size;
            lp.height = size;
        }
    }

    private View header(Context ctx) {
        LinearLayout h = new LinearLayout(ctx);
        h.setOrientation(LinearLayout.HORIZONTAL);
        h.setGravity(Gravity.CENTER_VERTICAL);
        TextView title = text(ctx, 18, theme.textPrimary, Fonts.interBold(ctx));
        title.setText(Strings.get(lang, Key.TITLE));
        h.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView x = text(ctx, 26, theme.textPrimary, Fonts.inter(ctx));
        x.setText("×");
        x.setGravity(Gravity.CENTER);
        x.setContentDescription(Strings.get(lang, Key.CLOSE));
        x.setClickable(true);
        x.setOnClickListener(v -> close());
        h.addView(x, new LinearLayout.LayoutParams(dp(HEADER_HEIGHT_DP), dp(HEADER_HEIGHT_DP)));
        h.setOnTouchListener(new SwipeListener());
        return h;
    }

    /** Swipe down on the header: the panel follows the finger and closes on a fling or a long enough drag. */
    private final class SwipeListener implements View.OnTouchListener {
        private float downY;
        private VelocityTracker tracker;

        @Override
        public boolean onTouch(View v, MotionEvent e) {
            try {
                return handle(e);
            } catch (Throwable t) {
                return false;
            }
        }

        private boolean handle(MotionEvent e) {
            if (panel == null) return false;
            ViewConfiguration vc = ViewConfiguration.get(activity);
            switch (e.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downY = e.getRawY();
                    recycle();
                    tracker = VelocityTracker.obtain();
                    tracker.addMovement(e);
                    return true;
                case MotionEvent.ACTION_MOVE: {
                    if (tracker != null) tracker.addMovement(e);
                    float dy = e.getRawY() - downY;
                    if (dy > vc.getScaledTouchSlop()) panel.setTranslationY(SwipeDismiss.dragOffset(dy));
                    return true;
                }
                case MotionEvent.ACTION_UP: {
                    float vy = 0f;
                    if (tracker != null) {
                        tracker.addMovement(e);
                        tracker.computeCurrentVelocity(1000);
                        vy = tracker.getYVelocity();
                    }
                    recycle();
                    float dy = e.getRawY() - downY;
                    if (SwipeDismiss.shouldDismiss(dy, vy, vc.getScaledTouchSlop(), panel.getHeight(),
                            vc.getScaledMinimumFlingVelocity())) {
                        final int s = session;
                        panel.animate().translationY(panel.getHeight()).setDuration(150)
                                .withEndAction(() -> {
                                    if (open && session == s) close();
                                }).start();
                    } else {
                        panel.animate().translationY(0f).setDuration(150).start();
                    }
                    return true;
                }
                case MotionEvent.ACTION_CANCEL:
                    recycle();
                    panel.animate().translationY(0f).setDuration(150).start();
                    return true;
                default:
                    return true;
            }
        }

        private void recycle() {
            if (tracker != null) {
                tracker.recycle();
                tracker = null;
            }
        }
    }

    private LinearLayout infoRow(Context ctx) {
        LinearLayout row = new LinearLayout(ctx);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);

        LinearLayout texts = new LinearLayout(ctx);
        texts.setOrientation(LinearLayout.VERTICAL);
        infoWord = text(ctx, 18, theme.textPrimary, Fonts.mono(ctx));
        infoWord.setTypeface(Fonts.mono(ctx), android.graphics.Typeface.BOLD);
        infoDetail = text(ctx, 13, theme.textSecondary, Fonts.inter(ctx));
        texts.addView(infoWord);
        texts.addView(infoDetail);
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        infoScore = text(ctx, 16, theme.textPrimary, Fonts.interBold(ctx));
        LinearLayout.LayoutParams sclp = wrap();
        sclp.rightMargin = dp(SECTION_GAP_DP);
        row.addView(infoScore, sclp);

        playButton = button(ctx, Strings.get(lang, Key.PLAY), true);
        playButton.setOnClickListener(v -> {
            try {
                onPlayClicked();
            } catch (Throwable ignored) {
                // keep the overlay alive
            }
        });
        row.addView(playButton, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                dp(BUTTON_HEIGHT_DP)));

        notYourTurn = text(ctx, 14, theme.textSecondary, Fonts.inter(ctx));
        notYourTurn.setText(Strings.get(lang, Key.NOT_YOUR_TURN));
        notYourTurn.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        notYourTurn.setMaxWidth(dp(160));
        row.addView(notYourTurn, wrap());
        return row;
    }

    private LinearLayout sortRow(Context ctx) {
        LinearLayout row = new LinearLayout(ctx);
        row.setOrientation(LinearLayout.HORIZONTAL);
        Key[] keys = {Key.SORT_SCORE, Key.SORT_LENGTH, Key.SORT_ALPHA};
        SortMode[] modes = {SortMode.SCORE, SortMode.LENGTH, SortMode.ALPHA};
        for (int i = 0; i < modes.length; i++) {
            final SortMode mode = modes[i];
            TextView b = button(ctx, Strings.get(lang, keys[i]), false);
            b.setOnClickListener(v -> {
                try {
                    onSort(mode);
                } catch (Throwable ignored) {
                    // keep the overlay alive
                }
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, dp(BUTTON_HEIGHT_DP), 1f);
            if (i > 0) lp.leftMargin = dp(SECTION_GAP_DP);
            row.addView(b, lp);
            sortButtons[mode.ordinal()] = b;
        }
        updateSortButtons();
        return row;
    }

    private void clearOverlayViews() {
        overlayRoot = null;
        panel = null;
        rackRow = null;
        board = null;
        progress = null;
        errorPanel = null;
        infoRow = null;
        infoWord = null;
        infoDetail = null;
        infoScore = null;
        playButton = null;
        notYourTurn = null;
        sortRow = null;
        java.util.Arrays.fill(sortButtons, null);
        list = null;
        adapter = null;
    }

    // =====================================================================================================
    // Data flow
    // =====================================================================================================

    /** Main thread: shows the open game (new open, or new data for it) and starts computing its moves. */
    private void loadGame() {
        if (!open || panel == null) return;
        computations.cancel();
        moves = null;
        selected = null;
        adapter.setMoves(Collections.<Move>emptyList());
        GameState st = state;
        progress.hide();
        errorPanel.hide();
        if (st == null) {
            // Not in the GameStore yet (a new game opened before Wordfeud's next games/detail poll). The store
            // listener calls refresh(), which loads the game as soon as it arrives.
            game = null;
            showContent(false);
            errorPanel.showLoading();
            return;
        }
        WfError err = st.unreadable();
        game = wf.gameStore().game(gameId);
        ruleset = game == null ? null : wf.gameStore().ruleset(game.getRulesetId());
        layout = game == null ? null : wf.gameStore().board(game.getBoardId());
        if (err == null && (game == null || ruleset == null || layout == null)) {
            err = WfError.gsData("game data missing");
        }
        if (err != null) {
            showContent(false);
            errorPanel.show(err, game == null ? -1 : game.getRulesetId(), null);
            return;
        }
        showContent(true);
        board.setBoard(st.board(), layout, ruleset);
        board.setMove(null);
        updateRack();
        updateInfo();
        compute();
    }

    /** Main thread: generates the move list in the background (cancelling any running computation). */
    private void compute() {
        if (!open || state == null || game == null) return;
        final AtomicBoolean token = computations.begin();
        final int s = session;
        final GameState st = state;
        final BoardLayout bl = layout;
        final Ruleset rs = ruleset;
        final int rulesetId = game.getRulesetId();
        final long gid = gameId;
        final SortMode mode = sort;
        final WordGraph known = readyGraphRuleset == rulesetId ? readyGraph : null;
        background(() -> {
            if (token.get()) return;
            WordGraph wg = known;
            if (wg == null) {
                try {
                    wg = wf.wordLists().getOrNull(rulesetId);
                } catch (Throwable t) {
                    wg = null;
                }
            }
            if (wg == null) {
                ui(() -> {
                    if (open && session == s && computations.isCurrent(token)) requestWordList(rulesetId, rs);
                });
                return;
            }
            final List<Move> out = MovePipeline.compute(st, bl, rs, wg,
                    l -> wf.submitter().hidden().filter(gid, wf.rejected().filter(rulesetId, l)), mode, token);
            if (out == null) return;
            ui(() -> {
                if (open && session == s && computations.isCurrent(token)) showMoves(out, false);
            });
        });
    }

    /**
     * Main thread: the word list is missing. Downloads it once per open overlay (and again on Retry) with a progress
     * bar; an error shows the error panel with "Retry" where that applies (spec 6.2 step 5).
     */
    private void requestWordList(int rulesetId, Ruleset rs) {
        if (wordListError != null) {
            showWordListError(rulesetId);
            return;
        }
        if (progress.getVisibility() != View.VISIBLE) progress.start();
        if (wordListRequested) return;
        wordListRequested = true;
        final int s = session;
        final int attempt = ++wordListAttempt;
        wf.wordLists().ensureForOverlay(rulesetId, rs, new WordListManager.Callback() {
            /** Progress may be replayed on the calling thread, even after the result: ignore it once one is in. */
            private boolean current() {
                return open && session == s && wordListAttempt == attempt && progress != null;
            }

            @Override
            public void onProgress(int pct) {
                ui(() -> {
                    if (current() && wordListError == null && readyGraphRuleset != rulesetId) {
                        progress.setPercent(pct);
                    }
                });
            }

            @Override
            public void onReady(WordGraph g) {
                ui(() -> {
                    if (!current()) return;
                    readyGraph = g;
                    readyGraphRuleset = rulesetId;
                    progress.hide();
                    compute();
                });
            }

            @Override
            public void onError(WfError e) {
                ui(() -> {
                    if (!current()) return;
                    wordListError = e;
                    showWordListError(rulesetId);
                });
            }
        });
    }

    private void showWordListError(int rulesetId) {
        progress.hide();
        errorPanel.show(wordListError, rulesetId, () -> {
            // Retry: a new ensureForOverlay attempt (through compute, which first checks memory and disk)
            if (!open || errorPanel == null) return;
            wordListError = null;
            wordListRequested = false;
            errorPanel.hide();
            compute();
        });
    }

    /** Main thread: a new sorted list. Keeps the selected move after a re-sort; else selects the best move. */
    private void showMoves(List<Move> out, boolean keepSelection) {
        if (adapter == null) return;
        Move keep = selected;
        progress.hide();
        moves = out;
        adapter.setMoves(out); // resets the adapter's selection
        int idx = keepSelection ? MovePipeline.indexOf(out, keep) : -1;
        if (idx < 0) idx = MovePipeline.bestIndex(out);
        select(idx, true);
    }

    /** Main thread: highlights row {@code idx} (-1 for none) and updates board, rack and info line at once. */
    private void select(int idx, boolean scrollTo) {
        if (adapter == null || moves == null) return;
        selected = idx >= 0 && idx < moves.size() ? moves.get(idx) : null;
        adapter.setSelected(selected == null ? -1 : idx);
        board.setMove(selected);
        updateRack();
        updateInfo();
        if (scrollTo && selected != null) list.setSelection(idx);
    }

    private void onSort(SortMode mode) {
        if (!open || mode == sort) return;
        sort = mode;
        updateSortButtons();
        final List<Move> current = moves;
        if (current == null) {
            // Still computing (or waiting for the word list): restart with the new order.
            if (!wordListRequested || readyGraph != null) compute();
            return;
        }
        final AtomicBoolean token = computations.begin();
        final int s = session;
        background(() -> {
            List<Move> sorted = MovePipeline.sort(current, mode, token);
            if (sorted == null) return;
            ui(() -> {
                if (open && session == s && computations.isCurrent(token)) showMoves(sorted, true);
            });
        });
    }

    // =====================================================================================================
    // Play (spec 8.3)
    // =====================================================================================================

    /**
     * Sends the selected move on the background executor. SUCCESS closes the overlay and asks Wordfeud to refresh
     * ({@link Refresher}); REJECTED shows the words and a recomputed list (RejectedWords now filters them); MV-NET
     * keeps Play disabled until the next games/detail; any other error shows the error panel and Play comes back.
     */
    private void onPlayClicked() {
        if (!open || game == null || !canPlay()) return;
        MoveSubmitter submitter = wf.submitter();
        if (!play.begin()) return;
        errorPanel.hide();
        updatePlayEnabled();
        computations.cancel(); // free the executor for the request
        final Move m = selected;
        final long id = gameId;
        final int rulesetId = game.getRulesetId();
        final int s = session;
        background(() -> {
            MoveSubmitter.Result result = null; // null: outcome unknown, handled like MV-NET
            try {
                result = submitter.submit(id, rulesetId, m);
            } finally {
                // Read after the request ended: only a games/detail processed from now on lifts an MV-NET block.
                long generation = detailGeneration();
                MoveSubmitter.Result r = result;
                ui(() -> onPlayResult(s, id, rulesetId, r, generation));
            }
        });
    }

    /** Main thread. Also runs when the overlay closed or reopened meanwhile: the Play state and refresh still apply. */
    private void onPlayResult(int s, long id, int rulesetId, MoveSubmitter.Result r, long generation) {
        MoveSubmitter.Result.Kind kind = r == null ? MoveSubmitter.Result.Kind.ERROR : r.kind;
        WfError error = r == null ? null : r.error;
        PlayState.Action a = play.onResult(kind, error, generation);
        boolean sameSession = open && session == s;
        if (a == PlayState.Action.CLOSE_AND_REFRESH) {
            if (sameSession) close();
            Refresher.refresh(id);
            return;
        }
        if (sameSession) {
            if (a == PlayState.Action.SHOW_REJECTED) {
                // In the error panel (primary text, code, Copy details with server=): the old grey status line
                // under the board went unnoticed (V6). It stays until the user picks another move or plays.
                errorPanel.showRejection(OverlayFormat.rejectionText(lang, r.words, r.oneOf),
                        WfError.mvServer("illegal_word"), rulesetId, r.server);
                moves = null;
                selected = null; // the rejected move must not be played again while the list is recomputed
                adapter.setMoves(Collections.<Move>emptyList());
                board.setMove(null);
                updateRack();
                updateInfo();
                compute(); // RejectedWords / HiddenMoves now drop the move from the list
            } else {
                errorPanel.show(error != null ? error : WfError.mvNet(), game == null ? -1 : game.getRulesetId(),
                        null);
            }
        }
        updatePlayEnabled();
    }

    private boolean canPlay() {
        return play.canPlay(selected != null, state != null && state.myTurn(), wf.submitter().isBusy(),
                detailGeneration());
    }

    private long detailGeneration() {
        try {
            return wf.gameStore().detailGeneration();
        } catch (Throwable t) {
            return Long.MIN_VALUE;
        }
    }

    // =====================================================================================================
    // View updates (main thread)
    // =====================================================================================================

    private void showContent(boolean visible) {
        int v = visible ? View.VISIBLE : View.GONE;
        rackRow.setVisibility(v);
        board.setVisibility(v);
        infoRow.setVisibility(v);
        sortRow.setVisibility(v);
        list.setVisibility(v);
    }

    private void updateRack() {
        if (rackRow == null || state == null) return;
        List<String> rack = state.rack();
        if (rackRow.getChildCount() != rack.size()) {
            rackRow.removeAllViews();
            for (int i = 0; i < rack.size(); i++) {
                View t = new View(activity);
                t.setBackground(new TileDrawable(theme, Fonts.interBold(activity), Fonts.inter(activity)));
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(RACK_TILE_DP), dp(RACK_TILE_DP));
                if (i > 0) lp.leftMargin = dp(RACK_GAP_DP);
                rackRow.addView(t, lp);
            }
        }
        boolean[] used = OverlayFormat.usedRackIndices(rack, selected);
        for (int i = 0; i < rack.size(); i++) {
            String t = rack.get(i);
            boolean blank = t == null || t.isEmpty() || Rules.isBlank(t);
            String letter = blank ? "" : t.toUpperCase(Locale.ROOT);
            int points = blank ? 0 : OverlayFormat.letterPoints(ruleset, t.charAt(0));
            TileDrawable d = (TileDrawable) rackRow.getChildAt(i).getBackground();
            d.set(letter, points, used[i] ? TileDrawable.State.DIMMED : TileDrawable.State.NORMAL, null);
        }
    }

    private void updateInfo() {
        if (infoRow == null) return;
        Move m = selected;
        infoWord.setText(m == null ? "" : m.word);
        infoDetail.setText(m == null ? "" : OverlayFormat.detail(lang, m));
        infoDetail.setVisibility(m == null ? View.GONE : View.VISIBLE);
        infoScore.setText(m == null ? "" : OverlayFormat.scoreText(lang, m.score));
        boolean myTurn = state != null && state.myTurn();
        playButton.setVisibility(myTurn ? View.VISIBLE : View.GONE);
        notYourTurn.setVisibility(myTurn ? View.GONE : View.VISIBLE);
        updatePlayEnabled();
    }

    private void updatePlayEnabled() {
        if (playButton == null) return;
        boolean enabled = canPlay();
        playButton.setEnabled(enabled);
        playButton.setAlpha(enabled ? 1f : 0.4f);
    }

    private void updateSortButtons() {
        for (SortMode mode : SortMode.values()) {
            TextView b = sortButtons[mode.ordinal()];
            if (b == null) continue;
            boolean on = mode == sort;
            b.setBackground(Widgets.rounded(on ? theme.accent : theme.surface, dp(BUTTON_HEIGHT_DP) / 2));
            b.setTextColor(on ? theme.onAccent : theme.textPrimary);
        }
    }

    // ---- small view helpers ----

    private TextView text(Context ctx, int sp, int color, android.graphics.Typeface face) {
        return Widgets.text(ctx, sp, color, face);
    }

    private TextView button(Context ctx, String label, boolean accent) {
        return Widgets.button(ctx, theme, density, label, accent);
    }

    private static LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private static LinearLayout.LayoutParams wrap() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private int dp(int v) {
        return FabPlacement.dp(density, v);
    }

    /** Interface language. TODO(V12): use the app's own language setting once its source is known. */
    private static String language() {
        String l = Locale.getDefault().getLanguage();
        return l == null || l.isEmpty() ? "en" : l;
    }

    /** Round accent button with an open-book glyph (drawn, so it needs no icon resource or font). */
    private static final class FabDrawable extends Drawable {
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);

        FabDrawable(Theme theme) {
            fill.setColor(theme.accent);
            fill.setStyle(Paint.Style.FILL);
            stroke.setColor(theme.onAccent);
            stroke.setStyle(Paint.Style.STROKE);
            stroke.setStrokeCap(Paint.Cap.ROUND);
            stroke.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public void draw(Canvas c) {
            Rect b = getBounds();
            float r = Math.min(b.width(), b.height()) / 2f;
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            c.drawCircle(cx, cy, r, fill);
            stroke.setStrokeWidth(r * 0.121f);
            // Open book on a 56-unit grid centred on (28, 28): two pages meeting at the spine x = 28.
            float u = r / 28f;
            Path book = new Path();
            book.moveTo(cx, cy - 10 * u);
            book.cubicTo(cx - 4 * u, cy - 13 * u, cx - 9 * u, cy - 14 * u, cx - 14 * u, cy - 13 * u);
            book.lineTo(cx - 14 * u, cy + 9 * u);
            book.cubicTo(cx - 9 * u, cy + 8 * u, cx - 4 * u, cy + 9 * u, cx, cy + 12 * u);
            book.cubicTo(cx + 4 * u, cy + 9 * u, cx + 9 * u, cy + 8 * u, cx + 14 * u, cy + 9 * u);
            book.lineTo(cx + 14 * u, cy - 13 * u);
            book.cubicTo(cx + 9 * u, cy - 14 * u, cx + 4 * u, cy - 13 * u, cx, cy - 10 * u);
            book.close();
            c.drawPath(book, stroke);
            c.drawLine(cx, cy - 10 * u, cx, cy + 12 * u, stroke);
        }

        @Override
        public void setAlpha(int alpha) {
            fill.setAlpha(alpha);
            stroke.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter cf) {
            fill.setColorFilter(cf);
            stroke.setColorFilter(cf);
            invalidateSelf();
        }

        @Override
        @SuppressWarnings("deprecation")
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
