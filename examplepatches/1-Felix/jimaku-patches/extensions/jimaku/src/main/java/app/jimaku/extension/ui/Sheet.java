package app.jimaku.extension.ui;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.os.Bundle;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.DecelerateInterpolator;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;

import java.util.List;

/**
 * A sheet in the measures of YouTube's player sheets, in its own window over the activity: 8 dp
 * from the screen's sides and above the navigation bar in portrait, 384 dp wide and centred in
 * landscape, or at its end edge once moved there, 16 dp corners, a drag handle, the screen behind dimmed by 60% black. It slides up when
 * it opens and down when it closes; Back, a tap beside it or dragging it down closes it.
 */
public final class Sheet {
    /** Told when the sheet has closed, however it was closed. */
    public interface OnClosed {
        void onClosed();
    }

    /** Decides whether a touch beside the sheet is Jimaku's own, such as the captions' grip. */
    public interface Beside {
        /** Whether this touch, in screen coordinates, is taken; the sheet then stays open. */
        boolean onTouch(MotionEvent event);
    }

    private static final long SLIDE_MILLIS = 250;
    private static final float SEE_THROUGH = 0.2f;

    private final Activity activity;
    private final Theme theme;
    private final Dialog dialog;
    private final Root root;
    private final Panel panel;
    private final LinearLayout header;
    private final LinearLayout content;
    private final ScrollView scroll;
    private OnClosed onClosed;
    private Beside beside;
    private boolean closing;
    private boolean atEnd;
    private int maxTop;

    /**
     * Opens an empty sheet over {@code activity}. In portrait the sheet's top stays below
     * {@code maxTop}, in screen pixels, so whatever is above it stays in view. It is dark as the
     * app's theme is, or as the activity's configuration has it where {@code dark} is null.
     */
    public static Sheet open(Activity activity, int maxTop, Boolean dark) {
        return new Sheet(activity, maxTop, dark);
    }

