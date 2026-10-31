/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.ActionMode;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.KeyboardShortcutGroup;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.DecelerateInterpolator;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.List;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;
import app.hushtelegram.extension.telegram.settings.SettingsRoutes;

/**
 * The side menu itself: a dimmed layer over the main screen with the menu sliding in from the left.
 * It's added to the main screen's own layout the first time it opens, so it goes away with that
 * screen. While a swipe opens it, the rest of that swipe comes to the menu through the window
 * instead of the chat list, which gets a cancel so nothing it started goes on.
 *
 * <p>The colors follow Telegram's theme: the menu takes the chat list's own background, and text
 * dark or light on it. Black with AMOLED black on and a dark theme.
 */
@SuppressLint("ViewConstructor")
final class SideMenuPanel extends FrameLayout {
    static final String TAG = "hushtelegram_side_menu";
    /** The widest the menu gets, in dp, and the least it leaves of the screen beside it. */
    static final int MAX_WIDTH = 300;
    static final int GAP = 56;
    static final int ROW_HEIGHT = 52;
    static final long SETTLE_MS = 220;
    /** How dark the screen behind gets with the menu all the way open. */
    static final float SCRIM = 0.5f;

    Object screen;
    final View scrim;
    final LinearLayout menu;
    final TextView name;
    /** The Archived Chats row once it's added, where it goes and what it says. */
    TextView archive;
    private int archiveAt;
    private String archiveLabel;
    /** The HushTelegram row and the line above it, which the way's switch shows or hides each time the menu opens. */
    View hushRow;
    View hushDivider;
    private final int touchSlop;
    private final int flingSpeed;
    private float progress;
    private ValueAnimator settling;
    private VelocityTracker velocity;
    private float dragFrom;
    private float progressFrom;
    private boolean dragging;
    private float downX;
    private float downY;

    private SideMenuPanel(Context context, Object screen) {
        super(context);
        this.screen = screen;
        setTag(TAG);
        setVisibility(GONE);
        setClickable(true);
        ViewConfiguration config = ViewConfiguration.get(context);
        touchSlop = config.getScaledTouchSlop();
        flingSpeed = config.getScaledMinimumFlingVelocity() * 4;

        scrim = new View(context);
        scrim.setBackgroundColor(Color.BLACK);
        scrim.setAlpha(0f);
        scrim.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        addView(scrim, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));

