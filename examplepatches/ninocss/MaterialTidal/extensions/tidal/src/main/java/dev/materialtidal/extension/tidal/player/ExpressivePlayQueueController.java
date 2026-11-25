package dev.materialtidal.extension.tidal.player;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ArgbEvaluator;
import android.animation.ValueAnimator;
import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.animation.Interpolator;
import android.view.animation.PathInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.recyclerview.widget.AsyncListDiffer;
import androidx.recyclerview.widget.ItemTouchHelper;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.LinearSmoothScroller;
import androidx.recyclerview.widget.ListAdapter;
import androidx.recyclerview.widget.RecyclerView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.WeakHashMap;

import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit;
import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit.ExpressivePalette;
import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit.PaletteTransitionController;
import dev.materialtidal.extension.tidal.theme.ExpressiveBlurKit;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Coordinates the Material 3 Expressive redesign for TIDAL's Play Queue bottom sheet
 * ({@code com.aspiro.wamp.nowplaying.view.playqueue.c}) and Suggested Tracks tab
 * ({@code com.aspiro.wamp.nowplaying.view.suggestions.a}):
 * <ul>
 *     <li>Floating rounded bottom sheet (86% viewport height) with cross-window backdrop blur,
 *         drag handle, velocity-tracked swipe-to-dismiss, and real M3 spatial spring physics.</li>
 *     <li>Expressive "Next up" display header with live track count and top-right source pill
 *         (e.g. "Your Mix").</li>
 *     <li>Spotlight Currently Playing pill card with live animated playing dots, elevated Up Next
 *         cards with tonal drag handle pills, and soft history rows.</li>
 *     <li>Connected asymmetrical M3 Expressive bottom floating toolbar (Shuffle / Repeat / Sleep
 *         Timer + attached tertiary overflow button) expanding into a centered staggered spring
 *         menu (Clear queue / Save as playlist).</li>
 * </ul>
 */
final class ExpressivePlayQueueController {

    private static final int TAG_PLAYING_DOTS = 0x7A4D5471;
    private static final int TAG_ROW_ANIMATED = 0x7A4D5472;
    private static final int TAG_BTN_BG_COLOR = 0x7A4D5473;
    private static final int TAG_BTN_FG_COLOR = 0x7A4D5474;
    private static final int TAG_BTN_ANIM = 0x7A4D5475;
    private static final int TAG_ROW_STYLE_SIG = 0x7A4D5476;
    private static final int TAG_ROW_CONSTRAINTS_APPLIED = 0x7A4D5477;
    private static final int TAG_ROW_OPTIONS_BTN = 0x7A4D5478;
    private static final int TAG_DOTS_LAYOUT_HOOKED = 0x7A4D5479;
    private static final int ID_ROW_OPTIONS_BTN = View.generateViewId();

    private static final Interpolator SPRING_SPATIAL = new ExpressiveSpringInterpolator(0.78f, 8.6f);
    private static final Interpolator SPRING_BOUNCY = new ExpressiveSpringInterpolator(0.66f, 10.2f);
    private static final Interpolator EFFECTS_SMOOTH = new PathInterpolator(0.20f, 0.0f, 0.0f, 1.0f);
    private static final Interpolator DISMISS_ACCEL = new PathInterpolator(0.32f, 0.0f, 0.80f, 0.16f);

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

    private static Field clpStartToStartField;
    private static Field clpStartToEndField;
    private static Field clpEndToStartField;
    private static Field clpEndToEndField;
    private static Field clpTopToTopField;
    private static Field clpBottomToBottomField;
    private static Field clpGoneStartMarginField;
    private static boolean clpFieldsResolved;

    private static Field listAdapterDifferField;
    private static Field differMaxGenField;
    private static Field differListField;
    private static Field differReadOnlyListField;
    private static boolean differFieldsResolved;

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
    private boolean dismissing;
    private boolean entranceAnimated;
    private long sheetOpenedUptimeMs;
    private boolean isPlayingNow;
    private boolean isDraggingItem;
    private RecyclerView.ItemAnimator savedItemAnimator;
    private boolean itemAnimatorSuspended;

    // Bottom-sheet chrome
    private Dialog hostDialog;
    private Window dialogWindow;
    private GradientDrawable handleDrawable;
    private View.OnLayoutChangeListener handleLayoutListener;
    private RecyclerView.AdapterDataObserver adapterObserver;
    private RecyclerView.Adapter<?> observedAdapter;
    private ViewTreeObserver.OnGlobalLayoutListener globalListener;
    private String lastTitle = "";
    private String lastSubtitle = "";
    private String appliedToolbarTitle = "";
    private String appliedToolbarSubtitle = "";
    private String lastSourceLabel = "";

    // Top-right source chip ("Your Mix")
    private LinearLayout sourceChip;
    private ImageView sourceChipIcon;
    private TextView sourceChipText;
    private SourceQueueDrawable sourceQueueDrawable;

    // Floating dock & expressive stacked menu
    private FrameLayout actionOverlay;
    private View menuScrim;
    private LinearLayout menuColumn;
    private LinearLayout barRow;
    private LinearLayout pillGroup;
    private ImageView btnShuffle;
    private ImageView btnRepeat;
    private ImageView btnSleep;
    private ImageView btnMore;
    private ShuffleDrawable shuffleDrawable;
    private RepeatDrawable repeatDrawable;
    private RepeatDrawable repeatOneDrawable;
    private SleepTimerDrawable sleepTimerOffDrawable;
    private SleepTimerDrawable sleepTimerOnDrawable;
    private MoreDotsDrawable moreDotsDrawable;
    private ClearQueueDrawable clearQueueDrawable;
    private PlaylistAddDrawable playlistAddDrawable;
    private final LinearLayout[] menuItems = new LinearLayout[2];
    private boolean menuOpen;
    private boolean dockShownForTab = true;
    private boolean lastShuffleActive;
    private boolean lastRepeatActive;
    private boolean lastRepeatOne;
    private boolean lastSleepActive;
    private boolean actionStateInitialized;

    private final Set<PlayingDotsDrawable> activeDotsDrawables =
            Collections.newSetFromMap(new WeakHashMap<>());

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

