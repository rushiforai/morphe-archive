package dev.materialtidal.extension.tidal.player;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.WeakHashMap;

import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit;
import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit.ExpressivePalette;
import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit.PaletteTransitionController;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Coordinates the Material 3 Expressive redesign for TIDAL's Play Queue dialog
 * ({@code com.aspiro.wamp.nowplaying.view.playqueue.c}) and Suggested Tracks tab
 * ({@code com.aspiro.wamp.nowplaying.view.suggestions.a}):
 * <ul>
 *     <li>Atmospheric cover-tinted scrim over TIDAL's blurred album art backdrop + smooth Monet
 *         & cover-adaptive {@link PaletteTransitionController}.</li>
 *     <li>Floating M3 Expressive segmented pill switcher for Queue / Suggested Tracks.</li>
 *     <li>Spotlight Currently Playing card, tonal floating Up Next cards, subtle history rows,
 *         12dp squircle artwork, and circular header action pills.</li>
 * </ul>
 */
final class ExpressivePlayQueueController {

    private static final WeakHashMap<Object, ExpressivePlayQueueController> BY_FRAGMENT =
            new WeakHashMap<>();
    private static final WeakHashMap<View, ExpressivePlayQueueController> BY_RV =
            new WeakHashMap<>();
    private static volatile WeakReference<ExpressivePlayQueueController> activeControllerRef =
            new WeakReference<>(null);

    private static Method dfGetDialogMethod;
    private static boolean dfDialogMethodResolved;

    private static Method tabSetTabModeMethod;
    private static Method tabSetTabGravityMethod;
    private static Method tabSetIndicatorFullWidthMethod;
    private static Method tabSetIndicatorGravityMethod;
    private static Method tabSetIndicatorAnimModeMethod;
    private static Method tabSetSelectedIndicatorDrawableMethod;
    private static Method tabSetSelectedIndicatorColorMethod;
    private static Method tabSetTextColorsMethod;
    private static Method tabSetRippleColorMethod;
    private static Class<?> tabLayoutClassCached;

    private static Field swipeColorDrawableField;
    private static boolean swipeFieldResolved;

    private static Field clpBottomToBottomField;
    private static boolean clpFieldsResolved;

    private final Context context;
    private final float density;
    private final View rootView;
    private final Object dialogFragment;

    private final int idArtwork;
    private final int idTitle;
    private final int idArtistName;
    private final int idMoveButton;
    private final int idOptions;
    private final int idExplicit;
    private final int idExtraIcon;
    private final int idVideoIcon;
    private final int idAiIcon;
    private final int idPayToStreamIcon;

    private ImageView nowPlayingBg;
    private PlayQueueBackdropScrimView backdropScrimView;
    private ViewGroup toolbar;
    private ImageButton navPillButton;
    private ViewGroup tabLayout;
    private RecyclerView playQueueRv;
    private RecyclerView suggestionsRv;
    private TextView suggestionsRefreshBtn;
    private ProgressBar suggestionsProgressBar;

    private GradientDrawable tabContainerBg;
    private GradientDrawable tabIndicatorPill;
    private Drawable tabIndicatorDrawable;

    private final PaletteTransitionController paletteCtrl =
            new PaletteTransitionController(this::syncAllColors);
    private final ExpressivePalette activePalette = paletteCtrl.active;
    private boolean destroyed;

    static void onPlayQueueViewCreated(Object dialogFragment, View rootView) {
        if (dialogFragment == null || rootView == null || !MaterialYouConfig.isExpressivePlayQueueEnabled()) {
            return;
        }
        ExpressivePlayQueueController prev = BY_FRAGMENT.remove(dialogFragment);
        if (prev != null) {
            prev.onDestroy();
        }
        ExpressivePlayQueueController controller =
                new ExpressivePlayQueueController(dialogFragment, rootView);
        BY_FRAGMENT.put(dialogFragment, controller);
        activeControllerRef = new WeakReference<>(controller);
    }

    static void onPlayQueueDestroyView(Object dialogFragment) {
        if (dialogFragment == null) {
            return;
        }
        ExpressivePlayQueueController controller = BY_FRAGMENT.remove(dialogFragment);
        if (controller != null) {
            controller.onDestroy();
        }
    }

    static void onPlayQueueHeaderBound(View itemView) {
        if (itemView == null || !MaterialYouConfig.isExpressivePlayQueueEnabled()) {
            return;
        }
        ExpressivePlayQueueController ctrl = findControllerForView(itemView);
        if (ctrl != null && !ctrl.destroyed) {
            ctrl.styleHeaderRow(itemView);
        } else {
            styleHeaderRowWithPalette(itemView, ExpressiveMediaStyleKit.buildMonetPalette(),
                    itemView.getContext().getResources().getDisplayMetrics().density,
                    ExpressiveMediaStyleKit.getId(itemView.getContext(), "title"),
                    ExpressiveMediaStyleKit.getId(itemView.getContext(), "options"),
                    false);
        }
    }

    static void onPlayQueueItemBound(View itemView) {
        if (itemView == null || !MaterialYouConfig.isExpressivePlayQueueEnabled()) {
            return;
        }
        ExpressivePlayQueueController ctrl = findControllerForView(itemView);
        if (ctrl != null && !ctrl.destroyed) {
            ctrl.styleQueueItemRow(itemView, false);
        } else {
            styleQueueItemRowFallback(itemView, ExpressiveMediaStyleKit.buildMonetPalette(), false);
        }
    }

    static void onPlayQueueSuggestionsViewCreated(Object fragment, View rootView) {
        if (rootView == null || !MaterialYouConfig.isExpressivePlayQueueEnabled()) {
            return;
        }
        ExpressivePlayQueueController ctrl = activeControllerRef.get();
        if (ctrl != null && !ctrl.destroyed) {
            ctrl.attachSuggestionsView(rootView);
        } else {
            styleSuggestionsStandalone(rootView, ExpressiveMediaStyleKit.buildMonetPalette());
        }
    }

