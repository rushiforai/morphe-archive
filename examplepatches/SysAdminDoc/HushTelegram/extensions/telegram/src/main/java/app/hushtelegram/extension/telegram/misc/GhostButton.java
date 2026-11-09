/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ToggleButton;

import androidx.annotation.Nullable;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * A ghost on the chat list's top bar that turns Ghost mode on and off with one tap (#62). It
 * sits first among the bar's buttons, drawn in their color, filled while Ghost mode is on and an
 * outline while it's off. It hides while the bar's search is open, while its switch is off and
 * while HushTelegram is paused, and Telegram's own buttons, tap and long press on the bar stay as
 * they were.
 *
 * <p>The bar's buttons live in its menu, a {@link LinearLayout} that every one of Telegram's
 * loops over checks each child's class before using it, so a view of ours among them is passed
 * over. The selection bar Telegram shows over it while chats are picked is a subclass of that
 * menu, which is how the two are told apart.
 */
public final class GhostButton {
    private GhostButton() {}

    static final String FAMILY = FamilyNames.DISABLE_ANALYTICS;
    static final String SHOWN = "ghost button added to the chat list";
    static final String NO_MENU = "ghost button found no menu on the chat list";
    static final String SWITCHED = "Ghost mode switched from the chat list";
    /** Telegram's own width for a top bar button. */
    private static final int WIDTH_DP = 48;
    private static final int ICON_DP = 24;
    /** Drawn when no button of Telegram's has a color to copy: a gray that shows on light and dark bars. */
    static final int FALLBACK_COLOR = 0xFF8E8E93;