        menu = new LinearLayout(context);
        menu.setOrientation(LinearLayout.VERTICAL);
        menu.setClickable(true);
        menu.setAccessibilityPaneTitle(L10n.t("Side menu"));
        ScrollView scroll = new ScrollView(context);
        scroll.setFillViewport(true);
        scroll.addView(menu, new ScrollView.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
        addView(scroll, new LayoutParams(dp(MAX_WIDTH), LayoutParams.MATCH_PARENT, Gravity.START));

        name = new TextView(context);
        name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        name.setTypeface(Typeface.DEFAULT_BOLD);
        name.setSingleLine(true);
        name.setEllipsize(TextUtils.TruncateAt.END);
        name.setPadding(dp(24), dp(24), dp(24), dp(4));
        menu.addView(name);
        TextView accounts = row(L10n.t("Switch account"), "msg_contacts", null);
        accounts.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        accounts.setCompoundDrawablesRelative(null, null, null, null);
        accounts.setMinHeight(dp(48));
        accounts.setPadding(dp(24), 0, dp(24), dp(8));
        accounts.setOnClickListener(v -> {
            HookStatus.counted(FamilyNames.HIDE_CONTACTS_TAB, "side menu opened accounts");
            try {
                SideMenu.opener.accounts(this.screen, v);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.HIDE_CONTACTS_TAB, "side menu accounts", failure);
            }
        });
        menu.addView(accounts);
        menu.addView(divider());
        String[] labels = SideMenu.rowLabels();
        String[] icons = {"msg_openprofile", "msg_message", "msg_contacts", "msg_calls", "msg_saved", "msg_settings_old", "msg_archive", "msg_settings"};
        for (SideMenu.Row each : SideMenu.Row.values()) {
            if (each == SideMenu.Row.HUSH) {
                hushDivider = divider();
                menu.addView(hushDivider);
            }
            if (each == SideMenu.Row.ARCHIVE) {
                // Added the first time the menu opens with All Chats hidden, which a later build can bring.
                archiveAt = menu.getChildCount();
                archiveLabel = labels[each.ordinal()];
                continue;
            }
            TextView added = row(labels[each.ordinal()], icons[each.ordinal()], each);
            if (each == SideMenu.Row.HUSH) hushRow = added;
            menu.addView(added);
        }
    }

    /** Shows the HushTelegram row while its way is on. Read each time the menu opens, so a switch applies at once. */
    void showHush() {
        boolean shown;
        try {
            shown = SettingsRoutes.sideMenuRow();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CONTACTS_TAB, "side menu hush row", failure);
            shown = true;
        }
        if (hushRow != null) hushRow.setVisibility(shown ? VISIBLE : GONE);
        if (hushDivider != null) hushDivider.setVisibility(shown ? VISIBLE : GONE);
    }

    /** Shows the Archived Chats row while a chat list is built without All Chats, adding it the first time. */
    private void showArchive() {
        boolean shown;
        try {
            shown = LaunchFolder.archiveShown();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "side menu archive", failure);
            shown = false;
        }
        if (shown && archive == null) {
            archive = row(archiveLabel, "msg_archive", SideMenu.Row.ARCHIVE);
            menu.addView(archive, archiveAt);
        }
        if (archive != null) archive.setVisibility(shown ? VISIBLE : GONE);
    }

    /**
     * Called when a swipe on the first page can open the menu: finds or adds the menu over the
     * main screen and hands it the rest of the swipe.
     */
    static void arm(Object screen, View pager, MotionEvent event) {
        ViewParent parent = pager.getParent();
        Activity activity = activityOf(pager.getContext());
        if (!(parent instanceof FrameLayout) || activity == null) {
            HookStatus.counted(FamilyNames.HIDE_CONTACTS_TAB, "side menu had no place to open");
            return;
        }
        SideMenuPanel panel = in((FrameLayout) parent, screen);
        Gestures gestures = Gestures.install(activity.getWindow());
        if (gestures == null) return;
        gestures.arm(panel, event.getRawX());
    }

    /** The menu over this main screen's layout, added the first time. */
    static SideMenuPanel in(FrameLayout parent, Object screen) {
        View found = parent.findViewWithTag(TAG);
        if (found instanceof SideMenuPanel) {
            SideMenuPanel panel = (SideMenuPanel) found;
            panel.screen = screen;
            panel.bringToFront();
            return panel;
        }
        SideMenuPanel panel = new SideMenuPanel(parent.getContext(), screen);
        parent.addView(panel, new FrameLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
        return panel;
    }

    /** Back on the main screen: true while the menu shows, closing it when Back happened. */
    static boolean back(Object screen, boolean invoked) {
        SideMenuPanel panel = Gestures.shown(screen);
        if (panel == null) return false;
        if (invoked) panel.settle(false);
        return true;
    }

    /** Whether any of the menu shows. */
    boolean shown() {
        return getVisibility() == VISIBLE && progress > 0f;
    }

    /** Gets the menu ready to show: the name, colors, width and the room the bars take. */
    private void prepare() {
        Activity activity = activityOf(getContext());
        String self = null;
        try {
            self = SideMenu.selfName(screen);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CONTACTS_TAB, "side menu name", failure);
        }
        name.setText(self == null ? "" : self);
        name.setVisibility(self == null || self.isEmpty() ? GONE : VISIBLE);
        showArchive();
        showHush();
        paint(colorsFor(activity, (View) getParent()));
        View parent = (View) getParent();
        int width = parent == null ? 0 : parent.getWidth();
        View scroll = (View) menu.getParent();
        LayoutParams params = (LayoutParams) scroll.getLayoutParams();
        int wanted = width <= 0 ? dp(MAX_WIDTH) : Math.min(dp(MAX_WIDTH), Math.max(dp(GAP), width - dp(GAP)));
        if (params.width != wanted) {
            params.width = wanted;
            scroll.setLayoutParams(params);
        }
        WindowInsets insets = getRootWindowInsets();
        int top = insets == null ? 0 : insets.getSystemWindowInsetTop();
        int bottom = insets == null ? 0 : insets.getSystemWindowInsetBottom();
        menu.setPadding(0, top, 0, bottom + dp(8));
    }

    /** The menu's width as it's laid out, or the width it's set to before that. */
    private int menuWidth() {
        View scroll = (View) menu.getParent();
        int laid = scroll.getWidth();
        return laid > 0 ? laid : Math.max(1, scroll.getLayoutParams().width);
    }

    void beginDrag(float rawX) {
        stopSettling();
        if (getVisibility() != VISIBLE) {
            prepare();
            setVisibility(VISIBLE);
        }
        dragging = true;
        dragFrom = rawX;
        progressFrom = progress;
        if (velocity != null) velocity.recycle();
        velocity = VelocityTracker.obtain();
    }

    /** One event of a drag, in the window's coordinates. */
    void drag(MotionEvent event) {
        if (velocity != null) velocity.addMovement(event);
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_MOVE:
                setProgress(progressFrom + (event.getRawX() - dragFrom) / menuWidth());
                break;
            case MotionEvent.ACTION_UP:
                float speed = 0f;
                if (velocity != null) {
                    velocity.computeCurrentVelocity(1000);
                    speed = velocity.getXVelocity();
                }
                endDrag();
                settle(speed > flingSpeed || (speed > -flingSpeed && progress > 0.5f));
                break;
            case MotionEvent.ACTION_CANCEL:
                endDrag();
                settle(progress > 0.5f);
                break;
            default:
                break;
        }
    }

    private void endDrag() {
        dragging = false;
        if (velocity != null) {
            velocity.recycle();
            velocity = null;
        }
    }

    /** Opens or closes the rest of the way. */
    void settle(boolean open) {
        stopSettling();
        if (open && getVisibility() != VISIBLE) {
            prepare();
            setVisibility(VISIBLE);
        }
        float target = open ? 1f : 0f;
        if (progress == target) {
            finish(open);
            return;
        }
        settling = ValueAnimator.ofFloat(progress, target);
        settling.setDuration((long) (SETTLE_MS * Math.abs(target - progress)) + 40);
        settling.setInterpolator(new DecelerateInterpolator());
        settling.addUpdateListener(animation -> setProgress((float) animation.getAnimatedValue()));
        settling.addListener(new AnimatorListenerAdapter() {
            private boolean cancelled;

            @Override
            public void onAnimationCancel(Animator animation) {
                cancelled = true;
            }

            @Override
            public void onAnimationEnd(Animator animation) {
                if (!cancelled) finish(open);
            }
        });
        settling.start();
    }

    private void finish(boolean open) {
        settling = null;
        setProgress(open ? 1f : 0f);
        if (open) {
            HookStatus.counted(FamilyNames.HIDE_CONTACTS_TAB, "side menu opened");
            View first = menu.getChildAt(0);
            if (first != null) first.sendAccessibilityEvent(AccessibilityEvent.TYPE_VIEW_FOCUSED);
        }
    }

    private void stopSettling() {
        if (settling != null) {
            settling.cancel();
            settling = null;
        }
    }

    void setProgress(float value) {
        progress = Math.max(0f, Math.min(1f, value));
        View scroll = (View) menu.getParent();
        scroll.setTranslationX(-(1f - progress) * menuWidth());
        scrim.setAlpha(SCRIM * progress);
        setVisibility(progress > 0f || dragging || settling != null ? VISIBLE : GONE);
    }

    float progress() {
        return progress;
    }

    @Override
    public boolean onInterceptTouchEvent(MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downX = event.getRawX();
                downY = event.getRawY();
                return false;
            case MotionEvent.ACTION_MOVE:
                float dx = event.getRawX() - downX;
                // A swipe back toward the edge drags the menu closed; anything else stays with the rows.
                if (-dx > touchSlop && Math.abs(dx) > Math.abs(event.getRawY() - downY)) {
                    beginDrag(event.getRawX());
                    return true;
                }
                return false;
            default:
                return false;
        }
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (dragging) {
            drag(event);
            return true;
        }
        if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
            downX = event.getRawX();
            downY = event.getRawY();
        } else if (event.getActionMasked() == MotionEvent.ACTION_MOVE) {
            float dx = event.getRawX() - downX;
            if (-dx > touchSlop && Math.abs(dx) > Math.abs(event.getRawY() - downY)) beginDrag(event.getRawX());
        } else if (event.getActionMasked() == MotionEvent.ACTION_UP) {
            // A tap beside the menu closes it.
            View scroll = (View) menu.getParent();
            if (event.getX() > scroll.getRight() + scroll.getTranslationX()) settle(false);
        }
        // The screen behind gets nothing while the menu shows.
        return true;
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (event.getKeyCode() == KeyEvent.KEYCODE_ESCAPE && shown()) {
            if (event.getAction() == KeyEvent.ACTION_UP) settle(false);
            return true;
        }
        return super.dispatchKeyEvent(event);
    }

    @Override
    protected void onDetachedFromWindow() {
        // A screen a row opens without sliding takes the main screen off mid-close. It comes back closed.
        stopSettling();
        endDrag();
        setProgress(0f);
        super.onDetachedFromWindow();
    }

    private TextView row(String text, String icon, SideMenu.Row action) {
        TextView row = new TextView(getContext());
        row.setText(text);
        row.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        row.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
        row.setMinHeight(dp(ROW_HEIGHT));
        row.setPadding(dp(24), 0, dp(24), 0);
        row.setCompoundDrawablePadding(dp(28));
        row.setSingleLine(true);
        row.setEllipsize(TextUtils.TruncateAt.END);
        row.setFocusable(true);
        Drawable drawable = telegramIcon(icon);
        if (drawable != null) {
            drawable.setBounds(0, 0, dp(24), dp(24));
            row.setCompoundDrawablesRelative(drawable, null, null, null);
        }
        if (action != null) {
            row.setOnClickListener(v -> {
                Activity activity = activityOf(getContext());
                if (activity == null) return;
                // A page of the main screen slides in as the menu slides out; a screen of its own opens over both.
                settle(false);
                try {
                    SideMenu.open(action, screen, activity);
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.HIDE_CONTACTS_TAB, "side menu row", failure);
                }
            });
        }
        return row;
    }

    private View divider() {
        View line = new View(getContext());
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, Math.max(1, dp(1) / 2));
        params.topMargin = dp(6);
        params.bottomMargin = dp(6);
        line.setLayoutParams(params);
        line.setTag("divider");
        return line;
    }

    /** One of Telegram's own icons by name, or null when this build doesn't have it. */
    private Drawable telegramIcon(String icon) {
        Context context = getContext();
        int id = context.getResources().getIdentifier(icon, "drawable", context.getPackageName());
        if (id == 0) return null;
        try {
            Drawable drawable = context.getDrawable(id);
            return drawable == null ? null : drawable.mutate();
        } catch (RuntimeException missing) {
            return null;
        }
    }

    /** The menu's background, text and secondary color. */
    static final class Colors {
        final int background;
        final int text;
        final int secondary;

        Colors(int background) {
            this.background = background;
            boolean light = luminance(background) > 0.5f;
            text = light ? 0xFF000000 : 0xFFFFFFFF;
            secondary = light ? 0x8A000000 : 0x99FFFFFF;
        }
    }

    void paint(Colors colors) {
        menu.setBackgroundColor(colors.background);
        name.setTextColor(colors.text);
        for (int i = 0; i < menu.getChildCount(); i++) {
            View child = menu.getChildAt(i);
            if ("divider".equals(child.getTag())) {
                child.setBackgroundColor(colors.secondary & 0x33FFFFFF);
            } else if (child instanceof TextView && child != name) {
                TextView row = (TextView) child;
                boolean small = row.getTextSize() < name.getTextSize() * 0.8f && row.getCompoundDrawablesRelative()[0] == null;
                row.setTextColor(small ? colors.secondary : colors.text);
                row.setBackground(new RippleDrawable(ColorStateList.valueOf(colors.secondary & 0x33FFFFFF), null, new ColorDrawable(Color.WHITE)));
                Drawable icon = row.getCompoundDrawablesRelative()[0];
                if (icon != null) icon.setTint(colors.secondary);
            }
        }
    }

    /**
     * The chat list's own background, the first solid color found under the main screen's pager,
     * which is the theme's. Black instead with AMOLED black on and a dark theme. When nothing solid
     * is found, the status bar's look says light or dark.
     */
    static Colors colorsFor(Activity activity, View root) {
        Integer found = root == null ? null : solidBackground(root, 0);
        boolean light = found != null ? luminance(found) > 0.5f : lightBars(activity);
        int background = found != null ? found : light ? Color.WHITE : 0xFF1F1F1F;
        if (!light && amoled()) background = Color.BLACK;
        return new Colors(background);
    }

    private static boolean amoled() {
        try {
            return PatchFamily.AMOLED_BLACK.inBuild() && Settings.AMOLED_BLACK.get();
        } catch (Throwable failure) {
            return false;
        }
    }

    /** The first opaque color background found going down from [view], skipping this menu. */
    static Integer solidBackground(View view, int depth) {
        if (view instanceof SideMenuPanel || view.getVisibility() != VISIBLE || depth > 8) return null;
        Drawable background = view.getBackground();
        if (background instanceof ColorDrawable && Color.alpha(((ColorDrawable) background).getColor()) == 255
                && view.getWidth() * 2 >= ((View) view.getRootView()).getWidth()) {
            return ((ColorDrawable) background).getColor();
        }
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            Integer inside = solidBackground(group.getChildAt(i), depth + 1);
            if (inside != null) return inside;
        }
        return null;
    }

    @SuppressWarnings("deprecation")
    private static boolean lightBars(Activity activity) {
        if (activity == null) return false;
        Window window = activity.getWindow();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            WindowInsetsController controller = window.getInsetsController();
            if (controller != null && (controller.getSystemBarsAppearance() & WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS) != 0) return true;
        }
        return (window.getDecorView().getSystemUiVisibility() & View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR) != 0;
    }

    static float luminance(int color) {
        return (0.2126f * Color.red(color) + 0.7152f * Color.green(color) + 0.0722f * Color.blue(color)) / 255f;
    }

    private int dp(float value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    /**
     * The window's callback, wrapped so the rest of a swipe that opens the menu reaches the menu
     * instead of the screen it started on. Everything else passes straight through.
     */
    static final class Gestures implements Window.Callback {
        final Window.Callback inner;
        private WeakReference<SideMenuPanel> armed;
        private float armedAt;
        private WeakReference<SideMenuPanel> dragging;
        private WeakReference<SideMenuPanel> last;

        Gestures(Window.Callback inner) {
            this.inner = inner;
        }

        /** The window's wrapper, put in place the first time. Null when the window has no callback to wrap. */
        static Gestures install(Window window) {
            Window.Callback callback = window.getCallback();
            if (callback instanceof Gestures) return (Gestures) callback;
            if (callback == null) return null;
            Gestures gestures = new Gestures(callback);
            window.setCallback(gestures);
            return gestures;
        }

        /** The menu last armed over [screen], when it shows. */
        static SideMenuPanel shown(Object screen) {
            SideMenuPanel panel = Registry.panel.get();
            if (panel == null || panel.screen != screen || !panel.isAttachedToWindow()) return null;
            return panel.shown() ? panel : null;
        }

        void arm(SideMenuPanel panel, float rawX) {
            armed = new WeakReference<>(panel);
            armedAt = rawX;
            last = armed;
            Registry.panel = new WeakReference<>(panel);
        }

        @Override
        public boolean dispatchTouchEvent(MotionEvent event) {
            SideMenuPanel drag = dragging == null ? null : dragging.get();
            if (drag != null && !drag.isAttachedToWindow()) {
                // Its screen went while the finger was down, so the rest of the swipe goes on to the window.
                dragging = null;
                drag = null;
            }
            if (drag != null) {
                drag.drag(event);
                int action = event.getActionMasked();
                if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) dragging = null;
                return true;
            }
            SideMenuPanel opening = armed == null ? null : armed.get();
            if (opening != null) {
                armed = null;
                int action = event.getActionMasked();
                if (action == MotionEvent.ACTION_MOVE || action == MotionEvent.ACTION_UP) {
                    // The screen lets go of the swipe it started, and the menu follows the finger from here.
                    MotionEvent cancel = MotionEvent.obtain(event);
                    cancel.setAction(MotionEvent.ACTION_CANCEL);
                    inner.dispatchTouchEvent(cancel);
                    cancel.recycle();
                    opening.beginDrag(armedAt);
                    opening.drag(event);
                    if (action == MotionEvent.ACTION_MOVE) dragging = new WeakReference<>(opening);
                    return true;
                }
            }
            return inner.dispatchTouchEvent(event);
        }

        @Override public boolean dispatchKeyEvent(KeyEvent event) { return inner.dispatchKeyEvent(event); }
        @Override public boolean dispatchKeyShortcutEvent(KeyEvent event) { return inner.dispatchKeyShortcutEvent(event); }
        @Override public boolean dispatchTrackballEvent(MotionEvent event) { return inner.dispatchTrackballEvent(event); }
        @Override public boolean dispatchGenericMotionEvent(MotionEvent event) { return inner.dispatchGenericMotionEvent(event); }
        @Override public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) { return inner.dispatchPopulateAccessibilityEvent(event); }
        @Override public View onCreatePanelView(int featureId) { return inner.onCreatePanelView(featureId); }
        @Override public boolean onCreatePanelMenu(int featureId, Menu menu) { return inner.onCreatePanelMenu(featureId, menu); }
        @Override public boolean onPreparePanel(int featureId, View view, Menu menu) { return inner.onPreparePanel(featureId, view, menu); }
        @Override public boolean onMenuOpened(int featureId, Menu menu) { return inner.onMenuOpened(featureId, menu); }
        @Override public boolean onMenuItemSelected(int featureId, MenuItem item) { return inner.onMenuItemSelected(featureId, item); }
        @Override public void onWindowAttributesChanged(WindowManager.LayoutParams attrs) { inner.onWindowAttributesChanged(attrs); }
        @Override public void onContentChanged() { inner.onContentChanged(); }
        @Override public void onWindowFocusChanged(boolean hasFocus) { inner.onWindowFocusChanged(hasFocus); }
        @Override public void onAttachedToWindow() { inner.onAttachedToWindow(); }
        @Override public void onDetachedFromWindow() { inner.onDetachedFromWindow(); }
        @Override public void onPanelClosed(int featureId, Menu menu) { inner.onPanelClosed(featureId, menu); }
        @Override public boolean onSearchRequested() { return inner.onSearchRequested(); }
        @Override public boolean onSearchRequested(SearchEvent searchEvent) { return inner.onSearchRequested(searchEvent); }
        @Override public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) { return inner.onWindowStartingActionMode(callback); }
        @Override public ActionMode onWindowStartingActionMode(ActionMode.Callback callback, int type) { return inner.onWindowStartingActionMode(callback, type); }
        @Override public void onActionModeStarted(ActionMode mode) { inner.onActionModeStarted(mode); }
        @Override public void onActionModeFinished(ActionMode mode) { inner.onActionModeFinished(mode); }
        @Override public void onProvideKeyboardShortcuts(List<KeyboardShortcutGroup> data, Menu menu, int deviceId) { inner.onProvideKeyboardShortcuts(data, menu, deviceId); }
        @Override public void onPointerCaptureChanged(boolean hasCapture) { inner.onPointerCaptureChanged(hasCapture); }
    }

    /** The menu last armed, which Back asks about, held weakly so a closed screen's menu goes with it. */
    static final class Registry {
        static WeakReference<SideMenuPanel> panel = new WeakReference<>(null);

        private Registry() {}
    }
}
