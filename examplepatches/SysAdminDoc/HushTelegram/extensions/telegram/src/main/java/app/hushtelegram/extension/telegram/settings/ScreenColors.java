/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
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
import android.view.Gravity;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import android.widget.Switch;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import app.hushtelegram.extension.shared.settings.preference.ImmediateAction;
import app.hushtelegram.extension.shared.ui.ShimmerTitle;

/**
 * The colours of the HushTelegram screen, its rows and its dialogs: a black page with dark Material
 * rows, whatever the host activity's theme is. Every pair meets WCAG 2.2 AA, which ScreenColorsTest
 * works out.
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
    /** Section titles. */
    final int heading;
    /** A switch that's on, and the buttons of a dialog. */
    final int accent;
    /** A switch that's off. */
    final int switchOff;
    /** Grouped preference rows and their edge. */
    final int card;
    final int outline;
    /** Text on the filled primary dialog action. */
    final int onAccent;
    /** Low-emphasis fill behind navigation glyphs. */
    final int iconTile;
    final int fieldBorder;
    final int selection;
    final int error;
    final int ripple;
    static final int CARD_RADIUS = 12;
    /** How far a card sits in from the screen's sides. */
    static final int CARD_INSET = 12;
    /** A row icon's tile, and the column it sits in with the gap before the text. */
    static final int ICON_SIZE = 36;
    static final int ICON_COLUMN = 48;
    static final int BUTTON_RADIUS = 12;
    static final int FIELD_RADIUS = 12;
    static final int ICON_RADIUS = 12;
    static final int DISABLED_TEXT = 0xFF8296A8;

    /** The one palette the screen is drawn in. */
    static final ScreenColors DEFAULT = new ScreenColors();

    /** The framework theme rows and dialogs are built with, so what this class doesn't paint still reads. */
    static final int THEME = android.R.style.Theme_Material_NoActionBar;

    private ScreenColors() {
        background = Color.BLACK;
        dialog = 0xFF0A111C;
        title = 0xFFEEF6FC;
        summary = 0xFFA5B7C7;
        heading = 0xFF2AABEE;
        accent = 0xFF2AABEE;
        switchOff = 0xFF60758A;
        card = 0xFF0A111C;
        outline = 0xFF223044;
        onAccent = 0xFF03141F;
        iconTile = 0xFF082230;
        fieldBorder = 0xFF607C92;
        selection = 0xFF17344A;
        error = 0xFFFFB4A8;
        ripple = 0x332AABEE;
    }

    /**
     * The white thumb of an off switch reads against its muted track. On switches use dark ink
     * against Telegram blue, so the thumb's position stays distinct in both states.
     */
    int offThumb() {
        return Color.WHITE;
    }

    /**
     * Disabled explanations stay readable while the unavailable control and its status explain why.
     */
    static ColorStateList dimmedWhenDisabled(int color) {
        return new ColorStateList(new int[][]{{-android.R.attr.state_enabled}, {}}, new int[]{DISABLED_TEXT, color});
    }

    /**
     * The text of a dialog's outlined actions, such as Cancel, uses the same Telegram blue as headings.
     */
    int secondaryActionText() {
        return heading;
    }

    /** A row's title and summary, its switch if it has one, and its chevron if a tap opens something. */
    void paintRow(View row, Preference preference) {
        TextView title = row.findViewById(android.R.id.title);
        if (title != null) {
            title.setTextColor(dimmedWhenDisabled(this.title));
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
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
            summary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            summary.setLineSpacing(dp(row, 1), 1);
        }
        View widget = row.findViewById(android.R.id.switch_widget);
        if (widget instanceof Switch) {
            int[][] states = {{-android.R.attr.state_enabled, android.R.attr.state_checked},
                    {-android.R.attr.state_enabled}, {android.R.attr.state_checked}, {}};
            Switch toggle = (Switch) widget;
            GradientDrawable thumb = new GradientDrawable();
            thumb.setCornerRadius(dp(row, 10));
            thumb.setSize(dp(row, 20), dp(row, 20));
            thumb.setColor(Color.WHITE);
            GradientDrawable track = new GradientDrawable() {
                @Override public boolean getPadding(android.graphics.Rect padding) {
                    int inset = dp(row, 3);
                    padding.set(inset, inset, inset, inset);
                    return true;
                }
            };
            track.setCornerRadius(dp(row, 13));
            track.setSize(dp(row, 46), dp(row, 26));
            track.setColor(Color.WHITE);
            // Switch stretches its thumb to the track height. Keep a circular 20dp glyph
            // inside that 26dp box, with the track's end padding leaving a visible rim.
            toggle.setThumbDrawable(new InsetDrawable(thumb, 0, dp(row, 3), 0, dp(row, 3)));
            toggle.setTrackDrawable(track);
            toggle.setSwitchMinWidth(dp(row, 46));
            toggle.setThumbTintList(new ColorStateList(states, new int[]{half(onAccent), half(offThumb()), onAccent, offThumb()}));
            toggle.setTrackTintList(new ColorStateList(states, new int[]{half(accent), half(switchOff), accent, switchOff}));
        }
        paintChevron(row, preference);
        ImageView icon = row.findViewById(android.R.id.icon);
        if (icon != null && preference.getIcon() != null) {
            ViewGroup.LayoutParams imageSize = icon.getLayoutParams();
            // Replace the platform's icon padding and margins, including Samsung's large-text
            // template, with one consistent tile and a full-size glyph.
            icon.setColorFilter(heading);
            icon.setBackground(rounded(iconTile, dp(row, ICON_RADIUS)));
            icon.setPadding(dp(row, 7), dp(row, 7), dp(row, 7), dp(row, 7));
            imageSize.width = dp(row, ICON_SIZE);
            imageSize.height = dp(row, ICON_SIZE);
            icon.setLayoutParams(imageSize);
            if (icon.getParent() instanceof ViewGroup) {
                ViewGroup frame = (ViewGroup) icon.getParent();
                frame.setPaddingRelative(0, 0, dp(row, ICON_COLUMN - ICON_SIZE), 0);
                ViewGroup.LayoutParams size = frame.getLayoutParams();
                size.width = dp(row, ICON_COLUMN);
                if (!(preference instanceof android.preference.SwitchPreference)
                        && size instanceof LinearLayout.LayoutParams) {
                    ((LinearLayout.LayoutParams) size).gravity = Gravity.TOP;
                }
                frame.setLayoutParams(size);
                // A nested Samsung frame must not move its glyph past its clipping parent.
                View line = frame;
                while (line.getParent() instanceof View && line.getParent() != row) line = (View) line.getParent();
                if (line.getParent() == row) {
                    startMargin(frame, 0);
                    startMargin(line, 0);
                }
            }
        }
        PreferenceGroup parent = preference.getParent();
        boolean grouped = parent instanceof PreferenceCategory;
        boolean first = !grouped || parent.getPreference(0) == preference;
        boolean last = !grouped || parent.getPreference(parent.getPreferenceCount() - 1) == preference;
        paintSurface(row, preference, first, last);
    }

    /** Group boundaries follow the visible rows, including a filtered search result. */
    void paintSurface(View row, Preference preference, boolean first, boolean last) {
        paintSurface(row, preference, first, last, false, false);
    }

    void paintSurface(View row, Preference preference, boolean first, boolean last,
                      boolean emphasized, boolean transparent) {
        // The status and restart rows stay cards in either look, as panels apart from the rows.
        if (plainRows() && !emphasized) {
            paintPlain(row, preference, last);
            return;
        }
        float radius = dp(row, CARD_RADIUS);
        float[] corners = {
                first ? radius : 0, first ? radius : 0,
                first ? radius : 0, first ? radius : 0,
                last ? radius : 0, last ? radius : 0,
                last ? radius : 0, last ? radius : 0};
        GradientDrawable surface = new GradientDrawable();
        surface.setColor(transparent ? Color.TRANSPARENT : card);
        surface.setStroke(transparent ? 0 : dp(row, 1), emphasized ? heading : outline);
        surface.setCornerRadii(corners);
        // 4 dp above a group and below it, so two cards in a row sit 8 dp apart.
        int top = first ? dp(row, 4) : -dp(row, 1);
        int bottom = last ? dp(row, 4) : 0;
        // Outside touch mode the list marks the row a keyboard is on as selected. Its selector
        // draws under this opaque surface, so the row shows the ring itself.
        GradientDrawable ring = new GradientDrawable();
        ring.setColor(android.graphics.Color.TRANSPARENT);
        ring.setStroke(dp(row, 2), accent);
        ring.setCornerRadii(corners);
        android.graphics.drawable.StateListDrawable keyboard = new android.graphics.drawable.StateListDrawable();
        int inset = dp(row, CARD_INSET);
        keyboard.addState(new int[]{android.R.attr.state_focused},
                new InsetDrawable(ring, inset, top, inset, bottom));
        keyboard.addState(new int[]{android.R.attr.state_selected},
                new InsetDrawable(ring, inset, top, inset, bottom));
        android.graphics.drawable.LayerDrawable layers = new android.graphics.drawable.LayerDrawable(new Drawable[]{
                new InsetDrawable(surface, inset, top, inset, bottom), keyboard});
        // Stacked, so the ring isn't inset a second time by the surface's padding.
        layers.setPaddingMode(android.graphics.drawable.LayerDrawable.PADDING_MODE_STACK);
        row.setBackground(preference.isSelectable()
                ? new RippleDrawable(ColorStateList.valueOf(ripple), layers, null) : layers);
        // Explicit padding after the inset background prevents its padding from moving the text.
        int vertical = preference.getSummary() == null ? 8 : 10;
        // A card keeps its text clear of the card's edge, even among plain rows.
        int side = dp(row, CARD_INSET + 14);
        row.setPaddingRelative(side, dp(row, vertical + (first ? 4 : 0)),
                side, dp(row, vertical + (last ? 4 : 0)));
        row.setMinimumHeight(dp(row, 52));
    }

    /**
     * Whether the pages draw plain rows with a thin line between them instead of cards (#18). It's
     * read each time a row is drawn, so the next draw follows a change. The recovery page, drawn
     * when settings can't be read, gets the cards.
     */
    static boolean plainRows() {
        return app.hushtelegram.extension.shared.Utils.settingsReady() && SettingsNavigation.PLAIN_ROWS.get();
    }

    /** How far a row's text sits in from the screen's sides: inside the card, or from the edge in the plain look. */
    int rowSide(View row) {
        return dp(row, plainRows() ? 16 : CARD_INSET + 14);
    }

    /**
     * A row in the plain look: the page's black behind it and a thin line under it, from where its
     * text starts to the screen's end, unless it ends its group. It keeps the keyboard ring, the
     * ripple and a 48 dp target.
     */
    private void paintPlain(View row, Preference preference, boolean last) {
        int side = rowSide(row);
        // A row with an icon has its text past the icon's column, and the line starts there too.
        Drawable line = last ? new ColorDrawable(Color.TRANSPARENT)
                : new Divider(outline, dp(row, 1), side + (preference.getIcon() != null ? dp(row, ICON_COLUMN) : 0));
        GradientDrawable ring = new GradientDrawable();
        ring.setColor(Color.TRANSPARENT);
        ring.setStroke(dp(row, 2), accent);
        StateListDrawable keyboard = new StateListDrawable();
        keyboard.addState(new int[]{android.R.attr.state_focused}, new InsetDrawable(ring, dp(row, 2)));
        keyboard.addState(new int[]{android.R.attr.state_selected}, new InsetDrawable(ring, dp(row, 2)));
        android.graphics.drawable.LayerDrawable layers =
                new android.graphics.drawable.LayerDrawable(new Drawable[]{line, keyboard});
        layers.setPaddingMode(android.graphics.drawable.LayerDrawable.PADDING_MODE_STACK);
        // Nothing here is opaque, so the ripple gets the whole row as its mask.
        row.setBackground(preference.isSelectable()
                ? new RippleDrawable(ColorStateList.valueOf(ripple), layers, new ColorDrawable(Color.WHITE)) : layers);
        int vertical = preference.getSummary() == null ? 8 : 10;
        row.setPaddingRelative(side, dp(row, vertical), side, dp(row, vertical));
        row.setMinimumHeight(dp(row, 48));
    }

    /** The plain look's line along a row's bottom edge, starting a given distance in from the side the row reads from. */
    static final class Divider extends Drawable {
        final int color;
        final int start;
        private final int thickness;
        private final Paint paint = new Paint();

        Divider(int color, int thickness, int start) {
            this.color = color;
            this.thickness = thickness;
            this.start = start;
            paint.setColor(color);
        }

        /** Left, top, right and bottom of the line inside the bounds. */
        Rect line() {
            Rect bounds = getBounds();
            boolean rtl = getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
            return new Rect(rtl ? bounds.left : bounds.left + start, bounds.bottom - thickness,
                    rtl ? bounds.right - start : bounds.right, bounds.bottom);
        }

        @Override
        public void draw(Canvas canvas) {
            canvas.drawRect(line(), paint);
        }

        @Override
        public boolean onLayoutDirectionChanged(int layoutDirection) {
            invalidateSelf();
            return true;
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

    /** A section title: muted in the cards, in the accent colour in the plain look, where nothing else marks a group. */
    void paintHeading(View row) {
        boolean plain = plainRows();
        TextView title = row.findViewById(android.R.id.title);
        if (title != null) {
            title.setTextColor(plain ? heading : summary);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            title.setLetterSpacing(0.06f);
            title.setAllCaps(true);
        }
        int side = dp(row, plain ? 20 : 22);
        row.setPaddingRelative(side, dp(row, plain ? 14 : 10), side, dp(row, plain ? 4 : 6));
    }

    static GradientDrawable rounded(int color, float radius) {
        GradientDrawable surface = new GradientDrawable();
        surface.setColor(color);
        surface.setCornerRadius(radius);
        return surface;
    }

    /** Stateful controls retain a visible outline with a keyboard, D-pad or mouse. */
    RippleDrawable control(View view, int fill, int radius, boolean bordered) {
        int focus = fill == accent ? onAccent : accent;
        StateListDrawable states = new StateListDrawable();
        for (int state : new int[]{android.R.attr.state_focused, android.R.attr.state_selected, android.R.attr.state_hovered}) {
            GradientDrawable active = rounded(fill, dp(view, radius));
            active.setStroke(dp(view, 2), focus);
            states.addState(new int[]{state}, active);
        }
        GradientDrawable resting = rounded(fill, dp(view, radius));
        if (bordered) resting.setStroke(dp(view, 1), outline);
        states.addState(new int[]{}, resting);
        return new RippleDrawable(ColorStateList.valueOf(fill == accent ? half(onAccent) : ripple),
                states, rounded(Color.WHITE, dp(view, radius)));
    }

    /**
     * The switch shares a line with the title, leaving the explanation the full width below.
     * Framework SwitchPreference still binds and persists the real switch using its usual ids.
     * Owning this small layout also keeps Samsung's large-font preference template from changing
     * the available text width or placing its switch over a description.
     */
    static View switchRow(Context context) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setLayoutParams(new android.widget.AbsListView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        LinearLayout header = new LinearLayout(context);
        header.setGravity(Gravity.CENTER_VERTICAL);
        FrameLayout iconFrame = new FrameLayout(context);
        ImageView icon = new ImageView(context);
        icon.setId(android.R.id.icon);
        icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        iconFrame.addView(icon, new FrameLayout.LayoutParams(dp(row, ICON_SIZE), dp(row, ICON_SIZE)));
        header.addView(iconFrame);
        TextView title = new TextView(context);
        title.setId(android.R.id.title);
        header.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        LinearLayout widget = new LinearLayout(context);
        widget.setId(android.R.id.widget_frame);
        widget.setGravity(Gravity.CENTER_VERTICAL);
        widget.setPaddingRelative(dp(row, 12), 0, 0, 0);
        Switch toggle = new Switch(context);
        toggle.setId(android.R.id.switch_widget);
        toggle.setFocusable(false);
        toggle.setClickable(false);
        toggle.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        widget.addView(toggle);
        header.addView(widget);
        row.addView(header);
        RelativeLayout detail = new RelativeLayout(context);
        detail.setPadding(0, dp(row, 4), 0, 0);
        TextView summary = new TextView(context);
        summary.setId(android.R.id.summary);
        detail.addView(summary, new RelativeLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        row.addView(detail);
        return row;
    }

    /** Marks the chevron a row was given, so a recycled row's can be found and taken off. */
    static final String CHEVRON = "hushtelegram_chevron";

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
     * A chevron drawn in code, since Telegram's APK has no resource for one. It points the way
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
        row.setBackground(new InsetDrawable(control(row, primary ? accent : background, BUTTON_RADIUS, !primary),
                dp(row, 16), dp(row, 4), dp(row, 16), dp(row, 4)));
        row.setMinimumHeight(dp(row, 56));
        row.setPadding(dp(row, 32), dp(row, 8), dp(row, 32), dp(row, 8));
    }

    static void recoveryMessage(View row) {
        ScreenColors palette = DEFAULT;
        HushTelegramPreferenceFragment.showAllText(row);
        TextView title = row.findViewById(android.R.id.title);
        TextView summary = row.findViewById(android.R.id.summary);
        // Centred across the row: text wrapped to its own width has nothing to centre in.
        if (title != null) {
            fillWidth(title);
            title.setGravity(android.view.Gravity.CENTER);
            title.setTextSize(22);
            // The gradient follows the lines as laid out, so they're placed by the gravity above.
            title.setTextAlignment(View.TEXT_ALIGNMENT_GRAVITY);
            ShimmerTitle.wear(title);
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
        row.setPadding(dp(row, 32), dp(row, 100), dp(row, 32), dp(row, 56));
    }

    private static void fillWidth(View text) {
        ViewGroup.LayoutParams size = text.getLayoutParams();
        if (size == null) return;
        size.width = ViewGroup.LayoutParams.MATCH_PARENT;
        text.setLayoutParams(size);
    }

    /**
     * A dialog on show: its surface, title, message, buttons and text field. A list's rows keep the
     * theme's colours.
     */
    void paint(@Nullable AlertDialog dialog) {
        if (dialog == null) return;
        Window window = dialog.getWindow();
        if (window != null) {
            GradientDrawable panel = new GradientDrawable();
            panel.setColor(this.dialog);
            panel.setCornerRadius(dp(window.getDecorView(), CARD_RADIUS));
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
            // In Telegram's blues, as every HushTelegram title is.
            ShimmerTitle.wear(title);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
            title.setSingleLine(false);
            title.setMaxLines(Integer.MAX_VALUE);
        }
        // AlertDialog's own message, and the one a preference's dialog layout brings, which is the
        // one on show there: AlertDialog's own sits GONE above it, and findViewById finds that first.
        if (window != null) paintMessages(window.getDecorView());
        android.widget.ListView choices = dialog.getListView();
        if (choices != null && choices.getChoiceMode() == android.widget.ListView.CHOICE_MODE_SINGLE
                && choices.getAdapter() != null && !(choices.getAdapter() instanceof DialogChoices)) {
            int selected = choices.getCheckedItemPosition();
            choices.setAdapter(new DialogChoices(choices.getAdapter(), this));
            if (selected >= 0) choices.setItemChecked(selected, true);
            choices.setDivider(null);
        }
        for (int which : new int[]{AlertDialog.BUTTON_POSITIVE, AlertDialog.BUTTON_NEGATIVE, AlertDialog.BUTTON_NEUTRAL}) {
            Button button = dialog.getButton(which);
            if (button == null) continue;
            boolean primary = which == AlertDialog.BUTTON_POSITIVE;
            RippleDrawable background = control(button, primary ? accent : this.dialog, BUTTON_RADIUS, false);
            // The framework button's own insets: the 48dp touch height keeps a 36dp fill, clear of
            // the dialog's edge like every Material button.
            background.setLayerInsetRelative(0, dp(button, 4), dp(button, 6), dp(button, 4), dp(button, 6));
            button.setBackground(background);
            button.setTextColor(primary ? onAccent : secondaryActionText());
            button.setAllCaps(false);
            button.setSingleLine(false);
            button.setMaxLines(Integer.MAX_VALUE);
            button.setEllipsize(null);
            button.setMinHeight(dp(button, 48));
            button.setPaddingRelative(dp(button, 16), dp(button, 6), dp(button, 16), dp(button, 6));
        }
        // AlertDialog otherwise reserves only one button's height for a stacked action panel.
        // Keep every action outside the form's scroll area, including at the largest font size.
        @SuppressWarnings("DiscouragedApi")
        int actionsId = dialog.getContext().getResources().getIdentifier("buttonPanel", "id", "android");
        View actions = actionsId == 0 ? null : dialog.findViewById(actionsId);
        if (actions != null) {
            int width = window == null ? dialog.getContext().getResources().getDisplayMetrics().widthPixels
                    - dp(actions, 32) : window.getAttributes().width;
            width = Math.max(1, width);
            actions.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
            actions.setMinimumHeight(actions.getMeasuredHeight());
        }
        if (window != null) paintFields(window.getDecorView());
    }

    private void paintFields(View view) {
        if (view instanceof EditText) paintField((EditText) view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) paintFields(group.getChildAt(i));
        }
    }

    /**
     * A dialog's text field. The framework theme draws its underline, cursor and selection in its
     * own teal, so they take the accent the buttons have.
     */
    void paintField(EditText field) {
        field.setHintTextColor(summary);
        boolean invalid = field.getError() != null || EditorForm.INVALID.equals(field.getTag());
        StateListDrawable border = new StateListDrawable();
        GradientDrawable focused = rounded(dialog, dp(field, FIELD_RADIUS));
        focused.setStroke(dp(field, 2), invalid ? error : accent);
        border.addState(new int[]{android.R.attr.state_focused}, focused);
        GradientDrawable resting = rounded(dialog, dp(field, FIELD_RADIUS));
        resting.setStroke(dp(field, 1), invalid ? error : fieldBorder);
        border.addState(new int[]{}, resting);
        field.setBackgroundTintList(null);
        field.setBackground(border);
        field.setMinimumHeight(dp(field, 48));
        field.setPaddingRelative(dp(field, 12), dp(field, 10), dp(field, 12), dp(field, 10));
        field.setTextColor(title);
        paintSelection(field);
    }

    void paintSelection(EditText field) {
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
        if (view instanceof TextView && view.getId() == android.R.id.message) ((TextView) view).setTextColor(summary);
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

    private static void startMargin(View view, int margin) {
        if (view.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams size = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
            size.setMarginStart(margin);
            view.setLayoutParams(size);
        }
    }

    private static int dp(View view, int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                view.getResources().getDisplayMetrics()));
    }

    /** A switch's track: the thumb's colour at half strength, as Material's own switch draws it. */
    static int half(int color) {
        return (color & 0x00FFFFFF) | 0x80000000;
    }
}