    /**
     * Called with the chat list's top bar, right after Telegram makes its logo the bar's title
     * ({@link app.hushtelegram.extension.telegram.settings.SettingsEntry#watchChatListTitle}).
     * Telegram can fill the bar's menu after that, so the button goes in once the chat list's view
     * is built.
     */
    public static void attach(@Nullable View bar) {
        if (!(bar instanceof ViewGroup)) return;
        try {
            // Without Ghost mode in this build there's nothing for the button to switch.
            if (!PatchFamily.Capability.GHOST_MODE.installed()) return;
            bar.post(() -> place((ViewGroup) bar));
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "ghost button", failure);
        }
    }

    /** Puts the button first among the bar's buttons, once per bar. */
    static void place(ViewGroup bar) {
        try {
            LinearLayout menu = menu(bar);
            if (menu == null) {
                HookStatus.counted(FAMILY, NO_MENU);
                return;
            }
            if (find(menu) != null) return;
            Context context = menu.getContext();
            int at = firstButton(menu);
            View next = at < menu.getChildCount() ? menu.getChildAt(at) : null;
            int width = next != null && next.getLayoutParams() != null && next.getLayoutParams().width > 0
                    ? next.getLayoutParams().width : dp(context, WIDTH_DP);
            menu.addView(new Ghost(context, menu), at, new LinearLayout.LayoutParams(width, ViewGroup.LayoutParams.MATCH_PARENT));
            HookStatus.counted(FAMILY, SHOWN);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "ghost button", failure);
        }
    }

    /**
     * The bar's menu: its one child whose class extends {@link LinearLayout} itself. The selection
     * bar extends the menu's class, one step further down, so it isn't taken.
     */
    @Nullable
    static LinearLayout menu(ViewGroup bar) {
        LinearLayout found = null;
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (!(child instanceof LinearLayout) || child.getClass().getSuperclass() != LinearLayout.class) continue;
            if (found != null) return null;
            found = (LinearLayout) child;
        }
        return found;
    }

    /** The ghost already in [menu], if it has one. */
    @Nullable
    static Ghost find(ViewGroup menu) {
        for (int i = 0; i < menu.getChildCount(); i++) {
            if (menu.getChildAt(i) instanceof Ghost) return (Ghost) menu.getChildAt(i);
        }
        return null;
    }

    /** Where the buttons start: after the search field, which Telegram puts first and stretches over the rest. */
    static int firstButton(LinearLayout menu) {
        int at = 0;
        while (at < menu.getChildCount() && stretches(menu.getChildAt(at))) at++;
        return at;
    }

    private static boolean stretches(View child) {
        ViewGroup.LayoutParams params = child.getLayoutParams();
        return params instanceof LinearLayout.LayoutParams && ((LinearLayout.LayoutParams) params).weight > 0;
    }

    /** The bar's search field is open: the menu's stretching child is showing. */
    static boolean searching(ViewGroup menu) {
        for (int i = 0; i < menu.getChildCount(); i++) {
            View child = menu.getChildAt(i);
            if (stretches(child) && child.getVisibility() == View.VISIBLE) return true;
        }
        return false;
    }

    /** The color Telegram gives its own top bar icons, from the first of them that has one. */
    @Nullable
    static ColorFilter iconColor(ViewGroup menu, View self) {
        for (int i = 0; i < menu.getChildCount(); i++) {
            View child = menu.getChildAt(i);
            if (child == self) continue;
            ColorFilter found = tint(child);
            if (found != null) return found;
        }
        return null;
    }

    @Nullable
    private static ColorFilter tint(View view) {
        if (view instanceof ImageView) {
            ImageView image = (ImageView) view;
            if (image.getColorFilter() != null) return image.getColorFilter();
            Drawable drawable = image.getDrawable();
            return drawable != null ? drawable.getColorFilter() : null;
        }
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            ColorFilter found = tint(group.getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }

    static boolean on() {
        try {
            return Utils.settingsReady() && Settings.GHOST_BUTTON.get();
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "ghost button switch read", failure);
            return false;
        }
    }

    static boolean ghostMode() {
        try {
            return Utils.settingsReady() && Settings.GHOST_MODE.get();
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "ghost mode read", failure);
            return false;
        }
    }

    /** A tap on the ghost, as if the user had: answers whether Ghost mode is now on. */
    static boolean tap() {
        boolean now = !ghostMode();
        if (!Settings.GHOST_MODE.save(now)) {
            Utils.showToastShort(L10n.t("Couldn't save that. It's back to the saved value. Try again."));
            return !now;
        }
        HookStatus.counted(FAMILY, SWITCHED);
        Utils.showToastShort(now ? L10n.t("Ghost mode on") : L10n.t("Ghost mode off"));
        return now;
    }

    private static int dp(Context context, float value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    /** The ghost: three feet below a round head, two eyes, drawn on a 24 by 24 grid. */
    static Path body() {
        Path path = new Path();
        path.moveTo(5f, 20f);
        path.lineTo(5f, 10f);
        path.arcTo(new RectF(5f, 3f, 19f, 17f), 180f, 180f, false);
        path.lineTo(19f, 20f);
        path.quadTo(16.67f, 23f, 14.33f, 20f);
        path.quadTo(12f, 23f, 9.67f, 20f);
        path.quadTo(7.33f, 23f, 5f, 20f);
        path.close();
        return path;
    }

    private static void eyes(Path path) {
        path.addCircle(9.5f, 10.5f, 1.5f, Path.Direction.CW);
        path.addCircle(14.5f, 10.5f, 1.5f, Path.Direction.CW);
    }

    static final class Ghost extends View {
        private final LinearLayout menu;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        /** Filled, with the eyes cut out of it. */
        private final Path solid = body();
        private final Path outline = body();
        private final Path eyes = new Path();
        private final ViewTreeObserver.OnPreDrawListener follow = this::follow;
        private boolean ghostMode;
        @Nullable private ColorFilter color;

        Ghost(Context context, LinearLayout menu) {
            super(context);
            this.menu = menu;
            eyes(solid);
            solid.setFillType(Path.FillType.EVEN_ODD);
            eyes(eyes);
            paint.setStrokeJoin(Paint.Join.ROUND);
            setBackground(new RippleDrawable(ColorStateList.valueOf(0x26808080), null, null));
            setContentDescription(L10n.t(context, "Ghost mode"));
            setOnClickListener(clicked -> {
                try {
                    tap();
                    refresh();
                } catch (Throwable failure) {
                    HookStatus.threw(FAMILY, "ghost button tap", failure);
                }
            });
            ghostMode = ghostMode();
            color = iconColor(menu, this);
            setVisibility(shown() ? VISIBLE : GONE);
        }

        boolean ghostMode() {
            return ghostMode;
        }

        @Nullable
        ColorFilter color() {
            return color;
        }

        @Override
        protected void onAttachedToWindow() {
            super.onAttachedToWindow();
            getViewTreeObserver().addOnPreDrawListener(follow);
        }

        @Override
        protected void onDetachedFromWindow() {
            getViewTreeObserver().removeOnPreDrawListener(follow);
            super.onDetachedFromWindow();
        }

        private boolean shown() {
            return on() && !searching(menu);
        }

        /**
         * Before each frame: hide or show with the switch and the bar's search, and follow Ghost
         * mode and the bar's colors. A change of size skips this frame so the next is laid out.
         */
        boolean follow() {
            try {
                int shown = shown() ? VISIBLE : GONE;
                boolean resized = getVisibility() != shown;
                if (resized) setVisibility(shown);
                refresh();
                return !resized;
            } catch (Throwable failure) {
                HookStatus.threw(FAMILY, "ghost button follow", failure);
                return true;
            }
        }

        void refresh() {
            boolean now = GhostButton.ghostMode();
            ColorFilter tint = iconColor(menu, this);
            if (now == ghostMode && tint == color) return;
            ghostMode = now;
            color = tint;
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            float size = dp(getContext(), ICON_DP);
            int saved = canvas.save();
            canvas.translate((getWidth() - size) / 2f, (getHeight() - size) / 2f);
            canvas.scale(size / 24f, size / 24f);
            // Telegram tints white icons with its color, so a white ghost under the same filter matches them.
            paint.setColor(color != null ? 0xFFFFFFFF : FALLBACK_COLOR);
            paint.setColorFilter(color);
            if (ghostMode) {
                paint.setStyle(Paint.Style.FILL);
                canvas.drawPath(solid, paint);
            } else {
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(1.7f);
                canvas.drawPath(outline, paint);
                paint.setStyle(Paint.Style.FILL);
                canvas.drawPath(eyes, paint);
            }
            canvas.restoreToCount(saved);
        }

        @Override
        public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
            super.onInitializeAccessibilityNodeInfo(info);
            info.setClassName(ToggleButton.class.getName());
            info.setCheckable(true);
            info.setChecked(ghostMode);
        }
    }
}
