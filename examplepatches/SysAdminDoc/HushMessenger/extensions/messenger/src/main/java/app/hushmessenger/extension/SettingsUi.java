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
    final int track, thumb, ripple, infoSurface, infoBorder, warningBorder, selectedText, error, selection;
    /** The settings layout's roles by name; each is one of the colors above or its own. */
    final int dialog, card, hint, heading, switchOff, iconSurface, onAccent;
    final boolean largeText, light;
    /** The in-call Record button: red while it records (white on it 4.98), else the call screen's dark glass (white 16.1). */
    static final int RECORDING = 0xffd32f2f, CALL_SCRIM = 0xe6202124;
    /** The Record button's press, a white wash that shows on the red and on the dark glass alike. */
    static final int CALL_RIPPLE = 0x40ffffff;

    // Ratios are WCAG contrast, measured against the page, card and dialog (dark: all black; light: page #f0f2f5, card white).
    SettingsUi(Context context, boolean light) {
        this.context = context;
        this.light = light;
        background = light ? 0xfff0f2f5 : 0xff000000;
        // Cards and dialogs sit on the page's own black in the dark look, drawn out by their outline.
        surface = light ? 0xffffffff : 0xff000000;
        card = surface;
        dialog = surface;
        text = light ? 0xff050505 : 0xfff3f5f9; // light 18.2 / 20.4, dark 19.2
        muted = light ? 0xff65676b : 0xffa6afbe; // light 5.05 / 5.67, dark 9.50
        hint = light ? 0xff686b71 : 0xff8b95a5; // light 4.76 / 5.35, dark 6.94
        // No one blue reads as text on both the page and under white text, so each job gets its own.
        accent = light ? 0xff0064e0 : 0xff4599ff; // light 4.80 / 5.39, dark 7.25
        heading = accent;
        accentFill = 0xff0866ff; // Messenger's launcher blue; white on it 4.82
        onAccent = 0xffffffff;
        line = light ? 0xff84878c : 0xff525c6c; // card outlines and dividers: light 3.21 / 3.60, dark 3.11
        switchOff = light ? 0xff84878c : 0xff6b7584; // light 3.60 on white, dark 4.50; the off thumb on it light 5.65, dark 4.66
        outline = switchOff;
        selected = accentFill;
        warning = light ? 0xff785100 : 0xffffcc67; // on warningSurface: light 6.19, dark 9.68
        warningSurface = light ? 0xffffefc5 : 0xff352800;
        warningBorder = light ? 0xfff2d58c : 0xff5c4600; // like infoBorder: the surface's edge, drawn a step stronger
        // A switch that can't be used, on or off: the off track at half strength, so it never reads as on.
        track = half(switchOff);
        // HushGram's off thumb: the title color in the light look, since a white one vanishes on the white card.
        thumb = light ? text : 0xffffffff;
        // The heading color at 20 percent.
        ripple = (accent & 0x00ffffff) | 0x33000000;
        infoSurface = light ? 0xffe7f3ff : 0xff0f1c2e; // the heading color on it: light 4.79, dark 5.92
        iconSurface = infoSurface;
        infoBorder = light ? 0xffcfe3fb : 0xff1d3350;
        selectedText = onAccent;
        error = light ? 0xffb3261e : 0xffffb4ab; // light 5.83 / 6.54, dark 12.37
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

    /** A title, and a badge set with {@link TitleLine#badge} after it on the line or under it when both don't fit. */
    TitleLine titleLine() {
        TitleLine view = new TitleLine(context, dp(8), largeText);
        view.setGravity(Gravity.CENTER_VERTICAL);
        return view;
    }

    /**
     * Side by side, a wrapping title takes the line's whole width and leaves its badge a sliver, where the badge's
     * word wrapped a letter or two per line into a tall empty bar. Measured first, the pair sits on one line only
     * when both fit whole, and otherwise the badge goes under the title.
     */
    static final class TitleLine extends LinearLayout {
        private final int gap;
        private final boolean stacked;
        private TextView badge;

        TitleLine(Context context, int gap, boolean stacked) {
            super(context);
            this.gap = gap;
            this.stacked = stacked;
            setOrientation(stacked ? VERTICAL : HORIZONTAL);
        }

        void badge(TextView view) {
            badge = view;
            view.setSingleLine(true);
            addView(view, new LayoutParams(-2, -2));
        }

        boolean sideBySide() { return getOrientation() == HORIZONTAL; }

        @Override protected void onMeasure(int widthSpec, int heightSpec) {
            if (badge != null && getChildCount() == 2) {
                boolean fits = !stacked;
                if (fits && MeasureSpec.getMode(widthSpec) != MeasureSpec.UNSPECIFIED) {
                    int whole = MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED);
                    View title = getChildAt(0);
                    title.measure(whole, whole);
                    badge.measure(whole, whole);
                    int room = MeasureSpec.getSize(widthSpec) - getPaddingLeft() - getPaddingRight();
                    fits = title.getMeasuredWidth() + gap + badge.getMeasuredWidth() <= room;
                }
                setOrientation(fits ? HORIZONTAL : VERTICAL);
                LayoutParams params = (LayoutParams) badge.getLayoutParams();
                params.setMarginStart(fits ? gap : 0);
                params.topMargin = fits ? 0 : gap / 2;
                // The badge's start margin was already resolved to a left or right one on its first measure, and
                // LinearLayout lays out with that, so a line first measured stacked would put the badge against the title.
                params.resolveLayoutDirection(getLayoutDirection());
            }
            super.onMeasure(widthSpec, heightSpec);
        }
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
        // English text gets English capitals, since a Turkish phone's own would dot the I. A translated section heading
        // arrives already in its language's capitals (SettingsText.heading), which these leave as they are.
        TextView view = text(value.toUpperCase(java.util.Locale.ROOT), 12, heading, true);
        view.setLetterSpacing(0.055f);
        view.setAccessibilityHeading(true);
        return view;
    }

    GradientDrawable shape(int fill, int border, int radius) { return shape(fill, border, radius, 1); }

    GradientDrawable shape(int fill, int border, int radius, int stroke) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(fill);
        drawable.setCornerRadius(dp(radius));
        if (border != 0) drawable.setStroke(dp(stroke), border);
        return drawable;
    }

    /** A borderless shape that reports sides and ends as its padding, which a GradientDrawable takes only from XML before Android 10. */
    GradientDrawable paddedShape(int fill, int radius, int sides, int ends) {
        GradientDrawable drawable = new GradientDrawable() {
            @Override public boolean getPadding(android.graphics.Rect padding) {
                padding.set(sides, ends, sides, ends);
                return true;
            }
        };
        drawable.setColor(fill);
        drawable.setCornerRadius(dp(radius));
        return drawable;
    }

    /** color at half strength, for a disabled switch. */
    static int half(int color) { return (color & 0x00ffffff) | ((color >>> 25) << 24); }

    /** color, and 38 percent of it for a disabled row's icon. */
    static ColorStateList dimmedWhenDisabled(int color) {
        return new ColorStateList(new int[][] {{-android.R.attr.state_enabled}, {}}, new int[] {(color & 0x00ffffff) | 0x61000000, color});
    }

    Drawable interactive(int fill, int border, int radius) { return interactive(fill, border, radius, accent); }

    Drawable interactive(int fill, int border, int radius, int focus) { return interactive(fill, border, radius, focus, 1); }

    /**
     * focus colors the ring around a focused control, except on an accent fill, which always gets its own two rings.
     * A hovered, selected or activated control gets a ring in the same color.
     */
    Drawable interactive(int fill, int border, int radius, int focus, int stroke) {
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
            ring.setStroke(dp(Math.max(2, stroke)), focus);
            focused = ring;
        }
        // A disabled accent control keeps its blue at 38 percent, like a disabled title.
        states.addState(new int[] {-android.R.attr.state_enabled},
            shape(fill == accentFill ? (fill & 0x00ffffff) | 0x61000000 : fill, border == 0 ? 0 : (line & 0x00ffffff) | 0x61000000, radius, stroke));
        states.addState(new int[] {android.R.attr.state_focused}, focused);
        for (int state : new int[] {android.R.attr.state_hovered, android.R.attr.state_selected, android.R.attr.state_activated})
            states.addState(new int[] {state}, fill == accentFill ? shape(fill, border, radius, stroke) : shape(fill, focus, radius, stroke));
        states.addState(new int[] {}, shape(fill, border, radius, stroke));
        return new RippleDrawable(ColorStateList.valueOf(ripple), states, shape(0xffffffff, 0, radius));
    }

    /**
     * A choice's background, after HushGram's choice cards: the picked one wears the accent at 13 percent,
     * an unpicked one stays clear until pressed, and focus or hover rings it in the heading color.
     */
    Drawable choice(int radius) {
        ColorStateList picked = new ColorStateList(new int[][] {{android.R.attr.state_checked}, {}},
            new int[] {(accent & 0x00ffffff) | 0x22000000, 0});
        StateListDrawable states = new StateListDrawable();
        for (int state : new int[] {android.R.attr.state_focused, android.R.attr.state_hovered, android.R.attr.state_selected, android.R.attr.state_activated}) {
            GradientDrawable ring = shape(0, 0, radius);
            ring.setColor(picked);
            ring.setStroke(dp(state == android.R.attr.state_focused ? 2 : 1), heading);
            states.addState(new int[] {state}, ring);
        }
        GradientDrawable plain = shape(0, 0, radius);
        plain.setColor(picked);
        states.addState(new int[] {}, plain);
        return new RippleDrawable(ColorStateList.valueOf(ripple), states, shape(0xffffffff, 0, radius));
    }

    /**
     * A row's background with its leading icon, 24 dp in the heading color, start dp in from the row's
     * start edge, and a chevron end dp in from its end edge when a tap opens something. Both follow
     * the row's layout direction and dim with it.
     */
    LayerDrawable rowParts(Drawable base, String icon, int start, boolean chevron, int end) {
        Drawable glyph = SettingsIcons.icon(context, icon, heading);
        LayerDrawable parts = new LayerDrawable(chevron
            ? new Drawable[] {base, glyph, new Chevron(muted, dp(2))} : new Drawable[] {base, glyph});
        parts.setLayerGravity(1, Gravity.START | Gravity.CENTER_VERTICAL);
        parts.setLayerSize(1, dp(24), dp(24));
        parts.setLayerInsetRelative(1, dp(start), 0, 0, 0);
        if (chevron) {
            parts.setLayerGravity(2, Gravity.END | Gravity.CENTER_VERTICAL);
            parts.setLayerSize(2, dp(16), dp(24));
            parts.setLayerInsetRelative(2, 0, 0, dp(end), 0);
        }
        return parts;
    }

    /** HushGram's card corner, for every card: the section cards, the cards on the sheets and the restart card. */
    static final int CARD_RADIUS = 10;

    /** A card's background: the card fill in a 1 dp outline. */
    GradientDrawable cardShape() { return shape(card, line, CARD_RADIUS); }

    /** [fill] under a 1 dp line along its top, for a bar that sits over content scrolling past it. */
    Drawable topEdge(int fill) {
        return new LayerDrawable(new Drawable[] {shape(line, 0, 0), new android.graphics.drawable.InsetDrawable(shape(fill, 0, 0), 0, dp(1), 0, 0)});
    }

    /** A note in its own box: the info blue, or amber when it warns that something could be lost. */
    TextView notice(String value, boolean caution) {
        TextView view = text(value, 13, caution ? warning : muted, false);
        view.setPadding(dp(12), dp(12), dp(12), dp(12));
        view.setBackground(caution ? shape(warningSurface, warningBorder, 8) : shape(infoSurface, infoBorder, 8));
        return view;
    }

    /** A secondary dialog or page button: the card's fill in a 2 dp outline, with text in the heading color. */
    Button button(String title) {
        Button view = new Button(context);
        view.setText(title);
        view.setTextSize(16);
        view.setAllCaps(false);
        view.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        view.setTextColor(new ColorStateList(new int[][] {{-android.R.attr.state_enabled}, {}}, new int[] {muted, heading}));
        view.setMinHeight(dp(48));
        view.setMinimumHeight(dp(48));
        view.setMinWidth(dp(64));
        view.setMinimumWidth(dp(64));
        view.setPadding(dp(12), dp(8), dp(12), dp(8));
        view.setBackground(interactive(card, line, 12, heading, 2));
        view.setStateListAnimator(null);
        return view;
    }

    Button primaryButton(String title) {
        Button view = button(title);
        view.setTextColor(new ColorStateList(new int[][] {{-android.R.attr.state_enabled}, {}}, new int[] {muted, onAccent}));
        view.setBackground(interactive(accentFill, 0, 12));
        return view;
    }

    /** A button that removes something: the secondary button with its text and focus ring in the error color. */
    Button destructiveButton(String title) {
        Button view = button(title);
        view.setTextColor(new ColorStateList(new int[][] {{-android.R.attr.state_enabled}, {}}, new int[] {muted, error}));
        view.setBackground(interactive(card, line, 12, error, 2));
        return view;
    }

    EditText field(String hint, int limit, boolean singleLine) {
        EditText view = new EditText(context);
        view.setId(View.generateViewId());
        view.setHint(hint);
        view.setTextSize(16);
        view.setSingleLine(singleLine);
        view.setTextDirection(View.TEXT_DIRECTION_FIRST_STRONG);
        view.setFilters(new android.text.InputFilter[] {new android.text.InputFilter.LengthFilter(limit)});
        view.setTextColor(text);
        view.setHintTextColor(this.hint);
        view.setHighlightColor(selection);
        view.setMinHeight(dp(48));
        view.setPadding(dp(12), dp(10), dp(12), dp(10));
        view.setBackground(fieldBackground(false));
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

    /** A field's 2 dp outline, in the error color while its text needs fixing. */
    Drawable fieldBackground(boolean wrong) {
        return wrong ? interactive(dialog, error, 12, error, 2) : interactive(dialog, switchOff, 12, heading, 2);
    }

    private Drawable tinted(Drawable drawable) {
        Drawable copy = drawable.mutate();
        copy.setTint(accent);
        return copy;
    }

    LinearLayout panel() {
        LinearLayout view = column();
        view.setPadding(dp(16), dp(16), dp(16), dp(16));
        view.setBackground(cardShape());
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
        // A 20 dp square thumb with 2 dp of track around it, on a 40 by 24 dp track; disabled is the same at half strength.
        // Switch shrinks the track by the thumb's inset wherever the track's padding doesn't cover it, takes the inset off
        // the travel, and is at least two thumbs plus the padding wide. So the thumb is inset only above and below, the
        // handle reports 2 dp a side (a 16 dp thumb to Switch) and the track 4 dp a side: 40 dp wide, 16 dp of travel, and
        // the 20 dp square drawn 2 dp in from either end.
        int[][] states = {{-android.R.attr.state_enabled, android.R.attr.state_checked}, {-android.R.attr.state_enabled},
            {android.R.attr.state_checked}, {}};
        int[] thumbs = {half(onAccent), half(thumb), onAccent, thumb}, tracks = {track, track, accentFill, switchOff};
        StateListDrawable handles = new StateListDrawable(), rails = new StateListDrawable();
        for (int i = 0; i < states.length; i++) {
            GradientDrawable handle = paddedShape(thumbs[i], 4, dp(2), 0);
            handle.setSize(dp(20), dp(20));
            handles.addState(states[i], new android.graphics.drawable.InsetDrawable(handle, 0, dp(2), 0, dp(2)));
            GradientDrawable rail = paddedShape(tracks[i], 6, dp(4), dp(2));
            rail.setSize(dp(40), dp(24));
            rails.addState(states[i], rail);
        }
        view.setThumbDrawable(handles);
        view.setTrackDrawable(rails);
        view.setBackground(interactive(0x00000000, 0, 8));
        view.setChecked(checked);
        // New drawables take no state until the switch's next state change, and an off switch built off has none, so
        // until then it drew in its disabled look.
        view.refreshDrawableState();
        return view;
    }
}
