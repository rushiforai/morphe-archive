/*
 * Copyright (C) 2026 lavinhoque33
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-23
 * Written by lavinhoque33, 2026-10-28
 *
 * Segmented button layout adapted from Morphe's ReturnYouTubeDislikeButtons:
 * Copyright 2026 Morphe, https://github.com/MorpheApp/morphe-patches/pull/3075
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.extension.youtube.returnyoutubedislike;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.utils.ThemeUtils;

/** Keeps the native like icon, divider and dislike icon, adding text beside the dislike icon. */
public final class DislikePill {
    private static final float ICON_WIDTH = pixels(16);
    private static final float DIVIDER_WIDTH = pixels(1);
    private static final float BEFORE_DIVIDER_MIN_WIDTH = pixels(2);
    private static final float BEFORE_DIVIDER_MAX_WIDTH = pixels(100);
    private static final float COUNT_MARGIN = pixels(14);
    private static final float COUNT_CENTER_OFFSET = pixels(20);
    private static final Paint countPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private static final int ACCESSIBILITY_TAG_ID =
            ResourceUtils.getIdIdentifier("elements_accessibility_view_tag_id");
    private static final ThreadLocal<float[]> previousWidths = ThreadLocal.withInitial(() -> new float[2]);
    private static final Map<View, CountDrawable> counts = new WeakHashMap<>();
    @Nullable
    private static volatile Object watchSession;
    private static volatile String dislikeText = "";
    private static volatile int textColor;

    static {
        countPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        countPaint.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 12,
                Utils.getContext().getResources().getDisplayMetrics()));
    }

    private DislikePill() {
    }

    /** Replaced only after both native layout and host hooks have been resolved. */
    public static boolean isAvailable() {
        return false;
    }

    public static boolean isEnabled() {
        return isAvailable() && Settings.RYD_ENABLED.get() && Settings.RYD_MORPHE_DISLIKE_PILL.get();
    }

    public static synchronized void setWatchSession(@Nullable Object session) {
        dislikeText = "";
        watchSession = session;
        Utils.runOnMainThreadNowOrLater(DislikePill::removeObsoleteCounts);
    }

    public static synchronized void update(@NonNull Object session, @NonNull CharSequence text, int color) {
        if (watchSession != session || (TextUtils.equals(dislikeText, text) && textColor == color)) {
            return;
        }

        dislikeText = text.toString();
        textColor = color;
        Utils.runOnMainThreadNowOrLater(DislikePill::invalidateCounts);
    }

    private static void removeObsoleteCounts() {
        Object session = watchSession;
        var iterator = counts.entrySet().iterator();
        while (iterator.hasNext()) {
            var entry = iterator.next();
            View host = entry.getKey();
            CountDrawable drawable = entry.getValue();
            if (host == null || drawable.session != session) {
                iterator.remove();
                if (host != null) {
                    drawable.removeFrom(host);
                }
            }
        }
    }

    private static void invalidateCounts() {
        for (CountDrawable drawable : counts.values()) {
            drawable.invalidateSelf();
        }
    }

    private static float pixels(float dp) {
        return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dp,
                Utils.getContext().getResources().getDisplayMetrics());
    }

    /** Called by a generated bridge around the app's native width setter. No app-class stubs are needed. */
    public static float getMargin(float width) {
        if (!isEnabled() || watchSession == null) {
            return 0;
        }

        float[] previous = previousWidths.get();
        boolean afterDivider = previous[0] > BEFORE_DIVIDER_MIN_WIDTH && previous[0] < BEFORE_DIVIDER_MAX_WIDTH
                && Math.abs(previous[1] - DIVIDER_WIDTH) < 1;
        previous[0] = previous[1];
        previous[1] = width;

        if (!afterDivider || Math.abs(width - ICON_WIDTH) >= 1) {
            return 0;
        }

        // Reserve room before the count arrives so the label stays aligned as it is published.
        String text = dislikeText;
        if (text.isEmpty()) {
            text = Settings.RYD_DISLIKE_PERCENTAGE.get() ? "88.8%" : "8.8M";
        }
        return COUNT_MARGIN + (float) Math.ceil(countPaint.measureText(text));
    }

    /** Returns a native Yoga edge, or -1 when no margin should be applied. Keep float comparisons in Java. */
    public static int getMarginEdge(float margin) {
        return margin > 0 ? (Utils.isRightToLeftLocale() ? 0 : 2) : -1;
    }

    /** Called as Litho binds or clears a host's accessibility attributes. */
    public static void onContentDescription(@NonNull View host, @Nullable CharSequence description) {
        Object session = watchSession;
        if (session == null || !isEnabled() || description == null) {
            return;
        }

        CountDrawable existing = counts.get(host);
        if (!isDislikeHost(host)) {
            if (existing != null) {
                counts.remove(host);
                existing.removeFrom(host);
            }
            return;
        }
        if (existing != null && existing.session == session && existing.getCallback() != null) {
            return;
        }
        if (existing != null) {
            existing.removeFrom(host);
        }

        // Litho can update or briefly clear descriptions on the same button during a rebind.
        // Do not tear down a visible count and leave it absent until a posted reattach.
        CountDrawable drawable = new CountDrawable(host, session);
        counts.put(host, drawable);
        host.getOverlay().add(drawable);
        host.addOnLayoutChangeListener(drawable);
    }

    private static boolean isDislikeHost(View host) {
        Object tag = ACCESSIBILITY_TAG_ID == 0 ? null : host.getTag(ACCESSIBILITY_TAG_ID);
        return tag != null && tag.toString().startsWith("id.video.dislike");
    }

    private static final class CountDrawable extends Drawable implements View.OnLayoutChangeListener {
        private final WeakReference<View> hostReference;
        private final Object session;
        private final Paint paint = new Paint(countPaint);
        private final Paint.FontMetrics fontMetrics = new Paint.FontMetrics();

        CountDrawable(View host, Object session) {
            hostReference = new WeakReference<>(host);
            this.session = session;
            paint.setTextAlign(Paint.Align.CENTER);
            setBounds(0, 0, host.getWidth(), host.getHeight());
        }

        @Override
        public void draw(@NonNull Canvas canvas) {
            View host = hostReference.get();
            String text = dislikeText;
            // A recycled host must not draw the count over another action, even if Litho
            // has not called the description setter yet. Square icon-only buttons use a separate path.
            if (host == null || watchSession != session || !isEnabled() || text.isEmpty()
                    || host.getWidth() <= host.getHeight() || !isDislikeHost(host)) {
                return;
            }

            paint.setColor(textColor == 0 ? ThemeUtils.getAppForegroundColor() : textColor);
            float center = (host.getWidth()
                    + (Utils.isRightToLeftLocale() ? -COUNT_CENTER_OFFSET : COUNT_CENTER_OFFSET)) / 2f;
            paint.getFontMetrics(fontMetrics);
            canvas.drawText(text, center, (host.getHeight() - fontMetrics.bottom - fontMetrics.top) / 2f, paint);
        }

        void removeFrom(View host) {
            host.getOverlay().remove(this);
            host.removeOnLayoutChangeListener(this);
        }

        @Override
        public void onLayoutChange(View view, int left, int top, int right, int bottom,
                                   int oldLeft, int oldTop, int oldRight, int oldBottom) {
            setBounds(0, 0, right - left, bottom - top);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(@Nullable ColorFilter filter) {
            paint.setColorFilter(filter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