    private Sheet(Activity activity, int maxTop, Boolean dark) {
        this.activity = activity;
        this.theme = Theme.of(activity, dark);
        this.maxTop = maxTop;

        header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.VERTICAL);
        content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        scroll = new ScrollView(activity);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.setOverScrollMode(View.OVER_SCROLL_NEVER);
        scroll.addView(content, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        panel = new Panel(activity);
        panel.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable ground = new GradientDrawable();
        ground.setColor(theme.sheet);
        ground.setCornerRadius(theme.dp(16));
        panel.setBackground(ground);
        panel.setClipToOutline(true);
        // TalkBack announces the sheet and its handle in YouTube's words, in the app's language.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            panel.setAccessibilityPaneTitle(hostString("bottom_sheet_accessibility_pane_title"));
        }
        panel.addView(new Handle(activity, hostString("bottomsheet_drag_handle_content_description")), new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, theme.dp(12)));
        panel.addView(header, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        panel.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        panel.setPadding(0, 0, 0, theme.dp(8));

        root = new Root(activity);
        root.addView(panel, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL));
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
                // The keyboard, while Other languages' search has it, pushes the sheet up above it.
                int keyboard = insets.getInsets(WindowInsets.Type.ime()).bottom;
                root.insets.set(bars.left, bars.top, bars.right, Math.max(bars.bottom, keyboard));
            } else {
                root.insets.set(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                        insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            }
            root.requestLayout();
            return insets;
        });

        dialog = new Dialog(activity) {
            @Override
            public void onBackPressed() {
                close();
            }
        };
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(root);
        dialog.setCanceledOnTouchOutside(false);
        dialog.setOnDismissListener(d -> {
            if (onClosed != null) onClosed.onClosed();
        });
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            window.setWindowAnimations(0);
            // The keyboard opens only when the search field is tapped.
            window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN
                    | WindowManager.LayoutParams.SOFT_INPUT_ADJUST_NOTHING);
            window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                window.setDecorFitsSystemWindows(false);
                WindowManager.LayoutParams attributes = window.getAttributes();
                attributes.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS;
                // The window covers the system bars too, so the dim reaches the screen's edges as YouTube's does.
                attributes.setFitInsetsTypes(0);
                attributes.setFitInsetsSides(0);
                window.setAttributes(attributes);
            } else {
                window.getAttributes().layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
                window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                        | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION);
            }
            // The bars' grounds are the window's own and clear, so the dim shows under them.
            window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            window.setStatusBarColor(Color.TRANSPARENT);
            window.setNavigationBarColor(Color.TRANSPARENT);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                window.setStatusBarContrastEnforced(false);
                window.setNavigationBarContrastEnforced(false);
            }
            WindowInsetsController bars = Build.VERSION.SDK_INT >= Build.VERSION_CODES.R ? window.getInsetsController() : null;
            if (bars != null) {
                // YouTube's sheets turn the bars' icons dark in the light theme, but over a
                // fullscreen player, whose bars only show for the sheet, they stay white. Set
                // either way, as the dialog would otherwise take the app theme's dark icons.
                int light = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                bars.setSystemBarsAppearance(!theme.dark && activityBarsShown() ? light : 0, light);
            }
        }
        // Over a fullscreen player the system bars show while the sheet is open, as with YouTube's
        // own sheets, and hide again once the player has focus back.
        dialog.show();
        root.post(this::slideIn);
    }

    public Theme theme() {
        return theme;
    }

    public Context context() {
        return activity;
    }

    public void setOnClosed(OnClosed listener) {
        onClosed = listener;
    }

    public void setBeside(Beside listener) {
        beside = listener;
    }

    /** Open and on screen: a dialog whose activity was destroyed still says it shows, but never closes. */
    public boolean isOpen() {
        return dialog.isShowing() && !closing && !activity.isDestroyed();
    }

    /** Puts {@code rows} in the sheet in place of what it held, keeping its scroll where it can. */
    public void show(List<View> rows) {
        int scrolled = scroll.getScrollY();
        content.removeAllViews();
        for (View row : rows) content.addView(row);
        scroll.post(() -> scroll.scrollTo(0, scrolled));
    }

    /** Scrolls so that {@code row} is in the middle of the list, where the list scrolls. */
    public void reveal(View row) {
        scroll.post(() -> {
            int middle = row.getTop() + row.getHeight() / 2 - scroll.getHeight() / 2;
            scroll.scrollTo(0, Math.max(0, middle));
        });
    }

    /** Replaces the sheet's rows as YouTube replaces its settings sheet with its Captions sheet. */
    public void replace(List<View> rows) {
        replace(List.of(), rows);
    }

    /**
     * Replaces the sheet with {@code top}, which stays above the list while it scrolls and while its
     * rows are put in again, and {@code rows} under it.
     */
    public void replace(List<View> top, List<View> rows) {
        panel.setMinimumHeight(0);
        header.removeAllViews();
        for (View row : top) header.addView(row);
        scroll.scrollTo(0, 0);
        show(rows);
        root.sendAccessibilityEvent(AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED);
    }

    /** Keeps the sheet at the height it has now while its list narrows, as Other languages while it is searched. */
    public void keepHeight() {
        if (panel.getHeight() > panel.getMinimumHeight()) panel.setMinimumHeight(panel.getHeight());
    }

    /**
     * In landscape, moves the sheet from the middle to the screen's end edge, 8 dp from it, so what
     * the middle of the player shows stays in view beside it. It slides across; portrait is unchanged.
     */
    public void moveToEnd() {
        if (atEnd) return;
        atEnd = true;
        int from = panel.getLeft();
        panel.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
            @Override
            public void onLayoutChange(View v, int left, int top, int right, int bottom,
                                       int oldLeft, int oldTop, int oldRight, int oldBottom) {
                panel.removeOnLayoutChangeListener(this);
                if (left == from) return;
                panel.setTranslationX(from - left);
                panel.animate().translationX(0).setDuration(SLIDE_MILLIS).setInterpolator(new DecelerateInterpolator()).start();
            }
        });
        root.requestLayout();
    }

    /** While the captions are dragged in landscape with the sheet at the end edge: it fades, so they show under it. */
    public void setSeeThrough(boolean value) {
        boolean fade = value && atEnd && root.getWidth() > root.getHeight();
        panel.animate().alpha(fade ? SEE_THROUGH : 1f).setDuration(150).start();
    }

    /**
     * What the sheet covers once moved to the end edge in landscape, in screen pixels, where it
     * will be after its slide; null in the middle, in portrait or before it is laid out.
     */
    public Rect coveredAtEnd() {
        int width = root.getWidth();
        int height = root.getHeight();
        if (!atEnd || width <= height || width == 0) return null;
        int side = theme.dp(8);
        int panelWidth = panelWidth(width, true);
        boolean rtl = root.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
        int left = rtl ? root.insets.left + side : width - root.insets.right - side - panelWidth;
        int[] at = new int[2];
        root.getLocationOnScreen(at);
        return new Rect(at[0] + left, at[1], at[0] + left + panelWidth, at[1] + height);
    }

    private int panelWidth(int width, boolean landscape) {
        int side = theme.dp(8);
        return landscape ? Math.min(theme.dp(384), width - 2 * side) : width - 2 * side;
    }

    /** One of YouTube's own strings, or null where this YouTube has none by that name. */
    private String hostString(String name) {
        Resources resources = activity.getResources();
        for (String pkg : new String[] {activity.getPackageName(), "com.google.android.youtube"}) {
            int id = resources.getIdentifier(name, "string", pkg);
            if (id != 0) return resources.getString(id);
        }
        return null;
    }

    public void close() {
        if (closing || !dialog.isShowing()) return;
        closing = true;
        float from = panel.getTranslationY();
        float to = panel.getHeight() + theme.dp(16);
        ValueAnimator slide = ValueAnimator.ofFloat(0, 1);
        slide.setDuration(SLIDE_MILLIS);
        slide.setInterpolator(new DecelerateInterpolator());
        slide.addUpdateListener(a -> {
            float f = (float) a.getAnimatedValue();
            panel.setTranslationY(from + (to - from) * f);
            root.setDim(1 - f);
        });
        slide.addListener(new android.animation.AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(android.animation.Animator animation) {
                if (dialog.isShowing()) dialog.dismiss();
            }
        });
        slide.start();
    }

    private void slideIn() {
        float from = panel.getHeight() + theme.dp(16);
        panel.setTranslationY(from);
        ValueAnimator slide = ValueAnimator.ofFloat(0, 1);
        slide.setDuration(SLIDE_MILLIS);
        slide.setInterpolator(new DecelerateInterpolator());
        slide.addUpdateListener(a -> {
            float f = (float) a.getAnimatedValue();
            panel.setTranslationY(from * (1 - f));
            root.setDim(f);
        });
        slide.start();
        root.sendAccessibilityEvent(AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED);
    }

    /** Whether the activity shows its status bar, as the portrait player does and the fullscreen one doesn't. */
    private boolean activityBarsShown() {
        Window activityWindow = activity.getWindow();
        if (activityWindow == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.R) return true;
        WindowInsets insets = activityWindow.getDecorView().getRootWindowInsets();
        return insets == null || insets.isVisible(WindowInsets.Type.statusBars());
    }

    /** The whole window: the dim, and the sheet placed as YouTube places its own. */
    private final class Root extends FrameLayout {
        final Rect insets = new Rect();
        private final Paint dimPaint = new Paint();
        private float dim;
        private float downY;
        private boolean dragging;
        private boolean besideTaken;

        Root(Context context) {
            super(context);
            setWillNotDraw(false);
        }

        void setDim(float f) {
            dim = f;
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            dimPaint.setColor(Color.argb(Math.round(255 * Theme.DIM * dim), 0, 0, 0));
            canvas.drawRect(0, 0, getWidth(), getHeight(), dimPaint);
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int width = MeasureSpec.getSize(widthMeasureSpec);
            int height = MeasureSpec.getSize(heightMeasureSpec);
            boolean landscape = width > height;
            int side = theme.dp(8);
            int panelWidth = panelWidth(width, landscape);
            int bottom = insets.bottom + theme.dp(8);
            int top = landscape ? theme.dp(56) : Math.max(insets.top + theme.dp(8), maxTop + theme.dp(8));
            FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) panel.getLayoutParams();
            params.width = panelWidth;
            params.bottomMargin = bottom;
            boolean end = landscape && atEnd;
            boolean rtl = getLayoutDirection() == LAYOUT_DIRECTION_RTL;
            params.gravity = Gravity.BOTTOM | (!end ? Gravity.CENTER_HORIZONTAL : rtl ? Gravity.LEFT : Gravity.RIGHT);
            params.leftMargin = end && rtl ? insets.left + side : 0;
            params.rightMargin = end && !rtl ? insets.right + side : 0;
            panel.maxHeight = Math.max(theme.dp(160), height - top - bottom);
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        }

        @Override
        public boolean onInterceptTouchEvent(MotionEvent event) {
            return false;
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            // Only touches beside the sheet get here: the sheet's own rows take theirs.
            if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
                besideTaken = beside != null && beside.onTouch(event);
                return true;
            }
            if (besideTaken) {
                beside.onTouch(event);
                if (event.getActionMasked() == MotionEvent.ACTION_UP || event.getActionMasked() == MotionEvent.ACTION_CANCEL) {
                    besideTaken = false;
                }
                return true;
            }
            if (event.getActionMasked() == MotionEvent.ACTION_UP) close();
            return true;
        }

        boolean dragSheet(MotionEvent event) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN -> {
                    downY = event.getRawY();
                    dragging = false;
                    return false;
                }
                case MotionEvent.ACTION_MOVE -> {
                    float dy = event.getRawY() - downY;
                    if (!dragging && dy > theme.dp(8) && scroll.getScrollY() == 0) dragging = true;
                    if (dragging) panel.setTranslationY(Math.max(0, dy));
                    return dragging;
                }
                case MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> {
                    if (!dragging) return false;
                    dragging = false;
                    if (panel.getTranslationY() > panel.getHeight() / 4f) {
                        close();
                    } else {
                        panel.animate().translationY(0).setDuration(150).start();
                    }
                    return true;
                }
                default -> {
                    return dragging;
                }
            }
        }
    }

    /** The sheet: no taller than the room it has, and dragged down by its handle or its top. */
    private final class Panel extends LinearLayout {
        int maxHeight = Integer.MAX_VALUE;

        Panel(Context context) {
            super(context);
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            super.onMeasure(widthMeasureSpec, MeasureSpec.makeMeasureSpec(maxHeight, MeasureSpec.AT_MOST));
        }

        @Override
        public boolean onInterceptTouchEvent(MotionEvent event) {
            return root.dragSheet(event);
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            root.dragSheet(event);
            return true;
        }
    }

    /**
     * YouTube's drag handle: a 40 × 4 dp bar in a 12 dp band at the sheet's top. For TalkBack it is
     * YouTube's "Drag handle" button, which closes the sheet; touches still drag it.
     */
    private final class Handle extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF bar = new RectF();

        Handle(Context context, String name) {
            super(context);
            paint.setColor(theme.handle);
            if (name == null) {
                setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
                return;
            }
            setContentDescription(name);
            setAccessibilityDelegate(new AccessibilityDelegate() {
                @Override
                public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                    super.onInitializeAccessibilityNodeInfo(host, info);
                    info.setClassName("android.widget.Button");
                    info.setClickable(true);
                    info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK);
                }

                @Override
                public boolean performAccessibilityAction(View host, int action, Bundle arguments) {
                    if (action != AccessibilityNodeInfo.ACTION_CLICK) return super.performAccessibilityAction(host, action, arguments);
                    close();
                    return true;
                }
            });
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float w = theme.dp(40), h = theme.dp(4);
            float top = theme.dp(8);
            bar.set((getWidth() - w) / 2, top, (getWidth() + w) / 2, top + h);
            canvas.drawRoundRect(bar, h / 2, h / 2, paint);
        }
    }
}