    static void onPlayQueueSwipeCallbackInit(Object callback) {
        if (callback == null || !MaterialYouConfig.isExpressivePlayQueueEnabled()) {
            return;
        }
        try {
            if (!swipeFieldResolved) {
                swipeFieldResolved = true;
                for (Field f : callback.getClass().getDeclaredFields()) {
                    if (ColorDrawable.class.isAssignableFrom(f.getType())) {
                        f.setAccessible(true);
                        swipeColorDrawableField = f;
                        break;
                    }
                }
            }
            if (swipeColorDrawableField != null) {
                Object val = swipeColorDrawableField.get(callback);
                if (val instanceof ColorDrawable) {
                    ((ColorDrawable) val).setColor(0xFFB3261E);
                } else {
                    swipeColorDrawableField.set(callback, new ColorDrawable(0xFFB3261E));
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static ExpressivePlayQueueController findControllerForView(View view) {
        View cur = view;
        while (cur != null) {
            if (cur instanceof RecyclerView) {
                ExpressivePlayQueueController ctrl = BY_RV.get(cur);
                if (ctrl != null) {
                    return ctrl;
                }
            }
            if (cur.getParent() instanceof View) {
                cur = (View) cur.getParent();
            } else {
                break;
            }
        }
        ExpressivePlayQueueController active = activeControllerRef.get();
        return (active != null && !active.destroyed) ? active : null;
    }

    private ExpressivePlayQueueController(Object dialogFragment, View rootView) {
        this.dialogFragment = dialogFragment;
        this.rootView = rootView;
        this.context = rootView.getContext();
        this.density = context.getResources().getDisplayMetrics().density;

        idArtwork = ExpressiveMediaStyleKit.getId(context, "artwork");
        idTitle = ExpressiveMediaStyleKit.getId(context, "title");
        idArtistName = ExpressiveMediaStyleKit.getId(context, "artistName");
        idMoveButton = ExpressiveMediaStyleKit.getId(context, "moveButton");
        idOptions = ExpressiveMediaStyleKit.getId(context, "options");
        idExplicit = ExpressiveMediaStyleKit.getId(context, "explicit");
        idExtraIcon = ExpressiveMediaStyleKit.getId(context, "extraIcon");
        idVideoIcon = ExpressiveMediaStyleKit.getId(context, "videoIcon");
        idAiIcon = ExpressiveMediaStyleKit.getId(context, "aiIcon");
        idPayToStreamIcon = ExpressiveMediaStyleKit.getId(context, "payToStreamIcon");

        bindViews();
        styleDialogWindow();
        setupBackdropScrim();
        styleToolbar();
        setupSegmentedTabs();
        setupQueueRecyclerView();
        syncAllColors();
    }

    private void bindViews() {
        View bg = ExpressiveMediaStyleKit.findView(
                rootView, ExpressiveMediaStyleKit.getId(context, "nowPlayingBackground"));
        if (bg instanceof ImageView) {
            nowPlayingBg = (ImageView) bg;
        }
        View tb = ExpressiveMediaStyleKit.findView(
                rootView, ExpressiveMediaStyleKit.getId(context, "toolbar"));
        if (tb instanceof ViewGroup) {
            toolbar = (ViewGroup) tb;
        }
        View tl = ExpressiveMediaStyleKit.findView(
                rootView, ExpressiveMediaStyleKit.getId(context, "tabLayout"));
        if (tl instanceof ViewGroup) {
            tabLayout = (ViewGroup) tl;
        }
        View pq = ExpressiveMediaStyleKit.findView(
                rootView, ExpressiveMediaStyleKit.getId(context, "playQueue"));
        if (pq instanceof RecyclerView) {
            playQueueRv = (RecyclerView) pq;
            BY_RV.put(playQueueRv, this);
        }
    }

    private void styleDialogWindow() {
        try {
            if (!dfDialogMethodResolved) {
                dfDialogMethodResolved = true;
                Class<?> cls = dialogFragment.getClass();
                while (cls != null && dfGetDialogMethod == null) {
                    try {
                        dfGetDialogMethod = cls.getMethod("getDialog");
                    } catch (Throwable ignored) {
                        cls = cls.getSuperclass();
                    }
                }
            }
            if (dfGetDialogMethod == null) {
                return;
            }
            Object dlg = dfGetDialogMethod.invoke(dialogFragment);
            if (!(dlg instanceof android.app.Dialog)) {
                return;
            }
            Window window = ((android.app.Dialog) dlg).getWindow();
            if (window == null) {
                return;
            }
            window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            window.setStatusBarColor(Color.TRANSPARENT);
            window.setNavigationBarColor(Color.TRANSPARENT);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                window.setNavigationBarContrastEnforced(false);
            }
            MaterialYouColorEngine.applySystemBarAppearance(window, MaterialYouColorEngine.isLightMode(context));
        } catch (Throwable ignored) {
        }
    }

    private void setupBackdropScrim() {
        rootView.setBackgroundColor(activePalette.surfaceBase);
        if (!(rootView instanceof ViewGroup)) {
            return;
        }
        ViewGroup rootGroup = (ViewGroup) rootView;
        if (nowPlayingBg != null) {
            nowPlayingBg.setForeground(null);
            if (MaterialYouColorEngine.isEffectiveAmoledBlack()) {
                nowPlayingBg.setVisibility(View.GONE);
            }
        }
        backdropScrimView = new PlayQueueBackdropScrimView(context);
        int bgIdx = nowPlayingBg != null ? rootGroup.indexOfChild(nowPlayingBg) : -1;
        int insertIdx = bgIdx >= 0 ? bgIdx + 1 : 0;
        ViewGroup.LayoutParams lp = (nowPlayingBg != null && nowPlayingBg.getLayoutParams() != null)
                ? nowPlayingBg.getLayoutParams()
                : new ViewGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        // Copy width/height/constraint layout params cleanly so scrim spans full screen behind chrome
        ViewGroup.LayoutParams cloned = null;
        try {
            cloned = (ViewGroup.LayoutParams) lp.getClass().getConstructor(lp.getClass()).newInstance(lp);
        } catch (Throwable ignored) {
            try {
                cloned = lp.getClass().getConstructor(ViewGroup.LayoutParams.class).newInstance(lp);
            } catch (Throwable ignored2) {
            }
        }
        if (cloned != null) {
            rootGroup.addView(backdropScrimView, insertIdx, cloned);
        } else {
            rootGroup.addView(backdropScrimView, insertIdx, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        }
        backdropScrimView.attachArtworkObserver(nowPlayingBg, paletteCtrl::extractFromDrawable);
    }

    private void styleToolbar() {
        if (toolbar == null) {
            return;
        }
        toolbar.setElevation(0f);
        toolbar.setBackground(null);
        ExpressiveMediaStyleKit.tintToolbarMenuAndNav(toolbar, activePalette.onSurface);

        for (int i = 0; i < toolbar.getChildCount(); i++) {
            View child = toolbar.getChildAt(i);
            if (child instanceof ImageButton) {
                navPillButton = (ImageButton) child;
                int size = dp(42f);
                ViewGroup.LayoutParams lp = navPillButton.getLayoutParams();
                if (lp instanceof ViewGroup.MarginLayoutParams) {
                    ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
                    mlp.width = size;
                    mlp.height = size;
                    mlp.setMarginStart(dp(12f));
                    navPillButton.setLayoutParams(mlp);
                }
                int pad = dp(9f);
                navPillButton.setPadding(pad, pad, pad, pad);
                navPillButton.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
                ExpressiveMediaStyleKit.attachSpringPressEffect(navPillButton);
                break;
            }
        }
    }

    private void setupSegmentedTabs() {
        if (tabLayout == null) {
            return;
        }
        tabLayout.setElevation(0f);
        tabLayout.setClipToPadding(false);
        tabLayout.setClipChildren(false);
        ViewGroup.LayoutParams lp = tabLayout.getLayoutParams();
        if (lp instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
            mlp.height = dp(46f);
            mlp.setMarginStart(dp(12f));
            mlp.setMarginEnd(dp(12f));
            mlp.topMargin = dp(4f);
            mlp.bottomMargin = dp(8f);
            tabLayout.setLayoutParams(mlp);
        }
        tabLayout.setPadding(0, 0, 0, 0);

        tabContainerBg = new GradientDrawable();
        tabContainerBg.setShape(GradientDrawable.RECTANGLE);
        tabContainerBg.setCornerRadius(dpf(23f));
        tabLayout.setBackground(tabContainerBg);

        tabIndicatorPill = new GradientDrawable();
        tabIndicatorPill.setShape(GradientDrawable.RECTANGLE);
        tabIndicatorPill.setCornerRadius(dpf(19f));
        int inset = dp(4f);
        tabIndicatorDrawable = new InsetDrawable(tabIndicatorPill, inset, inset, inset, inset);

        resolveTabMethods(tabLayout.getClass());
        invokeTabMethod(tabSetTabModeMethod, tabLayout, 1); // MODE_FIXED
        invokeTabMethod(tabSetTabGravityMethod, tabLayout, 0); // GRAVITY_FILL
        invokeTabMethod(tabSetIndicatorFullWidthMethod, tabLayout, true);
        invokeTabMethod(tabSetIndicatorGravityMethod, tabLayout, 3); // INDICATOR_GRAVITY_STRETCH
        invokeTabMethod(tabSetIndicatorAnimModeMethod, tabLayout, 1); // INDICATOR_ANIMATION_MODE_ELASTIC
        invokeTabMethod(tabSetSelectedIndicatorDrawableMethod, tabLayout, tabIndicatorDrawable);

        tabLayout.post(() -> {
            if (!destroyed && tabLayout != null) {
                styleTabTextViews(tabLayout);
            }
        });
    }

    private void styleTabTextViews(View v) {
        if (v instanceof TextView) {
            TextView tv = (TextView) v;
            tv.setAllCaps(false);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            tv.setLetterSpacing(0.01f);
            tv.setSingleLine(true);
            return;
        }
        if (v instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) v;
            for (int i = 0; i < vg.getChildCount(); i++) {
                styleTabTextViews(vg.getChildAt(i));
            }
        }
    }

    private static void configureScrollRecyclerView(RecyclerView rv, float density) {
        rv.setBackgroundColor(Color.TRANSPARENT);
        rv.setClipToPadding(false);
        rv.setVerticalFadingEdgeEnabled(true);
        rv.setFadingEdgeLength(ExpressiveMediaStyleKit.dp(density, 18f));
        ViewGroup.LayoutParams rlp = rv.getLayoutParams();
        if (rlp instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) rlp;
            int topM = ExpressiveMediaStyleKit.dp(density, 4f);
            if (mlp.topMargin != topM) {
                mlp.topMargin = topM;
                rv.setLayoutParams(mlp);
            }
        }
        final int padL = rv.getPaddingLeft();
        final int padR = rv.getPaddingRight();
        rv.setPadding(
                padL,
                ExpressiveMediaStyleKit.dp(density, 2f),
                padR,
                ExpressiveMediaStyleKit.dp(density, 28f));

        rv.setOnApplyWindowInsetsListener((v, insets) -> {
            int navBot = insets.getInsets(WindowInsets.Type.navigationBars()).bottom;
            v.setPadding(
                    padL,
                    ExpressiveMediaStyleKit.dp(density, 2f),
                    padR,
                    navBot + ExpressiveMediaStyleKit.dp(density, 24f));
            return insets;
        });
        rv.requestApplyInsets();
    }

    private void setupQueueRecyclerView() {
        if (playQueueRv == null) {
            return;
        }
        configureScrollRecyclerView(playQueueRv, density);

        playQueueRv.addOnChildAttachStateChangeListener(new RecyclerView.OnChildAttachStateChangeListener() {
            @Override
            public void onChildViewAttachedToWindow(View child) {
                if (destroyed || child == null) {
                    return;
                }
                if (ExpressiveMediaStyleKit.findView(child, idMoveButton) != null) {
                    styleQueueItemRow(child, false);
                } else if (ExpressiveMediaStyleKit.findView(child, idTitle) != null) {
                    styleHeaderRow(child);
                }
            }

            @Override
            public void onChildViewDetachedFromWindow(View child) {
            }
        });

        for (int i = 0; i < playQueueRv.getChildCount(); i++) {
            View child = playQueueRv.getChildAt(i);
            if (ExpressiveMediaStyleKit.findView(child, idMoveButton) != null) {
                styleQueueItemRow(child, false);
            } else if (ExpressiveMediaStyleKit.findView(child, idTitle) != null) {
                styleHeaderRow(child);
            }
        }
    }

    private void attachSuggestionsView(View suggRoot) {
        if (suggRoot == null) {
            return;
        }
        suggRoot.setBackgroundColor(Color.TRANSPARENT);

        View pb = ExpressiveMediaStyleKit.findView(
                suggRoot, ExpressiveMediaStyleKit.getId(context, "progressBar"));
        if (pb instanceof ProgressBar) {
            suggestionsProgressBar = (ProgressBar) pb;
            suggestionsProgressBar.setIndeterminateTintList(
                    ColorStateList.valueOf(activePalette.primaryAccent));
        }

        View ref = ExpressiveMediaStyleKit.findView(
                suggRoot, ExpressiveMediaStyleKit.getId(context, "refresh"));
        if (ref instanceof TextView) {
            suggestionsRefreshBtn = (TextView) ref;
            styleSuggestionsRefreshPill(suggestionsRefreshBtn, activePalette, density);
        }

        View rv = ExpressiveMediaStyleKit.findView(
                suggRoot, ExpressiveMediaStyleKit.getId(context, "recyclerView"));
        if (rv instanceof RecyclerView) {
            suggestionsRv = (RecyclerView) rv;
            BY_RV.put(suggestionsRv, this);
            configureScrollRecyclerView(suggestionsRv, density);

            suggestionsRv.addOnChildAttachStateChangeListener(new RecyclerView.OnChildAttachStateChangeListener() {
                @Override
                public void onChildViewAttachedToWindow(View child) {
                    if (!destroyed && child != null) {
                        styleQueueItemRow(child, true);
                    }
                }

                @Override
                public void onChildViewDetachedFromWindow(View child) {
                }
            });

            for (int i = 0; i < suggestionsRv.getChildCount(); i++) {
                styleQueueItemRow(suggestionsRv.getChildAt(i), true);
            }
        }
    }

    private static void styleSuggestionsStandalone(View suggRoot, ExpressivePalette palette) {
        Context ctx = suggRoot.getContext();
        float density = ctx.getResources().getDisplayMetrics().density;
        suggRoot.setBackgroundColor(Color.TRANSPARENT);

        View pb = ExpressiveMediaStyleKit.findView(
                suggRoot, ExpressiveMediaStyleKit.getId(ctx, "progressBar"));
        if (pb instanceof ProgressBar) {
            ((ProgressBar) pb).setIndeterminateTintList(
                    ColorStateList.valueOf(palette.primaryAccent));
        }

        View ref = ExpressiveMediaStyleKit.findView(
                suggRoot, ExpressiveMediaStyleKit.getId(ctx, "refresh"));
        if (ref instanceof TextView) {
            styleSuggestionsRefreshPill((TextView) ref, palette, density);
        }

        View rvView = ExpressiveMediaStyleKit.findView(
                suggRoot, ExpressiveMediaStyleKit.getId(ctx, "recyclerView"));
        if (rvView instanceof RecyclerView) {
            RecyclerView rv = (RecyclerView) rvView;
            configureScrollRecyclerView(rv, density);
            rv.addOnChildAttachStateChangeListener(new RecyclerView.OnChildAttachStateChangeListener() {
                @Override
                public void onChildViewAttachedToWindow(View child) {
                    if (child != null) {
                        styleQueueItemRowFallback(child, palette, true);
                    }
                }

                @Override
                public void onChildViewDetachedFromWindow(View child) {
                }
            });
        }
    }

    private void syncAllColors() {
        if (destroyed) {
            return;
        }
        rootView.setBackgroundColor(activePalette.surfaceBase);
        if (backdropScrimView != null) {
            backdropScrimView.setColors(activePalette.surfaceBase, activePalette.atmosphericTint);
        }
        if (toolbar != null) {
            ExpressiveMediaStyleKit.tintToolbarMenuAndNav(toolbar, activePalette.onSurface);
        }
        if (navPillButton != null) {
            navPillButton.setImageTintList(ColorStateList.valueOf(activePalette.onSurface));
            navPillButton.setBackground(createCircularPillDrawable(
                    MaterialYouColorEngine.withAlpha(activePalette.surfaceContainer, 0xCC),
                    Math.max(1, dp(1f)),
                    MaterialYouColorEngine.withAlpha(activePalette.outlineVariant, 0x70),
                    MaterialYouColorEngine.withAlpha(activePalette.primaryAccent, 0x33)
            ));
        }
        if (tabLayout != null) {
            if (tabContainerBg != null) {
                tabContainerBg.setColor(MaterialYouColorEngine.withAlpha(
                        activePalette.surfaceContainer, 0xD2));
                tabContainerBg.setStroke(Math.max(1, dp(1f)),
                        MaterialYouColorEngine.withAlpha(activePalette.outlineVariant, 0x66));
            }
            if (tabIndicatorPill != null) {
                tabIndicatorPill.setColor(activePalette.primaryAccent);
                invokeTabMethod(tabSetSelectedIndicatorDrawableMethod, tabLayout,
                        tabIndicatorDrawable != null ? tabIndicatorDrawable : tabIndicatorPill);
            }
            invokeTabMethod(tabSetSelectedIndicatorColorMethod, tabLayout, activePalette.primaryAccent);
            invokeTabMethod(tabSetTextColorsMethod, tabLayout,
                    activePalette.onSurfaceVariant, activePalette.onPrimary);
            invokeTabMethod(tabSetRippleColorMethod, tabLayout,
                    ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(activePalette.primaryAccent, 0x24)));
            styleTabTextViews(tabLayout);
        }
        if (playQueueRv != null) {
            for (int i = 0; i < playQueueRv.getChildCount(); i++) {
                View child = playQueueRv.getChildAt(i);
                if (ExpressiveMediaStyleKit.findView(child, idMoveButton) != null) {
                    styleQueueItemRow(child, false);
                } else if (ExpressiveMediaStyleKit.findView(child, idTitle) != null) {
                    styleHeaderRow(child);
                }
            }
        }
        if (suggestionsProgressBar != null) {
            suggestionsProgressBar.setIndeterminateTintList(
                    ColorStateList.valueOf(activePalette.primaryAccent));
        }
        if (suggestionsRefreshBtn != null) {
            styleSuggestionsRefreshPill(suggestionsRefreshBtn, activePalette, density);
        }
        if (suggestionsRv != null) {
            for (int i = 0; i < suggestionsRv.getChildCount(); i++) {
                styleQueueItemRow(suggestionsRv.getChildAt(i), true);
            }
        }
    }

    private void styleHeaderRow(View itemView) {
        boolean isFirstHeader = false;
        if (playQueueRv != null && itemView.getParent() == playQueueRv) {
            isFirstHeader = playQueueRv.getChildAdapterPosition(itemView) == 0;
        }
        styleHeaderRowWithPalette(itemView, activePalette, density, idTitle, idOptions, isFirstHeader);
    }

    private static void styleHeaderRowWithPalette(
            View itemView,
            ExpressivePalette palette,
            float density,
            int idTitle,
            int idOptions,
            boolean isFirstHeader
    ) {
        itemView.setBackground(null);
        itemView.setPaddingRelative(
                ExpressiveMediaStyleKit.dp(density, 20f),
                ExpressiveMediaStyleKit.dp(density, isFirstHeader ? 10f : 14f),
                ExpressiveMediaStyleKit.dp(density, 14f),
                ExpressiveMediaStyleKit.dp(density, 6f));

        View titleView = ExpressiveMediaStyleKit.findView(itemView, idTitle);
        if (titleView instanceof TextView) {
            TextView tv = (TextView) titleView;
            ViewGroup.LayoutParams tlp = tv.getLayoutParams();
            if (tlp != null && tlp.height != ViewGroup.LayoutParams.WRAP_CONTENT) {
                tlp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
                tv.setLayoutParams(tlp);
            }
            tv.setMinimumHeight(ExpressiveMediaStyleKit.dp(density, 36f));
            tv.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
            tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            tv.setLetterSpacing(0.06f);
            tv.setTextColor(isFirstHeader ? palette.primaryAccent : palette.onSurfaceVariant);
        }

        View optionsView = ExpressiveMediaStyleKit.findView(itemView, idOptions);
        if (optionsView instanceof ImageView && optionsView.getVisibility() == View.VISIBLE) {
            ImageView iv = (ImageView) optionsView;
            int size = ExpressiveMediaStyleKit.dp(density, 36f);
            ViewGroup.LayoutParams olp = iv.getLayoutParams();
            if (olp != null) {
                olp.width = size;
                olp.height = size;
                centerConstraintVertically(olp);
                iv.setLayoutParams(olp);
            }
            int pad = ExpressiveMediaStyleKit.dp(density, 8f);
            iv.setPadding(pad, pad, pad, pad);
            iv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            iv.setImageTintList(ColorStateList.valueOf(palette.onSurface));
            iv.setBackground(createCircularPillDrawable(
                    MaterialYouColorEngine.withAlpha(palette.surfaceContainerHigh, 0xCC),
                    Math.max(1, ExpressiveMediaStyleKit.dp(density, 1f)),
                    MaterialYouColorEngine.withAlpha(palette.outlineVariant, 0x66),
                    MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x33)
            ));
            ExpressiveMediaStyleKit.attachSpringPressEffect(iv);
        }
    }

