package app.spicetify.extension.spotify.settings;

import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import app.spicetify.extension.spotify.theme.ThemeRuntime;

/** Builds settings views that follow Spotify's native settings pages, using Spotify's fonts and icons when present. */
final class SpotifyStyle {
    static final int DIVIDER = Color.rgb(51, 51, 51);
    static final int SUBDUED = Color.rgb(179, 179, 179);
    static final int OUTLINE = Color.rgb(114, 114, 114);

    private SpotifyStyle() {}

    /** The in-app theme background, or Spotify's own when none is chosen. */
    static int background() {
        return ThemeRuntime.color("main", Color.rgb(18, 18, 18));
    }

    /** The in-app theme accent, or Spotify's green when none is chosen. */
    static int accent() {
        return ThemeRuntime.color("button", Color.rgb(30, 215, 96));
    }

    /** Header bars and other top surfaces: the theme's card color, or Spotify's own. */
    static int surface() {
        return ThemeRuntime.color("card", Color.rgb(40, 40, 40));
    }

    static int elevated() {
        int base = background();
        int top = surface();
        return Color.rgb((Color.red(base) + Color.red(top)) / 2, (Color.green(base) + Color.green(top)) / 2,
                (Color.blue(base) + Color.blue(top)) / 2);
    }

    static int field() {
        return lighten(background(), 24);
    }

    /** Black or white, whichever reads better on the given colour. */
    static int onColor(int color) {
        double luminance = (0.299 * Color.red(color) + 0.587 * Color.green(color) + 0.114 * Color.blue(color)) / 255;
        return luminance > 0.5 ? Color.BLACK : Color.WHITE;
    }

    private static int lighten(int color, int amount) {
        return Color.argb(Color.alpha(color), Math.min(255, Color.red(color) + amount),
                Math.min(255, Color.green(color) + amount), Math.min(255, Color.blue(color) + amount));
    }

