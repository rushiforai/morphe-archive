package dev.materialtidal.extension.tidal.search;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.RecordingCanvas;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ProgressBar;

import androidx.recyclerview.widget.RecyclerView;

import java.lang.reflect.Field;
import java.util.WeakHashMap;

import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit;
import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit.ExpressivePalette;
import dev.materialtidal.extension.tidal.search.ExpressiveSearchStyler.SearchPageIds;
import dev.materialtidal.extension.tidal.theme.ExpressiveBlurKit;
import dev.materialtidal.extension.tidal.theme.ExpressiveBlurKit.MultiTierProgressiveBlurRenderer;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Coordinates the Material 3 Expressive redesign for both TIDAL Search fragments:
 * <ul>
 *     <li>{@code Lis6;} — Search / Explore Landing Page ({@code dynamic_page_fragment_searchbar})</li>
 *     <li>{@code UnifiedSearchView} — Default XML Active Search ({@code unified_search})</li>
 * </ul>
 */
final class ExpressiveSearchPageController {

    private static final WeakHashMap<Object, ExpressiveSearchPageController> BY_FRAGMENT =
            new WeakHashMap<>();

    private static Field clpTopToBottomField;
    private static Field clpTopToTopField;
    private static boolean clpFieldsResolved;

    private final View rootView;
    private final Context context;
    private final float density;
    private final ExpressivePalette palette;
    private final SearchPageIds ids;
    private final boolean isUnifiedSearch;

    private RecyclerView recyclerView;
    private RecyclerView filterRecyclerView;
    private View searchBarOrView;
    private View backIcon;
    private SearchHeaderGlassView headerGlassView;
    private int baseRvPaddingTop;
    private int lastAppliedExtraTop = -1;
    private int currentHeaderHeightPx = 0;
    private float currentScrollFrac = 0f;
    private boolean destroyed;

    static void onSearchLandingViewCreated(Object fragment, View rootView) {
        attach(fragment, rootView, false);
    }

    static void onUnifiedSearchViewCreated(Object fragment, View rootView) {
        attach(fragment, rootView, true);
    }

    private static void attach(Object fragment, View rootView, boolean unifiedSearch) {
        if (fragment == null || rootView == null) {
            return;
        }
        ExpressiveSearchPageController prev = BY_FRAGMENT.remove(fragment);
        if (prev != null) {
            prev.onDestroy();
        }
        BY_FRAGMENT.put(fragment, new ExpressiveSearchPageController(rootView, unifiedSearch));
    }

    static void onDestroyView(Object fragment) {
        if (fragment == null) {
            return;
        }
        ExpressiveSearchPageController controller = BY_FRAGMENT.remove(fragment);
        if (controller != null) {
            controller.onDestroy();
        }
    }

    private ExpressiveSearchPageController(View rootView, boolean isUnifiedSearch) {
        this.rootView = rootView;
        this.context = rootView.getContext();
        this.density = context.getResources().getDisplayMetrics().density;
        this.palette = ExpressiveMediaStyleKit.buildMonetPalette();
        this.ids = new SearchPageIds(context);
        this.isUnifiedSearch = isUnifiedSearch;

        setup();
    }

    private void setup() {
        rootView.setBackgroundColor(palette.surfaceBase);

        View rvView = ExpressiveMediaStyleKit.findView(
                rootView, ExpressiveMediaStyleKit.getId(context, "recyclerView"));
        if (rvView instanceof RecyclerView) {
            recyclerView = (RecyclerView) rvView;
            baseRvPaddingTop = recyclerView.getPaddingTop();
            recyclerView.setBackgroundColor(palette.surfaceBase);
            recyclerView.setClipToPadding(false);
        }

        if (isUnifiedSearch) {
            setupUnifiedSearch();
        } else {
            setupSearchLanding();
        }

        if (recyclerView != null) {
            recyclerView.addOnChildAttachStateChangeListener(new RecyclerView.OnChildAttachStateChangeListener() {
                @Override
                public void onChildViewAttachedToWindow(View child) {
                    if (destroyed || child == null) {
                        return;
                    }
                    if (isUnifiedSearch) {
                        ExpressiveSearchStyler.styleUnifiedSearchResultChild(child, ids);
                    } else {
                        ExpressiveSearchStyler.styleSearchLandingChild(child, ids, false);
                    }
                }

                @Override
                public void onChildViewDetachedFromWindow(View child) {
                }
            });

            recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
                @Override
                public void onScrolled(RecyclerView rv, int dx, int dy) {
                    if (!destroyed) {
                        updateScrollBlur(rv);
                    }
                }
            });

