package app.hushmessenger.extension;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

/** Framework-only styling: the extension can run without adding host resources. */
final class SettingsUi {
    final Context context;
    final int background, surface, text, muted, accent, line, outline, selected, warning, warningSurface;
    final int track, thumb, ripple, infoSurface, infoBorder, selectedText;
    final boolean largeText;

    SettingsUi(Context context, boolean light) {
        this.context = context;
        background = light ? 0xfff7f9fc : 0xff000000;
        surface = light ? 0xffffffff : 0xff11161e;
        text = light ? 0xff182435 : 0xfff5f7fc;
        muted = light ? 0xff536478 : 0xffaebacb;
        accent = light ? 0xff1467c8 : 0xff74aeff;
        line = light ? 0xffd5deea : 0xff293241;
        outline = light ? 0xff71839b : 0xff65768c;
        selected = light ? 0xffdceaff : 0xff74aeff;
        warning = light ? 0xff785100 : 0xffffcc67;
        warningSurface = light ? 0xffffefc5 : 0xff352800;
        track = light ? 0xffc1c8d3 : 0xff313943;
        thumb = light ? 0xffffffff : 0xffe1e6ef;
        ripple = light ? 0x221467c8 : 0x3374aeff;
        infoSurface = light ? 0xffeaf2fb : 0xff0c1928;
        infoBorder = light ? 0xffbdd1ea : 0xff274361;
        selectedText = light ? accent : background;
        largeText = context.getResources().getConfiguration().fontScale > 1.3f ||
            context.getResources().getConfiguration().screenWidthDp < 360 ||
            new SettingsText(context).isPseudo();
    }

    int dp(int value) { return Math.round(value * context.getResources().getDisplayMetrics().density); }

    LinearLayout column() {
        LinearLayout view = new LinearLayout(context);
        view.setOrientation(LinearLayout.VERTICAL);
        return view;
    }

    LinearLayout row() {
        LinearLayout view = new LinearLayout(context);
        view.setGravity(Gravity.CENTER_VERTICAL);
        return view;
    }

    TextView text(String value, int size, int color, boolean bold) {
        TextView view = new TextView(context);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        view.setFontFeatureSettings("kern");
        view.setTypeface(Typeface.create(bold && size < 18 ? "sans-serif-medium" : "sans-serif", bold && size >= 18 ? Typeface.BOLD : Typeface.NORMAL));
        view.setIncludeFontPadding(false);
        view.setLineSpacing(dp(2), 1);
        return view;
    }

    TextView heading(String value) {
        TextView view = text(value, 13, muted, true);
        view.setLetterSpacing(0.06f);
        view.setAccessibilityHeading(true);
        return view;
    }

    GradientDrawable shape(int fill, int border, int radius) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(fill);
        drawable.setCornerRadius(dp(radius));
        if (border != 0) drawable.setStroke(dp(1), border);
        return drawable;
    }

    Drawable interactive(int fill, int border, int radius) {
        StateListDrawable states = new StateListDrawable();
        GradientDrawable focused = shape(fill, accent, radius);
        focused.setStroke(dp(2), accent);
        states.addState(new int[] {android.R.attr.state_focused}, focused);
        states.addState(new int[] {}, shape(fill, border, radius));
        return new RippleDrawable(ColorStateList.valueOf(ripple), states, shape(0xffffffff, 0, radius));
    }

    Button button(String title) {
        Button view = new Button(context);
        view.setText(title);
        view.setTextSize(14);
        view.setAllCaps(false);
        view.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        view.setTextColor(accent);
        view.setMinHeight(dp(48));
        view.setMinimumHeight(dp(48));
        view.setMinWidth(0);
        view.setMinimumWidth(0);
        view.setPadding(dp(12), dp(8), dp(12), dp(8));
        view.setBackground(interactive(background, accent, 8));
        view.setStateListAnimator(null);
        return view;
    }

    LinearLayout panel() {
        LinearLayout view = column();
        view.setPadding(dp(16), dp(16), dp(16), dp(12));
        view.setBackground(shape(surface, line, 8));
        return view;
    }

    void add(LinearLayout parent, View child, int top) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.topMargin = dp(top);
        parent.addView(child, params);
    }

    void rule(LinearLayout parent, int top) {
        View divider = new View(context);
        divider.setBackgroundColor(line);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, dp(1));
        params.topMargin = dp(top);
        parent.addView(divider, params);
    }

    @SuppressWarnings("deprecation")
    Switch toggle(String key, String title, String description, boolean checked) {
        Switch view = new Switch(context);
        view.setTag(key);
        view.setContentDescription(title + (description.isEmpty() ? "" : ". " + description));
        view.setShowText(false);
        view.setSplitTrack(false);
        view.setSwitchMinWidth(dp(40));
        view.setMinWidth(dp(48));
        view.setMinHeight(dp(48));
        view.setMinimumWidth(dp(48));
        view.setMinimumHeight(dp(48));
        view.setGravity(Gravity.CENTER);
        view.setThumbTintList(null);
        view.setTrackTintList(null);
        GradientDrawable handle = shape(thumb, outline, 4);
        handle.setSize(dp(18), dp(18));
        view.setThumbDrawable(handle);
        StateListDrawable tracks = new StateListDrawable();
        for (boolean on : new boolean[] {true, false}) {
            GradientDrawable drawable = shape(on ? accent : track, on ? accent : outline, 6);
            drawable.setSize(dp(40), dp(20));
            tracks.addState(on ? new int[] {android.R.attr.state_checked} : new int[] {}, drawable);
        }
        view.setTrackDrawable(tracks);
        view.setBackground(interactive(0x00000000, 0, 8));
        view.setChecked(checked);
        return view;
    }
}