    static void onPlaybackStateChanged(
            boolean shuffleOn,
            String repeatMode,
            boolean playing,
            String sourceName
    ) {
        ExpressivePlayQueueController ctrl = activeControllerRef.get();
        if (ctrl == null || ctrl.destroyed) {
            return;
        }
        ctrl.rootView.post(() -> {
            if (ctrl.destroyed) {
                return;
            }
            ctrl.isPlayingNow = playing;
            ctrl.updatePlayingDotsState();
            ctrl.applyActionState(shuffleOn, repeatMode, ExpressivePlayerBridge.isSleepTimerActiveNow(), true);
            if (sourceName != null && !sourceName.trim().isEmpty()) {
                ctrl.updateSourceChipText(sourceName.trim());
            }
        });
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
                int errColor = MaterialYouColorEngine.getError();
                Object val = swipeColorDrawableField.get(callback);
                if (val instanceof ColorDrawable) {
                    ((ColorDrawable) val).setColor(errColor);
                } else {
                    swipeColorDrawableField.set(callback, new ColorDrawable(errColor));
                }
            }
        } catch (Throwable ignored) {
        }
    }

    @SuppressWarnings("unchecked")
    static void onPlayQueueSyncMove(
            ListAdapter<?, ?> adapter,
            List<?> newList,
            RecyclerView.ViewHolder source,
            RecyclerView.ViewHolder target
    ) {
        if (adapter == null || newList == null || source == null || target == null) {
            return;
        }
        ExpressivePlayQueueController active = activeControllerRef.get();
        if (active != null && !active.destroyed) {
            active.isDraggingItem = true;
        }
        int fromPos = source.getAbsoluteAdapterPosition();
        int toPos = target.getAbsoluteAdapterPosition();
        try {
            if (!differFieldsResolved) {
                differFieldsResolved = true;
                listAdapterDifferField = ListAdapter.class.getDeclaredField("mDiffer");
                listAdapterDifferField.setAccessible(true);
                differMaxGenField = AsyncListDiffer.class.getDeclaredField("mMaxScheduledGeneration");
                differMaxGenField.setAccessible(true);
                differListField = AsyncListDiffer.class.getDeclaredField("mList");
                differListField.setAccessible(true);
                differReadOnlyListField = AsyncListDiffer.class.getDeclaredField("mReadOnlyList");
                differReadOnlyListField.setAccessible(true);
            }
            Object differ = listAdapterDifferField.get(adapter);
            if (differ != null) {
                int gen = differMaxGenField.getInt(differ);
                differMaxGenField.setInt(differ, gen + 1);
                differListField.set(differ, newList);
                differReadOnlyListField.set(differ, Collections.unmodifiableList(newList));
                if (fromPos != RecyclerView.NO_POSITION
                        && toPos != RecyclerView.NO_POSITION
                        && fromPos != toPos) {
                    adapter.notifyItemMoved(fromPos, toPos);
                }
                return;
            }
        } catch (Throwable ignored) {
        }
        ((ListAdapter<Object, RecyclerView.ViewHolder>) adapter).submitList((List<Object>) newList);
    }

    static void onPlayQueueSelectedChanged(RecyclerView.ViewHolder vh, int actionState) {
        ExpressivePlayQueueController ctrl = activeControllerRef.get();
        if (actionState == ItemTouchHelper.ACTION_STATE_DRAG && vh != null && vh.itemView != null) {
            if (ctrl != null && !ctrl.destroyed) {
                ctrl.isDraggingItem = true;
                ctrl.suspendItemAnimatorForDrag();
            }
            View row = vh.itemView;
            float d = row.getContext().getResources().getDisplayMetrics().density;
            row.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
            row.animate().cancel();
            row.animate()
                    .scaleX(1.022f)
                    .scaleY(1.022f)
                    .translationZ(8f * d)
                    .setDuration(130L)
                    .setInterpolator(EFFECTS_SMOOTH)
                    .start();
        }
    }

    static void onPlayQueueDragClearView(RecyclerView rv, RecyclerView.ViewHolder vh) {
        if (vh != null && vh.itemView != null) {
            View row = vh.itemView;
            ItemTouchHelper.Callback.getDefaultUIUtil().clearView(row);
            row.animate().cancel();
            row.animate()
                    .scaleX(1f)
                    .scaleY(1f)
                    .translationZ(0f)
                    .setDuration(180L)
                    .setInterpolator(SPRING_SPATIAL)
                    .start();
        }
        ExpressivePlayQueueController ctrl = (rv != null) ? BY_RV.get(rv) : null;
        if (ctrl == null) {
            ctrl = activeControllerRef.get();
        }
        if (ctrl != null && !ctrl.destroyed) {
            ctrl.isDraggingItem = false;
            ctrl.restoreItemAnimatorAfterDrag();
            ctrl.postHeaderUpdate();
        }
    }

    /**
     * While a row is being dragged, RecyclerView's default move animations fight the
     * touch-driven translation and stack up, which reads as lag. Disable them for the
     * drag session and restore the original animator on drop.
     */
    private void suspendItemAnimatorForDrag() {
        if (playQueueRv == null || itemAnimatorSuspended) {
            return;
        }
        itemAnimatorSuspended = true;
        savedItemAnimator = playQueueRv.getItemAnimator();
        playQueueRv.setItemAnimator(null);
    }

    private void restoreItemAnimatorAfterDrag() {
        if (playQueueRv == null || !itemAnimatorSuspended) {
            return;
        }
        itemAnimatorSuspended = false;
        playQueueRv.setItemAnimator(savedItemAnimator);
        savedItemAnimator = null;
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
        this.sheetOpenedUptimeMs = SystemClock.uptimeMillis();
        this.isPlayingNow = ExpressivePlayerBridge.isPlayingNow();

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
        setupSourceChip();
        setupSegmentedTabs();
        setupQueueRecyclerView();
        syncAllColors();
        applySheetShape();
        setupHandle();
        updateHeader();
        observeAdapter();
        attachChromeListeners();
        prepareEntranceState();
        rootView.post(() -> {
            if (destroyed) {
                return;
            }
            enforceDialogWindowLayout();
            setupActionBar();
            playEntranceAnimation();
        });
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
            if (!(dlg instanceof Dialog)) {
                return;
            }
            hostDialog = (Dialog) dlg;
            hostDialog.setCanceledOnTouchOutside(true);
            hostDialog.setOnKeyListener((d, keyCode, event) -> {
                if (keyCode == KeyEvent.KEYCODE_BACK && event != null) {
                    if (event.getAction() == KeyEvent.ACTION_UP) {
                        if (menuOpen) {
                            setMenuOpen(false);
                            return true;
                        }
                        dismissSheetAnimated();
                        return true;
                    }
                    return true;
                }
                return false;
            });

            Window window = hostDialog.getWindow();
            if (window == null) {
                return;
            }
            dialogWindow = window;
            window.setWindowAnimations(0);
            enforceDialogWindowLayout();
        } catch (Throwable ignored) {
        }
    }

    private void enforceDialogWindowLayout() {
        if (dialogWindow == null || destroyed) {
            return;
        }
        try {
            dialogWindow.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            android.util.DisplayMetrics dm = context.getResources().getDisplayMetrics();
            int screenW = dm.widthPixels;
            int screenH = dm.heightPixels;
            if (screenW / density >= 600f && MaterialYouConfig.isPlayerTabletDesktopLayoutEnabled()) {
                int sheetW = Math.min(dp(560f), Math.max(dp(320f), screenW - dp(48f)));
                boolean landscape = screenW > screenH;
                int sheetH = Math.round(screenH * (landscape ? 0.90f : 0.85f));
                dialogWindow.setLayout(sheetW, sheetH);
                dialogWindow.setGravity(landscape
                        ? (Gravity.BOTTOM | Gravity.END)
                        : (Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL));
                if (landscape) {
                    WindowManager.LayoutParams lp = dialogWindow.getAttributes();
                    lp.x = dp(20f);
                    dialogWindow.setAttributes(lp);
                }
            } else {
                dialogWindow.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, Math.round(screenH * 0.87f));
                dialogWindow.setGravity(Gravity.BOTTOM);
            }
            dialogWindow.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            dialogWindow.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            try {
                ExpressiveBlurKit.applyWindowBackdropBlur(dialogWindow, 24, 0, 0.48f, 0.56f, density);
            } catch (Throwable ignored) {
            }
            dialogWindow.setStatusBarColor(Color.TRANSPARENT);
            dialogWindow.setNavigationBarColor(Color.TRANSPARENT);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                dialogWindow.setNavigationBarContrastEnforced(false);
            }
            MaterialYouColorEngine.applySystemBarAppearance(
                    dialogWindow, MaterialYouColorEngine.isLightMode(context));
        } catch (Throwable ignored) {
        }
    }

    private void prepareEntranceState() {
        rootView.setAlpha(0f);
        rootView.setTranslationY(dpf(108f));
    }

    private void playEntranceAnimation() {
        if (destroyed || entranceAnimated) {
            return;
        }
        entranceAnimated = true;
        rootView.animate().cancel();
        rootView.animate()
                .translationY(0f)
                .alpha(1f)
                .setDuration(400L)
                .setInterpolator(SPRING_SPATIAL)
                .start();

        if (barRow != null && dockShownForTab) {
            barRow.animate().cancel();
            barRow.setAlpha(0f);
            barRow.setTranslationY(dpf(36f));
            barRow.setScaleX(0.88f);
            barRow.setScaleY(0.88f);
            barRow.animate()
                    .alpha(1f)
                    .translationY(0f)
                    .scaleX(1f)
                    .scaleY(1f)
                    .setStartDelay(75L)
                    .setDuration(380L)
                    .setInterpolator(SPRING_BOUNCY)
                    .start();
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

        // Bottom sheet header: clean display title + subtitle + top-right source pill (no back arrow).
        invokeReflect(toolbar, "setNavigationIcon", new Class<?>[]{Drawable.class}, new Object[]{null});
        invokeReflect(toolbar, "setContentInsetsRelative", new Class<?>[]{int.class, int.class},
                new Object[]{0, 0});
        invokeReflect(toolbar, "setTitleMarginTop", new Class<?>[]{int.class}, new Object[]{0});
        invokeReflect(toolbar, "setTitleMarginBottom", new Class<?>[]{int.class}, new Object[]{0});
        ViewGroup.LayoutParams tlp = toolbar.getLayoutParams();
        if (tlp != null) {
            tlp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
            toolbar.setLayoutParams(tlp);
        }
        toolbar.setMinimumHeight(dp(88f));
        toolbar.setOnApplyWindowInsetsListener((v, insets) -> insets);
        toolbar.setPaddingRelative(dp(22f), dp(22f), dp(18f), dp(6f));
    }

    private void setupSourceChip() {
        if (toolbar == null || sourceChip != null) {
            return;
        }
        sourceChip = new LinearLayout(context);
        sourceChip.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        sourceChip.setOrientation(LinearLayout.HORIZONTAL);
        sourceChip.setGravity(Gravity.CENTER_VERTICAL);
        sourceChip.setPaddingRelative(dp(12f), dp(7f), dp(14f), dp(7f));
        sourceChip.setClickable(true);
        sourceChip.setVisibility(View.GONE);
        sourceChip.setOnClickListener(v -> {
            v.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
            locateCurrent();
        });
        ExpressiveMediaStyleKit.attachSpringPressEffect(sourceChip);

        sourceQueueDrawable = new SourceQueueDrawable(density);
        sourceChipIcon = new ImageView(context);
        sourceChipIcon.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        sourceChipIcon.setImageDrawable(sourceQueueDrawable);
        sourceChip.addView(sourceChipIcon, new LinearLayout.LayoutParams(dp(17f), dp(17f)));

        sourceChipText = new TextView(context);
        sourceChipText.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        sourceChipText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        sourceChipText.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        sourceChipText.setSingleLine(true);
        sourceChipText.setEllipsize(TextUtils.TruncateAt.END);
        sourceChipText.setMaxWidth(dp(146f));
        LinearLayout.LayoutParams tlp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        tlp.setMarginStart(dp(7f));
        sourceChip.addView(sourceChipText, tlp);

        ViewGroup.LayoutParams chipLp = createToolbarEndLayoutParams(toolbar);
        toolbar.addView(sourceChip, chipLp);
    }

    private ViewGroup.LayoutParams createToolbarEndLayoutParams(ViewGroup tb) {
        try {
            Class<?> lpCls = Class.forName(tb.getClass().getName() + "$LayoutParams",
                    false, tb.getClass().getClassLoader());
            Constructor<?> ctor = lpCls.getConstructor(int.class, int.class, int.class);
            Object lp = ctor.newInstance(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    Gravity.END | Gravity.CENTER_VERTICAL);
            if (lp instanceof ViewGroup.MarginLayoutParams) {
                ((ViewGroup.MarginLayoutParams) lp).setMarginStart(dp(10f));
                return (ViewGroup.LayoutParams) lp;
            }
        } catch (Throwable ignored) {
        }
        ViewGroup.MarginLayoutParams fallback = new ViewGroup.MarginLayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        fallback.setMarginStart(dp(10f));
        return fallback;
    }

    private void updateSourceChipText(String label) {
        if (destroyed || sourceChip == null || sourceChipText == null) {
            return;
        }
        String clean = label != null ? label.trim() : "";
        if (clean.isEmpty()) {
            if (sourceChip.getVisibility() == View.VISIBLE) {
                sourceChip.animate().alpha(0f).scaleX(0.92f).scaleY(0.92f)
                        .setDuration(160L)
                        .setInterpolator(EFFECTS_SMOOTH)
                        .withEndAction(() -> {
                            if (sourceChip != null && lastSourceLabel.isEmpty()) {
                                sourceChip.setVisibility(View.GONE);
                            }
                        }).start();
            }
            lastSourceLabel = "";
            return;
        }
        if (clean.equals(lastSourceLabel) && sourceChip.getVisibility() == View.VISIBLE) {
            return;
        }
        boolean wasHidden = sourceChip.getVisibility() != View.VISIBLE;
        lastSourceLabel = clean;
        sourceChipText.setText(clean);
        if (wasHidden) {
            sourceChip.setVisibility(View.VISIBLE);
            sourceChip.setAlpha(0f);
            sourceChip.setScaleX(0.90f);
            sourceChip.setScaleY(0.90f);
            sourceChip.animate()
                    .alpha(1f)
                    .scaleX(1f)
                    .scaleY(1f)
                    .setDuration(260L)
                    .setInterpolator(SPRING_SPATIAL)
                    .start();
        }
    }

    private void styleSourceChipColors() {
        if (sourceChip == null) {
            return;
        }
        boolean light = MaterialYouColorEngine.isLightMode(context);
        int fill = light
                ? MaterialYouColorEngine.withAlpha(
                        MaterialYouColorEngine.blendRgb(activePalette.surfaceContainerHigh, activePalette.primaryAccent, 0.16f),
                        0xE8)
                : MaterialYouColorEngine.withAlpha(
                        MaterialYouColorEngine.blendRgb(activePalette.surfaceContainerHigh, activePalette.primaryAccent, 0.22f),
                        0xDC);
        int fg = light
                ? MaterialYouColorEngine.blendRgb(activePalette.onSurface, activePalette.primaryAccent, 0.18f)
                : activePalette.onSurface;
        float r = dpf(18f);

        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.RECTANGLE);
        bg.setCornerRadius(r);
        bg.setColor(fill);

        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(r);
        mask.setColor(0xFFFFFFFF);

        sourceChip.setBackground(new RippleDrawable(
                ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(activePalette.primaryAccent, 0x2A)),
                bg,
                mask
        ));
        if (sourceQueueDrawable != null) {
            sourceQueueDrawable.setColor(fg);
        }
        if (sourceChipText != null) {
            sourceChipText.setTextColor(fg);
        }
    }

    private static Object invokeReflect(Object target, String name, Class<?>[] types, Object[] args) {
        if (target == null) {
            return null;
        }
        try {
            Method m = target.getClass().getMethod(name, types);
            return m.invoke(target, args);
        } catch (Throwable ignored) {
            return null;
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
            mlp.height = dp(42f);
            mlp.width = Math.min(dp(276f),
                    context.getResources().getDisplayMetrics().widthPixels - dp(40f));
            mlp.setMarginStart(dp(12f));
            mlp.setMarginEnd(dp(12f));
            mlp.topMargin = dp(2f);
            mlp.bottomMargin = dp(8f);
            tabLayout.setLayoutParams(mlp);
        }
        tabLayout.setPadding(0, 0, 0, 0);

        tabContainerBg = new GradientDrawable();
        tabContainerBg.setShape(GradientDrawable.RECTANGLE);
        tabContainerBg.setCornerRadius(dpf(21f));
        tabLayout.setBackground(tabContainerBg);

        tabIndicatorPill = new GradientDrawable();
        tabIndicatorPill.setShape(GradientDrawable.RECTANGLE);
        tabIndicatorPill.setCornerRadius(dpf(18f));
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
        rv.setFadingEdgeLength(ExpressiveMediaStyleKit.dp(density, 20f));
        ViewGroup.LayoutParams rlp = rv.getLayoutParams();
        if (rlp instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) rlp;
            int topM = ExpressiveMediaStyleKit.dp(density, 2f);
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
                ExpressiveMediaStyleKit.dp(density, 118f));

        rv.setOnApplyWindowInsetsListener((v, insets) -> {
            int navBot = insets.getInsets(WindowInsets.Type.navigationBars()).bottom;
            v.setPadding(
                    padL,
                    ExpressiveMediaStyleKit.dp(density, 2f),
                    padR,
                    navBot + ExpressiveMediaStyleKit.dp(density, 112f));
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
                    maybeAnimateInitialRowEntrance(child);
                } else if (ExpressiveMediaStyleKit.findView(child, idTitle) != null) {
                    styleHeaderRow(child);
                }
            }

            @Override
            public void onChildViewDetachedFromWindow(View child) {
                if (child != null) {
                    pauseDotsOnRow(child);
                }
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

    private void maybeAnimateInitialRowEntrance(View child) {
        if (destroyed || playQueueRv == null) {
            return;
        }
        if (SystemClock.uptimeMillis() - sheetOpenedUptimeMs > 420L) {
            return;
        }
        if (Boolean.TRUE.equals(child.getTag(TAG_ROW_ANIMATED))) {
            return;
        }
        child.setTag(TAG_ROW_ANIMATED, Boolean.TRUE);
        int idx = Math.max(0, Math.min(7, playQueueRv.indexOfChild(child)));
        child.setAlpha(0f);
        child.setTranslationY(dpf(20f));
        child.animate()
                .alpha(1f)
                .translationY(0f)
                .setStartDelay(45L + idx * 32L)
                .setDuration(300L)
                .setInterpolator(SPRING_SPATIAL)
                .start();
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
        if (handleDrawable != null) {
            handleDrawable.setColor(MaterialYouColorEngine.withAlpha(activePalette.onSurfaceVariant, 0x7A));
        }
        styleHeaderTexts();
        styleSourceChipColors();
        applyActionBarColors();
        if (tabLayout != null) {
            if (tabContainerBg != null) {
                tabContainerBg.setColor(MaterialYouColorEngine.withAlpha(
                        activePalette.surfaceContainer, 0xD6));
                tabContainerBg.setStroke(Math.max(1, dp(1f)),
                        MaterialYouColorEngine.withAlpha(activePalette.outlineVariant, 0x5A));
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
                ExpressiveMediaStyleKit.dp(density, 22f),
                ExpressiveMediaStyleKit.dp(density, isFirstHeader ? 6f : 12f),
                ExpressiveMediaStyleKit.dp(density, 16f),
                ExpressiveMediaStyleKit.dp(density, 4f));

        View titleView = ExpressiveMediaStyleKit.findView(itemView, idTitle);
        if (titleView instanceof TextView) {
            TextView tv = (TextView) titleView;
            ViewGroup.LayoutParams tlp = tv.getLayoutParams();
            if (tlp != null && tlp.height != ViewGroup.LayoutParams.WRAP_CONTENT) {
                tlp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
                tv.setLayoutParams(tlp);
            }
            tv.setMinimumHeight(ExpressiveMediaStyleKit.dp(density, 32f));
            tv.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
            tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            tv.setLetterSpacing(0.05f);
            tv.setTextColor(isFirstHeader ? palette.primaryAccent : palette.onSurfaceVariant);
        }

        View optionsView = ExpressiveMediaStyleKit.findView(itemView, idOptions);
        if (optionsView instanceof ImageView && optionsView.getVisibility() == View.VISIBLE) {
            ImageView iv = (ImageView) optionsView;
            int size = ExpressiveMediaStyleKit.dp(density, 34f);
            ViewGroup.LayoutParams olp = iv.getLayoutParams();
            if (olp != null) {
                olp.width = size;
                olp.height = size;
                centerConstraintVertically(olp);
                iv.setLayoutParams(olp);
            }
            int pad = ExpressiveMediaStyleKit.dp(density, 7f);
            iv.setPadding(pad, pad, pad, pad);
            iv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            MoreVertDrawable mvDrawable = iv.getDrawable() instanceof MoreVertDrawable
                    ? (MoreVertDrawable) iv.getDrawable()
                    : new MoreVertDrawable(density);
            mvDrawable.setColor(palette.onSurface);
            iv.setImageDrawable(mvDrawable);
            iv.setImageTintList(null);
            iv.setBackground(createCircularPillDrawable(
                    MaterialYouColorEngine.withAlpha(palette.surfaceContainerHigh, 0xD2),
                    Math.max(1, ExpressiveMediaStyleKit.dp(density, 1f)),
                    MaterialYouColorEngine.withAlpha(palette.outlineVariant, 0x55),
                    MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x33)
            ));
            ExpressiveMediaStyleKit.attachSpringPressEffect(iv);
        }
    }

    private static void resolveConstraintFields(Class<?> cls) {
        if (clpFieldsResolved) {
            return;
        }
        clpFieldsResolved = true;
        try {
            clpStartToStartField = cls.getField("startToStart");
            clpStartToEndField = cls.getField("startToEnd");
            clpEndToStartField = cls.getField("endToStart");
            clpEndToEndField = cls.getField("endToEnd");
            clpTopToTopField = cls.getField("topToTop");
            clpBottomToBottomField = cls.getField("bottomToBottom");
            clpGoneStartMarginField = cls.getField("goneStartMargin");
        } catch (Throwable ignored) {
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
            resolveConstraintFields(cls);
            if (clpBottomToBottomField != null) {
                clpBottomToBottomField.setInt(lp, 0);
            }
        } catch (Throwable ignored) {
        }
    }

    private void styleQueueItemRow(View itemView, boolean isSuggestions) {
        boolean isCurrentlyPlaying = styleQueueItemRowInternal(
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
        syncPlayingDotsOnRow(itemView, isCurrentlyPlaying);
    }

    private void syncPlayingDotsOnRow(View itemView, boolean isCurrentlyPlaying) {
        Object existing = itemView.getTag(TAG_PLAYING_DOTS);
        PlayingDotsDrawable dots = existing instanceof PlayingDotsDrawable
                ? (PlayingDotsDrawable) existing
                : null;
        if (isCurrentlyPlaying) {
            if (dots == null) {
                dots = new PlayingDotsDrawable(density);
                itemView.setTag(TAG_PLAYING_DOTS, dots);
                itemView.getOverlay().add(dots);
                if (!Boolean.TRUE.equals(itemView.getTag(TAG_DOTS_LAYOUT_HOOKED))) {
                    itemView.setTag(TAG_DOTS_LAYOUT_HOOKED, Boolean.TRUE);
                    itemView.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
                        Object dObj = v.getTag(TAG_PLAYING_DOTS);
                        if (dObj instanceof PlayingDotsDrawable) {
                            layoutPlayingDots(v, (PlayingDotsDrawable) dObj);
                        }
                    });
                }
            }
            activeDotsDrawables.add(dots);
            dots.setColor(activePalette.primaryAccent);
            dots.setPlaying(isPlayingNow && !destroyed);
            layoutPlayingDots(itemView, dots);
        } else if (dots != null) {
            dots.setPlaying(false);
            itemView.getOverlay().remove(dots);
            itemView.setTag(TAG_PLAYING_DOTS, null);
            activeDotsDrawables.remove(dots);
        }
    }

    private void pauseDotsOnRow(View itemView) {
        Object existing = itemView.getTag(TAG_PLAYING_DOTS);
        if (existing instanceof PlayingDotsDrawable) {
            ((PlayingDotsDrawable) existing).setPlaying(false);
        }
    }

    private void updatePlayingDotsState() {
        for (PlayingDotsDrawable d : activeDotsDrawables) {
            if (d != null) {
                d.setPlaying(isPlayingNow && !destroyed);
            }
        }
    }

    private void layoutPlayingDots(View row, PlayingDotsDrawable dots) {
        if (row == null || dots == null) {
            return;
        }
        int w = row.getWidth();
        int h = row.getHeight();
        if (w <= 0 || h <= 0) {
            return;
        }
        int dw = dp(22f);
        int dh = dp(18f);
        // Sit neatly to the left of the right-edge options pill (14dp inset + 12dp pad + 30dp pill + 8dp gap)
        int right = w - dp(64f);
        int top = (h - dh) / 2;
        dots.setBounds(right - dw, top, right, top + dh);
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

    private static boolean styleQueueItemRowInternal(
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
        boolean lightMode = MaterialYouColorEngine.isLightMode(itemView.getContext());

        View artView = ExpressiveMediaStyleKit.findView(itemView, idArtwork);
        if (artView != null) {
            ExpressiveMediaStyleKit.setShapeableImageCornerRadiusIfSquare(
                    artView, ExpressiveMediaStyleKit.dpf(density, 14f), density);
        }

        View moveBtn = ExpressiveMediaStyleKit.findView(itemView, idMoveButton);
        View tView = ExpressiveMediaStyleKit.findView(itemView, idTitle);
        View aView = ExpressiveMediaStyleKit.findView(itemView, idArtistName);
        View payView = ExpressiveMediaStyleKit.findView(itemView, idPayToStreamIcon);

        boolean isCurrentlyPlaying = !isSuggestions
                && moveBtn != null
                && moveBtn.getVisibility() != View.VISIBLE;
        boolean isHistory = !isSuggestions
                && tView != null
                && tView.getAlpha() < 0.75f;

        if (!isSuggestions && itemView instanceof ViewGroup) {
            ensureQueueRowLayout((ViewGroup) itemView, artView, moveBtn, aView, payView,
                    idArtwork, idMoveButton, density, isCurrentlyPlaying);
        }

        int targetH = ExpressiveMediaStyleKit.dp(density, isCurrentlyPlaying ? 80f : 74f);
        if (itemView.getMinimumHeight() != targetH) {
            itemView.setMinimumHeight(targetH);
        }
        ViewGroup.LayoutParams ilp = itemView.getLayoutParams();
        if (ilp != null && ilp.height != targetH) {
            ilp.height = targetH;
            itemView.setLayoutParams(ilp);
        }

        long styleSig = (((long) (isCurrentlyPlaying ? 1 : 0)) << 62)
                | (((long) (isHistory ? 1 : 0)) << 61)
                | (((long) (isSuggestions ? 1 : 0)) << 60)
                | (((long) (lightMode ? 1 : 0)) << 59)
                | (((long) palette.surfaceBase & 0xFFFFFFFFL) << 28)
                | ((long) palette.primaryAccent & 0x0FFFFFFFL);
        Object prevSig = itemView.getTag(TAG_ROW_STYLE_SIG);
        boolean styleChanged = !(prevSig instanceof Long) || ((Long) prevSig).longValue() != styleSig;

        int insetH = ExpressiveMediaStyleKit.dp(density, 14f);
        int insetV = ExpressiveMediaStyleKit.dp(density, isCurrentlyPlaying ? 4.5f : 3.5f);

        if (styleChanged) {
            itemView.setTag(TAG_ROW_STYLE_SIG, styleSig);
            float radius = ExpressiveMediaStyleKit.dpf(density, isCurrentlyPlaying ? 32f : 22f);

            GradientDrawable cardFill = null;
            if (isCurrentlyPlaying) {
                cardFill = new GradientDrawable();
                cardFill.setShape(GradientDrawable.RECTANGLE);
                cardFill.setCornerRadius(radius);
                int bgColor = lightMode
                        ? MaterialYouColorEngine.withAlpha(
                                MaterialYouColorEngine.blendRgb(0xFFFFFFFF, palette.surfaceBase, 0.14f), 0xF5)
                        : MaterialYouColorEngine.withAlpha(
                                MaterialYouColorEngine.blendRgb(palette.surfaceContainerHigh, palette.primaryAccent, 0.24f),
                                0xE6);
                cardFill.setColor(bgColor);
                cardFill.setStroke(Math.max(1, ExpressiveMediaStyleKit.dp(density, 1.25f)),
                        MaterialYouColorEngine.withAlpha(palette.primaryAccent, lightMode ? 0x5A : 0x8E));
            } else if (!isHistory) {
                cardFill = new GradientDrawable();
                cardFill.setShape(GradientDrawable.RECTANGLE);
                cardFill.setCornerRadius(radius);
                int bgColor = lightMode
                        ? MaterialYouColorEngine.withAlpha(
                                MaterialYouColorEngine.blendRgb(0xFFFFFFFF, palette.surfaceBase, 0.22f), 0xEC)
                        : MaterialYouColorEngine.withAlpha(palette.surfaceContainer, 0x9C);
                cardFill.setColor(bgColor);
                cardFill.setStroke(Math.max(1, ExpressiveMediaStyleKit.dp(density, 0.75f)),
                        MaterialYouColorEngine.withAlpha(palette.outlineVariant, lightMode ? 0x26 : 0x38));
            }

            GradientDrawable mask = new GradientDrawable();
            mask.setShape(GradientDrawable.RECTANGLE);
            mask.setCornerRadius(radius);
            mask.setColor(0xFFFFFFFF);

            RippleDrawable ripple = new RippleDrawable(
                    ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x2A)),
                    cardFill,
                    mask
            );
            // Apply InsetDrawable background BEFORE setting padding so setBackground doesn't wipe inner card padding
            itemView.setBackground(new InsetDrawable(ripple, insetH, insetV, insetH, insetV));
            itemView.setPaddingRelative(
                    insetH + ExpressiveMediaStyleKit.dp(density, !isSuggestions && !isCurrentlyPlaying ? 8f : 14f),
                    insetV + ExpressiveMediaStyleKit.dp(density, 6f),
                    insetH + ExpressiveMediaStyleKit.dp(density, 12f),
                    insetV + ExpressiveMediaStyleKit.dp(density, 6f)
            );
        }

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
                    ? MaterialYouColorEngine.blendRgb(palette.onSurfaceVariant, palette.primaryAccent, 0.35f)
                    : palette.onSurfaceVariant);
        }

        if (moveBtn instanceof ImageView) {
            ImageView mv = (ImageView) moveBtn;
            if (isSuggestions) {
                mv.setImageTintMode(PorterDuff.Mode.SRC_IN);
                mv.setImageTintList(ColorStateList.valueOf(palette.primaryAccent));
                if (styleChanged) {
                    GradientDrawable handlePill = new GradientDrawable();
                    handlePill.setShape(GradientDrawable.RECTANGLE);
                    handlePill.setCornerRadius(ExpressiveMediaStyleKit.dpf(density, 14f));
                    handlePill.setColor(MaterialYouColorEngine.withAlpha(
                            palette.surfaceContainerHigh, lightMode ? 0xB8 : 0x78));
                    int hInset = ExpressiveMediaStyleKit.dp(density, 8f);
                    int vInset = ExpressiveMediaStyleKit.dp(density, 5f);
                    mv.setBackground(new InsetDrawable(handlePill, hInset, vInset, hInset, vInset));
                }
            } else {
                DragIndicatorDrawable dragIcon = mv.getDrawable() instanceof DragIndicatorDrawable
                        ? (DragIndicatorDrawable) mv.getDrawable()
                        : new DragIndicatorDrawable(density);
                dragIcon.setColor(MaterialYouColorEngine.withAlpha(palette.onSurfaceVariant, 0xC8));
                mv.setImageDrawable(dragIcon);
                mv.setImageTintList(null);
                mv.setBackground(null);
            }
        }

        if (!isSuggestions) {
            Object optObj = itemView.getTag(TAG_ROW_OPTIONS_BTN);
            if (optObj instanceof ImageView) {
                ImageView optBtn = (ImageView) optObj;
                styleRowOptionsPill(optBtn, palette, density, lightMode, isCurrentlyPlaying, isHistory, styleChanged);
            }
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
        if (payView instanceof ImageView) {
            ((ImageView) payView).setImageTintList(null);
        }
        return isCurrentlyPlaying;
    }

    private static void ensureQueueRowLayout(
            ViewGroup row,
            View artView,
            View moveBtn,
            View artistView,
            View payView,
            int idArtwork,
            int idMoveButton,
            float density,
            boolean isCurrentlyPlaying
    ) {
        if (moveBtn == null || artView == null) {
            return;
        }
        ImageView optBtn;
        Object existingOpt = row.getTag(TAG_ROW_OPTIONS_BTN);
        if (existingOpt instanceof ImageView) {
            optBtn = (ImageView) existingOpt;
        } else {
            optBtn = new ImageView(row.getContext());
            optBtn.setId(ID_ROW_OPTIONS_BTN);
            optBtn.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
            optBtn.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            int pH = ExpressiveMediaStyleKit.dp(density, 6f);
            int pV = ExpressiveMediaStyleKit.dp(density, 9f);
            optBtn.setPadding(pH, pV, pH, pV);
            optBtn.setClickable(true);
            optBtn.setFocusable(true);
            optBtn.setOnClickListener(v -> {
                v.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                row.performLongClick();
            });
            ExpressiveMediaStyleKit.attachSpringPressEffect(optBtn);

            ViewGroup.LayoutParams lp = createConstraintParamsLike(moveBtn.getLayoutParams(),
                    ExpressiveMediaStyleKit.dp(density, 28f),
                    ExpressiveMediaStyleKit.dp(density, 38f));
            setConstraintFields(lp, -1, -1, -1, 0, 0, 0, 0);
            row.addView(optBtn, lp);
            row.setTag(TAG_ROW_OPTIONS_BTN, optBtn);
        }

        if (!Boolean.TRUE.equals(row.getTag(TAG_ROW_CONSTRAINTS_APPLIED))) {
            row.setTag(TAG_ROW_CONSTRAINTS_APPLIED, Boolean.TRUE);

            // Move drag handle to the LEFT of artwork
            ViewGroup.LayoutParams mlp = moveBtn.getLayoutParams();
            if (mlp != null) {
                mlp.width = ExpressiveMediaStyleKit.dp(density, 30f);
                mlp.height = ExpressiveMediaStyleKit.dp(density, 48f);
                if (mlp instanceof ViewGroup.MarginLayoutParams) {
                    ((ViewGroup.MarginLayoutParams) mlp).setMarginStart(0);
                    ((ViewGroup.MarginLayoutParams) mlp).setMarginEnd(ExpressiveMediaStyleKit.dp(density, 2f));
                }
                setConstraintFields(mlp, 0, -1, idArtwork, -1, 0, 0, -1);
                moveBtn.setLayoutParams(mlp);
                int mpH = ExpressiveMediaStyleKit.dp(density, 5f);
                int mpV = ExpressiveMediaStyleKit.dp(density, 12f);
                moveBtn.setPadding(mpH, mpV, mpH, mpV);
                if (moveBtn instanceof ImageView) {
                    ((ImageView) moveBtn).setScaleType(ImageView.ScaleType.CENTER_INSIDE);
                }
            }

            // Artwork follows moveButton (and collapses to start when moveButton is GONE)
            ViewGroup.LayoutParams alp = artView.getLayoutParams();
            if (alp != null) {
                setConstraintFields(alp, -1, idMoveButton, -2, -2, -2, -2, 0);
                artView.setLayoutParams(alp);
            }

            // Artist & payToStreamIcon end before rowOptionsBtn
            if (artistView != null && artistView.getLayoutParams() != null) {
                setConstraintFields(artistView.getLayoutParams(), -2, -2, ID_ROW_OPTIONS_BTN, -2, -2, -2, -2);
            }
            if (payView != null && payView.getLayoutParams() != null) {
                setConstraintFields(payView.getLayoutParams(), -2, -2, ID_ROW_OPTIONS_BTN, -2, -2, -2, -2);
            }
        }

        int textEndMargin = ExpressiveMediaStyleKit.dp(density, isCurrentlyPlaying ? 34f : 8f);
        if (artistView != null && artistView.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams aMlp = (ViewGroup.MarginLayoutParams) artistView.getLayoutParams();
            if (aMlp.getMarginEnd() != textEndMargin) {
                aMlp.setMarginEnd(textEndMargin);
                artistView.setLayoutParams(aMlp);
            }
        }
        if (payView != null && payView.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams pMlp = (ViewGroup.MarginLayoutParams) payView.getLayoutParams();
            if (pMlp.getMarginEnd() != textEndMargin) {
                pMlp.setMarginEnd(textEndMargin);
                payView.setLayoutParams(pMlp);
            }
        }
    }

    private static void styleRowOptionsPill(
            ImageView optBtn,
            ExpressivePalette palette,
            float density,
            boolean lightMode,
            boolean isCurrentlyPlaying,
            boolean isHistory,
            boolean styleChanged
    ) {
        optBtn.setAlpha(isHistory ? 0.55f : 1.0f);
        if (!styleChanged && optBtn.getDrawable() instanceof MoreVertDrawable) {
            return;
        }
        int pillBg;
        int iconFg;
        if (isCurrentlyPlaying) {
            int tertiary = MaterialYouColorEngine.getTertiaryContainer();
            pillBg = lightMode
                    ? MaterialYouColorEngine.blendRgb(tertiary, palette.primaryAccent, 0.14f)
                    : MaterialYouColorEngine.blendRgb(tertiary, palette.primaryAccent, 0.24f);
            iconFg = MaterialYouColorEngine.getOnTertiaryContainer();
        } else if (!isHistory) {
            pillBg = lightMode
                    ? MaterialYouColorEngine.withAlpha(
                            MaterialYouColorEngine.blendRgb(palette.surfaceContainerHigh, palette.primaryAccent, 0.18f),
                            0xDE)
                    : MaterialYouColorEngine.withAlpha(palette.surfaceContainerHigh, 0xCC);
            iconFg = palette.onSurfaceVariant;
        } else {
            pillBg = Color.TRANSPARENT;
            iconFg = palette.onSurfaceVariant;
        }

        MoreVertDrawable dots = optBtn.getDrawable() instanceof MoreVertDrawable
                ? (MoreVertDrawable) optBtn.getDrawable()
                : new MoreVertDrawable(density);
        dots.setColor(iconFg);
        optBtn.setImageDrawable(dots);
        optBtn.setImageTintList(null);

        float r = ExpressiveMediaStyleKit.dpf(density, 14f);
        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.RECTANGLE);
        bg.setCornerRadius(r);
        bg.setColor(pillBg);

        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(r);
        mask.setColor(0xFFFFFFFF);

        optBtn.setBackground(new RippleDrawable(
                ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x2E)),
                bg,
                mask
        ));
    }

    private static ViewGroup.LayoutParams createConstraintParamsLike(
            ViewGroup.LayoutParams template,
            int width,
            int height
    ) {
        if (template != null) {
            try {
                Constructor<?> ctor = template.getClass().getConstructor(int.class, int.class);
                return (ViewGroup.LayoutParams) ctor.newInstance(width, height);
            } catch (Throwable ignored) {
            }
        }
        return new ViewGroup.MarginLayoutParams(width, height);
    }

    /** Pass -2 to leave a ConstraintLayout$LayoutParams field untouched. */
    private static void setConstraintFields(
            ViewGroup.LayoutParams lp,
            int startToStart,
            int startToEnd,
            int endToStart,
            int endToEnd,
            int topToTop,
            int bottomToBottom,
            int goneStartMargin
    ) {
        if (lp == null) {
            return;
        }
        Class<?> cls = lp.getClass();
        if (!cls.getName().endsWith("ConstraintLayout$LayoutParams")) {
            return;
        }
        try {
            resolveConstraintFields(cls);
            if (startToStart != -2 && clpStartToStartField != null) clpStartToStartField.setInt(lp, startToStart);
            if (startToEnd != -2 && clpStartToEndField != null) clpStartToEndField.setInt(lp, startToEnd);
            if (endToStart != -2 && clpEndToStartField != null) clpEndToStartField.setInt(lp, endToStart);
            if (endToEnd != -2 && clpEndToEndField != null) clpEndToEndField.setInt(lp, endToEnd);
            if (topToTop != -2 && clpTopToTopField != null) clpTopToTopField.setInt(lp, topToTop);
            if (bottomToBottom != -2 && clpBottomToBottomField != null) clpBottomToBottomField.setInt(lp, bottomToBottom);
            if (goneStartMargin != -2 && clpGoneStartMarginField != null) clpGoneStartMarginField.setInt(lp, goneStartMargin);
        } catch (Throwable ignored) {
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

    // ---------------------------------------------------------------------------------------
    // Bottom-sheet chrome: rounded shape, drag handle, header, floating action bar & menu
    // ---------------------------------------------------------------------------------------

    private boolean isGerman() {
        return "de".equals(Locale.getDefault().getLanguage());
    }

    private void applySheetShape() {
        final float r = dpf(30f);
        rootView.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View v, Outline outline) {
                int w = v.getWidth();
                int h = v.getHeight();
                if (w > 0 && h > 0) {
                    outline.setRoundRect(0, 0, w, h + Math.round(r), r);
                }
            }
        });
        rootView.setClipToOutline(true);
    }

    private void setupHandle() {
        handleDrawable = new GradientDrawable();
        handleDrawable.setShape(GradientDrawable.RECTANGLE);
        handleDrawable.setCornerRadius(dpf(2.5f));
        handleDrawable.setColor(MaterialYouColorEngine.withAlpha(activePalette.onSurfaceVariant, 0x7A));
        rootView.getOverlay().add(handleDrawable);
        handleLayoutListener = (v, l, t, r, b, ol, ot, or, ob) -> layoutHandle(r - l, 0f);
        rootView.addOnLayoutChangeListener(handleLayoutListener);
        if (rootView.getWidth() > 0) {
            layoutHandle(rootView.getWidth(), 0f);
        }
    }

    private void layoutHandle(int width, float dragProgress) {
        if (handleDrawable == null || width <= 0) {
            return;
        }
        float clamped = Math.max(0f, Math.min(1f, dragProgress));
        int hw = dp(38f + 14f * clamped);
        int hh = Math.max(2, dp(4.2f));
        int x = (width - hw) / 2;
        int y = dp(10f);
        handleDrawable.setBounds(x, y, x + hw, y + hh);
    }

    private void attachChromeListeners() {
        if (toolbar != null) {
            final float slop = ViewConfiguration.get(context).getScaledTouchSlop();
            toolbar.setClickable(true);
            toolbar.setOnTouchListener(new View.OnTouchListener() {
                private float startY;
                private float lastDy;
                private boolean dragging;
                private VelocityTracker velocityTracker;

                @Override
                public boolean onTouch(View v, MotionEvent ev) {
                    if (dismissing) {
                        return true;
                    }
                    switch (ev.getActionMasked()) {
                        case MotionEvent.ACTION_DOWN:
                            startY = ev.getRawY();
                            lastDy = 0f;
                            dragging = false;
                            if (velocityTracker != null) {
                                velocityTracker.recycle();
                            }
                            velocityTracker = VelocityTracker.obtain();
                            velocityTracker.addMovement(ev);
                            return true;
                        case MotionEvent.ACTION_MOVE:
                            if (velocityTracker != null) {
                                velocityTracker.addMovement(ev);
                            }
                            float rawDy = ev.getRawY() - startY;
                            if (!dragging && Math.abs(rawDy) > slop) {
                                dragging = true;
                                if (menuOpen) {
                                    setMenuOpen(false);
                                }
                            }
                            if (dragging) {
                                if (rawDy >= 0f) {
                                    lastDy = rawDy;
                                    setSheetTranslation(lastDy);
                                    layoutHandle(rootView.getWidth(), lastDy / dpf(140f));
                                } else {
                                    // Gentle rubber-band upward resistance
                                    float resist = rawDy * 0.14f;
                                    lastDy = 0f;
                                    setSheetTranslation(resist);
                                    layoutHandle(rootView.getWidth(), 0f);
                                }
                            }
                            return true;
                        case MotionEvent.ACTION_UP:
                        case MotionEvent.ACTION_CANCEL:
                            float vy = 0f;
                            if (velocityTracker != null) {
                                velocityTracker.computeCurrentVelocity(1000);
                                vy = velocityTracker.getYVelocity();
                                velocityTracker.recycle();
                                velocityTracker = null;
                            }
                            layoutHandle(rootView.getWidth(), 0f);
                            boolean flingDown = ev.getActionMasked() == MotionEvent.ACTION_UP
                                    && vy > dpf(900f) && lastDy > dpf(24f);
                            if (dragging && (lastDy > dpf(115f) || flingDown)) {
                                dismissSheetAnimated();
                            } else if (dragging) {
                                animateSheetBack();
                            }
                            dragging = false;
                            return true;
                        default:
                            return false;
                    }
                }
            });
        }
        globalListener = () -> {
            if (destroyed || actionOverlay == null || playQueueRv == null) {
                return;
            }
            boolean queueVisible = playQueueRv.getVisibility() == View.VISIBLE;
            if (queueVisible != dockShownForTab) {
                dockShownForTab = queueVisible;
                animateDockForTab(queueVisible);
            }
        };
        rootView.getViewTreeObserver().addOnGlobalLayoutListener(globalListener);
    }

    private void animateDockForTab(boolean show) {
        if (actionOverlay == null || barRow == null) {
            return;
        }
        if (!show) {
            if (menuOpen) {
                setMenuOpen(false);
            }
            barRow.animate().cancel();
            barRow.animate()
                    .translationY(dpf(68f))
                    .alpha(0f)
                    .scaleX(0.90f)
                    .scaleY(0.90f)
                    .setDuration(200L)
                    .setInterpolator(DISMISS_ACCEL)
                    .withEndAction(() -> {
                        if (!dockShownForTab && actionOverlay != null) {
                            actionOverlay.setVisibility(View.GONE);
                        }
                    })
                    .start();
        } else {
            actionOverlay.setVisibility(View.VISIBLE);
            barRow.animate().cancel();
            barRow.setTranslationY(dpf(60f));
            barRow.setAlpha(0f);
            barRow.setScaleX(0.90f);
            barRow.setScaleY(0.90f);
            barRow.animate()
                    .translationY(0f)
                    .alpha(1f)
                    .scaleX(1f)
                    .scaleY(1f)
                    .setDuration(340L)
                    .setInterpolator(SPRING_SPATIAL)
                    .start();
        }
    }

    private void setSheetTranslation(float dy) {
        rootView.setTranslationY(dy);
        if (actionOverlay != null) {
            actionOverlay.setTranslationY(dy);
        }
    }

    private void animateSheetBack() {
        rootView.animate().cancel();
        rootView.animate()
                .translationY(0f)
                .setDuration(340L)
                .setInterpolator(SPRING_SPATIAL)
                .start();
        if (actionOverlay != null) {
            actionOverlay.animate().cancel();
            actionOverlay.animate()
                    .translationY(0f)
                    .setDuration(340L)
                    .setInterpolator(SPRING_SPATIAL)
                    .start();
        }
    }

    private void dismissSheetAnimated() {
        if (destroyed || dismissing) {
            return;
        }
        dismissing = true;
        if (menuOpen) {
            setMenuOpen(false);
        }
        float targetY = rootView.getHeight() > 0 ? rootView.getHeight() * 0.92f : dpf(520f);
        rootView.animate().cancel();
        rootView.animate()
                .translationY(targetY)
                .alpha(0.35f)
                .setDuration(220L)
                .setInterpolator(DISMISS_ACCEL)
                .withEndAction(this::dismissSheetNow)
                .start();
        if (actionOverlay != null) {
            actionOverlay.animate().cancel();
            actionOverlay.animate()
                    .translationY(targetY)
                    .alpha(0f)
                    .setDuration(200L)
                    .setInterpolator(DISMISS_ACCEL)
                    .start();
        }
    }

    private void dismissSheetNow() {
        invokeReflect(dialogFragment, "dismissAllowingStateLoss", new Class<?>[0], new Object[0]);
    }

    private Object hostActivity() {
        return invokeReflect(dialogFragment, "getActivity", new Class<?>[0], new Object[0]);
    }

    private int countQueueTracks() {
        if (playQueueRv == null) {
            return 0;
        }
        RecyclerView.Adapter<?> a = playQueueRv.getAdapter();
        if (a == null) {
            return 0;
        }
        if (!(a instanceof ListAdapter)) {
            return Math.max(0, a.getItemCount() - 2);
        }
        List<?> list = ((ListAdapter<?, ?>) a).getCurrentList();
        int n = 0;
        int historySection = Integer.MIN_VALUE;
        Field itemSectionField = null;
        for (Object o : list) {
            if (o == null || !o.getClass().getName().endsWith("$b")) {
                continue;
            }
            if (historySection == Integer.MIN_VALUE) {
                try {
                    Class<?> headerCls = Class.forName(o.getClass().getSuperclass().getName() + "$a",
                            false, o.getClass().getClassLoader());
                    Field historyField = headerCls.getDeclaredField("e");
                    historyField.setAccessible(true);
                    historySection = historyField.getInt(null);
                    itemSectionField = o.getClass().getDeclaredField("b");
                    itemSectionField.setAccessible(true);
                } catch (Throwable ignored) {
                    historySection = -1;
                }
            }
            if (itemSectionField != null && historySection != -1) {
                try {
                    if (itemSectionField.getInt(o) == historySection) {
                        continue; // exclude already-played history rows
                    }
                } catch (Throwable ignored) {
                }
            }
            n++;
        }
        return n;
    }

    private String resolveSourceLabelFromQueue() {
        String fromPlayer = ExpressivePlayerBridge.sourceLabelNow();
        if (fromPlayer != null && !fromPlayer.isEmpty()) {
            return fromPlayer;
        }
        if (playQueueRv == null) {
            return "";
        }
        RecyclerView.Adapter<?> a = playQueueRv.getAdapter();
        if (!(a instanceof ListAdapter)) {
            return "";
        }
        List<?> list = ((ListAdapter<?, ?>) a).getCurrentList();
        for (Object o : list) {
            if (o == null || !o.getClass().getName().endsWith("$a")) {
                continue;
            }
            try {
                Field titleField = o.getClass().getDeclaredField("b");
                titleField.setAccessible(true);
                Object val = titleField.get(o);
                if (val instanceof String && !((String) val).trim().isEmpty()) {
                    return ((String) val).trim();
                }
            } catch (Throwable ignored) {
            }
        }
        return "";
    }

    private void updateHeader() {
        if (destroyed || toolbar == null) {
            return;
        }
        boolean de = isGerman();
        int n = countQueueTracks();
        lastTitle = de ? "Als Nächstes" : "Next up";
        String sub = de
                ? n + (n == 1 ? " Titel in der Warteschlange." : " Titel in der Warteschlange.")
                : n + (n == 1 ? " track lined up." : " tracks lined up.");
        boolean titleChanged = !lastTitle.equals(appliedToolbarTitle);
        boolean subtitleChanged = !sub.equals(appliedToolbarSubtitle);
        lastSubtitle = sub;

        if (titleChanged) {
            appliedToolbarTitle = lastTitle;
            invokeReflect(toolbar, "setTitle", new Class<?>[]{CharSequence.class}, new Object[]{lastTitle});
        }
        if (subtitleChanged) {
            appliedToolbarSubtitle = sub;
            invokeReflect(toolbar, "setSubtitle", new Class<?>[]{CharSequence.class}, new Object[]{sub});
        }
        if (titleChanged || subtitleChanged) {
            final boolean pulseSub = subtitleChanged;
            toolbar.post(() -> {
                styleHeaderTexts();
                if (pulseSub) {
                    pulseHeaderSubtitle();
                }
            });
        }
        updateSourceChipText(resolveSourceLabelFromQueue());
    }

    private void pulseHeaderSubtitle() {
        if (destroyed || toolbar == null) {
            return;
        }
        for (int i = 0; i < toolbar.getChildCount(); i++) {
            View child = toolbar.getChildAt(i);
            if (child instanceof TextView && child != sourceChipText) {
                TextView tv = (TextView) child;
                if (!lastTitle.contentEquals(tv.getText())) {
                    tv.setAlpha(0.45f);
                    tv.animate().alpha(1f).setDuration(220L).setInterpolator(EFFECTS_SMOOTH).start();
                    break;
                }
            }
        }
    }

    private void styleHeaderTexts() {
        if (destroyed || toolbar == null) {
            return;
        }
        for (int i = 0; i < toolbar.getChildCount(); i++) {
            View child = toolbar.getChildAt(i);
            if (!(child instanceof TextView)) {
                continue;
            }
            TextView tv = (TextView) child;
            boolean isTitle = lastTitle.contentEquals(tv.getText());
            if (isTitle) {
                tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 30f);
                tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
                tv.setLetterSpacing(-0.02f);
                tv.setTextColor(activePalette.onSurface);
            } else {
                tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
                tv.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
                tv.setTextColor(activePalette.onSurfaceVariant);
            }
        }
    }

    private void observeAdapter() {
        if (playQueueRv == null) {
            return;
        }
        RecyclerView.Adapter<?> a = playQueueRv.getAdapter();
        if (a == null) {
            playQueueRv.post(this::observeAdapter);
            return;
        }
        if (observedAdapter != null) {
            return;
        }
        adapterObserver = new RecyclerView.AdapterDataObserver() {
            @Override
            public void onChanged() {
                postHeaderUpdate();
            }

            @Override
            public void onItemRangeChanged(int positionStart, int itemCount) {
                postHeaderUpdate();
            }

            @Override
            public void onItemRangeInserted(int positionStart, int itemCount) {
                postHeaderUpdate();
            }

            @Override
            public void onItemRangeRemoved(int positionStart, int itemCount) {
                postHeaderUpdate();
            }

            @Override
            public void onItemRangeMoved(int fromPosition, int toPosition, int itemCount) {
                // Reordering items in the queue does not alter track count or header metadata.
            }
        };
        observedAdapter = a;
        a.registerAdapterDataObserver(adapterObserver);
        updateHeader();
    }

    private void postHeaderUpdate() {
        if (isDraggingItem) {
            return;
        }
        if (toolbar != null) {
            toolbar.post(() -> {
                if (destroyed || isDraggingItem) {
                    return;
                }
                updateHeader();
                refreshActionState(true);
            });
        }
    }

    private Drawable themedIcon(String name) {
        try {
            int id = context.getResources().getIdentifier(name, "drawable", context.getPackageName());
            if (id != 0) {
                Drawable d = context.getDrawable(id);
                return d != null ? d.mutate() : null;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private ImageView makeBarButton(Drawable iconDrawable, String fallbackIconName, View.OnClickListener click) {
        ImageView iv = new ImageView(context);
        iv.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        iv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        iv.setPadding(dp(12f), dp(12f), dp(12f), dp(12f));
        iv.setImageDrawable(iconDrawable != null ? iconDrawable : themedIcon(fallbackIconName));
        iv.setOnClickListener(v -> {
            v.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
            click.onClick(v);
        });
        ExpressiveMediaStyleKit.attachSpringPressEffect(iv);
        return iv;
    }

    private LinearLayout makeMenuItem(Drawable customIcon, String fallbackIconName, String label, View.OnClickListener click) {
        LinearLayout item = new LinearLayout(context);
        item.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        item.setOrientation(LinearLayout.HORIZONTAL);
        item.setGravity(Gravity.CENTER_VERTICAL);
        item.setPaddingRelative(dp(20f), 0, dp(24f), 0);
        item.setMinimumHeight(dp(54f));
        item.setElevation(dpf(8f));
        item.setClickable(true);
        item.setOnClickListener(v -> {
            v.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
            click.onClick(v);
        });

        ImageView icon = new ImageView(context);
        icon.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        icon.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        icon.setImageDrawable(customIcon != null ? customIcon : themedIcon(fallbackIconName));
        item.addView(icon, new LinearLayout.LayoutParams(dp(22f), dp(22f)));

        TextView tv = new TextView(context);
        tv.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        tv.setText(label);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
        tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        tv.setLetterSpacing(-0.005f);
        tv.setSingleLine(true);
        LinearLayout.LayoutParams tlp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        tlp.setMarginStart(dp(12f));
        item.addView(tv, tlp);
        ExpressiveMediaStyleKit.attachSpringPressEffect(item);
        return item;
    }

    private void setupActionBar() {
        if (destroyed || dialogWindow == null || actionOverlay != null) {
            return;
        }
        final boolean de = isGerman();
        final int barBottomBase = dp(18f);

        actionOverlay = new FrameLayout(context);
        actionOverlay.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        actionOverlay.setClipChildren(false);
        actionOverlay.setClipToPadding(false);

        menuScrim = new View(context);
        menuScrim.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        menuScrim.setVisibility(View.GONE);
        menuScrim.setAlpha(0f);
        menuScrim.setOnClickListener(v -> setMenuOpen(false));
        actionOverlay.addView(menuScrim, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        // Floating connected split dock (matches Image 1)
        barRow = new LinearLayout(context);
        barRow.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        barRow.setOrientation(LinearLayout.HORIZONTAL);
        barRow.setGravity(Gravity.CENTER_VERTICAL);
        barRow.setClipChildren(false);
        barRow.setClipToPadding(false);

        pillGroup = new LinearLayout(context);
        pillGroup.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        pillGroup.setOrientation(LinearLayout.HORIZONTAL);
        pillGroup.setGravity(Gravity.CENTER);
        pillGroup.setPadding(dp(8f), dp(7f), dp(8f), dp(7f));
        pillGroup.setElevation(dpf(6f));

        shuffleDrawable = new ShuffleDrawable(density);
        repeatDrawable = new RepeatDrawable(density, false);
        repeatOneDrawable = new RepeatDrawable(density, true);
        sleepTimerOffDrawable = new SleepTimerDrawable(density, false);
        sleepTimerOnDrawable = new SleepTimerDrawable(density, true);

        btnShuffle = makeBarButton(shuffleDrawable, "ic_shuffle", v -> {
            ExpressivePlayerBridge.toggleShuffleFromQueue();
            applyActionState(!lastShuffleActive,
                    lastRepeatOne ? "SINGLE" : (lastRepeatActive ? "ALL" : "OFF"),
                    lastSleepActive, true);
            scheduleStateRefresh();
        });
        btnRepeat = makeBarButton(repeatDrawable, "ic_repeat", v -> {
            ExpressivePlayerBridge.cycleRepeatFromQueue();
            scheduleStateRefresh();
        });
        btnSleep = makeBarButton(sleepTimerOffDrawable, "ic_sleep_timer", v -> {
            if (menuOpen) {
                setMenuOpen(false);
            }
            ExpressivePlayerBridge.showSleepTimer(hostActivity());
            scheduleStateRefresh();
        });
        ImageView[] pills = {btnShuffle, btnRepeat, btnSleep};
        for (ImageView p : pills) {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(48f), dp(48f));
            lp.setMargins(dp(3.5f), 0, dp(3.5f), 0);
            pillGroup.addView(p, lp);
        }
        barRow.addView(pillGroup, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, dp(62f)));

        moreDotsDrawable = new MoreDotsDrawable(density);
        btnMore = makeBarButton(moreDotsDrawable, "ic_more", v -> setMenuOpen(!menuOpen));
        btnMore.setPadding(dp(18f), dp(16f), dp(18f), dp(16f));
        btnMore.setElevation(dpf(6f));
        LinearLayout.LayoutParams moreLp = new LinearLayout.LayoutParams(dp(68f), dp(62f));
        moreLp.setMarginStart(dp(6f));
        barRow.addView(btnMore, moreLp);

        FrameLayout.LayoutParams blp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
        blp.bottomMargin = barBottomBase;
        actionOverlay.addView(barRow, blp);

        // Centered expressive stacked pill menu (matches Image 2)
        menuColumn = new LinearLayout(context);
        menuColumn.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        menuColumn.setOrientation(LinearLayout.VERTICAL);
        menuColumn.setGravity(Gravity.CENTER_HORIZONTAL);
        menuColumn.setClipChildren(false);
        menuColumn.setClipToPadding(false);
        menuColumn.setVisibility(View.GONE);

        clearQueueDrawable = new ClearQueueDrawable(density);
        playlistAddDrawable = new PlaylistAddDrawable(density);

        menuItems[0] = makeMenuItem(clearQueueDrawable, "ic_delete",
                de ? "Warteschlange leeren" : "Clear queue", v -> {
                    setMenuOpen(false);
                    ExpressivePlayerBridge.clearQueueExceptCurrent();
                });
        menuItems[1] = makeMenuItem(playlistAddDrawable, "ic_add_to_playlist",
                de ? "Als Playlist speichern" : "Save as playlist", v -> {
                    setMenuOpen(false);
                    ExpressivePlayerBridge.saveQueueAsPlaylist();
                });
        for (int i = 0; i < menuItems.length; i++) {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.bottomMargin = i < menuItems.length - 1 ? dp(10f) : 0;
            menuColumn.addView(menuItems[i], lp);
        }
        FrameLayout.LayoutParams mlp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
        mlp.bottomMargin = barBottomBase + dp(6f);
        actionOverlay.addView(menuColumn, mlp);

        actionOverlay.setOnApplyWindowInsetsListener((v, insets) -> {
            int nb = insets.getInsets(WindowInsets.Type.navigationBars()).bottom;
            ViewGroup.LayoutParams b = barRow.getLayoutParams();
            if (b instanceof FrameLayout.LayoutParams) {
                ((FrameLayout.LayoutParams) b).bottomMargin = barBottomBase + nb;
                barRow.setLayoutParams(b);
            }
            ViewGroup.LayoutParams m = menuColumn.getLayoutParams();
            if (m instanceof FrameLayout.LayoutParams) {
                ((FrameLayout.LayoutParams) m).bottomMargin = barBottomBase + nb + dp(6f);
                menuColumn.setLayoutParams(m);
            }
            return insets;
        });

        try {
            dialogWindow.addContentView(actionOverlay, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        } catch (Throwable t) {
            actionOverlay = null;
            return;
        }
        actionOverlay.requestApplyInsets();
        applyActionBarColors();
        refreshActionState(false);
    }

    private void styleBarButton(ImageView b, boolean active, boolean animate) {
        if (b == null) {
            return;
        }
        boolean light = MaterialYouColorEngine.isLightMode(context);
        int targetBg = active
                ? activePalette.primaryAccent
                : (light
                        ? MaterialYouColorEngine.withAlpha(
                                MaterialYouColorEngine.blendRgb(0xFFFFFFFF, activePalette.surfaceBase, 0.28f), 0xE6)
                        : MaterialYouColorEngine.withAlpha(activePalette.surfaceContainerHigh, 0xD4));
        int targetFg = active ? activePalette.onPrimary : activePalette.onSurface;
        int ripple = MaterialYouColorEngine.withAlpha(
                active ? activePalette.onPrimary : activePalette.primaryAccent, 0x2E);

        Integer prevBg = (Integer) b.getTag(TAG_BTN_BG_COLOR);
        Integer prevFg = (Integer) b.getTag(TAG_BTN_FG_COLOR);
        Object oldAnim = b.getTag(TAG_BTN_ANIM);
        if (oldAnim instanceof ValueAnimator) {
            ((ValueAnimator) oldAnim).cancel();
        }

        if (!animate || prevBg == null || prevFg == null || (prevBg == targetBg && prevFg == targetFg)) {
            applyBarButtonColorsDirect(b, targetBg, targetFg, ripple);
            return;
        }

        final int startBg = prevBg;
        final int startFg = prevFg;
        final ArgbEvaluator eval = new ArgbEvaluator();
        ValueAnimator va = ValueAnimator.ofFloat(0f, 1f);
        va.setDuration(240L);
        va.setInterpolator(EFFECTS_SMOOTH);
        va.addUpdateListener(anim -> {
            float f = (float) anim.getAnimatedValue();
            int curBg = (int) eval.evaluate(f, startBg, targetBg);
            int curFg = (int) eval.evaluate(f, startFg, targetFg);
            applyBarButtonColorsDirect(b, curBg, curFg, ripple);
        });
        b.setTag(TAG_BTN_ANIM, va);
        va.start();

        // Expressive tactile pop on toggle
        b.animate().cancel();
        b.setScaleX(0.86f);
        b.setScaleY(0.86f);
        b.animate()
                .scaleX(1f)
                .scaleY(1f)
                .setDuration(300L)
                .setInterpolator(SPRING_BOUNCY)
                .start();
    }

    private void applyBarButtonColorsDirect(ImageView b, int bgColor, int fgColor, int rippleColor) {
        b.setTag(TAG_BTN_BG_COLOR, bgColor);
        b.setTag(TAG_BTN_FG_COLOR, fgColor);
        b.setBackground(createCircularPillDrawable(bgColor, 0, 0, rippleColor));
        applyBarButtonIconColor(b, fgColor);
    }

    /**
     * Custom-drawn toolbar icons paint themselves and ignore {@code setImageTintList},
     * so push the resolved foreground color into the drawable itself. This is what
     * keeps the dock readable in light mode (dark icons on a light pill).
     */
    private static void applyBarButtonIconColor(ImageView b, int fgColor) {
        if (b == null) {
            return;
        }
        Drawable d = b.getDrawable();
        if (d instanceof ShuffleDrawable) {
            ((ShuffleDrawable) d).setColor(fgColor);
            b.setImageTintList(null);
        } else if (d instanceof RepeatDrawable) {
            ((RepeatDrawable) d).setColor(fgColor);
            b.setImageTintList(null);
        } else if (d instanceof SleepTimerDrawable) {
            ((SleepTimerDrawable) d).setColor(fgColor);
            b.setImageTintList(null);
        } else {
            b.setImageTintList(ColorStateList.valueOf(fgColor));
        }
    }

    private void applyActionBarColors() {
        if (actionOverlay == null) {
            return;
        }
        boolean light = MaterialYouColorEngine.isLightMode(context);

        // Soft bottom-weighted backdrop scrim behind stacked menu (matches Image 2)
        if (menuScrim != null) {
            int scrimTop = MaterialYouColorEngine.withAlpha(activePalette.surfaceBase, light ? 0x26 : 0x52);
            int scrimMid = MaterialYouColorEngine.withAlpha(activePalette.surfaceBase, light ? 0x62 : 0x8A);
            int scrimBot = MaterialYouColorEngine.withAlpha(activePalette.surfaceBase, light ? 0xCE : 0xDA);
            GradientDrawable scrimGrad = new GradientDrawable(
                    GradientDrawable.Orientation.TOP_BOTTOM,
                    new int[]{scrimTop, scrimMid, scrimBot});
            menuScrim.setBackground(scrimGrad);
        }

        // Connected left pill group: 32dp left, 12dp right facing btnMore
        float big = dpf(31f);
        float small = dpf(12f);
        GradientDrawable groupBg = new GradientDrawable();
        groupBg.setShape(GradientDrawable.RECTANGLE);
        groupBg.setCornerRadii(new float[]{big, big, small, small, small, small, big, big});
        int dockFill = light
                ? MaterialYouColorEngine.withAlpha(
                        MaterialYouColorEngine.blendRgb(activePalette.surfaceContainerHigh, activePalette.primaryAccent, 0.14f),
                        0xEE)
                : MaterialYouColorEngine.withAlpha(activePalette.surfaceContainer, 0xF2);
        groupBg.setColor(dockFill);
        groupBg.setStroke(Math.max(1, dp(0.9f)),
                MaterialYouColorEngine.withAlpha(activePalette.outlineVariant, light ? 0x3A : 0x52));
        pillGroup.setBackground(groupBg);

        // Attached right tertiary overflow button: 12dp left, 32dp right (matches Image 1)
        int tertiaryBg = resolveTertiaryContainerTone(light);
        int tertiaryFg = resolveOnTertiaryTone(light);

        GradientDrawable moreBg = new GradientDrawable();
        moreBg.setShape(GradientDrawable.RECTANGLE);
        moreBg.setCornerRadii(new float[]{small, small, big, big, big, big, small, small});
        moreBg.setColor(tertiaryBg);

        GradientDrawable moreMask = new GradientDrawable();
        moreMask.setShape(GradientDrawable.RECTANGLE);
        moreMask.setCornerRadii(new float[]{small, small, big, big, big, big, small, small});
        moreMask.setColor(0xFFFFFFFF);

        btnMore.setBackground(new RippleDrawable(
                ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(tertiaryFg, 0x26)),
                moreBg,
                moreMask));
        if (moreDotsDrawable != null) {
            moreDotsDrawable.setColor(tertiaryFg);
        }
        btnMore.setImageTintList(null);

        // 2 Expressive stacked menu pills (matches Image 2!)
        int warmSecondaryBg = light
                ? MaterialYouColorEngine.blendRgb(
                        MaterialYouColorEngine.getSecondaryContainer(), activePalette.surfaceContainerHigh, 0.25f)
                : MaterialYouColorEngine.blendRgb(
                        activePalette.surfaceContainerHigh, MaterialYouColorEngine.getErrorContainer(), 0.28f);
        int warmSecondaryFg = light
                ? MaterialYouColorEngine.getOnSecondaryContainer()
                : activePalette.onSurface;

        for (int i = 0; i < menuItems.length; i++) {
            LinearLayout item = menuItems[i];
            if (item == null) {
                continue;
            }
            int fill;
            int fg;
            if (i == 0) {
                // Clear queue -> Soft warm secondary/peach container
                fill = warmSecondaryBg;
                fg = warmSecondaryFg;
            } else {
                // Save as playlist -> Vibrant primary accent
                fill = activePalette.primaryAccent;
                fg = activePalette.onPrimary;
            }
            float pillR = dpf(27f);
            GradientDrawable bg = new GradientDrawable();
            bg.setShape(GradientDrawable.RECTANGLE);
            bg.setCornerRadius(pillR);
            bg.setColor(fill);

            GradientDrawable mask = new GradientDrawable();
            mask.setShape(GradientDrawable.RECTANGLE);
            mask.setCornerRadius(pillR);
            mask.setColor(0xFFFFFFFF);

            item.setBackground(new RippleDrawable(
                    ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(fg, 0x22)),
                    bg,
                    mask));

            ImageView icon = (ImageView) item.getChildAt(0);
            if (i == 0 && clearQueueDrawable != null) {
                clearQueueDrawable.setColor(fg);
                icon.setImageTintList(null);
            } else if (i == 1 && playlistAddDrawable != null) {
                playlistAddDrawable.setColor(fg);
                icon.setImageTintList(null);
            } else {
                icon.setImageTintList(ColorStateList.valueOf(fg));
            }
            ((TextView) item.getChildAt(1)).setTextColor(fg);
        }
        refreshActionState(false);
    }

    private int resolveTertiaryContainerTone(boolean light) {
        int sysTertiary = MaterialYouColorEngine.getTertiaryContainer();
        if (light) {
            return MaterialYouColorEngine.blendRgb(sysTertiary, activePalette.surfaceContainerHigh, 0.10f);
        }
        return MaterialYouColorEngine.blendRgb(sysTertiary, activePalette.primaryAccent, 0.16f);
    }

    private int resolveOnTertiaryTone(boolean light) {
        return light
                ? MaterialYouColorEngine.getOnTertiaryContainer()
                : MaterialYouColorEngine.getOnTertiaryContainer();
    }

    private void refreshActionState(boolean animate) {
        if (actionOverlay == null || destroyed) {
            return;
        }
        boolean shuffle = ExpressivePlayerBridge.isShuffleOnNow();
        String repeat = ExpressivePlayerBridge.repeatModeNow();
        boolean sleepActive = ExpressivePlayerBridge.isSleepTimerActiveNow();
        applyActionState(shuffle, repeat, sleepActive, animate);
    }

    private void applyActionState(boolean shuffle, String repeat, boolean sleepActive, boolean animate) {
        if (actionOverlay == null || destroyed) {
            return;
        }
        boolean repeatOn = repeat != null && !"OFF".equalsIgnoreCase(repeat);
        boolean repeatOne = repeat != null
                && (repeat.toUpperCase(Locale.ROOT).contains("ONE")
                || repeat.toUpperCase(Locale.ROOT).contains("SINGLE"));

        boolean animShuffle = animate && actionStateInitialized && shuffle != lastShuffleActive;
        boolean animRepeat = animate && actionStateInitialized
                && (repeatOn != lastRepeatActive || repeatOne != lastRepeatOne);
        boolean animSleep = animate && actionStateInitialized && sleepActive != lastSleepActive;

        if (!actionStateInitialized || repeatOne != lastRepeatOne) {
            Drawable repeatIcon = repeatOne ? repeatOneDrawable : repeatDrawable;
            if (repeatIcon != null) {
                btnRepeat.setImageDrawable(repeatIcon);
            }
        }
        if (!actionStateInitialized || sleepActive != lastSleepActive) {
            Drawable sleepIcon = sleepActive ? sleepTimerOnDrawable : sleepTimerOffDrawable;
            if (sleepIcon != null) {
                btnSleep.setImageDrawable(sleepIcon);
            }
        }

        lastShuffleActive = shuffle;
        lastRepeatActive = repeatOn;
        lastRepeatOne = repeatOne;
        lastSleepActive = sleepActive;
        actionStateInitialized = true;

        styleBarButton(btnShuffle, shuffle, animShuffle);
        styleBarButton(btnRepeat, repeatOn, animRepeat);
        styleBarButton(btnSleep, sleepActive, animSleep);
    }

    private void scheduleStateRefresh() {
        if (actionOverlay == null) {
            return;
        }
        actionOverlay.postDelayed(() -> refreshActionState(true), 160L);
        actionOverlay.postDelayed(() -> refreshActionState(true), 520L);
    }

    private void setMenuOpen(boolean open) {
        if (actionOverlay == null || menuColumn == null || menuOpen == open) {
            return;
        }
        menuOpen = open;

        if (open) {
            // Soft scrim fade in
            menuScrim.animate().cancel();
            menuScrim.setVisibility(View.VISIBLE);
            menuScrim.setAlpha(0f);
            menuScrim.animate()
                    .alpha(1f)
                    .setDuration(240L)
                    .setInterpolator(EFFECTS_SMOOTH)
                    .start();

            // Gently dim & recede the bottom dock right behind the menu (matches Image 2!)
            barRow.animate().cancel();
            barRow.setEnabled(false);
            setChildrenClickable(barRow, false);
            barRow.animate()
                    .alpha(0.14f)
                    .scaleX(0.90f)
                    .scaleY(0.90f)
                    .translationY(dpf(6f))
                    .setDuration(230L)
                    .setInterpolator(EFFECTS_SMOOTH)
                    .start();

            btnMore.animate().cancel();
            btnMore.animate()
                    .rotation(90f)
                    .setDuration(260L)
                    .setInterpolator(SPRING_SPATIAL)
                    .start();

            // Expressive bottom-to-top staggered spring pop-in of the 3 stacked pills
            menuColumn.animate().cancel();
            menuColumn.setAlpha(1f);
            menuColumn.setVisibility(View.VISIBLE);
            int count = menuColumn.getChildCount();
            for (int i = 0; i < count; i++) {
                View c = menuColumn.getChildAt(i);
                c.animate().cancel();
                c.setAlpha(0f);
                c.setTranslationY(dpf(34f));
                c.setScaleX(0.78f);
                c.setScaleY(0.78f);
                long delay = (count - 1 - i) * 44L;
                c.animate()
                        .alpha(1f)
                        .translationY(0f)
                        .scaleX(1f)
                        .scaleY(1f)
                        .setStartDelay(delay)
                        .setDuration(350L)
                        .setInterpolator(SPRING_BOUNCY)
                        .start();
            }
        } else {
            // Fade scrim out
            menuScrim.animate().cancel();
            menuScrim.animate()
                    .alpha(0f)
                    .setDuration(180L)
                    .setInterpolator(EFFECTS_SMOOTH)
                    .withEndAction(() -> {
                        if (!menuOpen && menuScrim != null) {
                            menuScrim.setVisibility(View.GONE);
                        }
                    })
                    .start();

            // Spring bottom dock back cleanly
            barRow.animate().cancel();
            barRow.setEnabled(true);
            setChildrenClickable(barRow, true);
            barRow.animate()
                    .alpha(1f)
                    .scaleX(1f)
                    .scaleY(1f)
                    .translationY(0f)
                    .setDuration(320L)
                    .setInterpolator(SPRING_SPATIAL)
                    .start();

            btnMore.animate().cancel();
            btnMore.animate()
                    .rotation(0f)
                    .setDuration(300L)
                    .setInterpolator(SPRING_SPATIAL)
                    .start();

            // Reverse top-to-bottom staggered collapse
            int count = menuColumn.getChildCount();
            for (int i = 0; i < count; i++) {
                final View c = menuColumn.getChildAt(i);
                final boolean isLast = (i == count - 1);
                c.animate().cancel();
                c.animate()
                        .alpha(0f)
                        .translationY(dpf(22f))
                        .scaleX(0.84f)
                        .scaleY(0.84f)
                        .setStartDelay(i * 26L)
                        .setDuration(175L)
                        .setInterpolator(DISMISS_ACCEL)
                        .setListener(isLast ? new AnimatorListenerAdapter() {
                            @Override
                            public void onAnimationEnd(Animator animation) {
                                c.animate().setListener(null);
                                if (!menuOpen && menuColumn != null) {
                                    menuColumn.setVisibility(View.GONE);
                                }
                            }
                        } : null)
                        .start();
            }
        }
    }

    private static void setChildrenClickable(ViewGroup vg, boolean clickable) {
        if (vg == null) {
            return;
        }
        for (int i = 0; i < vg.getChildCount(); i++) {
            View c = vg.getChildAt(i);
            c.setEnabled(clickable);
            if (c instanceof ViewGroup) {
                setChildrenClickable((ViewGroup) c, clickable);
            }
        }
    }

    private void locateCurrent() {
        if (playQueueRv == null) {
            return;
        }
        RecyclerView.Adapter<?> a = playQueueRv.getAdapter();
        if (!(a instanceof ListAdapter)) {
            return;
        }
        List<?> list = ((ListAdapter<?, ?>) a).getCurrentList();
        int pos = -1;
        try {
            for (int i = 0; i < list.size(); i++) {
                Object o = list.get(i);
                if (o == null || !o.getClass().getName().endsWith("$b")) {
                    continue;
                }
                Class<?> headerCls = Class.forName(o.getClass().getSuperclass().getName() + "$a",
                        false, o.getClass().getClassLoader());
                Field currentSection = headerCls.getDeclaredField("f");
                currentSection.setAccessible(true);
                Field itemSection = o.getClass().getDeclaredField("b");
                itemSection.setAccessible(true);
                if (itemSection.getInt(o) == currentSection.getInt(null)) {
                    pos = i;
                    break;
                }
            }
        } catch (Throwable ignored) {
        }
        if (pos < 0) {
            return;
        }
        final int targetPos = pos;
        final int scrollPos = Math.max(0, targetPos - 1);
        RecyclerView.LayoutManager lm = playQueueRv.getLayoutManager();
        if (lm instanceof LinearLayoutManager) {
            LinearSmoothScroller scroller = new LinearSmoothScroller(context) {
                @Override
                protected int getVerticalSnapPreference() {
                    return SNAP_TO_START;
                }
            };
            scroller.setTargetPosition(scrollPos);
            lm.startSmoothScroll(scroller);
        } else {
            playQueueRv.smoothScrollToPosition(scrollPos);
        }

        // Expressive spotlight bounce on the Currently Playing card once scrolled into view
        playQueueRv.postDelayed(() -> pulseLocatedRow(targetPos), 260L);
    }

    private void pulseLocatedRow(int adapterPos) {
        if (destroyed || playQueueRv == null) {
            return;
        }
        RecyclerView.ViewHolder vh = playQueueRv.findViewHolderForAdapterPosition(adapterPos);
        if (vh == null || vh.itemView == null) {
            return;
        }
        View row = vh.itemView;
        row.animate().cancel();
        row.animate()
                .scaleX(1.032f)
                .scaleY(1.032f)
                .setDuration(150L)
                .setInterpolator(EFFECTS_SMOOTH)
                .withEndAction(() -> {
                    if (!destroyed) {
                        row.animate()
                                .scaleX(1f)
                                .scaleY(1f)
                                .setDuration(320L)
                                .setInterpolator(SPRING_BOUNCY)
                                .start();
                    }
                })
                .start();
    }

    private void onDestroy() {
        destroyed = true;
        restoreItemAnimatorAfterDrag();
        if (activeControllerRef.get() == this) {
            activeControllerRef = new WeakReference<>(null);
        }
        for (PlayingDotsDrawable d : activeDotsDrawables) {
            if (d != null) {
                d.setPlaying(false);
            }
        }
        activeDotsDrawables.clear();
        try {
            if (hostDialog != null) {
                hostDialog.setOnKeyListener(null);
            }
            if (observedAdapter != null && adapterObserver != null) {
                observedAdapter.unregisterAdapterDataObserver(adapterObserver);
            }
            if (globalListener != null && rootView.getViewTreeObserver().isAlive()) {
                rootView.getViewTreeObserver().removeOnGlobalLayoutListener(globalListener);
            }
            if (handleLayoutListener != null) {
                rootView.removeOnLayoutChangeListener(handleLayoutListener);
            }
            if (handleDrawable != null) {
                rootView.getOverlay().remove(handleDrawable);
            }
            if (actionOverlay != null && actionOverlay.getParent() instanceof ViewGroup) {
                ((ViewGroup) actionOverlay.getParent()).removeView(actionOverlay);
            }
            if (sourceChip != null && sourceChip.getParent() instanceof ViewGroup) {
                ((ViewGroup) sourceChip.getParent()).removeView(sourceChip);
            }
        } catch (Throwable ignored) {
        }
        observedAdapter = null;
        adapterObserver = null;
        actionOverlay = null;
        dialogWindow = null;
        hostDialog = null;
        sourceChip = null;
        sourceChipIcon = null;
        sourceChipText = null;
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

    // ---------------------------------------------------------------------------------------
    // Analytic M3 Expressive Spring Interpolator & Crisp Vector Drawables
    // ---------------------------------------------------------------------------------------

    private static final class ExpressiveSpringInterpolator implements Interpolator {
        private final float zeta;
        private final float omega;
        private final float omegaD;
        private final float endVal;

        ExpressiveSpringInterpolator(float dampingRatio, float angularFreq) {
            this.zeta = Math.max(0.25f, Math.min(0.98f, dampingRatio));
            this.omega = Math.max(2f, angularFreq);
            this.omegaD = (float) (omega * Math.sqrt(1.0 - zeta * zeta));
            this.endVal = rawValue(1f);
        }

        private float rawValue(float t) {
            double env = Math.exp(-zeta * omega * t);
            double factor = zeta / Math.sqrt(1.0 - zeta * zeta);
            return (float) (1.0 - env * (Math.cos(omegaD * t) + factor * Math.sin(omegaD * t)));
        }

        @Override
        public float getInterpolation(float t) {
            if (t <= 0f) {
                return 0f;
            }
            if (t >= 1f) {
                return 1f;
            }
            float raw = rawValue(t);
            return endVal > 0.001f ? raw / endVal : t;
        }
    }

    /** Crisp 6-dot drag handle indicator ("⋮⋮") matching Material 3 Expressive queue rows. */
    private static final class DragIndicatorDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float density;

        DragIndicatorDrawable(float density) {
            this.density = density;
            paint.setStyle(Paint.Style.FILL);
        }

        void setColor(int color) {
            if (paint.getColor() != color) {
                paint.setColor(color);
                invalidateSelf();
            }
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            float r = Math.max(1.45f, 1.70f * density);
            float colOffset = 2.65f * density;
            float rowStep = 4.9f * density;
            for (int row = -1; row <= 1; row++) {
                float y = cy + row * rowStep;
                canvas.drawCircle(cx - colOffset, y, r, paint);
                canvas.drawCircle(cx + colOffset, y, r, paint);
            }
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** Crisp 3-dot vertical overflow icon ("⋮") for queue track pills and section headers. */
    private static final class MoreVertDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float density;

        MoreVertDrawable(float density) {
            this.density = density;
            paint.setStyle(Paint.Style.FILL);
        }

        void setColor(int color) {
            if (paint.getColor() != color) {
                paint.setColor(color);
                invalidateSelf();
            }
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            float r = Math.max(1.5f, 1.8f * density);
            float spacing = 4.8f * density;
            canvas.drawCircle(cx, cy - spacing, r, paint);
            canvas.drawCircle(cx, cy, r, paint);
            canvas.drawCircle(cx, cy + spacing, r, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** Crisp Material 3 rounded Shuffle icon for the queue bottom toolbar. */
    private static final class ShuffleDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final float density;

        ShuffleDrawable(float density) {
            this.density = density;
            paint.setColor(0xFFFFFFFF);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        void setColor(int color) {
            if (paint.getColor() != color) {
                paint.setColor(color);
                invalidateSelf();
            }
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            float s = Math.min(b.width(), b.height());
            float u = s / 24f;
            float ox = b.exactCenterX() - s * 0.5f;
            float oy = b.exactCenterY() - s * 0.5f;
            paint.setStrokeWidth(Math.max(1.6f, 2.05f * density));

            // Crossing track 1: bottom-left -> top-right
            path.reset();
            path.moveTo(ox + 3.5f * u, oy + 17.5f * u);
            path.lineTo(ox + 7.2f * u, oy + 17.5f * u);
            path.cubicTo(ox + 10.6f * u, oy + 17.5f * u, ox + 13.4f * u, oy + 6.5f * u, ox + 16.8f * u, oy + 6.5f * u);
            path.lineTo(ox + 20.2f * u, oy + 6.5f * u);
            canvas.drawPath(path, paint);

            // Crossing track 2: top-left -> bottom-right (split at center for clean overlap)
            path.reset();
            path.moveTo(ox + 3.5f * u, oy + 6.5f * u);
            path.lineTo(ox + 7.2f * u, oy + 6.5f * u);
            path.lineTo(ox + 9.6f * u, oy + 9.4f * u);
            canvas.drawPath(path, paint);

            path.reset();
            path.moveTo(ox + 14.4f * u, oy + 14.6f * u);
            path.lineTo(ox + 16.8f * u, oy + 17.5f * u);
            path.lineTo(ox + 20.2f * u, oy + 17.5f * u);
            canvas.drawPath(path, paint);

            // Top arrowhead
            path.reset();
            path.moveTo(ox + 17.4f * u, oy + 3.6f * u);
            path.lineTo(ox + 20.5f * u, oy + 6.5f * u);
            path.lineTo(ox + 17.4f * u, oy + 9.4f * u);
            canvas.drawPath(path, paint);

            // Bottom arrowhead
            path.reset();
            path.moveTo(ox + 17.4f * u, oy + 14.6f * u);
            path.lineTo(ox + 20.5f * u, oy + 17.5f * u);
            path.lineTo(ox + 17.4f * u, oy + 20.4f * u);
            canvas.drawPath(path, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** Crisp Material 3 rounded Repeat / Repeat-One icon for the queue bottom toolbar. */
    private static final class RepeatDrawable extends Drawable {
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint textPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final float density;
        private final boolean single;

        RepeatDrawable(float density, boolean single) {
            this.density = density;
            this.single = single;
            strokePaint.setColor(0xFFFFFFFF);
            strokePaint.setStyle(Paint.Style.STROKE);
            strokePaint.setStrokeCap(Paint.Cap.ROUND);
            strokePaint.setStrokeJoin(Paint.Join.ROUND);

            textPaint.setColor(0xFFFFFFFF);
            textPaint.setTextAlign(Paint.Align.CENTER);
            textPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        }

        void setColor(int color) {
            if (strokePaint.getColor() != color) {
                strokePaint.setColor(color);
                textPaint.setColor(color);
                invalidateSelf();
            }
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            float s = Math.min(b.width(), b.height());
            float u = s / 24f;
            float ox = b.exactCenterX() - s * 0.5f;
            float oy = b.exactCenterY() - s * 0.5f;
            strokePaint.setStrokeWidth(Math.max(1.6f, 2.0f * density));

            // Top loop right
            path.reset();
            path.moveTo(ox + 5.0f * u, oy + 10.6f * u);
            path.lineTo(ox + 5.0f * u, oy + 8.4f * u);
            path.quadTo(ox + 5.0f * u, oy + 6.4f * u, ox + 7.2f * u, oy + 6.4f * u);
            path.lineTo(ox + 19.0f * u, oy + 6.4f * u);
            canvas.drawPath(path, strokePaint);

            // Top arrowhead
            path.reset();
            path.moveTo(ox + 16.2f * u, oy + 3.6f * u);
            path.lineTo(ox + 19.3f * u, oy + 6.4f * u);
            path.lineTo(ox + 16.2f * u, oy + 9.2f * u);
            canvas.drawPath(path, strokePaint);

            // Bottom loop left
            path.reset();
            path.moveTo(ox + 19.0f * u, oy + 13.4f * u);
            path.lineTo(ox + 19.0f * u, oy + 15.6f * u);
            path.quadTo(ox + 19.0f * u, oy + 17.6f * u, ox + 16.8f * u, oy + 17.6f * u);
            path.lineTo(ox + 5.0f * u, oy + 17.6f * u);
            canvas.drawPath(path, strokePaint);

            // Bottom arrowhead
            path.reset();
            path.moveTo(ox + 7.8f * u, oy + 14.8f * u);
            path.lineTo(ox + 4.7f * u, oy + 17.6f * u);
            path.lineTo(ox + 7.8f * u, oy + 20.4f * u);
            canvas.drawPath(path, strokePaint);

            if (single) {
                textPaint.setTextSize(8.2f * u);
                Paint.FontMetrics fm = textPaint.getFontMetrics();
                float base = b.exactCenterY() - (fm.ascent + fm.descent) * 0.5f;
                canvas.drawText("1", b.exactCenterX(), base, textPaint);
            }
        }

        @Override
        public void setAlpha(int alpha) {
            strokePaint.setAlpha(alpha);
            textPaint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            strokePaint.setColorFilter(colorFilter);
            textPaint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** Crisp Material 3 stopwatch / timer icon for Sleep Timer in the queue bottom toolbar. */
    private static final class SleepTimerDrawable extends Drawable {
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path bodyPath = new Path();
        private final Path cutPath = new Path();
        private final Path handStroke = new Path();
        private final Paint handMeasurePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float density;
        private final boolean filled;
        private int lastW = -1;
        private int lastH = -1;

        SleepTimerDrawable(float density, boolean filled) {
            this.density = density;
            this.filled = filled;
            fillPaint.setColor(0xFFFFFFFF);
            fillPaint.setStyle(Paint.Style.FILL);
            handMeasurePaint.setStyle(Paint.Style.STROKE);
            handMeasurePaint.setStrokeCap(Paint.Cap.ROUND);
            handMeasurePaint.setStrokeJoin(Paint.Join.ROUND);
        }

        void setColor(int color) {
            if (fillPaint.getColor() != color) {
                fillPaint.setColor(color);
                invalidateSelf();
            }
        }

        private void rebuildIfNeeded(Rect b) {
            int w = b.width();
            int h = b.height();
            if (w == lastW && h == lastH) {
                return;
            }
            lastW = w;
            lastH = h;
            float s = Math.min(w, h);
            float u = s / 24f;
            float ox = b.exactCenterX() - s * 0.5f;
            float oy = b.exactCenterY() - s * 0.5f;

            bodyPath.reset();
            // Top cap button
            bodyPath.addRoundRect(
                    ox + 9.0f * u, oy + 2.0f * u, ox + 15.0f * u, oy + 4.0f * u,
                    1.0f * u, 1.0f * u, Path.Direction.CW);
            // Neck connecting top cap to dial
            bodyPath.addRect(
                    ox + 11.0f * u, oy + 3.6f * u, ox + 13.0f * u, oy + 5.8f * u,
                    Path.Direction.CW);
            // Main circular watch body
            float cx = ox + 12.0f * u;
            float cy = oy + 13.4f * u;
            float r = 7.7f * u;
            bodyPath.addCircle(cx, cy, r, Path.Direction.CW);

            if (!filled) {
                // Carve crisp inner dial ring or clean cutout hand matching Image 1
                cutPath.reset();
                handStroke.reset();
                handStroke.moveTo(cx, cy);
                handStroke.lineTo(cx, cy - 4.3f * u);
                handMeasurePaint.setStrokeWidth(Math.max(1.6f, 2.0f * u));
                handMeasurePaint.getFillPath(handStroke, cutPath);
                bodyPath.op(cutPath, Path.Op.DIFFERENCE);
            } else {
                // Active state: bold angled clock hand + minute tick cutout
                cutPath.reset();
                handStroke.reset();
                handStroke.moveTo(cx, cy - 4.4f * u);
                handStroke.lineTo(cx, cy);
                handStroke.lineTo(cx + 3.2f * u, cy + 1.8f * u);
                handMeasurePaint.setStrokeWidth(Math.max(1.7f, 2.1f * u));
                handMeasurePaint.getFillPath(handStroke, cutPath);
                bodyPath.op(cutPath, Path.Op.DIFFERENCE);
            }
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            rebuildIfNeeded(b);
            canvas.drawPath(bodyPath, fillPaint);
        }

        @Override
        public void setAlpha(int alpha) {
            fillPaint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            fillPaint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** Crisp Material 3 playlist_add icon for "Save as playlist". */
    private static final class PlaylistAddDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float density;

        PlaylistAddDrawable(float density) {
            this.density = density;
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
        }

        void setColor(int color) {
            if (paint.getColor() != color) {
                paint.setColor(color);
                invalidateSelf();
            }
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            float s = Math.min(b.width(), b.height());
            float u = s / 24f;
            float ox = b.exactCenterX() - s * 0.5f;
            float oy = b.exactCenterY() - s * 0.5f;
            paint.setStrokeWidth(Math.max(1.6f, 2.0f * density));

            // 3 playlist bars
            canvas.drawLine(ox + 3.2f * u, oy + 6.5f * u, ox + 14.5f * u, oy + 6.5f * u, paint);
            canvas.drawLine(ox + 3.2f * u, oy + 11.5f * u, ox + 14.5f * u, oy + 11.5f * u, paint);
            canvas.drawLine(ox + 3.2f * u, oy + 16.5f * u, ox + 10.5f * u, oy + 16.5f * u, paint);

            // "+" sign on bottom-right
            float px = ox + 17.5f * u;
            float py = oy + 16.5f * u;
            float arm = 3.2f * u;
            canvas.drawLine(px - arm, py, px + arm, py, paint);
            canvas.drawLine(px, py - arm, px, py + arm, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** Crisp 3-dot horizontal overflow icon ("...") matching M3 Expressive toolbar design. */
    private static final class MoreDotsDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float density;

        MoreDotsDrawable(float density) {
            this.density = density;
            paint.setStyle(Paint.Style.FILL);
        }

        void setColor(int color) {
            if (paint.getColor() != color) {
                paint.setColor(color);
                invalidateSelf();
            }
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            float r = Math.max(1.8f, 2.2f * density);
            float spacing = 6.6f * density;
            canvas.drawCircle(cx - spacing, cy, r, paint);
            canvas.drawCircle(cx, cy, r, paint);
            canvas.drawCircle(cx + spacing, cy, r, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** Crisp M3 staggered 3-bar clear-queue icon ("Clear queue"). */
    private static final class ClearQueueDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float density;

        ClearQueueDrawable(float density) {
            this.density = density;
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
        }

        void setColor(int color) {
            paint.setColor(color);
            invalidateSelf();
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            float size = Math.min(b.width(), b.height());
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            float sw = Math.max(1.6f, 2.0f * density);
            paint.setStrokeWidth(sw);

            float halfW = size * 0.34f;
            float dy = size * 0.22f;
            float shift = size * 0.08f;
            // Staggered descending bars (Material clear_all)
            canvas.drawLine(cx - halfW + shift, cy - dy, cx + halfW + shift, cy - dy, paint);
            canvas.drawLine(cx - halfW, cy, cx + halfW, cy, paint);
            canvas.drawLine(cx - halfW - shift, cy + dy, cx + halfW - shift, cy + dy, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** Crisp queue/mix icon for the top-right source pill ("Your Mix"). */
    private static final class SourceQueueDrawable extends Drawable {
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float density;

        SourceQueueDrawable(float density) {
            this.density = density;
            strokePaint.setStyle(Paint.Style.STROKE);
            strokePaint.setStrokeCap(Paint.Cap.ROUND);
            fillPaint.setStyle(Paint.Style.FILL);
        }

        void setColor(int color) {
            strokePaint.setColor(color);
            fillPaint.setColor(color);
            invalidateSelf();
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            float s = Math.min(b.width(), b.height());
            float left = b.exactCenterX() - s * 0.42f;
            float top = b.exactCenterY() - s * 0.32f;
            strokePaint.setStrokeWidth(Math.max(1.3f, 1.55f * density));

            // 3 queue lines on the left
            canvas.drawLine(left, top + s * 0.06f, left + s * 0.56f, top + s * 0.06f, strokePaint);
            canvas.drawLine(left, top + s * 0.30f, left + s * 0.56f, top + s * 0.30f, strokePaint);
            canvas.drawLine(left, top + s * 0.54f, left + s * 0.34f, top + s * 0.54f, strokePaint);

            // Tiny music note on bottom-right
            float noteX = left + s * 0.66f;
            float noteY = top + s * 0.56f;
            float nr = s * 0.12f;
            canvas.drawCircle(noteX, noteY, nr, fillPaint);
            canvas.drawLine(noteX + nr * 0.85f, noteY, noteX + nr * 0.85f, top + s * 0.14f, strokePaint);
            canvas.drawLine(noteX + nr * 0.85f, top + s * 0.14f, noteX + s * 0.24f, top + s * 0.14f, strokePaint);
        }

        @Override
        public void setAlpha(int alpha) {
            strokePaint.setAlpha(alpha);
            fillPaint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            strokePaint.setColorFilter(colorFilter);
            fillPaint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * Smooth animated 3-dot playing indicator rendered on the Currently Playing card
     * (gently pulsing while playing, resting calmly when paused).
     */
    private static final class PlayingDotsDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float density;
        private ValueAnimator animator;
        private float phase = 0f;
        private boolean playing;

        PlayingDotsDrawable(float density) {
            this.density = density;
            paint.setStyle(Paint.Style.FILL);
        }

        void setColor(int color) {
            if (paint.getColor() != color) {
                paint.setColor(color);
                invalidateSelf();
            }
        }

        void setPlaying(boolean isPlaying) {
            if (this.playing == isPlaying) {
                return;
            }
            this.playing = isPlaying;
            if (isPlaying) {
                if (animator == null) {
                    animator = ValueAnimator.ofFloat(0f, (float) (Math.PI * 2.0));
                    animator.setDuration(1150L);
                    animator.setRepeatCount(ValueAnimator.INFINITE);
                    animator.setInterpolator(t -> t);
                    animator.addUpdateListener(a -> {
                        phase = (float) a.getAnimatedValue();
                        invalidateSelf();
                    });
                }
                if (!animator.isStarted()) {
                    animator.start();
                }
            } else {
                if (animator != null) {
                    animator.cancel();
                }
                phase = 0f;
                invalidateSelf();
            }
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            float baseR = Math.max(1.7f, 2.0f * density);
            float spacing = 6.2f * density;
            float ampY = 2.6f * density;
            int baseColor = paint.getColor();
            int baseAlpha = Color.alpha(baseColor);

            for (int i = 0; i < 3; i++) {
                float x = cx + (i - 1) * spacing;
                float wave = playing ? (float) Math.sin(phase - i * 1.15f) : 0f;
                float y = cy - wave * ampY;
                float r = baseR * (1f + (playing ? 0.18f * Math.max(0f, wave) : 0f));
                int a = playing
                        ? Math.round(baseAlpha * (0.58f + 0.42f * (0.5f + 0.5f * wave)))
                        : Math.round(baseAlpha * 0.65f);
                paint.setColor(MaterialYouColorEngine.withAlpha(baseColor, a));
                canvas.drawCircle(x, y, r, paint);
            }
            paint.setColor(baseColor);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
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
                        surfaceBaseColor, atmosphericTintColor, lightMode ? 0.28f : 0.38f);
                int midTone = MaterialYouColorEngine.blendRgb(
                        surfaceBaseColor, atmosphericTintColor, lightMode ? 0.16f : 0.22f);
                int a0 = lightMode ? 0xD8 : 0xC6;
                int a1 = lightMode ? 0xEA : 0xD8;
                int a2 = lightMode ? 0xF8 : 0xEE;
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