    private static void centerConstraintVertically(ViewGroup.LayoutParams lp) {
        if (lp == null) {
            return;
        }
        Class<?> cls = lp.getClass();
        if (!cls.getName().endsWith("ConstraintLayout$LayoutParams")) {
            return;
        }
        try {
            if (!clpFieldsResolved) {
                clpFieldsResolved = true;
                clpBottomToBottomField = cls.getField("bottomToBottom");
            }
            if (clpBottomToBottomField != null) {
                clpBottomToBottomField.setInt(lp, 0);
            }
        } catch (Throwable ignored) {
        }
    }

    private void styleQueueItemRow(View itemView, boolean isSuggestions) {
        styleQueueItemRowInternal(
                itemView,
                activePalette,
                density,
                idArtwork,
                idTitle,
                idArtistName,
                idMoveButton,
                idExplicit,
                idExtraIcon,
                idVideoIcon,
                idAiIcon,
                idPayToStreamIcon,
                isSuggestions
        );
    }

    private static void styleQueueItemRowFallback(View itemView, ExpressivePalette palette, boolean isSuggestions) {
        Context ctx = itemView.getContext();
        float density = ctx.getResources().getDisplayMetrics().density;
        styleQueueItemRowInternal(
                itemView,
                palette,
                density,
                ExpressiveMediaStyleKit.getId(ctx, "artwork"),
                ExpressiveMediaStyleKit.getId(ctx, "title"),
                ExpressiveMediaStyleKit.getId(ctx, "artistName"),
                ExpressiveMediaStyleKit.getId(ctx, "moveButton"),
                ExpressiveMediaStyleKit.getId(ctx, "explicit"),
                ExpressiveMediaStyleKit.getId(ctx, "extraIcon"),
                ExpressiveMediaStyleKit.getId(ctx, "videoIcon"),
                ExpressiveMediaStyleKit.getId(ctx, "aiIcon"),
                ExpressiveMediaStyleKit.getId(ctx, "payToStreamIcon"),
                isSuggestions
        );
    }