    /**
     * A full-screen page in the dialog's window; its back button closes the dialog like Back does.
     * Content that scrolls on its own, such as a list, fills the page instead of scrolling in it.
     */
    static View screen(Dialog dialog, String title, View content, View footer, boolean scrolls) {
        Context context = dialog.getContext();
        Window window = dialog.getWindow();
        window.setStatusBarColor(surface());
        window.setNavigationBarColor(background());
        LinearLayout root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(background());

        FrameLayout header = new FrameLayout(context);
        header.setBackgroundColor(surface());
        FrameLayout bar = new FrameLayout(context);
        header.addView(bar, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));
        View back = backButton(context);
        back.setOnClickListener(view -> dialog.cancel());
        FrameLayout.LayoutParams backParams = new FrameLayout.LayoutParams(dp(context, 48), dp(context, 48),
                Gravity.START | Gravity.CENTER_VERTICAL);
        backParams.setMarginStart(dp(context, 4));
        bar.addView(back, backParams);
        TextView heading = text(context, title, 18, Color.WHITE, Font.TITLE);
        heading.setSingleLine(true);
        heading.setEllipsize(TextUtils.TruncateAt.END);
        heading(heading);
        FrameLayout.LayoutParams headingParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER);
        headingParams.setMargins(dp(context, 64), 0, dp(context, 64), 0);
        bar.addView(heading, headingParams);
        root.addView(header, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        final View page;
        if (scrolls) {
            ScrollView scroll = new ScrollView(context);
            scroll.setFillViewport(true);
            scroll.setClipToPadding(false);
            scroll.addView(content, new ScrollView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            page = scroll;
        } else {
            page = content;
        }
        root.addView(page, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        root.addView(footer, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        int bottomPadding = scrolls ? dp(context, 24) : 0;
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            int left = insets.getSystemWindowInsetLeft();
            int right = insets.getSystemWindowInsetRight();
            if (Build.VERSION.SDK_INT >= 28 && insets.getDisplayCutout() != null) {
                left = Math.max(left, insets.getDisplayCutout().getSafeInsetLeft());
                right = Math.max(right, insets.getDisplayCutout().getSafeInsetRight());
            }
            header.setPadding(left, insets.getSystemWindowInsetTop(), right, 0);
            page.setPadding(left, 0, right, bottomPadding);
            footer.setPadding(left, 0, right, 0);
            root.setPadding(0, 0, 0, insets.getSystemWindowInsetBottom());
            return insets.consumeSystemWindowInsets();
        });
        page.setPadding(0, 0, 0, bottomPadding);
        return root;
    }

    /** A bar that offers to restart Spotify; callers show it only while a restart is pending. */
    static View restartBar(Context context, View.OnClickListener restart) {
        LinearLayout bar = new LinearLayout(context);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setBackgroundColor(elevated());
        LinearLayout inner = new LinearLayout(context);
        inner.setGravity(Gravity.CENTER_VERTICAL);
        inner.setPadding(dp(context, 16), dp(context, 12), dp(context, 16), dp(context, 12));
        TextView message = text(context, "Restart Spotify to apply your changes.", 15, Color.WHITE, Font.REGULAR);
        LinearLayout.LayoutParams messageParams = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
        messageParams.setMarginEnd(dp(context, 12));
        inner.addView(message, messageParams);
        Button button = new Button(context);
        button.setText("Restart");
        style(button, true);
        button.setOnClickListener(restart);
        inner.addView(button, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, dp(context, 48)));
        bar.addView(inner, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        bar.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        return bar;
    }

    static LinearLayout column(Context context) {
        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        return column;
    }

    /** A root-level row that opens a group, like Spotify's own settings categories. */
    static void categoryRow(LinearLayout parent, String icon, String title, String summary, View.OnClickListener action) {
        Context context = parent.getContext();
        LinearLayout row = row(context);
        row.setMinimumHeight(dp(context, 72));
        Drawable drawable = icon(context, icon);
        if (drawable != null) {
            ImageView image = new ImageView(context);
            image.setImageDrawable(drawable);
            image.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(dp(context, 24), dp(context, 24));
            params.setMarginEnd(dp(context, 12));
            row.addView(image, params);
        }
        row.addView(labels(context, title, summary), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        row.setContentDescription(summary == null ? title : title + ", " + summary);
        row.setOnClickListener(action);
        parent.addView(row, matchWidth());
    }

    /** A row whose title and description sit beside a Spotify-style switch; tapping anywhere toggles it. */
    static void toggleRow(LinearLayout parent, String title, String description, boolean checked,
            CompoundButton.OnCheckedChangeListener listener) {
        Context context = parent.getContext();
        LinearLayout row = row(context);
        LinearLayout labels = labels(context, title, description);
        labels.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
        labelParams.setMarginEnd(dp(context, 16));
        row.addView(labels, labelParams);
        Switch toggle = new Switch(context);
        style(toggle);
        toggle.setContentDescription(description == null ? title : title + ". " + description);
        toggle.setChecked(checked);
        toggle.setOnCheckedChangeListener(listener);
        row.addView(toggle, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        row.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        row.setOnClickListener(view -> toggle.toggle());
        parent.addView(row, matchWidth());
    }

    /** A tappable row with a title and description that performs an action instead of toggling. */
    static void actionRow(LinearLayout parent, String title, String description, View.OnClickListener action) {
        Context context = parent.getContext();
        LinearLayout row = row(context);
        row.addView(labels(context, title, description), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        row.setContentDescription(title);
        row.setOnClickListener(action);
        parent.addView(row, matchWidth());
    }

    /** A tappable row that shows a colour's hex value and a swatch of it. */
    static void colorRow(LinearLayout parent, String title, int color, View.OnClickListener action) {
        Context context = parent.getContext();
        LinearLayout row = row(context);
        String hex = hex(color);
        row.addView(labels(context, title, hex), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        View swatch = new View(context);
        swatch.setBackground(swatch(context, color, false));
        row.addView(swatch, new LinearLayout.LayoutParams(dp(context, 32), dp(context, 32)));
        row.setContentDescription(title + ", " + hex);
        row.setOnClickListener(action);
        parent.addView(row, matchWidth());
    }

    /** A selectable theme with its colours shown as overlapping swatches; the chosen one shows a check mark. */
    static void themeRow(LinearLayout parent, String title, String description, int[] colors, boolean selected,
            View.OnClickListener action) {
        Context context = parent.getContext();
        LinearLayout row = row(context);
        FrameLayout strip = new FrameLayout(context);
        int size = dp(context, 28);
        for (int i = 0; i < colors.length; i++) {
            View dot = new View(context);
            dot.setBackground(swatch(context, colors[i], false));
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(size, size);
            params.setMarginStart(i * dp(context, 18));
            strip.addView(dot, params);
        }
        LinearLayout.LayoutParams stripParams = new LinearLayout.LayoutParams(size + (colors.length - 1) * dp(context, 18), size);
        stripParams.setMarginEnd(dp(context, 16));
        row.addView(strip, stripParams);
        row.addView(labels(context, title, description), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        if (selected) {
            Drawable check = icon(context, "encore_icon_check_alt_fill_24");
            View mark;
            if (check != null) {
                check.setTint(accent());
                ImageView image = new ImageView(context);
                image.setImageDrawable(check);
                mark = image;
            } else {
                mark = new View(context);
                mark.setBackground(swatch(context, accent(), false));
            }
            mark.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            row.addView(mark, new LinearLayout.LayoutParams(dp(context, 24), dp(context, 24)));
        }
        row.setContentDescription(title + (selected ? ", selected" : ""));
        row.setOnClickListener(action);
        parent.addView(row, matchWidth());
    }

    static GradientDrawable swatch(Context context, int color, boolean selected) {
        GradientDrawable circle = new GradientDrawable();
        circle.setShape(GradientDrawable.OVAL);
        circle.setColor(color);
        circle.setStroke(dp(context, selected ? 3 : 1), selected ? Color.WHITE : OUTLINE);
        return circle;
    }

    static String hex(int color) {
        return Color.alpha(color) == 0xFF
                ? String.format("#%06X", color & 0xFFFFFF)
                : String.format("#%08X", color);
    }

    /** A non-interactive row with a title and description. */
    static void infoRow(LinearLayout parent, String title, String description) {
        Context context = parent.getContext();
        LinearLayout row = row(context);
        row.setBackground(null);
        row.addView(labels(context, title, description), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        parent.addView(row, matchWidth());
    }

    static TextView sectionTitle(LinearLayout parent, String title, boolean divided) {
        Context context = parent.getContext();
        if (divided) divider(parent);
        TextView heading = text(context, title, 20, Color.WHITE, Font.TITLE);
        heading(heading);
        heading.setPadding(0, dp(context, divided ? 24 : 16), 0, dp(context, 8));
        parent.addView(heading, matchWidth());
        return heading;
    }

    static void divider(LinearLayout parent) {
        Context context = parent.getContext();
        View line = new View(context);
        line.setBackgroundColor(DIVIDER);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 1));
        params.topMargin = dp(context, 16);
        parent.addView(line, params);
    }

    static TextView body(Context context, String value) {
        TextView view = text(context, value, 14, SUBDUED, Font.REGULAR);
        view.setPadding(0, dp(context, 8), 0, dp(context, 8));
        return view;
    }

    static void style(Switch toggle) {
        Context context = toggle.getContext();
        toggle.setShowText(false);
        toggle.setSwitchMinWidth(dp(context, 52));
        StateListDrawable track = new StateListDrawable();
        track.addState(new int[] {android.R.attr.state_checked}, pill(context, accent(), 0, 0, 52, 32));
        track.addState(new int[0], pill(context, field(), SUBDUED, 2, 52, 32));
        StateListDrawable thumb = new StateListDrawable();
        thumb.addState(new int[] {android.R.attr.state_checked}, thumb(context, background(), 24));
        thumb.addState(new int[0], thumb(context, SUBDUED, 16));
        toggle.setTrackDrawable(track);
        toggle.setThumbDrawable(thumb);
        toggle.setMinHeight(dp(context, 48));
    }

    static void style(RadioButton radio) {
        Context context = radio.getContext();
        radio.setTextColor(Color.WHITE);
        radio.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        radio.setTypeface(font(context, Font.REGULAR));
        radio.setButtonTintList(new ColorStateList(
                new int[][] {new int[] {android.R.attr.state_checked}, new int[0]}, new int[] {accent(), SUBDUED}));
        radio.setMinHeight(dp(context, 48));
        radio.setPaddingRelative(dp(context, 8), 0, dp(context, 16), 0);
    }

    static void style(Button button, boolean primary) {
        Context context = button.getContext();
        button.setAllCaps(false);
        button.setStateListAnimator(null);
        button.setTypeface(font(context, Font.BOLD));
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        button.setTextColor(primary ? onColor(accent()) : Color.WHITE);
        GradientDrawable shape = pill(context, primary ? accent() : Color.TRANSPARENT, primary ? 0 : OUTLINE, primary ? 0 : 1, 0, 48);
        button.setBackground(new RippleDrawable(ColorStateList.valueOf(0x33FFFFFF), shape, pill(context, Color.WHITE, 0, 0, 0, 48)));
        button.setMinHeight(dp(context, 48));
        button.setMinimumHeight(dp(context, 48));
        button.setPadding(dp(context, 32), 0, dp(context, 32), 0);
    }

    static LinearLayout.LayoutParams buttonParams(Context context) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, dp(context, 48));
        params.topMargin = dp(context, 12);
        return params;
    }

    static void style(EditText input) {
        Context context = input.getContext();
        input.setTextColor(Color.WHITE);
        input.setHintTextColor(OUTLINE);
        input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        GradientDrawable field = new GradientDrawable();
        field.setColor(field());
        field.setCornerRadius(dp(context, 6));
        input.setBackground(field);
        input.setPadding(dp(context, 12), 0, dp(context, 12), 0);
        input.setMinHeight(dp(context, 48));
    }

    enum Font { REGULAR, BOLD, TITLE }

    static TextView text(Context context, String value, int size, int color, Font font) {
        TextView view = new TextView(context);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, size);
        view.setTextColor(color);
        view.setTypeface(font(context, font));
        return view;
    }

    static Typeface font(Context context, Font font) {
        String name = font == Font.TITLE ? "spotify_mix_ui_title_bold" : font == Font.BOLD ? "spotify_mix_ui_bold" : "spotify_mix_ui_regular";
        if (Build.VERSION.SDK_INT >= 26) {
            int id = context.getResources().getIdentifier(name, "font", context.getPackageName());
            if (id != 0) {
                try {
                    return context.getResources().getFont(id);
                } catch (RuntimeException missing) {
                    // Fall through to the platform typeface.
                }
            }
        }
        return font == Font.REGULAR ? Typeface.DEFAULT : Typeface.DEFAULT_BOLD;
    }

    static Drawable icon(Context context, String name) {
        int id = context.getResources().getIdentifier(name, "drawable", context.getPackageName());
        if (id == 0) return null;
        try {
            Drawable drawable = context.getDrawable(id);
            if (drawable == null) return null;
            drawable = drawable.mutate();
            drawable.setTint(Color.WHITE);
            return drawable;
        } catch (RuntimeException missing) {
            return null;
        }
    }

    static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    static void heading(TextView view) {
        if (Build.VERSION.SDK_INT >= 28) view.setAccessibilityHeading(true);
    }

    static View backButton(Context context) {
        Drawable arrow = icon(context, "encore_icon_arrow_left_24");
        View back;
        if (arrow != null) {
            ImageView image = new ImageView(context);
            image.setImageDrawable(arrow);
            image.setScaleType(ImageView.ScaleType.CENTER);
            back = image;
        } else {
            TextView fallback = text(context, "←", 24, Color.WHITE, Font.REGULAR);
            fallback.setGravity(Gravity.CENTER);
            back = fallback;
        }
        back.setContentDescription("Back");
        back.setClickable(true);
        back.setFocusable(true);
        back.setBackground(selectable(context, true));
        return back;
    }

    private static LinearLayout row(Context context) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(context, 64));
        row.setPadding(dp(context, 16), dp(context, 12), dp(context, 16), dp(context, 12));
        row.setBackground(selectable(context, false));
        return row;
    }

    private static LinearLayout labels(Context context, String title, String description) {
        LinearLayout labels = column(context);
        labels.addView(text(context, title, 17, Color.WHITE, Font.REGULAR));
        if (description != null) {
            TextView detail = text(context, description, 14, SUBDUED, Font.REGULAR);
            detail.setPadding(0, dp(context, 4), 0, 0);
            labels.addView(detail);
        }
        return labels;
    }

    private static LinearLayout.LayoutParams matchWidth() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    static Drawable selectable(Context context, boolean borderless) {
        TypedArray attributes = context.obtainStyledAttributes(new int[] {
                borderless ? android.R.attr.selectableItemBackgroundBorderless : android.R.attr.selectableItemBackground});
        try {
            return attributes.getDrawable(0);
        } finally {
            attributes.recycle();
        }
    }

    private static GradientDrawable pill(Context context, int fill, int stroke, int strokeWidth, int width, int height) {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(fill);
        shape.setCornerRadius(dp(context, height / 2));
        if (strokeWidth > 0) shape.setStroke(dp(context, strokeWidth), stroke);
        if (width > 0) shape.setSize(dp(context, width), dp(context, height));
        return shape;
    }

    private static Drawable thumb(Context context, int color, int size) {
        GradientDrawable dot = new GradientDrawable();
        dot.setShape(GradientDrawable.OVAL);
        dot.setColor(color);
        dot.setSize(dp(context, size), dp(context, size));
        LayerDrawable thumb = new LayerDrawable(new Drawable[] {dot});
        int inset = dp(context, (32 - size) / 2);
        thumb.setLayerInset(0, inset, inset, inset, inset);
        return thumb;
    }
}
