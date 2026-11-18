package app.afterglow.extension.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

import app.afterglow.extension.settings.ThemeColors;
import app.afterglow.extension.settings.ThemePalette;
import app.afterglow.extension.settings.ThemeRole;
import app.afterglow.extension.settings.ThemeStore;

/**
 * Builds the row views of the settings screens, styled like the iOS YouTube
 * settings cells Afterglow uses: full-width rows without separators, bold titles
 * (Afterglow rows are bolded, Settings.x:1370-1384), secondary description under
 * the title, detail text on the right, Afterglow-pink switch tint and touch
 * feedback. Colors come from {@link Palette}: YouTube's native colors unless the
 * active theme sets a role, as the iOS ColorMode.x palette does.
 */
final class RowViews {
    /** Afterglow tint (0.95, 0.41, 0.50), Settings.x:229-231: switch on-tint and touch feedback. */
    static final int TINT = Color.rgb(242, 105, 128);

    final Context context;
    final Palette palette;
    private final float density;

    RowViews(Context context, Palette palette) {
        this.context = context;
        this.palette = palette;
        this.density = context.getResources().getDisplayMetrics().density;
    }

    int dp(float value) {
        return Math.round(value * density);
    }

    // ---------------------------------------------------------------- texts

    TextView text(String value, float sp, int color, boolean bold) {
        TextView view = new TextView(context);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        if (bold) view.setTypeface(Typeface.create(Typeface.DEFAULT, Typeface.BOLD));
        app.afterglow.extension.theme.Typography.textView(view, false);
        return view;
    }

    private LinearLayout textColumn(String title, String description, boolean bold) {
        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        if (title != null && !title.isEmpty()) column.addView(text(title, 16, palette.text, bold));
        if (description != null && !description.isEmpty()) {
            TextView desc = text(description, 14, palette.secondaryText, false);
            desc.setPadding(0, dp(2), 0, 0);
            column.addView(desc);
        }
        return column;
    }

