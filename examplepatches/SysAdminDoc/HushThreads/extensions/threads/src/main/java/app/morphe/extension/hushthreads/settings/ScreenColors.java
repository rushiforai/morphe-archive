/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at 837bac40e (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.settings;

import android.app.AlertDialog;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceGroup;
import android.preference.TwoStatePreference;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import app.morphe.extension.shared.settings.preference.ImmediateAction;

/**
 * The colours of the HushThreads screen, its rows and its dialogs: a black page with the neutral
 * grey cards Threads draws its own dark screens in, and the logo's blue for section titles,
 * switches and actions, whatever the host activity's theme is. Every pair meets WCAG 2.2 AA, which
 * ScreenColorsTest works out.
 */
final class ScreenColors {
    /** The page, behind the title bar and every row. */
    final int background;
    /** A dialog's surface. */
    final int dialog;
    /** Row and dialog titles, the title bar and its back arrow. */
    final int title;
    /** Row summaries and a dialog's message. */
    final int summary;
    /** The placeholder of an empty field, quieter than a summary and still 4.5:1 on every surface. */
    final int hint;
    /** Section titles, row icons and the edge of whatever has the focus. */
    final int heading;
    /** A switch that's on, and the filled button of a dialog. */
    final int accent;
    /** A switch that's off. */
    final int switchOff;
    /** Rows, the search box and choice cards, and their edge. */
    final int card;
    final int outline;
    /** Text on the filled primary dialog action. */
    final int onAccent;

    /** The one palette the screen is drawn in. */
    static final ScreenColors DEFAULT = new ScreenColors();

    /** The framework theme rows and dialogs are built with, so what this class doesn't paint still reads. */
    static final int THEME = android.R.style.Theme_Material_NoActionBar;

    /**
     * Corner radii in dp: a small mark inside a control, a button or field, and a dialog or a card
     * that holds others.
     */
    static final int INNER_RADIUS = 4;
    static final int ELEMENT_RADIUS = 8;
    static final int CONTAINER_RADIUS = 12;

    private ScreenColors() {
        // WCAG 2.2 ratios on the black page, its card and the dialog, measured 2026-11-05.
        background = Color.BLACK;
        // Threads' own dark surfaces: the card one step off black, the dialog one above it.
        card = 0xFF181818;
        dialog = 0xFF262626;
        // 19.21 on the page, 16.25 on the card, 13.85 on the dialog.
        title = 0xFFF3F5F7;
        // 8.83, 7.47, 6.36.
        summary = 0xFFA8A8A8;
        // 5.42 on the card, 4.62 on the dialog.
        hint = 0xFF8E8E8E;
        // 8.58 on the page, 7.26 on the card, 6.19 on the dialog.
        heading = 0xFF6AA7FF;
        // 3.66 on the card, 3.12 on the dialog; white reads on it at 4.85.
        accent = 0xFF236BE7;
        // 5.32 on the card, 4.53 on the dialog; the white thumb reads on it at 3.34.
        switchOff = 0xFF858D9C;
        // 1.31 on the card: an edge, not a control's boundary. A focused row's outline is the
        // heading, 7.26.
        outline = 0xFF2E2E2E;
        onAccent = Color.WHITE;
    }

    /**
     * The thumb of a switch that's off, read against its track: the white that fills the on thumb
     * clears the 3:1 a control's state needs there.
     */
    int offThumb() {
        return onAccent;
    }

    /**
     * [color], at Material's 38% on a disabled row. A plain colour replaced the theme's own
     * disabled state, so a row that ignored taps, such as Import while an export runs, looked
     * the same as one that would take them.
     */
    static ColorStateList dimmedWhenDisabled(int color) {
        int dimmed = (color & 0x00FFFFFF) | 0x61000000;
        return new ColorStateList(new int[][]{{-android.R.attr.state_enabled}, {}}, new int[]{dimmed, color});
    }

    /**
     * The text of a dialog's outlined actions, such as Cancel. The accent reads at 3.1:1 on the
     * dialog, under the 4.5:1 text needs, so these take the heading colour.
     */
    int secondaryActionText() {
        return heading;
    }

    /** A row's title and summary, its switch if it has one, and its chevron if a tap opens something. */
    void paintRow(View row, Preference preference) {
        TextView title = row.findViewById(android.R.id.title);
        if (title != null) {
            title.setTextColor(dimmedWhenDisabled(this.title));
            title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            if (title.getParent() instanceof View) {
                View text = (View) title.getParent();
                text.setPadding(0, 0, 0, 0);
                text.setMinimumHeight(0);
            }
        }
        TextView summary = row.findViewById(android.R.id.summary);
        if (summary != null) {
            summary.setTextColor(dimmedWhenDisabled(this.summary));
            summary.setLineSpacing(0, 1);
        }
        View widget = row.findViewById(android.R.id.switch_widget);
        if (widget instanceof Switch) {
            int[][] states = {{-android.R.attr.state_enabled, android.R.attr.state_checked},
                    {-android.R.attr.state_enabled}, {android.R.attr.state_checked}, {}};
            Switch toggle = (Switch) widget;
            GradientDrawable thumb = new GradientDrawable();
            thumb.setShape(GradientDrawable.RECTANGLE);
            thumb.setCornerRadius(dp(row, INNER_RADIUS));
            thumb.setSize(dp(row, 20), dp(row, 20));
            thumb.setColor(Color.WHITE);
            GradientDrawable track = new GradientDrawable();
            track.setCornerRadius(dp(row, 6));
            track.setSize(dp(row, 40), dp(row, 24));
            track.setColor(Color.WHITE);
            toggle.setThumbDrawable(thumb);
            toggle.setTrackDrawable(track);
            toggle.setSwitchMinWidth(dp(row, 40));
            toggle.setSplitTrack(false);
            toggle.setThumbTintList(new ColorStateList(states, new int[]{half(onAccent), half(offThumb()), onAccent, offThumb()}));
            toggle.setTrackTintList(new ColorStateList(states, new int[]{half(accent), half(switchOff), accent, switchOff}));
            // Long titles use the whole column, with the switch beside the description.
            ViewGroup frame = row.findViewById(android.R.id.widget_frame);
            if (title != null && summary != null && title.getParent() instanceof android.widget.RelativeLayout
                    && frame != null && frame.getParent() != title.getParent()) {
                android.widget.RelativeLayout column = (android.widget.RelativeLayout) title.getParent();
                ((ViewGroup) frame.getParent()).removeView(frame);
                android.widget.RelativeLayout.LayoutParams place = new android.widget.RelativeLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                place.addRule(android.widget.RelativeLayout.ALIGN_PARENT_END);
                place.addRule(android.widget.RelativeLayout.BELOW, android.R.id.title);
                place.topMargin = dp(row, 4);
                column.addView(frame, place);
                android.widget.RelativeLayout.LayoutParams description =
                        (android.widget.RelativeLayout.LayoutParams) summary.getLayoutParams();
                description.setMarginEnd(dp(row, 52));
                summary.setLayoutParams(description);
            }
        }
        paintChevron(row, preference);
        ImageView icon = row.findViewById(android.R.id.icon);
        // Decoration: the row's title already says what it is, so a screen reader skips the icon.
        if (icon != null) icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        if (icon != null && preference.getIcon() != null) {
            ViewGroup.LayoutParams imageSize = icon.getLayoutParams();
            imageSize.width = dp(row, 24);
            imageSize.height = dp(row, 24);
            icon.setLayoutParams(imageSize);
            icon.setPadding(0, 0, 0, 0);
            icon.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            icon.setBackground(null);
            icon.setImageTintList(dimmedWhenDisabled(heading));
            if (icon.getParent() instanceof ViewGroup) {
                ViewGroup frame = (ViewGroup) icon.getParent();
                frame.setPaddingRelative(0, 0, dp(row, 14), 0);
                frame.setMinimumWidth(0);
                ViewGroup.LayoutParams size = frame.getLayoutParams();
                size.width = dp(row, 38);
                frame.setLayoutParams(size);
            }
        }
        paintSurface(row, preference);
    }

    /**
     * The card a row stands on, first or last of its section's card as the preference model has
     * it. A page that hides some of a section's rows paints them again with the rows it shows.
     */
    void paintSurface(View row, Preference preference) {
        PreferenceGroup parent = preference.getParent();
        boolean grouped = parent instanceof PreferenceCategory;
        boolean first = !grouped || parent.getPreference(0) == preference;
        boolean last = !grouped || parent.getPreference(parent.getPreferenceCount() - 1) == preference;
        paintSurface(row, preference, first, last);
    }

    /** {@link #paintSurface(View, Preference, boolean, boolean, boolean)} for a row a section doesn't hold, on the page itself. */
    void paintSurface(View row, Preference preference, boolean first, boolean last) {
        paintSurface(row, preference, first, last, !(preference.getParent() instanceof PreferenceCategory));
    }

    /**
     * Group boundaries follow the visible rows, including a filtered search result. A row on the
     * page itself ([overview]) runs edge to edge with square corners and its side and top strokes
     * pushed a dp off its bounds, so the page has no hairline down either edge and one between
     * rows. A section's rows share one card, inset 18 dp, rounded at its top and bottom, with
     * 4 dp more room above its first row and below its last. The card's height is the row's: its
     * text wraps at any font size and the row grows to fit.
     */
    void paintSurface(View row, Preference preference, boolean first, boolean last, boolean overview) {
        float radius = overview ? 0 : dp(row, 10);
        GradientDrawable surface = new GradientDrawable();
        surface.setColor(card);
        surface.setStroke(dp(row, 1), preference.isSelectable() ? interactionOutline(outline)
                : ColorStateList.valueOf(outline));
        surface.setCornerRadii(new float[]{
                first ? radius : 0, first ? radius : 0,
                first ? radius : 0, first ? radius : 0,
                last ? radius : 0, last ? radius : 0,
                last ? radius : 0, last ? radius : 0});
        int side = overview ? -dp(row, 1) : dp(row, 18);
        Drawable inset = new InsetDrawable(surface, side, overview ? -dp(row, 1) : first ? dp(row, 4) : -dp(row, 1),
                side, !overview && last ? dp(row, 4) : 0);
        row.setBackground(preference.isSelectable()
                ? new RippleDrawable(interactionRipple(heading), inset, null).mutate() : inset);
        // Explicit padding after the inset background prevents its padding from moving the text.
        // 8 dp above and below; a section's row puts its 2 dp more, and the card's 4 dp of room,
        // on its parts, which stay centred on the card.
        int horizontal = overview ? 20 : 30;
        row.setPaddingRelative(dp(row, horizontal), dp(row, 8), dp(row, horizontal), dp(row, 8));
        int above = overview ? 0 : 2 + (first ? 4 : 0);
        int below = overview ? 0 : 2 + (last ? 4 : 0);
        if (row instanceof LinearLayout && ((LinearLayout) row).getOrientation() == LinearLayout.HORIZONTAL) {
            ViewGroup parts = (ViewGroup) row;
            for (int index = 0; index < parts.getChildCount(); index++) {
                ViewGroup.LayoutParams place = parts.getChildAt(index).getLayoutParams();
                if (!(place instanceof ViewGroup.MarginLayoutParams)) continue;
                ((ViewGroup.MarginLayoutParams) place).topMargin = dp(row, above);
                ((ViewGroup.MarginLayoutParams) place).bottomMargin = dp(row, below);
                parts.getChildAt(index).setLayoutParams(place);
            }
        }
        row.setMinimumHeight(dp(row, overview ? 52 : 64));
        TextView title = row.findViewById(android.R.id.title);
        if (title != null) title.setTextSize(TypedValue.COMPLEX_UNIT_SP, overview ? 15 : 16);
        TextView summary = row.findViewById(android.R.id.summary);
        if (summary != null) summary.setTextSize(TypedValue.COMPLEX_UNIT_SP, overview ? 12 : 13);
    }

    /** Keep keyboard selection visible after replacing a framework background. */
    Drawable controlSurface(View view, int fill, int radius, int border) {
        return controlSurface(view, fill, radius, border, heading);
    }

    private Drawable controlSurface(View view, int fill, int radius, int border, int focus) {
        StateListDrawable states = new StateListDrawable();
        states.addState(new int[]{-android.R.attr.state_enabled}, surface(view, fill, radius, border, 1));
        for (int state : new int[]{android.R.attr.state_focused, android.R.attr.state_selected}) {
            states.addState(new int[]{state}, surface(view, fill, radius, focus, 2));
        }
        states.addState(new int[]{android.R.attr.state_hovered}, surface(view, fill, radius, focus, 1));
        states.addState(new int[]{}, surface(view, fill, radius, border, 1));
        return states;
    }

    private GradientDrawable surface(View view, int fill, int radius, int border, int width) {
        GradientDrawable surface = new GradientDrawable();
        surface.setColor(fill);
        surface.setCornerRadius(dp(view, radius));
        surface.setStroke(dp(view, width), border);
        return surface;
    }

    void paintInlineAction(View action) {
        action.setBackground(new RippleDrawable(ColorStateList.valueOf(half(accent)),
                controlSurface(action, Color.TRANSPARENT, ELEMENT_RADIUS, Color.TRANSPARENT), null));
    }

    /** A section title, in the heading colour, over the cards it names. */
    void paintHeading(View row) {
        TextView title = row.findViewById(android.R.id.title);
        if (title != null) {
            title.setTextColor(heading);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            title.setLetterSpacing(0.055f);
            title.setAllCaps(true);
        }
        row.setPaddingRelative(dp(row, 22), dp(row, 20), dp(row, 22), dp(row, 8));
    }

    /**
     * The restart row, drawn as the button it is: a card on the 18 dp line with 8 dp of page above
     * and below, rounded 12 dp and outlined in the heading colour, at least 56 dp tall. It stays a
     * row of the list, at its top, so it shows on whatever page is open the moment a change waits.
     */
    void paintRestartBar(View row) {
        GradientDrawable surface = new GradientDrawable();
        surface.setColor(card);
        surface.setCornerRadius(dp(row, CONTAINER_RADIUS));
        surface.setStroke(dp(row, 1), interactionOutline(heading, title));
        Drawable inset = new InsetDrawable(surface, dp(row, 18), dp(row, 8), dp(row, 18), dp(row, 8));
        row.setBackground(new RippleDrawable(interactionRipple(heading), inset, null).mutate());
        row.setPaddingRelative(dp(row, 18 + 16), dp(row, 8 + 6), dp(row, 18 + 20), dp(row, 8 + 6));
        row.setMinimumHeight(dp(row, 8 + 56 + 8));
        TextView title = row.findViewById(android.R.id.title);
        if (title != null) title.setTextColor(dimmedWhenDisabled(this.title));
    }

    /** Marks the chevron a row was given, so a recycled row's can be found and taken off. */
    static final String CHEVRON = "hushthreads_chevron";

    /**
     * Whether a tap on [preference] opens something: a dialog, a file picker, the browser. A
     * switch says what a tap does with its switch, and a row that acts the moment it's tapped
     * goes without a chevron, as the shared ImmediateAction asks, so the chevron keeps one meaning.
     */
    static boolean opensSomething(Preference preference) {
        return preference.isSelectable() && !(preference instanceof TwoStatePreference)
                && !(preference instanceof ImmediateAction && ((ImmediateAction) preference).actsOnTap());
    }

    /**
     * The chevron at the end of every row a tap opens something from. Only its title's colour set
     * such a row apart before, which is how "Licenses" and "Version" looked alike (WCAG 1.4.1). It
     * sits in the row's widget frame, where a switch row keeps its switch. Rows are recycled, and
     * one Row class draws plain lines too, so a row that shouldn't have one has it taken off.
     */
    private void paintChevron(View row, Preference preference) {
        View found = row.findViewById(android.R.id.widget_frame);
        if (!(found instanceof ViewGroup)) return;
        ViewGroup frame = (ViewGroup) found;
        View chevron = frame.findViewWithTag(CHEVRON);
        if (!opensSomething(preference)) {
            if (chevron != null) {
                frame.removeView(chevron);
                // Preference hides an empty frame only when it builds the row, which a recycled row
                // skips, and an empty frame still takes its padding's width from the text.
                if (frame.getChildCount() == 0) frame.setVisibility(View.GONE);
            }
            return;
        }
        ImageView image;
        if (chevron instanceof ImageView) {
            image = (ImageView) chevron;
        } else {
            image = new ImageView(row.getContext());
            image.setTag(CHEVRON);
            // The row already tells a screen reader it's a button; the shape adds nothing to hear.
            image.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            frame.addView(image, new LinearLayout.LayoutParams(dp(row, 16), dp(row, 24)));
        }
        Drawable drawn = image.getDrawable();
        if (!(drawn instanceof Chevron) || ((Chevron) drawn).color != summary) {
            image.setImageDrawable(new Chevron(summary, dp(row, 2)));
        }
        image.setEnabled(preference.isEnabled());
        frame.setVisibility(View.VISIBLE);
    }

    /**
     * A chevron drawn in code, since Threads' APK has no resource for one. It points the way
     * the row reads, so it mirrors in a right-to-left layout, and it dims with its row.
     */
    static final class Chevron extends Drawable {
        /** The colour it's drawn in on a row that can be tapped now. */
        final int color;
        private final ColorStateList colors;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();

        Chevron(int color, float stroke) {
            this.color = color;
            colors = dimmedWhenDisabled(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(stroke);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setColor(color);
        }

        /**
         * One arm's end, the tip and the other arm's end, as x and y pairs. The tip is at the end
         * the row reads towards: the right, or the left in a right-to-left layout. Material's own
         * chevron is 4.6 dp wide and 9.2 dp tall in a 24 dp icon, and this keeps that shape.
         */
        float[] points() {
            Rect bounds = getBounds();
            float half = bounds.height() * 0.19f;
            float reach = getLayoutDirection() == View.LAYOUT_DIRECTION_RTL ? -half / 2 : half / 2;
            float x = bounds.exactCenterX();
            float y = bounds.exactCenterY();
            return new float[]{x - reach, y - half, x + reach, y, x - reach, y + half};
        }

        /** The colour it draws in now, which follows its row's state. */
        int currentColor() {
            return paint.getColor();
        }

        @Override
        public void draw(Canvas canvas) {
            float[] at = points();
            path.rewind();
            path.moveTo(at[0], at[1]);
            path.lineTo(at[2], at[3]);
            path.lineTo(at[4], at[5]);
            canvas.drawPath(path, paint);
        }

        @Override
        public boolean isAutoMirrored() {
            return true;
        }

        @Override
        public boolean onLayoutDirectionChanged(int layoutDirection) {
            invalidateSelf();
            return true;
        }

        @Override
        public boolean isStateful() {
            return true;
        }

        @Override
        protected boolean onStateChange(int[] state) {
            int now = colors.getColorForState(state, color);
            if (now == paint.getColor()) return false;
            paint.setColor(now);
            invalidateSelf();
            return true;
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(@Nullable ColorFilter filter) {
            paint.setColorFilter(filter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** Recovery is a choice, not another pair of settings rows. */
    private void paintRecoveryAction(View row, boolean primary) {
        TextView title = row.findViewById(android.R.id.title);
        if (title != null) {
            title.setTextColor(primary ? onAccent : secondaryActionText());
            title.setTypeface(Typeface.DEFAULT_BOLD);
            title.setGravity(android.view.Gravity.CENTER);
            ViewGroup.LayoutParams size = title.getLayoutParams();
            size.width = ViewGroup.LayoutParams.MATCH_PARENT;
            title.setLayoutParams(size);
        }
        GradientDrawable surface = new GradientDrawable();
        surface.setColor(primary ? accent : Color.TRANSPARENT);
        surface.setCornerRadius(dp(row, ELEMENT_RADIUS));
        // The secondary action keeps an edge only while a keyboard is on it.
        surface.setStroke(dp(row, primary ? 1 : 2), primary ? interactionOutline(accent, onAccent)
                : focusStroke(heading, Color.TRANSPARENT));
        row.setBackground(new RippleDrawable(ColorStateList.valueOf(half(primary ? onAccent : accent)),
                new InsetDrawable(surface, dp(row, 20), dp(row, 4), dp(row, 20), dp(row, 4)), null));
        row.setMinimumHeight(dp(row, 56));
        row.setPadding(dp(row, 36), dp(row, 8), dp(row, 36), dp(row, 8));
    }

    static void recoveryMessage(View row) {
        ScreenColors palette = DEFAULT;
        HushThreadsPreferenceFragment.showAllText(row);
        TextView title = row.findViewById(android.R.id.title);
        TextView summary = row.findViewById(android.R.id.summary);
        // Centred across the row: text wrapped to its own width has nothing to centre in.
        if (title != null) {
            fillWidth(title);
            title.setGravity(android.view.Gravity.CENTER);
            title.setTextSize(22);
            ShimmerTitle.wear(title, palette.background);
            title.setTypeface(Typeface.create("sans-serif-medium", 0));
            Drawable icon = SettingsIcons.icon(row.getContext(), SettingsIcons.ABOUT, palette.heading);
            icon.setBounds(0, 0, dp(row, 56), dp(row, 56));
            title.setCompoundDrawablesRelative(null, icon, null, null);
            title.setCompoundDrawablePadding(dp(row, 24));
        }
        if (summary != null) {
            fillWidth(summary);
            summary.setGravity(android.view.Gravity.CENTER);
            summary.setTextColor(palette.summary);
            summary.setTextSize(16);
            summary.setPadding(0, dp(row, 12), 0, 0);
        }
        // A short or landscape screen, or the largest text, leaves Retry and Back in sight.
        int height = row.getResources().getConfiguration().screenHeightDp;
        boolean largeText = row.getResources().getConfiguration().fontScale >= 1.5f;
        int top = largeText ? 32 : Math.max(24, Math.min(100, height / 8));
        int bottom = largeText ? 24 : Math.max(16, Math.min(56, height / 16));
        row.setPadding(dp(row, 32), dp(row, top), dp(row, 32), dp(row, bottom));
    }

    private static void fillWidth(View text) {
        ViewGroup.LayoutParams size = text.getLayoutParams();
        if (size == null) return;
        size.width = ViewGroup.LayoutParams.MATCH_PARENT;
        text.setLayoutParams(size);
    }

    /**
     * A dialog on show: its surface, title, message, list rows, buttons and text field. Every list's
     * rows take the screen's colours through {@link DialogChoices}, with their picks kept.
     */
    void paint(@Nullable AlertDialog dialog) {
        if (dialog == null) return;
        Window window = dialog.getWindow();
        if (window != null) {
            GradientDrawable panel = new GradientDrawable();
            panel.setColor(this.dialog);
            panel.setCornerRadius(dp(window.getDecorView(), CONTAINER_RADIUS));
            panel.setStroke(dp(window.getDecorView(), 1), outline);
            window.setBackgroundDrawable(panel);
            int width = Math.min(dialog.getContext().getResources().getDisplayMetrics().widthPixels
                    - dp(window.getDecorView(), 32), dp(window.getDecorView(), 560));
            window.setLayout(width, ViewGroup.LayoutParams.WRAP_CONTENT);
        }
        @SuppressWarnings("DiscouragedApi")
        int titleId = dialog.getContext().getResources().getIdentifier("alertTitle", "id", "android");
        TextView title = titleId == 0 ? null : dialog.findViewById(titleId);
        if (title != null) {
            ShimmerTitle.wear(title, this.dialog);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
            title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            title.setSingleLine(false);
            title.setMaxLines(Integer.MAX_VALUE);
        }
        // AlertDialog's own message, and the one a preference's dialog layout brings, which is the
        // one on show there: AlertDialog's own sits GONE above it, and findViewById finds that first.
        if (window != null) paintMessages(window.getDecorView());
        android.widget.ListView choices = dialog.getListView();
        if (choices != null && choices.getAdapter() != null && !(choices.getAdapter() instanceof DialogChoices)
                && !(choices.getAdapter() instanceof ChoiceCards)) {
            DialogChoices.swap(choices, new DialogChoices(choices.getAdapter(), this));
            choices.setDivider(null);
        }
        for (int which : new int[]{AlertDialog.BUTTON_POSITIVE, AlertDialog.BUTTON_NEGATIVE, AlertDialog.BUTTON_NEUTRAL}) {
            Button button = dialog.getButton(which);
            if (button == null) continue;
            paintAction(button, which == AlertDialog.BUTTON_POSITIVE);
            // The framework button's own insets: the 48dp touch height keeps a 36dp fill, clear of
            // the dialog's edge like every Material button.
            ((RippleDrawable) button.getBackground()).setLayerInsetRelative(
                    0, dp(button, 4), dp(button, 6), dp(button, 4), dp(button, 6));
        }
        View field = dialog.findViewById(android.R.id.edit);
        if (field instanceof EditText) paintField((EditText) field);
    }

    /**
     * A dialog's button as a card: the primary one filled in the accent, the others on the card
     * colour, each outlined, at least 48 dp tall and 64 wide, wrapping a long word rather than
     * cutting it off.
     */
    private void paintAction(TextView action, boolean primary) {
        GradientDrawable surface = new GradientDrawable();
        surface.setColor(dimmedWhenDisabled(primary ? accent : card));
        surface.setCornerRadius(dp(action, ELEMENT_RADIUS));
        surface.setStroke(dp(action, 2), interactionOutline(primary ? accent : outline,
                primary ? onAccent : heading));
        action.setBackgroundTintList(null);
        // View's tint pass mutates the background after setting its state. Mutate first so
        // that pass can't replace enabled children with fresh, empty-state copies.
        action.setBackground(new RippleDrawable(
                interactionRipple(primary ? onAccent : heading), surface, null).mutate());
        action.setTextColor(dimmedWhenDisabled(primary ? onAccent : secondaryActionText()));
        action.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        action.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        action.setAllCaps(false);
        action.setSingleLine(false);
        action.setMaxLines(Integer.MAX_VALUE);
        action.setEllipsize(null);
        action.setHorizontallyScrolling(false);
        action.setGravity(android.view.Gravity.CENTER);
        action.setTextAlignment(View.TEXT_ALIGNMENT_GRAVITY);
        action.setMinHeight(dp(action, 48));
        action.setMinimumHeight(dp(action, 48));
        action.setMinWidth(dp(action, 64));
        action.setMinimumWidth(dp(action, 64));
        action.setPaddingRelative(dp(action, 16), dp(action, 12), dp(action, 16), dp(action, 12));
    }

    /** A list row's fill: [normal] at rest, the accent at 13% once it's picked. */
    ColorStateList choiceFill(int normal) {
        return new ColorStateList(new int[][]{{android.R.attr.state_checked}, {}},
                new int[]{(accent & 0x00FFFFFF) | 0x22000000, normal});
    }

    /**
     * A dialog's text field. The framework theme draws its underline, cursor and selection in its
     * own teal, so they take the accent the buttons have.
     */
    void paintField(EditText field) {
        field.setHintTextColor(hint);
        GradientDrawable outline = new GradientDrawable();
        outline.setColor(dialog);
        outline.setCornerRadius(dp(field, CONTAINER_RADIUS));
        outline.setStroke(dp(field, 2), interactionOutline(switchOff));
        field.setBackgroundTintList(null);
        field.setBackground(outline);
        field.setPaddingRelative(dp(field, 12), dp(field, 10), dp(field, 12), dp(field, 10));
        field.setTextColor(dimmedWhenDisabled(title));
        field.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        field.setMinHeight(dp(field, 48));
        paintTextEditing(field);
    }

    /** Search and dialog fields use the same selection, cursor and handle colors. */
    void paintTextEditing(EditText field) {
        field.setHighlightColor(half(accent));
        // Android 9 has no way to set the cursor or the handles from code, so they keep the teal.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) paintCursorAndHandles(field);
    }

    @RequiresApi(Build.VERSION_CODES.Q)
    private void paintCursorAndHandles(EditText field) {
        Drawable cursor = field.getTextCursorDrawable();
        if (cursor != null) {
            cursor = cursor.mutate();
            cursor.setTint(accent);
            field.setTextCursorDrawable(cursor);
        }
        Drawable handle = field.getTextSelectHandle();
        if (handle != null) {
            handle = handle.mutate();
            handle.setTint(accent);
            field.setTextSelectHandle(handle);
        }
        Drawable left = field.getTextSelectHandleLeft();
        if (left != null) {
            left = left.mutate();
            left.setTint(accent);
            field.setTextSelectHandleLeft(left);
        }
        Drawable right = field.getTextSelectHandleRight();
        if (right != null) {
            right = right.mutate();
            right.setTint(accent);
            field.setTextSelectHandleRight(right);
        }
    }

    private void paintMessages(View view) {
        if (view instanceof TextView && view.getId() == android.R.id.message) {
            TextView message = (TextView) view;
            message.setTextColor(dimmedWhenDisabled(summary));
            message.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            message.setLineSpacing(dp(view, 2), 1);
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) paintMessages(group.getChildAt(index));
        }
    }

    /** Paints a row in the screen's colours. */
    static void row(View row, Preference preference) {
        DEFAULT.paintRow(row, preference);
    }

    /** Paints a section title in the screen's colours. */
    static void heading(View row) {
        DEFAULT.paintHeading(row);
    }

    /** Paints both recovery actions even if the ordinary settings page failed to initialize. */
    static void recoveryAction(View row, boolean primary) {
        DEFAULT.paintRecoveryAction(row, primary);
    }

    /** Paints a dialog in the screen's colours. */
    static void dialog(@Nullable AlertDialog dialog) {
        DEFAULT.paint(dialog);
    }

    private static int dp(View view, int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                view.getResources().getDisplayMetrics()));
    }

    /** A switch's track: the thumb's colour at half strength, as Material's own switch draws it. */
    static int half(int color) {
        return (color & 0x00FFFFFF) | 0x80000000;
    }

    /**
     * The press ripple of a button drawn straight on the page, with no surface of its own: Material's
     * borderless button, in [color] at half strength and kept inside the button's bounds, a small
     * rounded rectangle for an icon button when [round]. A plain transparent background showed
     * nothing when tapped.
     */
    static void pressFeedback(View button, int color, boolean round) {
        GradientDrawable mask = new GradientDrawable();
        mask.setCornerRadius(dp(button, round ? ELEMENT_RADIUS : INNER_RADIUS));
        mask.setColor(Color.WHITE);
        GradientDrawable focus = new GradientDrawable();
        focus.setCornerRadius(dp(button, round ? ELEMENT_RADIUS : INNER_RADIUS));
        focus.setColor(Color.TRANSPARENT);
        focus.setStroke(dp(button, 2), focusStroke(color, Color.TRANSPARENT));
        button.setBackground(new RippleDrawable(ColorStateList.valueOf(half(color)), focus, mask));
    }

    /** A focused control has an explicit boundary even when no press ripple is running. */
    static ColorStateList focusStroke(int focused, int resting) {
        return new ColorStateList(new int[][]{{android.R.attr.state_enabled, android.R.attr.state_focused},
                {android.R.attr.state_enabled, android.R.attr.state_selected}, {}},
                new int[]{focused, focused, resting});
    }

    /**
     * A row's or a field's edge: [normal] at rest, at 38% when it's disabled, and in the heading
     * colour while a keyboard, a mouse or a list's own selection is on it (focused, hovered,
     * selected, activated or checked), so each of those stays visible.
     */
    ColorStateList interactionOutline(int normal) {
        return interactionOutline(normal, heading);
    }

    private static ColorStateList interactionOutline(int normal, int focused) {
        return new ColorStateList(new int[][]{
                {-android.R.attr.state_enabled}, {android.R.attr.state_focused},
                {android.R.attr.state_hovered}, {android.R.attr.state_selected},
                {android.R.attr.state_activated}, {android.R.attr.state_checked}, {}},
                new int[]{(normal & 0x00FFFFFF) | (Math.round(Color.alpha(normal) * 0.38f) << 24),
                        focused, focused, focused, focused, focused, normal});
    }

    /** A press ripple in [color] at 20%, and none on a disabled control. */
    static ColorStateList interactionRipple(int color) {
        return new ColorStateList(new int[][]{{-android.R.attr.state_enabled}, {}},
                new int[]{Color.TRANSPARENT, (color & 0x00FFFFFF) | 0x33000000});
    }

    /** A quiet outlined action with the same touch target as the dialog buttons. */
    void outlineAction(Button button) {
        GradientDrawable surface = new GradientDrawable();
        surface.setColor(card);
        surface.setCornerRadius(dp(button, ELEMENT_RADIUS));
        surface.setStroke(dp(button, 2), focusStroke(title, heading));
        RippleDrawable background = new RippleDrawable(ColorStateList.valueOf(half(heading)), surface, null);
        background.setLayerInsetRelative(0, 0, dp(button, 6), 0, dp(button, 6));
        button.setBackground(background);
        button.setTextColor(dimmedWhenDisabled(heading));
        button.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        button.setPaddingRelative(dp(button, 14), 0, dp(button, 14), 0);
    }
}
