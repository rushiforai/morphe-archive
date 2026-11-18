/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushpinterest.extension.pinterest.actions.PinFacts;
import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.ResourceType;
import app.hushpinterest.extension.shared.ResourceUtils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BooleanSetting;

/**
 * The arrow under an opened pin that folds its related pins. While folded the related list answers
 * that it has nothing more to load, so no request goes out. Opening it asks the same list to load
 * the way the page itself would, and folding clears it again.
 */
public final class RelatedPinsFold {
    private RelatedPinsFold() {}

    static final String ARROW_TAG = "hushpinterest_related_pins_arrow";

    /** The pin page's column of sections, upright and sideways. */
    private static final String COLUMN = "pin_closeup_view";
    private static final String LANDSCAPE_COLUMN = "landscape_closeup_non_media_modules_container";

    private static final int REMEMBERED_PAGES = 32;
    private static final int ARROW_HEIGHT_DP = 48;
    private static final int ICON_DP = 24;
    private static final int TURN_MILLIS = 200;
    private static final int RIPPLE = 0x33808080;
    private static final int LIGHT_ICON = 0xFFE9E9E9;
    private static final int DARK_ICON = 0xFF333333;

    /** The last choice, kept apart so reading a switch never loads it. Backups leave it out. */
    private static final class Choice {
        static final BooleanSetting EXPANDED =
                new BooleanSetting("hushpinterest_related_pins_expanded", Boolean.FALSE, false, false);
    }

    /** The presenter of each recently opened pin page, by pin id. */
    private static final Map<String, WeakReference<Object>> PRESENTERS =
            new LinkedHashMap<String, WeakReference<Object>>(16, 0.75f, true) {
                @Override protected boolean removeEldestEntry(Map.Entry<String, WeakReference<Object>> eldest) {
                    return size() > REMEMBERED_PAGES;
                }
            };

    /** Whether each page's list was last left open. It outlives the page's views. */
    private static final Map<Object, Boolean> OPEN = new WeakHashMap<>();

    /** No arrow was made yet, so a switch that's off has nothing to take away. */
    private static volatile boolean everShown;

    static BooleanSetting choice() {
        return Choice.EXPANDED;
    }

    /** The feature's own switch, which only counts in a build that carries the patch. */
    static boolean switchedOn() {
        return PatchFamily.FOLD_RELATED_PINS.inBuild()
                && UiHooks.enabled(FamilyNames.FOLD_RELATED_PINS, Settings.FOLD_RELATED_PINS);
    }

    /** Hide related pins wins, since there's no grid left to fold. */
    private static boolean active() {
        return switchedOn() && !Settings.HIDE_RELATED_PINS.get();
    }