    private static void styleQueueItemRowInternal(
            View itemView,
            ExpressivePalette palette,
            float density,
            int idArtwork,
            int idTitle,
            int idArtistName,
            int idMoveButton,
            int idExplicit,
            int idExtraIcon,
            int idVideoIcon,
            int idAiIcon,
            int idPayToStreamIcon,
            boolean isSuggestions
    ) {
        View artView = ExpressiveMediaStyleKit.findView(itemView, idArtwork);
        if (artView != null) {
            ExpressiveMediaStyleKit.setShapeableImageCornerRadiusIfSquare(
                    artView, ExpressiveMediaStyleKit.dpf(density, 12f), density);
        }

        View moveBtn = ExpressiveMediaStyleKit.findView(itemView, idMoveButton);
        View tView = ExpressiveMediaStyleKit.findView(itemView, idTitle);
        View aView = ExpressiveMediaStyleKit.findView(itemView, idArtistName);

        boolean isCurrentlyPlaying = !isSuggestions
                && moveBtn != null
                && moveBtn.getVisibility() != View.VISIBLE;
        boolean isHistory = !isSuggestions
                && tView != null
                && tView.getAlpha() < 0.75f;

        int targetH = ExpressiveMediaStyleKit.dp(density, isCurrentlyPlaying ? 76f : 72f);
        itemView.setMinimumHeight(targetH);
        ViewGroup.LayoutParams ilp = itemView.getLayoutParams();
        if (ilp != null && ilp.height != targetH) {
            ilp.height = targetH;
            itemView.setLayoutParams(ilp);
        }

        int insetH = ExpressiveMediaStyleKit.dp(density, 12f);
        int insetV = ExpressiveMediaStyleKit.dp(density, isCurrentlyPlaying ? 4f : 3f);
        float radius = ExpressiveMediaStyleKit.dpf(density, isCurrentlyPlaying ? 18f : 16f);

        GradientDrawable cardFill = null;
        if (isCurrentlyPlaying) {
            cardFill = new GradientDrawable();
            cardFill.setShape(GradientDrawable.RECTANGLE);
            cardFill.setCornerRadius(radius);
            cardFill.setColor(MaterialYouColorEngine.withAlpha(
                    MaterialYouColorEngine.blendRgb(palette.surfaceContainerHigh, palette.primaryAccent, 0.22f),
                    0xDC));
            cardFill.setStroke(Math.max(1, ExpressiveMediaStyleKit.dp(density, 1.25f)),
                    MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x8E));
        } else if (!isHistory) {
            cardFill = new GradientDrawable();
            cardFill.setShape(GradientDrawable.RECTANGLE);
            cardFill.setCornerRadius(radius);
            cardFill.setColor(MaterialYouColorEngine.withAlpha(palette.surfaceContainer, 0x88));
            cardFill.setStroke(Math.max(1, ExpressiveMediaStyleKit.dp(density, 0.75f)),
                    MaterialYouColorEngine.withAlpha(palette.outlineVariant, 0x3C));
        }

        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(radius);
        mask.setColor(0xFFFFFFFF);

