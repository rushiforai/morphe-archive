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
import android.graphics.drawable.RippleDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.LinearLayout;

import androidx.annotation.Nullable;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * A double check on the chat list's top bar that sends the read receipts Ghost mode kept back
 * (#69): one tap lets out the newest read of every chat the account on screen has read since
 * Telegram started. It sits right after the Ghost mode button, drawn in the bar's icon color, and
 * shows while its switch, Ghost mode and No read receipts are all on. Like the ghost, it steps
 * aside while the bar's search is open and while HushTelegram is paused.
 */
public final class ReadsButton {
    private ReadsButton() {}

    static final String FAMILY = FamilyNames.DISABLE_ANALYTICS;
    static final String SHOWN = "read receipts button added to the chat list";

    /** Called with the chat list's top bar right after {@link GhostButton#attach}, whose ghost it follows. */
    public static void attach(@Nullable View bar) {
        if (!(bar instanceof ViewGroup)) return;
        try {
            if (!PatchFamily.Capability.GHOST_MODE.installed()) return;
            bar.post(() -> place((ViewGroup) bar));
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "read receipts button", failure);
        }
    }

    /** Puts the checks right after the ghost, or first among the bar's buttons without one, once per bar. */
    static void place(ViewGroup bar) {
        try {
            LinearLayout menu = GhostButton.menu(bar);
            if (menu == null || find(menu) != null) return;
            Context context = menu.getContext();
            View ghost = GhostButton.find(menu);
            int at = ghost != null ? menu.indexOfChild(ghost) + 1 : GhostButton.firstButton(menu);
            View like = at < menu.getChildCount() ? menu.getChildAt(at) : ghost;
            int width = like != null && like.getLayoutParams() != null && like.getLayoutParams().width > 0
                    ? like.getLayoutParams().width : GhostButton.dp(context, GhostButton.WIDTH_DP);
            menu.addView(new Checks(context, menu), at, new LinearLayout.LayoutParams(width, ViewGroup.LayoutParams.MATCH_PARENT));
            HookStatus.counted(FAMILY, SHOWN);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "read receipts button", failure);
        }
    }

    /** The checks already in [menu], if it has them. */
    @Nullable
    static Checks find(ViewGroup menu) {
        for (int i = 0; i < menu.getChildCount(); i++) {
            if (menu.getChildAt(i) instanceof Checks) return (Checks) menu.getChildAt(i);
        }
        return null;
    }

    /** Its switch, Ghost mode and No read receipts are all on. */
    static boolean on() {
        try {
            return Utils.settingsReady() && Settings.GHOST_READS_BUTTON.get() && Settings.GHOST_MODE.get()
                    && Settings.GHOST_READS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "read receipts button switch read", failure);
            return false;
        }
    }

    /** A tap on the checks: sends the held reads and says how it went. */
    static void tap() {
        say(GhostMode.sendHeld());
    }

    /** Says how a send of held reads went: [sent] is how many went, or -1 when they couldn't. */
    static void say(int sent) {
        Utils.showToastShort(sent < 0 ? L10n.t("Couldn't send read receipts")
                : sent == 0 ? L10n.t("No read receipts waiting") : L10n.t("Read receipts sent"));
    }

    /** Two checks, the second a step to the right of the first, drawn on a 24 by 24 grid. */
    static Path checks() {
        Path path = new Path();
        path.moveTo(1.5f, 12.5f);
        path.lineTo(6f, 17f);
        path.lineTo(15f, 7.5f);
        path.moveTo(11f, 16f);
        path.lineTo(12f, 17f);
        path.lineTo(21.5f, 7.5f);
        return path;
    }

    static final class Checks extends View {
        private final LinearLayout menu;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path checks = checks();
        private final ViewTreeObserver.OnPreDrawListener follow = this::follow;
        @Nullable private ColorFilter color;

        Checks(Context context, LinearLayout menu) {
            super(context);
            this.menu = menu;
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(2f);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            setBackground(new RippleDrawable(ColorStateList.valueOf(0x26808080), null, null));
            setContentDescription(L10n.t(context, "Send read receipts"));
            setOnClickListener(clicked -> {
                try {
                    tap();
                } catch (Throwable failure) {
                    HookStatus.threw(FAMILY, "read receipts button tap", failure);
                }
            });
            color = GhostButton.iconColor(menu, this);
            setVisibility(shown() ? VISIBLE : GONE);
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
            return on() && !GhostButton.searching(menu);
        }

        /** Before each frame, as the ghost does: show with the switches, hide for search, follow the bar's color. */
        boolean follow() {
            try {
                int shown = shown() ? VISIBLE : GONE;
                boolean resized = getVisibility() != shown;
                if (resized) setVisibility(shown);
                ColorFilter tint = GhostButton.iconColor(menu, this);
                if (tint != color) {
                    color = tint;
                    invalidate();
                }
                return !resized;
            } catch (Throwable failure) {
                HookStatus.threw(FAMILY, "read receipts button follow", failure);
                return true;
            }
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            float size = GhostButton.dp(getContext(), GhostButton.ICON_DP);
            int saved = canvas.save();
            canvas.translate((getWidth() - size) / 2f, (getHeight() - size) / 2f);
            canvas.scale(size / 24f, size / 24f);
            paint.setColor(color != null ? 0xFFFFFFFF : GhostButton.FALLBACK_COLOR);
            paint.setColorFilter(color);
            canvas.drawPath(checks, paint);
            canvas.restoreToCount(saved);
        }

        @Override
        public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
            super.onInitializeAccessibilityNodeInfo(info);
            info.setClassName(Button.class.getName());
        }
    }
}