    /** True while related pins must not load. Pinterest's list asks this first. Never throws. */
    public static boolean folded() {
        try {
            return active() && !Choice.EXPANDED.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FOLD_RELATED_PINS, "related pins fold check", failure);
            return false;
        }
    }

    /** A pin page's presenter is setting up its sections. Remembers it for the arrow. Never throws. */
    public static void bind(Object presenter) {
        try {
            if (presenter == null || !active()) return;
            String pin = pinUid(presenter);
            if (pin == null) return;
            boolean open = Choice.EXPANDED.get();
            synchronized (PRESENTERS) {
                PRESENTERS.put(pin, new WeakReference<>(presenter));
                if (!OPEN.containsKey(presenter)) OPEN.put(presenter, open);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FOLD_RELATED_PINS, "related pins presenter", failure);
        }
    }

    /**
     * A section of the pin page took its pin. Its answer passes through untouched, and once the
     * section is in place the arrow is added or moved back under the last one. Never throws.
     */
    public static int module(View module, int shown) {
        try {
            if (module == null || (!everShown && !active())) return shown;
            module.post(() -> settle(module));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FOLD_RELATED_PINS, "related pins section", failure);
        }
        return shown;
    }

    private static void settle(View module) {
        try {
            LinearLayout column = column(module);
            if (column == null) return;
            Arrow arrow = arrow(column);
            if (!active()) {
                if (arrow != null) column.removeView(arrow);
                return;
            }
            Object pin = pinOf(module);
            String id = pin == null ? null : PinFacts.id(pin);
            Object presenter = id == null ? null : presenter(id);
            if (presenter == null) {
                if (arrow != null && id != null && !id.equals(arrow.pin)) column.removeView(arrow);
                return;
            }
            if (arrow == null) {
                arrow = new Arrow(column.getContext());
                column.addView(arrow, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, dp(column.getContext(), ARROW_HEIGHT_DP)));
                everShown = true;
            } else if (column.getChildAt(column.getChildCount() - 1) != arrow) {
                ViewGroup.LayoutParams params = arrow.getLayoutParams();
                column.removeView(arrow);
                column.addView(arrow, params);
            }
            arrow.show(id, presenter, iconColor(column));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FOLD_RELATED_PINS, "related pins arrow", failure);
        }
    }

    @Nullable
    private static LinearLayout column(View module) {
        Context context = module.getContext();
        int upright = ResourceUtils.getIdentifier(context, ResourceType.ID, COLUMN);
        int sideways = ResourceUtils.getIdentifier(context, ResourceType.ID, LANDSCAPE_COLUMN);
        for (ViewParent at = module.getParent(); at instanceof View; at = at.getParent()) {
            int id = ((View) at).getId();
            if (id > 0 && (id == upright || id == sideways)) return at instanceof LinearLayout ? (LinearLayout) at : null;
        }
        return null;
    }

    @Nullable
    private static Arrow arrow(ViewGroup column) {
        for (int i = column.getChildCount() - 1; i >= 0; i--) {
            View child = column.getChildAt(i);
            if (child instanceof Arrow) return (Arrow) child;
        }
        return null;
    }

    @Nullable
    private static Object presenter(String pin) {
        synchronized (PRESENTERS) {
            WeakReference<Object> known = PRESENTERS.get(pin);
            return known == null ? null : known.get();
        }
    }

    @Nullable
    private static String pinUid(Object presenter) throws IllegalAccessException {
        for (Class<?> at = presenter.getClass(); at != null && at != Object.class; at = at.getSuperclass()) {
            for (Field field : at.getDeclaredFields()) {
                if (!"pinUid".equals(field.getName()) || field.getType() != String.class) continue;
                field.setAccessible(true);
                return (String) field.get(presenter);
            }
        }
        return null;
    }

    private static Object pinOf(View module) throws ReflectiveOperationException {
        return call(module, "getPin");
    }

    private static Object call(Object target, String name) throws ReflectiveOperationException {
        Method method = target.getClass().getMethod(name);
        method.setAccessible(true);
        return method.invoke(target);
    }

    /** The color of the page's own text, so the arrow matches whichever theme is showing. */
    private static int iconColor(ViewGroup column) {
        TextView text = firstText(column);
        if (text != null) return text.getCurrentTextColor();
        int night = column.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return night == Configuration.UI_MODE_NIGHT_YES ? LIGHT_ICON : DARK_ICON;
    }

    @Nullable
    private static TextView firstText(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof TextView) return (TextView) child;
            if (child instanceof ViewGroup) {
                TextView found = firstText((ViewGroup) child);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics()));
    }

    /** Points down while folded and turns to point up once the pins are open. */
    private static final class Arrow extends ImageView {
        private final Chevron chevron;
        @Nullable String pin;
        private WeakReference<Object> presenter = new WeakReference<>(null);
        private boolean drawn;

        Arrow(Context context) {
            super(context);
            setTag(ARROW_TAG);
            setScaleType(ScaleType.CENTER);
            chevron = new Chevron(dp(context, ICON_DP), dp(context, 2));
            setImageDrawable(chevron);
            setBackground(new RippleDrawable(ColorStateList.valueOf(RIPPLE), null, null));
            setOnClickListener(view -> toggle());
            addOnAttachStateChangeListener(new OnAttachStateChangeListener() {
                @Override public void onViewAttachedToWindow(View view) {
                    if (drawn) follow(false);
                }

                @Override public void onViewDetachedFromWindow(View view) {}
            });
        }

        void show(String id, Object owner, int color) {
            pin = id;
            presenter = new WeakReference<>(owner);
            chevron.color(color);
            follow(false);
            drawn = true;
        }

        private void toggle() {
            try {
                Choice.EXPANDED.save(!Choice.EXPANDED.get());
                follow(true);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.FOLD_RELATED_PINS, "related pins arrow", failure);
            }
        }

        /** Brings this page in line with the saved choice, which another pin may have changed. */
        private void follow(boolean animate) {
            try {
                if (!active()) return;
                boolean wanted = Choice.EXPANDED.get();
                face(wanted, animate);
                Object owner = presenter.get();
                if (owner == null) return;
                Boolean open;
                synchronized (PRESENTERS) {
                    open = OPEN.get(owner);
                }
                if (open == null || open == wanted) return;
                call(call(owner, "getRelatedPinsPagedList"), wanted ? "loadData" : "clear");
                synchronized (PRESENTERS) {
                    OPEN.put(owner, wanted);
                }
                HookStatus.counted(FamilyNames.FOLD_RELATED_PINS, wanted ? "related pins opened" : "related pins folded");
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.FOLD_RELATED_PINS, "related pins arrow", failure);
            }
        }

        private void face(boolean expanded, boolean animate) {
            float turn = expanded ? 180f : 0f;
            animate().cancel();
            if (animate) animate().rotation(turn).setDuration(TURN_MILLIS);
            else setRotation(turn);
            setContentDescription(L10n.t(expanded ? "Hide related pins" : "Show related pins"));
        }
    }

    /** A plain downward chevron, drawn here so it needs nothing from Pinterest's resources. */
    private static final class Chevron extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final int size;

        Chevron(int size, int stroke) {
            this.size = size;
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setStrokeWidth(stroke);
        }

        void color(int color) {
            if (paint.getColor() == color) return;
            paint.setColor(color);
            invalidateSelf();
        }

        @Override protected void onBoundsChange(Rect bounds) {
            float width = bounds.width();
            float height = bounds.height();
            path.reset();
            path.moveTo(bounds.left + width * 0.22f, bounds.top + height * 0.38f);
            path.lineTo(bounds.left + width * 0.5f, bounds.top + height * 0.64f);
            path.lineTo(bounds.left + width * 0.78f, bounds.top + height * 0.38f);
        }

        @Override public void draw(Canvas canvas) {
            canvas.drawPath(path, paint);
        }

        @Override public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override public void setColorFilter(@Nullable ColorFilter filter) {
            paint.setColorFilter(filter);
            invalidateSelf();
        }

        @Override public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }

        @Override public int getIntrinsicWidth() {
            return size;
        }

        @Override public int getIntrinsicHeight() {
            return size;
        }
    }
}