        RippleDrawable ripple = new RippleDrawable(
                ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x2E)),
                cardFill,
                mask
        );
        // Apply InsetDrawable background BEFORE setting padding so setBackground doesn't wipe inner card padding
        itemView.setBackground(new InsetDrawable(ripple, insetH, insetV, insetH, insetV));
        itemView.setPaddingRelative(
                insetH + ExpressiveMediaStyleKit.dp(density, 12f),
                insetV + ExpressiveMediaStyleKit.dp(density, 6f),
                insetH + ExpressiveMediaStyleKit.dp(density, 4f),
                insetV + ExpressiveMediaStyleKit.dp(density, 6f)
        );

        if (tView instanceof TextView) {
            TextView tv = (TextView) tView;
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, isCurrentlyPlaying ? 15.5f : 15f);
            tv.setTypeface(Typeface.create("sans-serif-medium",
                    isCurrentlyPlaying ? Typeface.BOLD : Typeface.NORMAL));
            tv.setTextColor(isCurrentlyPlaying ? palette.primaryAccent : palette.onSurface);
        }
        if (aView instanceof TextView) {
            TextView av = (TextView) aView;
            av.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
            av.setTextColor(isCurrentlyPlaying
                    ? MaterialYouColorEngine.withAlpha(palette.onSurface, 0xCC)
                    : palette.onSurfaceVariant);
        }

        if (moveBtn instanceof ImageView) {
            ImageView mv = (ImageView) moveBtn;
            mv.setImageTintMode(PorterDuff.Mode.SRC_IN);
            mv.setImageTintList(ColorStateList.valueOf(isSuggestions
                    ? palette.primaryAccent
                    : MaterialYouColorEngine.withAlpha(palette.onSurfaceVariant, 0xA8)));
        }

        int badgeTint = isCurrentlyPlaying ? palette.primaryAccent : palette.onSurfaceVariant;
        View explicitView = ExpressiveMediaStyleKit.findView(itemView, idExplicit);
        if (explicitView instanceof ImageView && explicitView.getVisibility() == View.VISIBLE) {
            ImageView ev = (ImageView) explicitView;
            ev.setImageTintMode(PorterDuff.Mode.MULTIPLY);
            ev.setImageTintList(ColorStateList.valueOf(palette.onSurfaceVariant));
        }
        tintIconView(ExpressiveMediaStyleKit.findView(itemView, idVideoIcon), palette.onSurfaceVariant);
        tintIconView(ExpressiveMediaStyleKit.findView(itemView, idExtraIcon), badgeTint);
        tintIconView(ExpressiveMediaStyleKit.findView(itemView, idAiIcon), palette.onSurfaceVariant);
        View payView = ExpressiveMediaStyleKit.findView(itemView, idPayToStreamIcon);
        if (payView instanceof ImageView) {
            ((ImageView) payView).setImageTintList(null);
        }
    }

    private static void tintIconView(View v, int color) {
        if (v instanceof ImageView && v.getVisibility() == View.VISIBLE) {
            ImageView iv = (ImageView) v;
            iv.setImageTintMode(PorterDuff.Mode.SRC_IN);
            iv.setImageTintList(ColorStateList.valueOf(color));
        }
    }

    private static void styleSuggestionsRefreshPill(TextView btn, ExpressivePalette palette, float density) {
        btn.setMinimumHeight(ExpressiveMediaStyleKit.dp(density, 36f));
        btn.setPaddingRelative(
                ExpressiveMediaStyleKit.dp(density, 16f),
                ExpressiveMediaStyleKit.dp(density, 6f),
                ExpressiveMediaStyleKit.dp(density, 16f),
                ExpressiveMediaStyleKit.dp(density, 6f));
        btn.setGravity(Gravity.CENTER);
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        btn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        btn.setTextColor(palette.onSurface);

        float r = ExpressiveMediaStyleKit.dpf(density, 18f);
        GradientDrawable fill = new GradientDrawable();
        fill.setShape(GradientDrawable.RECTANGLE);
        fill.setCornerRadius(r);
        fill.setColor(MaterialYouColorEngine.blendRgb(
                palette.surfaceContainerHigh, palette.primaryAccent, 0.24f));
        fill.setStroke(Math.max(1, ExpressiveMediaStyleKit.dp(density, 1f)),
                MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x55));

        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(r);
        mask.setColor(0xFFFFFFFF);

        btn.setBackground(new RippleDrawable(
                ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x33)),
                fill,
                mask
        ));
        ExpressiveMediaStyleKit.attachSpringPressEffect(btn);
    }

    private static Drawable createCircularPillDrawable(int fillColor, int strokePx, int strokeColor, int rippleColor) {
        GradientDrawable fill = new GradientDrawable();
        fill.setShape(GradientDrawable.OVAL);
        fill.setColor(fillColor);
        if (strokePx > 0) {
            fill.setStroke(strokePx, strokeColor);
        }

        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.OVAL);
        mask.setColor(0xFFFFFFFF);

        return new RippleDrawable(ColorStateList.valueOf(rippleColor), fill, mask);
    }

    private static void resolveTabMethods(Class<?> cls) {
        if (tabLayoutClassCached == cls) {
            return;
        }
        tabLayoutClassCached = cls;
        tabSetTabModeMethod = findMethod(cls, "setTabMode", int.class);
        tabSetTabGravityMethod = findMethod(cls, "setTabGravity", int.class);
        tabSetIndicatorFullWidthMethod = findMethod(cls, "setTabIndicatorFullWidth", boolean.class);
        tabSetIndicatorGravityMethod = findMethod(cls, "setSelectedTabIndicatorGravity", int.class);
        tabSetIndicatorAnimModeMethod = findMethod(cls, "setTabIndicatorAnimationMode", int.class);
        tabSetSelectedIndicatorDrawableMethod = findMethod(cls, "setSelectedTabIndicator", Drawable.class);
        tabSetSelectedIndicatorColorMethod = findMethod(cls, "setSelectedTabIndicatorColor", int.class);
        tabSetTextColorsMethod = findMethod(cls, "setTabTextColors", int.class, int.class);
        tabSetRippleColorMethod = findMethod(cls, "setTabRippleColor", ColorStateList.class);
    }

    private static Method findMethod(Class<?> cls, String name, Class<?>... params) {
        try {
            return cls.getMethod(name, params);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void invokeTabMethod(Method m, Object target, Object... args) {
        if (m == null || target == null) {
            return;
        }
        try {
            m.invoke(target, args);
        } catch (Throwable ignored) {
        }
    }

    private void onDestroy() {
        destroyed = true;
        paletteCtrl.destroy();
        if (backdropScrimView != null) {
            backdropScrimView.attachArtworkObserver(null, null);
        }
        if (playQueueRv != null) {
            BY_RV.remove(playQueueRv);
        }
        if (suggestionsRv != null) {
            BY_RV.remove(suggestionsRv);
        }
        nowPlayingBg = null;
        backdropScrimView = null;
        toolbar = null;
        navPillButton = null;
        tabLayout = null;
        playQueueRv = null;
        suggestionsRv = null;
        suggestionsRefreshBtn = null;
        suggestionsProgressBar = null;
    }

    private int dp(float val) {
        return ExpressiveMediaStyleKit.dp(density, val);
    }

    private float dpf(float val) {
        return ExpressiveMediaStyleKit.dpf(density, val);
    }

    /**
     * Atmospheric tonal scrim rendered above TIDAL's blurred album art background and behind
     * Play Queue content, while observing Coil drawable transitions for live Monet color extraction.
     */
    private static final class PlayQueueBackdropScrimView extends View {

        interface OnDrawableListener {
            void onDrawableChanged(Drawable drawable);
        }

        private final Paint scrimPaint = new Paint();
        private WeakReference<ImageView> bgRef;
        private OnDrawableListener listener;
        private Drawable lastObservedDrawable;
        private boolean wasAnimating;
        private ViewTreeObserver.OnPreDrawListener preDrawListener;
        private boolean preDrawAttached;

        private int surfaceBaseColor;
        private int atmosphericTintColor;
        private int cachedH = -1;
        private int cachedBase;
        private int cachedTint;
        private boolean cachedAmoled;
        private boolean cachedLightMode;
        private LinearGradient scrimShader;

        PlayQueueBackdropScrimView(Context context) {
            super(context);
            setWillNotDraw(false);
            setForceDarkAllowed(false);
            setClickable(false);
            setFocusable(false);
            setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
            surfaceBaseColor = MaterialYouColorEngine.getSurfaceBase();
            atmosphericTintColor = surfaceBaseColor;
        }

        void attachArtworkObserver(ImageView bgView, OnDrawableListener l) {
            detachPreDraw();
            this.bgRef = bgView != null ? new WeakReference<>(bgView) : null;
            this.listener = l;
            this.lastObservedDrawable = null;
            this.wasAnimating = false;
            if (bgView != null && isAttachedToWindow()) {
                attachPreDraw();
            }
            checkDrawableChanged();
        }

        void setColors(int surfaceBase, int atmosphericTint) {
            if (this.surfaceBaseColor != surfaceBase || this.atmosphericTintColor != atmosphericTint) {
                this.surfaceBaseColor = surfaceBase;
                this.atmosphericTintColor = atmosphericTint;
                cachedH = -1;
                scrimShader = null;
                invalidate();
            }
        }

        void checkDrawableChanged() {
            ImageView iv = bgRef != null ? bgRef.get() : null;
            if (iv == null) {
                return;
            }
            Drawable cur = iv.getDrawable();
            boolean anim = cur instanceof Animatable && ((Animatable) cur).isRunning();
            if (cur != lastObservedDrawable) {
                lastObservedDrawable = cur;
                wasAnimating = anim;
                if (listener != null) {
                    listener.onDrawableChanged(cur);
                }
                if (anim) {
                    postInvalidateOnAnimation();
                }
            } else if (anim) {
                wasAnimating = true;
                postInvalidateOnAnimation();
            } else if (wasAnimating) {
                wasAnimating = false;
                if (listener != null) {
                    listener.onDrawableChanged(cur);
                }
            }
        }

        @Override
        protected void onAttachedToWindow() {
            super.onAttachedToWindow();
            attachPreDraw();
            checkDrawableChanged();
        }

        @Override
        protected void onDetachedFromWindow() {
            detachPreDraw();
            super.onDetachedFromWindow();
        }

        private void attachPreDraw() {
            if (preDrawAttached) {
                return;
            }
            ViewTreeObserver vto = getViewTreeObserver();
            if (vto != null && vto.isAlive()) {
                preDrawListener = () -> {
                    try {
                        if (!isAttachedToWindow()) {
                            detachPreDraw();
                            return true;
                        }
                        checkDrawableChanged();
                    } catch (Throwable ignored) {
                    }
                    return true;
                };
                vto.addOnPreDrawListener(preDrawListener);
                preDrawAttached = true;
            }
        }

        private void detachPreDraw() {
            if (!preDrawAttached || preDrawListener == null) {
                preDrawAttached = false;
                return;
            }
            try {
                ViewTreeObserver vto = getViewTreeObserver();
                if (vto != null && vto.isAlive()) {
                    vto.removeOnPreDrawListener(preDrawListener);
                }
            } catch (Throwable ignored) {
            }
            preDrawAttached = false;
            preDrawListener = null;
        }

        @Override
        protected void onDraw(Canvas canvas) {
            if (canvas == null) {
                return;
            }
            checkDrawableChanged();
            int w = getWidth();
            int h = getHeight();
            if (w <= 0 || h <= 0) {
                return;
            }
            boolean lightMode = MaterialYouColorEngine.isLightMode(getContext());
            boolean amoled = MaterialYouColorEngine.isEffectiveAmoledBlack();
            if (amoled) {
                scrimPaint.setShader(null);
                scrimPaint.setColor(0xFF000000);
                canvas.drawRect(0f, 0f, w, h, scrimPaint);
                return;
            }

            if (scrimShader == null
                    || cachedH != h
                    || cachedBase != surfaceBaseColor
                    || cachedTint != atmosphericTintColor
                    || cachedAmoled != amoled
                    || cachedLightMode != lightMode) {
                cachedH = h;
                cachedBase = surfaceBaseColor;
                cachedTint = atmosphericTintColor;
                cachedAmoled = amoled;
                cachedLightMode = lightMode;
                int topTone = MaterialYouColorEngine.blendRgb(
                        surfaceBaseColor, atmosphericTintColor, lightMode ? 0.32f : 0.40f);
                int midTone = MaterialYouColorEngine.blendRgb(
                        surfaceBaseColor, atmosphericTintColor, lightMode ? 0.18f : 0.24f);
                int a0 = lightMode ? 0xCC : 0xC4;
                int a1 = lightMode ? 0xE2 : 0xD6;
                int a2 = lightMode ? 0xF4 : 0xEC;
                scrimShader = new LinearGradient(
                        0f, 0f, 0f, h,
                        new int[]{
                                MaterialYouColorEngine.withAlpha(topTone, a0),
                                MaterialYouColorEngine.withAlpha(midTone, a1),
                                MaterialYouColorEngine.withAlpha(surfaceBaseColor, a2)
                        },
                        new float[]{0f, 0.45f, 1f},
                        Shader.TileMode.CLAMP
                );
            }
            scrimPaint.setShader(scrimShader);
            canvas.drawRect(0f, 0f, w, h, scrimPaint);
        }
    }
}