    private LinearLayout rowContainer(boolean clickable) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(56));
        row.setPadding(dp(16), dp(10), dp(16), dp(10));
        if (clickable) row.setBackground(touchFeedback());
        return row;
    }

    /** iOS YTTouchFeedbackController feedbackColor = Afterglow pink on Afterglow rows. */
    Drawable touchFeedback() {
        return new RippleDrawable(ColorStateList.valueOf(withAlpha(TINT, 0.24f)), null, new ColorDrawable(Color.WHITE));
    }

    // ---------------------------------------------------------------- rows

    /** Real table-section title (Credits "Credits"). */
    View sectionTitle(String title) {
        TextView view = text(title, 18, palette.text, true);
        view.setPadding(dp(16), dp(24), dp(16), dp(6));
        return view;
    }

    /**
     * The root page's "Afterglow" header: sparkles icon plus the glowing wordmark, the way
     * iOS draws its Afterglow settings entry (owner-requested on the root page; iOS pages
     * themselves show a plain "Afterglow").
     */
    View wordmarkHeader() {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(16), dp(32), dp(16), dp(24));
        row.setClipChildren(false);
        row.setClipToPadding(false);
        ImageView icon = new ImageView(context);
        icon.setImageDrawable(new TabIconDrawable("sparkles", palette.icon, palette.background, dp(24)));
        LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(dp(24), dp(24));
        iconParams.rightMargin = dp(18);
        row.addView(icon, iconParams);
        AfterglowWordmarkView wordmark = new AfterglowWordmarkView(context);
        wordmark.setUnclipDepth(2); // header row and page content; the scroll view clips at its top edge
        // The header row plays the iOS cell; the cards drawn after it cover the glow below.
        wordmark.setGlowRow(1, false);
        wordmark.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        wordmark.setTextColor(palette.text); // "After" keeps it when it is dark (light pages)
        wordmark.setText(AfterglowWordmarkView.DISPLAY_TITLE);
        wordmark.setContentDescription(AfterglowWordmarkView.DISPLAY_TITLE);
        row.addView(wordmark, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return row;
    }

    /** Blank row (iOS itemWithTitle:nil) separating groups. */
    View spacer() {
        View view = new View(context);
        view.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(16)));
        return view;
    }

    /** Disabled title + description row used as a group header (iOS themeSectionHeaderWithTitle). */
    View header(String title, String description) {
        LinearLayout row = rowContainer(false);
        row.addView(textColumn(title, description, true), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        row.setAlpha(0.5f);
        row.setEnabled(false);
        return row;
    }

    /** Description-only row (iOS itemWithTitle:nil titleDescription:...). */
    View caption(String description) {
        TextView view = text(description, 14, palette.secondaryText, false);
        view.setPadding(dp(16), dp(8), dp(16), dp(8));
        return view;
    }

    View switchRow(String title, String description, boolean checked, boolean enabled,
                   CompoundButton.OnCheckedChangeListener listener) {
        LinearLayout row = rowContainer(enabled);
        row.addView(textColumn(title, description, true), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        Switch toggle = new Switch(context);
        toggle.setChecked(checked);
        toggle.setEnabled(enabled);
        tintSwitch(toggle);
        // Listener attached after setChecked so rebuilding the row never writes a value.
        toggle.setOnCheckedChangeListener(listener);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.leftMargin = dp(12);
        row.addView(toggle, params);
        if (enabled) row.setOnClickListener(v -> toggle.toggle());
        else row.setAlpha(0.5f);
        return row;
    }

    /** Row with optional right-side detail text; the detail view is the row's tag. */
    View detailRow(String title, String description, String detail, boolean bold, View.OnClickListener onClick) {
        LinearLayout row = rowContainer(onClick != null);
        row.addView(textColumn(title, description, bold), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        TextView detailView = text(detail == null ? "" : detail, 14, palette.secondaryText, false);
        detailView.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        detailView.setMaxLines(2);
        detailView.setMaxWidth(Math.round(context.getResources().getDisplayMetrics().widthPixels * 0.42f));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.leftMargin = dp(12);
        row.addView(detailView, params);
        if (detail == null || detail.isEmpty()) detailView.setVisibility(View.GONE);
        row.setTag(detailView);
        if (onClick != null) row.setOnClickListener(onClick);
        return row;
    }

    /**
     * Checkmark option row (iOS checkmarkItemWithTitle): picker rows are YouTube's own cells, so
     * they keep the stock title weight and the check uses YouTube's accent (or the theme's).
     */
    View optionRow(String title, boolean checked, View.OnClickListener onClick) {
        LinearLayout row = rowContainer(true);
        row.setMinimumHeight(dp(52));
        row.addView(text(title, 16, palette.text, false), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        TextView check = text(checked ? "✓" : "", 18, palette.accent, true);
        check.setGravity(Gravity.CENTER);
        row.addView(check, new LinearLayout.LayoutParams(dp(28), ViewGroup.LayoutParams.WRAP_CONTENT));
        row.setOnClickListener(onClick);
        return row;
    }

    /** Search result cell (UITableViewCellStyleSubtitle): title, "breadcrumb • description", disclosure chevron. */
    View resultRow(String title, String subtitle, boolean separator, View.OnClickListener onClick) {
        LinearLayout row = rowContainer(false);
        row.setMinimumHeight(dp(52));
        row.setBackground(groupedRowBackground(separator, dp(16)));
        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.addView(text(title, 16, palette.groupedLabel, false));
        if (subtitle != null && !subtitle.isEmpty()) {
            TextView sub = text(subtitle, 13, palette.groupedSecondaryLabel, false);
            sub.setPadding(0, dp(2), 0, 0);
            column.addView(sub);
        }
        row.addView(column, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        ImageView chevron = new ImageView(context);
        chevron.setImageDrawable(new ChevronDrawable(palette.groupedTertiaryLabel, false, dp(14)));
        LinearLayout.LayoutParams chevronParams = new LinearLayout.LayoutParams(dp(14), dp(14));
        chevronParams.leftMargin = dp(8);
        row.addView(chevron, chevronParams);
        row.setOnClickListener(onClick);
        return row;
    }

    /** Non-selectable empty-state cell (title secondaryLabel, subtitle tertiaryLabel). */
    View emptyRow(String title, String subtitle) {
        LinearLayout row = rowContainer(false);
        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.addView(text(title, 16, palette.groupedSecondaryLabel, false));
        TextView sub = text(subtitle, 13, palette.groupedTertiaryLabel, false);
        sub.setPadding(0, dp(2), 0, 0);
        column.addView(sub);
        row.addView(column, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        return row;
    }

    View paragraph(String value) {
        TextView view = text(value, 14, palette.secondaryText, false);
        view.setPadding(dp(16), dp(16), dp(16), dp(16));
        return view;
    }

    private void tintSwitch(Switch toggle) {
        int[][] states = {{android.R.attr.state_checked}, {}};
        toggle.setThumbTintList(new ColorStateList(states, new int[] {TINT, palette.switchThumbOff}));
        toggle.setTrackTintList(new ColorStateList(states, new int[] {withAlpha(TINT, 0.5f), palette.switchTrackOff}));
    }

    // ---------------------------------------------------------------- inset-grouped (UIKit) screens

    /**
     * Search and the tab editor are plain UIKit UITableViewControllers on iOS (style
     * insetGrouped, Settings.x:962, 1129), not YouTube cells: rounded cards on the system
     * grouped background, hairline separators, uppercase section headers, system label colors.
     */
    LinearLayout groupedCard() {
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable background = new GradientDrawable();
        background.setColor(palette.groupedCell);
        background.setCornerRadius(dp(10));
        card.setBackground(background);
        card.setClipToOutline(true);
        return card;
    }

    LinearLayout.LayoutParams groupedCardParams() {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.leftMargin = dp(16);
        params.rightMargin = dp(16);
        return params;
    }

    TextView groupedHeader(String title) {
        TextView header = text(title, 13, palette.groupedSecondaryLabel, false);
        header.setAllCaps(true);
        header.setPadding(dp(32), dp(22), dp(32), dp(7));
        return header;
    }

    TextView groupedFooter(String footer) {
        TextView view = text(footer, 13, palette.groupedSecondaryLabel, false);
        view.setPadding(dp(32), dp(7), dp(32), dp(8));
        return view;
    }

    /** Cell background: touch feedback plus a bottom hairline inset from the leading edge. */
    Drawable groupedRowBackground(boolean separator, int separatorInsetLeft) {
        Drawable ripple = new RippleDrawable(ColorStateList.valueOf(withAlpha(palette.groupedLabel, 0.12f)), null, new ColorDrawable(Color.WHITE));
        if (!separator) return ripple;
        return new LayerDrawable(new Drawable[] {ripple, new SeparatorDrawable(palette.groupedSeparator, separatorInsetLeft, Math.max(1, dp(0.5f)))});
    }

    /** Bottom hairline drawn across the cell from {@code insetLeft}. */
    static final class SeparatorDrawable extends Drawable {
        private final Paint paint = new Paint();
        private final int insetLeft;
        private final int height;

        SeparatorDrawable(int color, int insetLeft, int height) {
            paint.setColor(color);
            this.insetLeft = insetLeft;
            this.height = height;
        }

        @Override
        public void draw(Canvas canvas) {
            canvas.drawRect(getBounds().left + insetLeft, getBounds().bottom - height, getBounds().right, getBounds().bottom, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    static int withAlpha(int color, float alpha) {
        return Color.argb(Math.round(alpha * 255), Color.red(color), Color.green(color), Color.blue(color));
    }

    /**
     * Search-hit flash (Settings.x:839-864): 12 dp corners, 1.5 dp pink border, pink at 16 %
     * opacity faded in over 0.18 s, held 0.85 s, faded out over 0.45 s.
     */
    void flash(View row) {
        if (row == null) return;
        GradientDrawable overlay = new GradientDrawable();
        overlay.setCornerRadius(dp(12));
        overlay.setColor(withAlpha(TINT, 0.16f));
        overlay.setStroke(Math.max(1, Math.round(1.5f * density)), TINT);
        overlay.setAlpha(0);
        row.setForeground(overlay);
        ValueAnimator in = ValueAnimator.ofInt(0, 255).setDuration(180);
        in.addUpdateListener(a -> overlay.setAlpha((Integer) a.getAnimatedValue()));
        ValueAnimator out = ValueAnimator.ofInt(255, 0).setDuration(450);
        out.setStartDelay(850);
        out.addUpdateListener(a -> overlay.setAlpha((Integer) a.getAnimatedValue()));
        out.addListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                row.setForeground(null);
            }
        });
        in.addListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                out.start();
            }
        });
        in.start();
    }

    /** iOS-style chevron: back ("<") for the navigation bar or forward (">") for disclosure. */
    static final class ChevronDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final boolean back;
        private final int size;

        ChevronDrawable(int color, boolean back, int size) {
            this.back = back;
            this.size = size;
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void draw(Canvas canvas) {
            float w = getBounds().width();
            float h = getBounds().height();
            paint.setStrokeWidth(Math.max(2f, Math.min(w, h) * (back ? 0.11f : 0.14f)));
            Path path = new Path();
            float left = getBounds().left;
            float top = getBounds().top;
            if (back) {
                path.moveTo(left + w * 0.62f, top + h * 0.18f);
                path.lineTo(left + w * 0.30f, top + h * 0.50f);
                path.lineTo(left + w * 0.62f, top + h * 0.82f);
            } else {
                path.moveTo(left + w * 0.36f, top + h * 0.20f);
                path.lineTo(left + w * 0.66f, top + h * 0.50f);
                path.lineTo(left + w * 0.36f, top + h * 0.80f);
            }
            canvas.drawPath(path, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * Colors for the settings screens. YouTube's own palette (dark #0F0F0F / light white,
     * text, secondary text, call-to-action blue), overridden role by role by the active
     * Afterglow theme exactly where iOS ColorMode.x overrides YouTube's palette:
     * background, primary/secondary text, icons, accent, the navigation bar (only when the
     * theme sets a navigation surface) and the page gradient.
     */
    static final class Palette {
        final boolean dark;
        final int background;
        final int[] gradient;
        final int text;
        final int secondaryText;
        final int tertiaryText;
        final int icon;
        final int accent;
        final int navBackground;
        final int navForeground;
        final int navTint;
        final Integer navBorder;
        final int switchThumbOff;
        final int switchTrackOff;
        // UIKit system colors for the inset-grouped screens (search, tab editor).
        final int groupedBackground;
        final int groupedCell;
        final int groupedSeparator;
        final int groupedLabel;
        final int groupedSecondaryLabel;
        final int groupedTertiaryLabel;
        final int searchFieldFill;

        private Palette(Configuration configuration) {
            ThemePalette theme = ThemeStore.snapshot().palette;
            int pageStyle = theme.pageStyleOverride();
            dark = pageStyle >= 0 ? pageStyle == 1
                    : app.afterglow.extension.theme.NativeTheme.isDark(configuration);

            Integer themeBackground = theme.color(ThemeRole.BACKGROUND);
            Integer themeText = theme.color(ThemeRole.PRIMARY_TEXT);
            Integer themeSecondary = theme.color(ThemeRole.SECONDARY_TEXT);
            Integer themeIcon = theme.color(ThemeRole.TAB_ICON);
            Integer themeAccent = theme.color(ThemeRole.ACCENT);
            Integer themeNavigation = theme.color(ThemeRole.NAVIGATION_SURFACE);

            background = themeBackground != null ? opaque(themeBackground) : (dark ? Color.parseColor("#0F0F0F") : Color.WHITE);
            text = themeText != null ? themeText : (dark ? Color.parseColor("#F1F1F1") : Color.parseColor("#0F0F0F"));
            secondaryText = themeSecondary != null ? themeSecondary : (dark ? Color.parseColor("#AAAAAA") : Color.parseColor("#606060"));
            tertiaryText = withAlpha(secondaryText, 0.7f);
            icon = themeIcon != null ? themeIcon : text;
            accent = themeAccent != null ? themeAccent : (dark ? Color.parseColor("#3EA6FF") : Color.parseColor("#065FD4"));
            gradient = theme.hasGradient()
                    ? new int[] {theme.color(ThemeRole.GRADIENT_START), theme.color(ThemeRole.GRADIENT_END)} : null;
            switchThumbOff = dark ? Color.parseColor("#9E9E9E") : Color.parseColor("#FAFAFA");
            switchTrackOff = dark ? Color.parseColor("#3F3F3F") : Color.parseColor("#BDBDBD");
            groupedBackground = dark ? Color.BLACK : Color.parseColor("#F2F2F7");
            groupedCell = dark ? Color.parseColor("#1C1C1E") : Color.WHITE;
            groupedSeparator = dark ? Color.parseColor("#38383A") : Color.parseColor("#C6C6C8");
            groupedLabel = dark ? Color.WHITE : Color.BLACK;
            groupedSecondaryLabel = dark ? Color.argb(153, 235, 235, 245) : Color.argb(153, 60, 60, 67);
            groupedTertiaryLabel = dark ? Color.argb(77, 235, 235, 245) : Color.argb(77, 60, 60, 67);
            searchFieldFill = dark ? Color.argb(61, 118, 118, 128) : Color.argb(31, 118, 118, 128);

            if (themeNavigation != null) {
                // YTAGNavigationAppearance: opaque themed surface, contrast-checked foreground and tint.
                navBackground = opaque(themeNavigation);
                navForeground = themeText != null && ThemeColors.contrast(opaque(themeText), navBackground) >= 4.5
                        ? themeText : ThemeColors.blackOrWhite(navBackground);
                if (themeIcon != null && ThemeColors.contrast(opaque(themeIcon), navBackground) >= 3.0) navTint = themeIcon;
                else if (themeText != null && ThemeColors.contrast(opaque(themeText), navBackground) >= 3.0) navTint = themeText;
                else navTint = ThemeColors.blackOrWhite(navBackground);
                navBorder = theme.color(ThemeRole.BORDER);
            } else {
                // Unthemed: YouTube's native bar over the page (transparent over a gradient).
                navBackground = gradient != null ? Color.TRANSPARENT : background;
                navForeground = text;
                navTint = text;
                navBorder = null;
            }
        }

        static Palette from(Configuration configuration) {
            return new Palette(configuration);
        }

        /** Page background: the theme gradient (iOS stops 0 / 0.35 / 0.65 / 1) or a solid color. */
        Drawable pageBackground() {
            if (gradient == null) return new ColorDrawable(background);
            GradientDrawable drawable = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,
                    new int[] {gradient[0], gradient[0], gradient[1], gradient[1]});
            if (Build.VERSION.SDK_INT >= 29) drawable.setColors(new int[] {gradient[0], gradient[0], gradient[1], gradient[1]}, new float[] {0f, 0.35f, 0.65f, 1f});
            return drawable;
        }

        private static int opaque(int color) {
            return color | 0xFF000000;
        }
    }
}
