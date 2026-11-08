/*
 * Copyright (C) 2026 sqzass
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * Additional term under GPLv3 Section 7(b): When conveying this material
 * or modified versions, preserve this notice and credit sqzass for this
 * material in any Appropriate Legal Notices displayed by works containing it.
 */
package app.sqzass.extension.proton;

import java.util.Arrays;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableWrapper;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.StateListDrawable;
import android.util.StateSet;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.Gravity;
import android.widget.Switch;

public final class SwitchStyle {

    private static final String WIDGET_STYLE = "Widget.Material3.CompoundButton.MaterialSwitch";

    private static final String COLORS_STYLE = "ThemeOverlay.Patches.MaterialSwitch";

    private static final int ICON_SIZE_DP = 16;

    private static final int[] CHECKED = { android.R.attr.state_checked };

    private static final int[][] TINT_STATE_SPECS = { { -android.R.attr.state_enabled, -android.R.attr.state_checked },
            { -android.R.attr.state_enabled }, { android.R.attr.state_checked, android.R.attr.state_pressed },
            { android.R.attr.state_checked }, { android.R.attr.state_pressed }, StateSet.WILD_CARD, };

    private static final int[][] TINT_STATE_SAMPLES = { {}, { android.R.attr.state_checked },
            { android.R.attr.state_enabled, android.R.attr.state_checked, android.R.attr.state_pressed },
            { android.R.attr.state_enabled, android.R.attr.state_checked },
            { android.R.attr.state_enabled, android.R.attr.state_pressed }, { android.R.attr.state_enabled }, };
    private static final class MaterialStyle {

        private final Context context;
        private final int widgetStyle;
        private final int primaryColor;
        private final int themePrimaryColor;

        MaterialStyle(Context context, int widgetStyle, int primaryColor, int themePrimaryColor) {
            this.context = context;
            this.widgetStyle = widgetStyle;
            this.primaryColor = primaryColor;
            this.themePrimaryColor = themePrimaryColor;
        }

        static MaterialStyle resolve(Context context, int primaryColor) {
            final int widgetStyle = context.getResources().getIdentifier(WIDGET_STYLE, "style", context.getPackageName());
            if (widgetStyle == 0) {
                return null;
            }
            final int themePrimaryColor = resolveColor(context, android.R.attr.colorPrimary);
            return new MaterialStyle(context, widgetStyle, primaryColor, themePrimaryColor);
        }

        private static int resolveColor(Context context, int attribute) {
            final TypedArray values = context.getTheme().obtainStyledAttributes(new int[] { attribute });
            try {
                return values.getColor(0, 0);
            } finally {
                values.recycle();
            }
        }

        Drawable thumb() {
            final Drawable shape = styleDrawable(attribute("thumb"));
            final Drawable track = styleDrawable(attribute("track"));
            final int inset = thumbInset();
            final LayerDrawable thumb = new LayerDrawable(new Drawable[] { shape, track });
            thumb.setPadding(inset, 0, inset, 0);
            return thumb;
        }

        Drawable track() {
            final Drawable shape = styleDrawable(attribute("track"));
            shape.setTintList(tint("trackTint"));
            final Drawable outline = styleDrawable(attribute("trackDecoration"));
            outline.setTintList(tint("trackDecorationTint"));

            final int inset = thumbInset();
            final LayerDrawable track = new LayerDrawable(new Drawable[] { shape, outline });
            track.setPadding(inset, 0, inset, 0);
            return track;
        }

        int dimension(String name) {
            final TypedArray values = styleValues(attribute(name));
            try {
                return values.getDimensionPixelSize(0, 0);
            } finally {
                values.recycle();
            }
        }

        private int thumbInset() {
            return styleDrawable(android.R.attr.thumb).getIntrinsicWidth()
                    - styleDrawable(attribute("track")).getIntrinsicWidth() / 2;
        }

        private ColorStateList tint(String name) {
            final TypedArray values = styleValues(attribute(name));
            final ColorStateList tint;
            try {
                tint = values.getColorStateList(0);
            } finally {
                values.recycle();
            }
            if (tint == null || this.primaryColor == this.themePrimaryColor) {
                return tint;
            }

            final int[] colors = new int[TINT_STATE_SPECS.length];
            for (int index = 0; index < colors.length; index++) {
                final int color = tint.getColorForState(TINT_STATE_SAMPLES[index], tint.getDefaultColor());
                colors[index] = (color == this.themePrimaryColor) ? this.primaryColor : color;
            }
            return new ColorStateList(TINT_STATE_SPECS, colors);
        }

        private Drawable styleDrawable(int attribute) {
            final TypedArray values = styleValues(attribute);
            try {
                return values.getDrawable(0);
            } finally {
                values.recycle();
            }
        }

        private TypedArray styleValues(int attribute) {
            return this.context.getTheme().obtainStyledAttributes(this.widgetStyle, new int[] { attribute });
        }

        private Drawable drawable(String name) {
            return this.context.getDrawable(identifier(this.context, name, "drawable"));
        }

        private int attribute(String name) {
            return identifier(this.context, name, "attr");
        }

        private static int identifier(Context context, String name, String type) {
            return context.getResources().getIdentifier(name, type, context.getPackageName());
        }

    }

    private static final class WithIconState extends DrawableWrapper {

        private final int stateWithIcon;

        WithIconState(Drawable drawable, int stateWithIcon) {
            super(drawable);
            this.stateWithIcon = stateWithIcon;
        }

        @Override
        protected boolean onStateChange(int[] state) {
            int stateCount = 0;
            while (stateCount < state.length && state[stateCount] != 0) {
                stateCount++;
            }
            final int[] withIconState = Arrays.copyOf(state, stateCount + 1);
            withIconState[stateCount] = this.stateWithIcon;
            return super.onStateChange(withIconState);
        }

    }



    private SwitchStyle() {

    }

    public static void apply(Switch control, int primaryColor) {
        final MaterialStyle style = MaterialStyle.resolve(control.getContext(), primaryColor);
        if (style == null) {
            return;
        }
        control.setSplitTrack(false);
        control.setSwitchPadding(style.dimension("switchPadding"));
        control.setThumbDrawable(style.thumb());
        control.setTrackDrawable(style.track());
        control.refreshDrawableState();
    }

    public static Drawable thumb(Context context, int primaryColor) {
        final MaterialStyle style = MaterialStyle.resolve(context, primaryColor);
        return (style != null) ? style.thumb() : null;
    }

    public static Drawable track(Context context, int primaryColor) {
        final MaterialStyle style = MaterialStyle.resolve(context, primaryColor);
        return (style != null) ? style.track() : null;
    }
}
