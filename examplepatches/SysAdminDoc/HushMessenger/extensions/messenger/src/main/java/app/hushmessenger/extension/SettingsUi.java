package app.hushmessenger.extension;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

/** Framework-only styling: the extension can run without adding host resources. */
final class SettingsUi {
    final Context context;
    /** accent is for text and lines on the page; accentFill is Messenger's blue behind white text, like its own buttons. */
    final int background, surface, text, muted, accent, accentFill, line, outline, selected, warning, warningSurface;
    final int track, thumb, ripple, infoSurface, infoBorder, selectedText, error, selection;
    final boolean largeText, light;

    SettingsUi(Context context, boolean light) {
        this.context = context;
        this.light = light;
        background = light ? 0xfff0f2f5 : 0xff000000;
        surface = light ? 0xffffffff : 0xff10151d;
        text = light ? 0xff050505 : 0xfff3f5f9;
        muted = light ? 0xff65676b : 0xffa6afbe;
        // No one blue reads as text on both the page and under white text, so each job gets its own.
        accent = light ? 0xff0064e0 : 0xff4599ff;
        accentFill = 0xff0866ff;
        line = light ? 0xffdadde1 : 0xff222c3a;
        outline = light ? 0xff8a8d91 : 0xff5c6878;
        selected = accentFill;
        warning = light ? 0xff785100 : 0xffffcc67;
        warningSurface = light ? 0xffffefc5 : 0xff352800;
        track = light ? 0xffd8dadf : 0xff2a3442;
        thumb = light ? 0xffffffff : 0xffe1e6ef;
        ripple = light ? 0x220866ff : 0x334599ff;
        infoSurface = light ? 0xffe7f3ff : 0xff0f1c2e;
        infoBorder = light ? 0xffcfe3fb : 0xff1d3350;
        selectedText = 0xffffffff;
        error = light ? 0xffb3261e : 0xffffb4ab;
        selection = (accent & 0x00ffffff) | 0x55000000;
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

    /** A HushMessenger title: bold text in Messenger's moving gradient. */
    TextView title(String value, int size) {
        TextView view = text(value, size, text, true);
        ShimmerTitle.wear(view, light);
        return view;
    }

    TextView heading(String value) {
        // The text is English on every phone, so English capitals: a Turkish phone's own would dot the I.
        TextView view = text(value.toUpperCase(java.util.Locale.ROOT), 12, muted, true);
        view.setLetterSpacing(0.07f);
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

    Drawable interactive(int fill, int border, int radius) { return interactive(fill, border, radius, accent); }

    /** focus colors the ring around a focused control, except on an accent fill, which always gets its own two rings. */
    Drawable interactive(int fill, int border, int radius, int focus) {
        StateListDrawable states = new StateListDrawable();
        Drawable focused;
        if (fill == accentFill) {
            // No one color stands out from both the accent fill and the page, so an accent control gets two
            // rings: the outer one in the text color against the page, the inner one in the fill's own text color.
            GradientDrawable outer = shape(fill, 0, radius);
            outer.setStroke(dp(4), text);
            GradientDrawable inner = shape(0, 0, Math.max(0, radius - 2));
            inner.setStroke(dp(2), selectedText);
            LayerDrawable rings = new LayerDrawable(new Drawable[] {outer, inner});
            rings.setLayerInset(1, dp(2), dp(2), dp(2), dp(2));
            focused = rings;
        } else {
            GradientDrawable ring = shape(fill, focus, radius);
            ring.setStroke(dp(2), focus);
            focused = ring;
        }
        states.addState(new int[] {-android.R.attr.state_enabled}, shape(fill == accentFill ? track : fill, border == 0 ? 0 : line, radius));
        states.addState(new int[] {android.R.attr.state_focused}, focused);
        states.addState(new int[] {android.R.attr.state_hovered}, shape(fill == accentFill ? fill : infoSurface, border, radius));
        states.addState(new int[] {}, shape(fill, border, radius));
        return new RippleDrawable(ColorStateList.valueOf(ripple), states, shape(0xffffffff, 0, radius));
    }

    Button button(String title) {
        Button view = new Button(context);
        view.setText(title);
        view.setTextSize(14);
        view.setAllCaps(false);
        view.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        view.setTextColor(new ColorStateList(new int[][] {{-android.R.attr.state_enabled}, {}}, new int[] {muted, accent}));
        view.setMinHeight(dp(48));
        view.setMinimumHeight(dp(48));
        view.setMinWidth(0);
        view.setMinimumWidth(0);
        view.setPadding(dp(12), dp(8), dp(12), dp(8));
        view.setBackground(interactive(surface, accent, 12));
        view.setStateListAnimator(null);
        return view;
    }

    Button primaryButton(String title) {
        Button view = button(title);
        view.setTypeface(Typeface.create("sans-serif", Typeface.BOLD));
        view.setTextColor(new ColorStateList(new int[][] {{-android.R.attr.state_enabled}, {}}, new int[] {muted, selectedText}));
        view.setBackground(interactive(accentFill, 0, 12));
        return view;
    }

    EditText field(String hint, int limit, boolean singleLine) {
        EditText view = new EditText(context);
        view.setId(View.generateViewId());
        view.setHint(hint);
        view.setTextSize(15);
        view.setSingleLine(singleLine);
        view.setTextDirection(View.TEXT_DIRECTION_FIRST_STRONG);
        view.setFilters(new android.text.InputFilter[] {new android.text.InputFilter.LengthFilter(limit)});
        view.setTextColor(text);
        view.setHintTextColor(muted);
        view.setHighlightColor(selection);
        view.setMinHeight(dp(48));
        view.setPadding(dp(12), dp(10), dp(12), dp(10));
        view.setBackground(interactive(surface, outline, 12));
        if (android.os.Build.VERSION.SDK_INT >= 29) {
            Drawable cursor = view.getTextCursorDrawable(), middle = view.getTextSelectHandle();
            Drawable left = view.getTextSelectHandleLeft(), right = view.getTextSelectHandleRight();
            if (cursor != null) view.setTextCursorDrawable(tinted(cursor));
            if (middle != null) view.setTextSelectHandle(tinted(middle));
            if (left != null) view.setTextSelectHandleLeft(tinted(left));
            if (right != null) view.setTextSelectHandleRight(tinted(right));
        }
        return view;
    }

    private Drawable tinted(Drawable drawable) {
        Drawable copy = drawable.mutate();
        copy.setTint(accent);
        return copy;
    }

    LinearLayout panel() {
        LinearLayout view = column();
        view.setPadding(dp(16), dp(16), dp(16), dp(16));
        view.setBackground(shape(surface, line, 12));
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
        StateListDrawable handles = new StateListDrawable();
        for (int state : new int[] {-android.R.attr.state_enabled, android.R.attr.state_checked, 0}) {
            GradientDrawable handle = shape(state < 0 ? muted : state > 0 ? selectedText : thumb, outline, 4);
            handle.setSize(dp(18), dp(18));
            handles.addState(state == 0 ? new int[] {} : new int[] {state}, handle);
        }
        view.setThumbDrawable(handles);
        StateListDrawable tracks = new StateListDrawable();
        GradientDrawable disabled = shape(track, line, 6);
        disabled.setSize(dp(40), dp(20));
        tracks.addState(new int[] {-android.R.attr.state_enabled}, disabled);
        for (boolean on : new boolean[] {true, false}) {
            GradientDrawable drawable = shape(on ? accentFill : track, on ? accentFill : outline, 6);
            drawable.setSize(dp(40), dp(20));
            tracks.addState(on ? new int[] {android.R.attr.state_checked} : new int[] {}, drawable);
        }
        view.setTrackDrawable(tracks);
        view.setBackground(interactive(0x00000000, 0, 8));
        view.setChecked(checked);
        return view;
    }
}
