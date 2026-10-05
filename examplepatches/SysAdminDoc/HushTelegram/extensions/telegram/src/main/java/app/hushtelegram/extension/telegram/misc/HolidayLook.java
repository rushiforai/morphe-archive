/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.text.Spanned;
import android.text.style.ImageSpan;
import android.view.View;

import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Telegram's New Year look on any day. Telegram's holiday check loads the Santa hat for the chat
 * list title only on Dec 31 and Jan 1, and lets snow start by itself only on Jan 1, over the chat
 * list's top bar and, with animated chat backgrounds on, over chat backgrounds. The check runs
 * whenever the top bar draws its title, so the hook at its start asks here on every frame and the
 * counts below move only when the answer changes. The logo bridge uses only the ImageSpan created
 * for the chat list title. Other titles keep Telegram's plain-text drawing path.
 */
public final class HolidayLook {
    /** Telegram's own check runs. */
    public static final int STOCK = 0;
    /** The hat loads if it hasn't, and snow may start. Telegram's date check is skipped. */
    public static final int SHOW = 1;
    /** Once after SHOW: the hat and Telegram's last check are cleared, so its own dates apply at once. */
    public static final int RESTORE = 2;

    private static boolean shown;
    private static final WeakHashMap<ImageSpan, Boolean> logoSpans = new WeakHashMap<>();

    private HolidayLook() {}

    /** Telegram's holiday check, before its date test: one of {@link #STOCK}, {@link #SHOW}, {@link #RESTORE}. */
    public static int mode() {
        HookStatus.invoked(FamilyNames.HOLIDAY_LOOK);
        if (enabled()) {
            if (!shown) {
                shown = true;
                HookStatus.counted(FamilyNames.HOLIDAY_LOOK, "holiday look shown");
            }
            return SHOW;
        }
        if (!shown) return STOCK;
        shown = false;
        HookStatus.counted(FamilyNames.HOLIDAY_LOOK, "holiday look restored");
        return RESTORE;
    }

    /** Called only at the verified chat list logo's ImageSpan constructor. Never changes the span. */
    public static void registerLogoSpan(ImageSpan span) {
        if (span == null) return;
        synchronized (logoSpans) { logoSpans.put(span, Boolean.TRUE); }
    }

    /** A whole-title, bottom-aligned logo registered by the chat list, with the switch active. */
    public static boolean isLogoTitle(CharSequence title) {
        return enabled() && logoSpan(title) != null;
    }

    /** Filled by the patch with the title's getters and Telegram's original offsets/alpha math. */
    public static void drawLogoHat(Canvas canvas, View title, Drawable hat, View scaleView) {}

    public static void drawLogoHatAt(Canvas canvas, CharSequence title, Drawable hat, int startX,
                                     int startY, int textHeight, int offsetX, int offsetY,
                                     int scaleOffsetY, int alpha) {
        if (!enabled() || canvas == null || hat == null) return;
        try {
            ImageSpan span = logoSpan(title);
            if (span == null) return;
            Rect logo = span.getDrawable().getBounds();
            int width = hat.getIntrinsicWidth();
            int height = hat.getIntrinsicHeight();
            if (logo.isEmpty() || width <= 0 || height <= 0 || textHeight <= 0) return;
            // DynamicDrawableSpan.ALIGN_BOTTOM places the drawable at lineBottom - bounds.bottom.
            // Its nonzero top/left remain part of the visible logo. No AppName text is measured.
            int left = startX + logo.left + offsetX + (logo.width() - width - offsetX) / 2;
            int bottom = startY + textHeight - logo.bottom + logo.top + offsetY + scaleOffsetY;
            hat.setBounds(left, bottom - height, left + width, bottom);
            hat.setAlpha(Math.max(0, Math.min(255, alpha)));
            ColorFilter originalFilter = hat.getColorFilter();
            try {
                // Telegram's white seasonal asset needs the logo's color on a light toolbar.
                hat.setColorFilter(span.getDrawable().getColorFilter());
                hat.draw(canvas);
            } finally {
                hat.setColorFilter(originalFilter);
            }
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HOLIDAY_LOOK, "logo hat drawing", t);
        }
    }

    private static ImageSpan logoSpan(CharSequence title) {
        if (!(title instanceof Spanned) || title.length() == 0) return null;
        Spanned text = (Spanned) title;
        ImageSpan[] spans = text.getSpans(0, text.length(), ImageSpan.class);
        if (spans.length != 1) return null;
        ImageSpan span = spans[0];
        if (span.getVerticalAlignment() != ImageSpan.ALIGN_BOTTOM || text.getSpanStart(span) != 0
                || text.getSpanEnd(span) != text.length() || span.getDrawable() == null) return null;
        synchronized (logoSpans) { return logoSpans.containsKey(span) ? span : null; }
    }

    private static boolean enabled() {
        try {
            return Utils.settingsReady() && Settings.HOLIDAY_LOOK.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HOLIDAY_LOOK, "switch read", t);
            return false;
        }
    }
}