            for (int i = 0; i < recyclerView.getChildCount(); i++) {
                View child = recyclerView.getChildAt(i);
                if (isUnifiedSearch) {
                    ExpressiveSearchStyler.styleUnifiedSearchResultChild(child, ids);
                } else {
                    ExpressiveSearchStyler.styleSearchLandingChild(child, ids, false);
                }
            }
        }
    }

    private void setupSearchLanding() {
        searchBarOrView = ExpressiveMediaStyleKit.findView(
                rootView, ExpressiveMediaStyleKit.getId(context, "searchBar"));
        if (searchBarOrView != null) {
            ExpressiveSearchStyler.styleTidalSearchView(searchBarOrView, false);
        }

        View pb = ExpressiveMediaStyleKit.findView(
                rootView, ExpressiveMediaStyleKit.getId(context, "progressBar"));
        if (pb instanceof ProgressBar) {
            ((ProgressBar) pb).setIndeterminateTintList(ColorStateList.valueOf(palette.primaryAccent));
        }

        floatBehindStickyHeader();
    }

    private void setupUnifiedSearch() {
        searchBarOrView = ExpressiveMediaStyleKit.findView(
                rootView, ExpressiveMediaStyleKit.getId(context, "searchView"));
        if (searchBarOrView != null) {
            ExpressiveSearchStyler.styleTidalSearchView(searchBarOrView, true);
        }

        backIcon = ExpressiveMediaStyleKit.findView(
                rootView, ExpressiveMediaStyleKit.getId(context, "backIcon"));
        if (backIcon != null) {
            ExpressiveSearchStyler.styleBackButton(backIcon, searchBarOrView);
        }

        View lp = ExpressiveMediaStyleKit.findView(
                rootView, ExpressiveMediaStyleKit.getId(context, "loadingProgress"));
        if (lp instanceof ProgressBar) {
            ExpressiveMediaStyleKit.tintHorizontalProgressBar(
                    (ProgressBar) lp,
                    palette.primaryAccent,
                    MaterialYouColorEngine.withAlpha(palette.outlineVariant, 0x44));
        }

        View filterRv = ExpressiveMediaStyleKit.findView(
                rootView, ExpressiveMediaStyleKit.getId(context, "searchFilterRecyclerView"));
        if (filterRv instanceof RecyclerView) {
            filterRecyclerView = (RecyclerView) filterRv;
            filterRecyclerView.setClipToPadding(false);
        }

        ExpressiveSearchStyler.styleEmptyView(
                ExpressiveMediaStyleKit.findView(
                        rootView, ExpressiveMediaStyleKit.getId(context, "initialEmptyView")),
                ids);
        ExpressiveSearchStyler.styleEmptyView(
                ExpressiveMediaStyleKit.findView(
                        rootView, ExpressiveMediaStyleKit.getId(context, "emptySearchResultsView")),
                ids);

        floatBehindStickyHeader();
    }

    /**
     * Detaches {@code recyclerView}'s top constraint from below the search header onto the root top,
     * converts header bottom into {@code recyclerView.paddingTop}, and mounts a blurred glass scrim
     * right above {@code recyclerView} and beneath the sticky search bar/chips so scrolling content
     * glides cleanly underneath frosted glass.
     */
    private void floatBehindStickyHeader() {
        if (!(rootView instanceof ViewGroup) || recyclerView == null || searchBarOrView == null) {
            return;
        }
        final ViewGroup rootGroup = (ViewGroup) rootView;

        if (!MaterialYouConfig.isExpressiveSearchHeaderBlurEnabled()) {
            return;
        }

        // Move recyclerView top constraint to parent top so content scrolls beneath the search bar
        try {
            if (!clpFieldsResolved) {
                clpFieldsResolved = true;
                Class<?> clpClass = recyclerView.getLayoutParams().getClass();
                if (clpClass.getName().endsWith("ConstraintLayout$LayoutParams")) {
                    clpTopToBottomField = clpClass.getField("topToBottom");
                    clpTopToTopField = clpClass.getField("topToTop");
                }
            }
            if (clpTopToBottomField != null && clpTopToTopField != null) {
                ViewGroup.LayoutParams rvLp = recyclerView.getLayoutParams();
                clpTopToBottomField.setInt(rvLp, -1); // UNSET
                clpTopToTopField.setInt(rvLp, 0);     // PARENT_ID
                if (rvLp instanceof ViewGroup.MarginLayoutParams) {
                    ((ViewGroup.MarginLayoutParams) rvLp).topMargin = 0;
                }
                recyclerView.setLayoutParams(rvLp);
            }
        } catch (Throwable ignored) {
            return;
        }

        if (isUnifiedSearch) {
            // Place recyclerView at index 0 behind the search chrome so headerGlassView captures
            // only scrolling list content and sits beneath backIcon, searchView, and filter chips.
            ViewGroup.LayoutParams moveLp = recyclerView.getLayoutParams();
            rootGroup.removeView(recyclerView);
            rootGroup.addView(recyclerView, 0, moveLp);
        }

        headerGlassView = new SearchHeaderGlassView(context);
        int rvIndex = rootGroup.indexOfChild(recyclerView);
        int insertIndex = rvIndex >= 0 ? rvIndex + 1 : 0;
        rootGroup.addView(headerGlassView, insertIndex,
                new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 1));
        headerGlassView.attach(rootGroup, searchBarOrView, filterRecyclerView);

        View.OnLayoutChangeListener headerBoundsListener =
                (v, l, t, r, b, ol, ot, or, ob) -> syncHeaderMetrics();
        searchBarOrView.addOnLayoutChangeListener(headerBoundsListener);
        if (filterRecyclerView != null) {
            filterRecyclerView.addOnLayoutChangeListener(headerBoundsListener);
        }
        rootView.post(() -> {
            if (!destroyed) {
                syncHeaderMetrics();
            }
        });
    }

    private void syncHeaderMetrics() {
        if (destroyed || searchBarOrView == null || recyclerView == null) {
            return;
        }
        int bottom = searchBarOrView.getBottom();
        if (backIcon != null && backIcon.getVisibility() == View.VISIBLE
                && backIcon.getBottom() > bottom) {
            bottom = backIcon.getBottom();
        }
        if (filterRecyclerView != null && filterRecyclerView.getVisibility() == View.VISIBLE
                && filterRecyclerView.getBottom() > bottom) {
            bottom = filterRecyclerView.getBottom();
        }
        if (bottom <= 0) {
            return;
        }
        int extraGap = ExpressiveMediaStyleKit.dp(density, isUnifiedSearch ? 10f : 12f);
        int headerH = bottom + extraGap;
        if (headerH != currentHeaderHeightPx) {
            currentHeaderHeightPx = headerH;
            if (headerGlassView != null) {
                headerGlassView.setHeaderHeightPx(headerH);
            }
        }
        if (headerH != lastAppliedExtraTop) {
            boolean firstSync = lastAppliedExtraTop < 0;
            lastAppliedExtraTop = headerH;
            int targetPadTop = baseRvPaddingTop + headerH;
            if (recyclerView.getPaddingTop() != targetPadTop) {
                recyclerView.setPadding(
                        recyclerView.getPaddingLeft(),
                        targetPadTop,
                        recyclerView.getPaddingRight(),
                        recyclerView.getPaddingBottom());
                if (firstSync) {
                    recyclerView.scrollToPosition(0);
                }
            }
        }
    }

    private void updateScrollBlur(RecyclerView rv) {
        if (headerGlassView == null || rv == null) {
            return;
        }
        int scrollY = computeRvScrollY(rv);
        float frac = ExpressiveMediaStyleKit.smoothstep(
                0f, ExpressiveMediaStyleKit.dpf(density, 28f), (float) scrollY);
        if (Math.abs(frac - currentScrollFrac) > 0.01f) {
            currentScrollFrac = frac;
            headerGlassView.updateAppearance(frac, palette.surfaceBase);
        }
    }

    private int computeRvScrollY(RecyclerView rv) {
        if (rv.getChildCount() == 0) {
            return 0;
        }
        View first = rv.getChildAt(0);
        int pos = rv.getChildAdapterPosition(first);
        if (pos == 0) {
            return Math.max(0, rv.getPaddingTop() - first.getTop());
        }
        return Math.max(1000, rv.computeVerticalScrollOffset());
    }

    private void onDestroy() {
        destroyed = true;
        if (headerGlassView != null) {
            headerGlassView.release();
            headerGlassView = null;
        }
        recyclerView = null;
        filterRecyclerView = null;
        searchBarOrView = null;
        backIcon = null;
    }

    /**
     * Frosted glass header backdrop rendered behind the Search Bar & Filter Chips while staying
     * completely idle (GONE) at scrollY == 0.
     */
    private static final class SearchHeaderGlassView extends View {

        private static final float[] TIER_RADII_DP = new float[]{4f, 11f, 24f, 44f};
        private static final float[] TIER_STARTS = new float[]{0.00f, 0.24f, 0.50f, 0.72f};

        private final MultiTierProgressiveBlurRenderer renderer =
                new MultiTierProgressiveBlurRenderer("searchHeaderBlur");
        private final float density;

        private ViewGroup backdropRoot;
        private int headerHeightPx = 1;
        private float scrollFraction = 0f;
        private int tintBaseColor;
        private boolean lastLightMode;
        private boolean waitingForOwnDraw = false;
        private long lastInvalidateUptime = 0L;
        private boolean listenersAttached = false;

        private final ViewTreeObserver.OnPreDrawListener preDrawListener = () -> {
            if (backdropRoot == null || scrollFraction <= 0.02f || getVisibility() != VISIBLE) {
                waitingForOwnDraw = false;
                return true;
            }
            if (!MaterialYouConfig.isExpressiveBlurEnabled()
                    || MaterialYouColorEngine.isEffectiveAmoledBlack()) {
                return true;
            }
            long now = SystemClock.uptimeMillis();
            if (waitingForOwnDraw && (now - lastInvalidateUptime) < 120L) {
                return true;
            }
            waitingForOwnDraw = true;
            lastInvalidateUptime = now;
            invalidate();
            return true;
        };

        SearchHeaderGlassView(Context context) {
            super(context);
            this.density = context.getResources().getDisplayMetrics().density;
            this.tintBaseColor = MaterialYouColorEngine.getSurfaceBase();
            this.lastLightMode = MaterialYouColorEngine.isLightMode(context);
            setWillNotDraw(false);
            setForceDarkAllowed(false);
            setClickable(false);
            setFocusable(false);
            setFocusableInTouchMode(false);
            setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
            setVisibility(GONE);
        }

        void attach(ViewGroup root, View searchAnchor, View filterAnchor) {
            detachListeners();
            this.backdropRoot = root;
            configureRenderer();
            attachListeners();
        }

        void setHeaderHeightPx(int heightPx) {
            int clamped = Math.max(1, heightPx);
            if (this.headerHeightPx != clamped) {
                this.headerHeightPx = clamped;
                ViewGroup.LayoutParams lp = getLayoutParams();
                if (lp != null && lp.height != clamped) {
                    lp.height = clamped;
                    setLayoutParams(lp);
                }
            }
        }

        void updateAppearance(float frac, int tintColor) {
            float clamped = ExpressiveMediaStyleKit.clamp01(frac);
            boolean lightMode = MaterialYouColorEngine.isLightMode(getContext());
            boolean changed = Math.abs(this.scrollFraction - clamped) > 0.01f
                    || this.tintBaseColor != tintColor
                    || this.lastLightMode != lightMode;
            this.scrollFraction = clamped;
            this.tintBaseColor = tintColor;

            int vis = (clamped > 0.02f && headerHeightPx > 4) ? VISIBLE : GONE;
            if (getVisibility() != vis) {
                setVisibility(vis);
            }
            if (changed) {
                configureRenderer();
                invalidate();
            }
        }

        private void configureRenderer() {
            boolean lightMode = MaterialYouColorEngine.isLightMode(getContext());
            lastLightMode = lightMode;
            int veilBase = MaterialYouColorEngine.getSurfaceBase();
            renderer.configure(
                    MultiTierProgressiveBlurRenderer.DIR_TOP_DOWN,
                    0.05f,
                    TIER_RADII_DP,
                    TIER_STARTS,
                    veilBase,
                    0.16f,
                    (lightMode ? 0.72f : 0.60f) * scrollFraction);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            waitingForOwnDraw = false;
            try {
                if (scrollFraction <= 0.02f || backdropRoot == null || canvas == null) {
                    return;
                }
                int w = getWidth();
                int h = getHeight();
                if (w <= 0 || h <= 0) {
                    return;
                }
                boolean lightMode = MaterialYouColorEngine.isLightMode(getContext());
                if (lightMode != lastLightMode) {
                    configureRenderer();
                }
                float bleedPx = 24f * density;
                boolean allowBlur = renderer.canUseHardwareBlur(canvas)
                        && !MaterialYouColorEngine.isEffectiveAmoledBlack()
                        && !ExpressiveBlurKit.CAPTURING_BACKDROP;
                if (allowBlur) {
                    RecordingCanvas rc = renderer.beginBackdropCapture(
                            w, h, bleedPx, 0.5f, MaterialYouColorEngine.getSurfaceBase());
                    if (rc != null) {
                        int myIdx = backdropRoot.indexOfChild(this);
                        int outerSave = rc.save();
                        rc.clipRect(-bleedPx, -bleedPx, w + bleedPx, h + bleedPx);
                        ExpressiveBlurKit.CAPTURING_BACKDROP = true;
                        try {
                            int limit = myIdx >= 0 ? myIdx : backdropRoot.getChildCount();
                            for (int i = 0; i < limit; i++) {
                                View child = backdropRoot.getChildAt(i);
                                if (child == null || child == this || child.getVisibility() != VISIBLE) {
                                    continue;
                                }
                                int cs = rc.save();
                                try {
                                    rc.translate(child.getLeft() + child.getTranslationX(),
                                            child.getTop() + child.getTranslationY());
                                    child.draw(rc);
                                } catch (Throwable ignored) {
                                } finally {
                                    rc.restoreToCount(cs);
                                }
                            }
                        } finally {
                            ExpressiveBlurKit.CAPTURING_BACKDROP = false;
                            rc.restoreToCount(outerSave);
                            renderer.endBackdropCapture(density);
                        }
                    }
                }
                int layerAlpha = Math.max(0, Math.min(255, Math.round(255f * scrollFraction)));
                int sc = canvas.saveLayerAlpha(0f, 0f, w, h, layerAlpha);
                try {
                    renderer.draw(canvas, w, h, bleedPx);
                } finally {
                    canvas.restoreToCount(sc);
                }
            } catch (Throwable ignored) {
            }
        }

        private void attachListeners() {
            if (listenersAttached || backdropRoot == null) {
                return;
            }
            ViewTreeObserver vto = backdropRoot.getViewTreeObserver();
            if (vto.isAlive()) {
                vto.addOnPreDrawListener(preDrawListener);
                listenersAttached = true;
            }
        }

        private void detachListeners() {
            if (!listenersAttached || backdropRoot == null) {
                listenersAttached = false;
                return;
            }
            ViewTreeObserver vto = backdropRoot.getViewTreeObserver();
            if (vto.isAlive()) {
                vto.removeOnPreDrawListener(preDrawListener);
            }
            listenersAttached = false;
        }

        @Override
        protected void onDetachedFromWindow() {
            detachListeners();
            renderer.release();
            super.onDetachedFromWindow();
        }

        void release() {
            detachListeners();
            renderer.release();
            backdropRoot = null;
        }
    }
}
