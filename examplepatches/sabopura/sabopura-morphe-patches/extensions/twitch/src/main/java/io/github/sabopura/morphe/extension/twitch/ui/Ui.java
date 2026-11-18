package io.github.sabopura.morphe.extension.twitch.ui;

import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.animation.StateListAnimator;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.text.InputFilter;
import android.text.InputType;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.PathInterpolator;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.function.BooleanSupplier;
import java.util.function.Consumer;
import java.util.function.IntConsumer;
import java.util.function.IntFunction;

/**
 * Palette and building blocks shared by the player menu and the settings screen. Everything
 * is created in code so the patch adds no layouts, drawables or strings to Twitch.
 */
public final class Ui {
    public final boolean dark;
    public final int background;
    public final int surface;
    public final int card;
    public final int line;
    public final int text;
    public final int secondary;
    public final int accent;
    public final int onAccent;
    public final int accentSoft;

    private Ui(boolean dark) {
        this.dark = dark;
        if (dark) {
            background = 0xFF0E0E10;
            surface = 0xFF18181B;
            card = 0xFF1F1F23;
            line = 0x1FFFFFFF;
            text = 0xFFEFEFF1;
            secondary = 0xFFADADB8;
            accent = 0xFFA970FF;
            onAccent = 0xFF0E0E10;
            accentSoft = 0x33A970FF;
        } else {
            background = 0xFFF7F7F8;
            surface = 0xFFFFFFFF;
            card = 0xFFFFFFFF;
            line = 0x1F000000;
            text = 0xFF0E0E10;
            secondary = 0xFF53535F;
            accent = 0xFF772CE8;
            onAccent = 0xFFFFFFFF;
            accentSoft = 0x1F772CE8;
        }
    }

    /** Always dark; used over the video. */
    public static Ui overVideo() {
        return new Ui(true);
    }

    /** Follows Twitch's current light or dark theme. */
    public static Ui of(Context context) {
        int background = Color.BLACK;
        TypedArray a = context.getTheme().obtainStyledAttributes(
                new int[]{android.R.attr.colorBackground});
        try {
            background = a.getColor(0, Color.BLACK);
        } finally {
            a.recycle();
        }
        double luminance = (0.299 * Color.red(background) + 0.587 * Color.green(background)
                + 0.114 * Color.blue(background)) / 255.0;
        return new Ui(luminance < 0.5);
    }

    public static int dp(Context context, float value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    public static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            Context next = ((ContextWrapper) context).getBaseContext();
            if (next == context) break;
            context = next;
        }
        return null;
    }

    // ---- drawables ----

    public static GradientDrawable rounded(Context context, int color, float radiusDp) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadius(dp(context, radiusDp));
        return d;
    }

    public static GradientDrawable corners(Context context, int color, float tl, float tr,
                                           float br, float bl) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        float a = dp(context, tl), b = dp(context, tr), c = dp(context, br), e = dp(context, bl);
        d.setCornerRadii(new float[]{a, a, b, b, c, c, e, e});
        return d;
    }

    public Drawable pressable(Context context, int color, float radiusDp) {
        int ripple = dark ? 0x33FFFFFF : 0x22000000;
        Drawable content = color == 0 ? null : rounded(context, color, radiusDp);
        return new RippleDrawable(ColorStateList.valueOf(ripple), content,
                rounded(context, Color.WHITE, radiusDp));
    }

    /** The tile and button press, .97 in 90 ms. Never delays the click. */
    static void pressScale(View view) {
        StateListAnimator states = new StateListAnimator();
        states.addState(new int[]{android.R.attr.state_pressed, android.R.attr.state_enabled}, scaleTo(view, .97f));
        states.addState(new int[]{}, scaleTo(view, 1f));
        view.setStateListAnimator(states);
    }

    private static ObjectAnimator scaleTo(View view, float scale) {
        ObjectAnimator animator = ObjectAnimator.ofPropertyValuesHolder(view,
                PropertyValuesHolder.ofFloat(View.SCALE_X, scale),
                PropertyValuesHolder.ofFloat(View.SCALE_Y, scale));
        animator.setDuration(90);
        animator.setInterpolator(new PathInterpolator(Ease.OUT[0], Ease.OUT[1], Ease.OUT[2], Ease.OUT[3]));
        return animator;
    }

    // ---- text ----

    public TextView text(Context context, CharSequence value, float sp, int color,
                         boolean medium) {
        TextView view = new TextView(context);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        if (medium) view.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        return view;
    }

    public TextView sectionLabel(Context context, String value) {
        TextView view = text(context, value, 13, accent, true);
        view.setPadding(dp(context, 4), dp(context, 20), dp(context, 4), dp(context, 8));
        return view;
    }

    // ---- containers ----

    public LinearLayout card(Context context) {
        return card(context, 16);
    }

    /** A rounded group of rows separated by hairlines; a hidden row takes its hairline with it. */
    public LinearLayout card(Context context, float dividerInsetDp) {
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(rounded(context, this.card, 16));
        card.setClipToOutline(true);
        GradientDrawable hairline = new GradientDrawable();
        hairline.setColor(line);
        hairline.setSize(0, Math.max(1, dp(context, 0.7f)));
        card.setDividerDrawable(new InsetDrawable(hairline, dp(context, dividerInsetDp), 0, 0, 0));
        card.setShowDividers(LinearLayout.SHOW_DIVIDER_MIDDLE);
        return card;
    }

    public static LinearLayout.LayoutParams matchWidth() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    // ---- rows ----

    /** The parts of a row that its owner keeps updating in place. */
    static final class Row {
        final View view;
        final TextView title;
        final TextView summary;
        final TextView value;
        final LiquidSwitch toggle;

        Row(View view, TextView title, TextView summary, TextView value, LiquidSwitch toggle) {
            this.view = view;
            this.title = title;
            this.summary = summary;
            this.value = value;
            this.toggle = toggle;
        }

        void setSummary(String text) {
            summary.setText(text);
            summary.setVisibility(TextUtils.isEmpty(text) ? View.GONE : View.VISIBLE);
        }
    }

    private LinearLayout rowBase(Context context) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(context, 56));
        row.setPadding(dp(context, 16), dp(context, 10), dp(context, 16), dp(context, 10));
        row.setBackground(pressable(context, 0, 0));
        return row;
    }

    private LinearLayout texts(Context context, String title, String summary, TextView[] out) {
        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        TextView t = text(context, title, 16, text, false);
        column.addView(t);
        TextView s = text(context, summary == null ? "" : summary, 13, secondary, false);
        s.setVisibility(TextUtils.isEmpty(summary) ? View.GONE : View.VISIBLE);
        s.setPadding(0, dp(context, 2), 0, 0);
        column.addView(s);
        out[0] = t;
        out[1] = s;
        return column;
    }

    Row switchRowParts(Context context, String title, String summary, boolean checked,
                       Consumer<Boolean> listener) {
        LinearLayout row = rowBase(context);
        TextView[] parts = new TextView[2];
        row.addView(texts(context, title, summary, parts),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        LiquidSwitch toggle = new LiquidSwitch(context, this);
        toggle.setChecked(checked, false);
        toggle.setListener(listener);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.leftMargin = dp(context, 12);
        row.addView(toggle, lp);
        row.setOnClickListener(v -> toggle.toggle());
        toggle.speakThrough(row);
        return new Row(row, parts[0], parts[1], null, toggle);
    }

    public View switchRow(Context context, String title, String summary, boolean checked,
                          Consumer<Boolean> listener) {
        return switchRowParts(context, title, summary, checked, listener).view;
    }

    public View sliderRow(Context context, String title, String summary, int min, int max,
                          int value, IntFunction<String> format, IntConsumer commit) {
        return sliderRow(context, title, summary, min, max, value, value, format, v -> {
        }, commit);
    }

    /** {@code mark} is the default value's position; {@code preview} follows a drag before it is committed. */
    public View sliderRow(Context context, String title, String summary, int min, int max, int value,
                          int mark, IntFunction<String> format, IntConsumer preview, IntConsumer commit) {
        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setClipChildren(false);
        column.setPadding(dp(context, 16), dp(context, 12), dp(context, 16), dp(context, 6));
        LinearLayout head = new LinearLayout(context);
        head.setGravity(Gravity.CENTER_VERTICAL);
        TextView[] parts = new TextView[2];
        head.addView(texts(context, title, summary, parts),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        TextView current = text(context, format.apply(value), 15, accent, true);
        current.setPadding(dp(context, 12), 0, 0, 0);
        head.addView(current);
        column.addView(head);
        ElasticSlider slider = new ElasticSlider(context, this, min, max, value, mark, format, v -> {
            current.setText(format.apply(v));
            preview.accept(v);
        }, commit);
        slider.setContentDescription(title);
        LinearLayout track = new LinearLayout(context);
        track.setGravity(Gravity.CENTER_VERTICAL);
        track.setClipChildren(false);
        track.addView(stepButton(context, Icons.Kind.MINUS, stepLabel(title, false), () -> slider.nudge(-1)));
        track.addView(slider, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        track.addView(stepButton(context, Icons.Kind.PLUS, stepLabel(title, true), () -> slider.nudge(1)));
        LinearLayout.LayoutParams lp = matchWidth();
        lp.topMargin = dp(context, 4);
        column.addView(track, lp);
        return column;
    }

    /** Names the value it changes, since TalkBack reaches the button on its own. */
    static String stepLabel(String title, boolean up) {
        return Text.label(title + (up ? "を1上げる" : "を1下げる"),
                (up ? "Increase " : "Decrease ") + PortMath.lowerFirst(title));
    }

    private ImageView stepButton(Context context, Icons.Kind kind, String description, Runnable onClick) {
        ImageView button = iconView(context, kind, text, 20);
        button.setContentDescription(description);
        button.setBackground(pressable(context, 0, 24));
        button.setOnClickListener(v -> onClick.run());
        button.setLayoutParams(new LinearLayout.LayoutParams(dp(context, 48), dp(context, 48)));
        return button;
    }

    ImageView iconView(Context context, Icons.Kind kind, int color, float sizeDp) {
        ImageView icon = new ImageView(context);
        icon.setImageDrawable(Icons.drawable(context, kind, color, sizeDp));
        icon.setScaleType(ImageView.ScaleType.CENTER);
        return icon;
    }

    Row linkRowParts(Context context, String title, String summary, String value, Runnable onClick) {
        return linkRowParts(context, title, summary, value, false, onClick);
    }

    /** {@code stacked} puts the value under the title in the accent colour instead of at the row's end. */
    Row linkRowParts(Context context, String title, String summary, String value, boolean stacked, Runnable onClick) {
        LinearLayout row = rowBase(context);
        TextView[] parts = new TextView[2];
        LinearLayout column = texts(context, title, summary, parts);
        row.addView(column, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        TextView v = text(context, value == null ? "" : value, 14, stacked ? accent : secondary, stacked);
        v.setVisibility(value == null ? View.GONE : View.VISIBLE);
        if (stacked) {
            v.setPadding(0, dp(context, 2), 0, 0);
            column.addView(v, 1);
        } else {
            v.setMaxWidth(dp(context, 160));
            v.setSingleLine(true);
            v.setEllipsize(TextUtils.TruncateAt.END);
            v.setPadding(dp(context, 12), 0, dp(context, 4), 0);
            row.addView(v);
        }
        ImageView chevron = iconView(context, Icons.Kind.CHEVRON, secondary, 20);
        LinearLayout.LayoutParams chevronLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        chevronLp.leftMargin = stacked ? dp(context, 12) : 0;
        row.addView(chevron, chevronLp);
        row.setOnClickListener(x -> onClick.run());
        return new Row(row, parts[0], parts[1], v, null);
    }

    /** Facts to read, with nothing to tap. */
    View infoRow(Context context, String title, String summary) {
        LinearLayout row = rowBase(context);
        row.setBackground(null);
        TextView[] parts = new TextView[2];
        row.addView(texts(context, title, summary, parts),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        parts[0].setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        return row;
    }

    /** An icon on a rounded tile of the section's own colour. */
    View iconTile(Context context, Icons.Kind icon, int tint, float sizeDp) {
        ImageView tile = iconView(context, icon, Color.WHITE, sizeDp * .55f);
        tile.setBackground(rounded(context, tint, sizeDp * .3f));
        tile.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return tile;
    }

    /** A section on the first screen: its icon, its name, what is inside, and its state at the end. */
    View sectionRow(Context context, Icons.Kind icon, int tint, String title, String summary, String status,
                    boolean statusOn, Runnable onClick) {
        LinearLayout row = rowBase(context);
        row.setMinimumHeight(dp(context, 68));
        LinearLayout.LayoutParams tileLp = new LinearLayout.LayoutParams(dp(context, 40), dp(context, 40));
        tileLp.rightMargin = dp(context, 14);
        row.addView(iconTile(context, icon, tint, 40), tileLp);
        TextView[] parts = new TextView[2];
        row.addView(texts(context, title, summary, parts),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        parts[0].setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        parts[1].setMaxLines(2);
        parts[1].setEllipsize(TextUtils.TruncateAt.END);
        if (status != null) {
            TextView state = text(context, status, 13, statusOn ? accent : secondary, statusOn);
            state.setPadding(dp(context, 12), 0, dp(context, 2), 0);
            row.addView(state);
        }
        row.addView(iconView(context, Icons.Kind.CHEVRON, secondary, 20));
        row.setOnClickListener(x -> onClick.run());
        return row;
    }

    /** Title and summary above Bencho's inline confirm pill. */
    View confirmRow(Context context, String title, String summary, String idle, String done,
                    ConfirmPill.Pending pending, Runnable commit, Runnable undo, Runnable expire) {
        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        ConfirmPill pill = new ConfirmPill(context, this, idle, done, pending, commit, undo, expire);
        // The pill's touch target reaches past its face; the face keeps its place.
        int reach = pill.targetMargin();
        column.setPadding(dp(context, 16), dp(context, 12), dp(context, 16), dp(context, 12) - reach);
        TextView[] parts = new TextView[2];
        column.addView(texts(context, title, summary, parts));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(context, 10) - reach;
        column.addView(pill, lp);
        return column;
    }

    /** Title, current value and a chevron; tapping opens the editor. */
    public View linkRow(Context context, String title, String summary, String value,
                        Runnable onClick) {
        return linkRowParts(context, title, summary, value, onClick).view;
    }

    /** A link row for one of several choices: the chosen one reads as the row's second line. */
    public View choiceRow(Context context, String title, String summary, String value, Runnable onClick) {
        return linkRowParts(context, title, summary, value, true, onClick).view;
    }

    /** A row of colour circles; the name stays available to TalkBack. */
    View swatchRow(Context context, String title, String summary, String[] labels, int[] colors,
                   int selected, IntConsumer pick) {
        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setPadding(dp(context, 16), dp(context, 12), dp(context, 16), dp(context, 12));
        TextView[] parts = new TextView[2];
        column.addView(texts(context, title, summary, parts));
        LinearLayout row = new LinearLayout(context);
        row.setPadding(0, dp(context, 8), 0, 0);
        for (int i = 0; i < colors.length; i++) {
            final int index = i;
            View swatch = new View(context);
            swatch.setContentDescription(labels[i]);
            swatch.setSelected(i == selected);
            GradientDrawable circle = new GradientDrawable();
            circle.setShape(GradientDrawable.OVAL);
            circle.setColor(colors[i] | 0xFF000000);
            if (i == selected) circle.setStroke(dp(context, 3), text);
            swatch.setBackground(new InsetDrawable(circle, dp(context, 8)));
            swatch.setOnClickListener(v -> pick.accept(index));
            row.addView(swatch, new LinearLayout.LayoutParams(dp(context, 48), dp(context, 48)));
        }
        column.addView(row);
        return column;
    }

    /** A chip whose face is 36 dp high inside a 48 dp touch target; selected shows as filled. */
    public TextView chip(Context context, String label, boolean selected, Runnable onClick) {
        TextView chip = text(context, label, 14, 0, true);
        chip.setGravity(Gravity.CENTER);
        chip.setMinWidth(dp(context, 44));
        chip.setMinHeight(dp(context, 48));
        chip.setTextColor(new ColorStateList(
                new int[][]{{android.R.attr.state_selected}, {}}, new int[]{onAccent, text}));
        int ripple = dark ? 0x33FFFFFF : 0x22000000;
        StateListDrawable faces = new StateListDrawable();
        faces.addState(new int[]{android.R.attr.state_selected}, rounded(context, accent, 18));
        faces.addState(new int[]{}, rounded(context, dark ? 0x22FFFFFF : 0x0F000000, 18));
        int inset = dp(context, 6);
        chip.setBackground(new RippleDrawable(ColorStateList.valueOf(ripple),
                new InsetDrawable(faces, 0, inset, 0, inset),
                new InsetDrawable(rounded(context, Color.WHITE, 18), 0, inset, 0, inset)));
        // After the background: its insets would otherwise replace this padding.
        chip.setPadding(dp(context, 14), 0, dp(context, 14), 0);
        chip.setSelected(selected);
        chip.setOnClickListener(v -> onClick.run());
        return chip;
    }

    /** Large tonal button used in the player menu grid: an icon over its label. */
    public View tile(Context context, Icons.Kind icon, String label, Runnable onClick) {
        LinearLayout tile = new LinearLayout(context);
        tile.setOrientation(LinearLayout.VERTICAL);
        tile.setGravity(Gravity.CENTER);
        tile.setMinimumHeight(dp(context, 64));
        tile.setPadding(dp(context, 6), dp(context, 10), dp(context, 6), dp(context, 8));
        tile.setBackground(pressable(context, dark ? 0x1AFFFFFF : 0x0D000000, 14));
        ImageView image = iconView(context, icon, text, 22);
        tile.addView(image, new LinearLayout.LayoutParams(dp(context, 24), dp(context, 24)));
        TextView name = text(context, label, 13, text, true);
        name.setGravity(Gravity.CENTER);
        name.setMaxLines(2);
        name.setPadding(0, dp(context, 4), 0, 0);
        tile.addView(name);
        tile.setContentDescription(label);
        pressScale(tile);
        tile.setOnClickListener(v -> onClick.run());
        return tile;
    }

    /** Changes the icon and the name of a {@link #tile} that shows a state. */
    public void retile(View tile, Icons.Kind icon, String label) {
        ViewGroup parts = (ViewGroup) tile;
        ((ImageView) parts.getChildAt(0)).setImageDrawable(Icons.drawable(tile.getContext(), icon, text, 22));
        ((TextView) parts.getChildAt(1)).setText(label);
        tile.setContentDescription(label);
    }

    /** Equally wide tiles whose column count follows the grid's own width, so it survives rotation. */
    public ViewGroup grid(Context context, View... tiles) {
        ViewGroup grid = new ViewGroup(context) {
            @Override
            protected void onMeasure(int widthSpec, int heightSpec) {
                int width = MeasureSpec.getSize(widthSpec);
                int gap = dp(getContext(), 8);
                int columns = Layouts.menuColumns(Math.round(width / getResources().getDisplayMetrics().density), getChildCount());
                int cell = (width - gap * (columns - 1)) / Math.max(1, columns);
                int spec = MeasureSpec.makeMeasureSpec(cell, MeasureSpec.EXACTLY);
                int rows = 0, rowHeight = 0, height = 0;
                for (int i = 0; i < getChildCount(); i++) {
                    View child = getChildAt(i);
                    child.measure(spec, MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED));
                    rowHeight = Math.max(rowHeight, child.getMeasuredHeight());
                    if (i % columns == columns - 1 || i == getChildCount() - 1) {
                        height += rowHeight + (rows > 0 ? gap : 0);
                        rows++;
                        rowHeight = 0;
                    }
                }
                setMeasuredDimension(width, height);
            }

            @Override
            protected void onLayout(boolean changed, int l, int t, int r, int b) {
                int gap = dp(getContext(), 8);
                int columns = Layouts.menuColumns(Math.round(getWidth() / getResources().getDisplayMetrics().density), getChildCount());
                int cell = (getWidth() - gap * (columns - 1)) / Math.max(1, columns);
                int top = 0;
                for (int i = 0; i < getChildCount(); i += columns) {
                    int rowHeight = 0;
                    for (int j = i; j < Math.min(getChildCount(), i + columns); j++)
                        rowHeight = Math.max(rowHeight, getChildAt(j).getMeasuredHeight());
                    for (int j = i; j < Math.min(getChildCount(), i + columns); j++) {
                        int x = (j - i) * (cell + gap);
                        getChildAt(j).layout(x, top, x + cell, top + rowHeight);
                    }
                    top += rowHeight + gap;
                }
            }
        };
        for (View tile : tiles) grid.addView(tile);
        return grid;
    }

    /** A 44 dp face inside a 48 dp touch target. */
    public TextView button(Context context, String label, boolean filled, Runnable onClick) {
        TextView button = text(context, label, 15, filled ? onAccent : accent, true);
        button.setGravity(Gravity.CENTER);
        button.setMinHeight(dp(context, 48));
        Drawable face;
        if (filled) {
            face = pressable(context, accent, 22);
        } else {
            GradientDrawable outline = rounded(context, 0, 22);
            outline.setStroke(Math.max(1, dp(context, 1)), (accent & 0x00FFFFFF) | 0x99000000);
            face = new RippleDrawable(ColorStateList.valueOf(accentSoft), outline, rounded(context, Color.WHITE, 22));
        }
        button.setBackground(new InsetDrawable(face, 0, dp(context, 2), 0, dp(context, 2)));
        // After the background: its insets would otherwise replace this padding.
        button.setPadding(dp(context, 18), 0, dp(context, 18), 0);
        pressScale(button);
        button.setOnClickListener(v -> onClick.run());
        return button;
    }

    /** Bencho's drag stepper, for callers outside this package. */
    public View stepper(Context context, String description, int min, int max, int value, int mark,
                        IntFunction<String> format, IntConsumer onChange) {
        StepperView view = new StepperView(context, this, min, max, value, mark, format, onChange);
        view.setContentDescription(description);
        return view;
    }

    /** The input background shared by the editors. */
    public Drawable field(Context context) {
        return rounded(context, dark ? 0x14FFFFFF : 0x0A000000, 12);
    }

    /** Red for errors and for actions that destroy data, readable on {@link #surface} in either theme. */
    public int danger() {
        return dark ? 0xFFFF6B6B : 0xFFC62828;
    }

    // ---- modal dialogs ----

    /** A centred card dialog with an optional content view and up to two buttons. */
    public Dialog modal(Context context, String title, String message, View content,
                        String positive, Runnable onPositive, String negative) {
        return modal(context, title, message, content, positive, () -> {
            if (onPositive != null) onPositive.run();
            return true;
        }, negative);
    }

    public Dialog modal(Context context, String title, String message, View content,
                        String positive, BooleanSupplier onPositive, String negative) {
        return modal(context, title, message, content, positive, accent, onPositive, negative);
    }

    /** Asks before an action that destroys data: the confirming button is drawn in {@link #danger}. */
    public Dialog confirmDanger(Context context, String title, String message,
                                String positive, Runnable onPositive, String negative) {
        return modal(context, title, message, null, positive, danger(), () -> {
            onPositive.run();
            return true;
        }, negative);
    }

    private Dialog modal(Context context, String title, String message, View content,
                         String positive, int positiveColor, BooleanSupplier onPositive, String negative) {
        Dialog dialog = new Dialog(context);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        LinearLayout box = new LinearLayout(context);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(context, 24), dp(context, 22), dp(context, 24), dp(context, 10));
        box.setBackground(rounded(context, surface, 24));
        if (title != null) {
            TextView t = text(context, title, 20, text, true);
            box.addView(t);
        }
        if (message != null) {
            TextView m = text(context, message, 14, secondary, false);
            m.setPadding(0, dp(context, 10), 0, 0);
            m.setLineSpacing(0, 1.15f);
            box.addView(m);
        }
        if (content != null) {
            LinearLayout.LayoutParams lp = matchWidth();
            lp.topMargin = dp(context, 14);
            box.addView(content, lp);
        }
        LinearLayout buttons = new LinearLayout(context);
        buttons.setGravity(Gravity.END);
        buttons.setPadding(0, dp(context, 12), 0, 0);
        if (negative != null) {
            TextView n = dialogButton(context, negative, accent);
            n.setOnClickListener(v -> dialog.dismiss());
            buttons.addView(n);
        }
        if (positive != null) {
            TextView p = dialogButton(context, positive, positiveColor);
            p.setOnClickListener(v -> {
                if (onPositive == null || onPositive.getAsBoolean()) dialog.dismiss();
            });
            buttons.addView(p);
        }
        box.addView(buttons, matchWidth());
        ScrollView scroll = new ScrollView(context) {
            @Override
            protected void onConfigurationChanged(Configuration config) {
                super.onConfigurationChanged(config);
                applyModalWidth(dialog, context);
            }
        };
        scroll.addView(box);
        dialog.setContentView(scroll);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            applyModalWidth(dialog, context);
        }
        return dialog;
    }

    /** A text button whose 40 dp press face sits inside a 48 dp touch target. */
    private TextView dialogButton(Context context, String label, int color) {
        TextView button = text(context, label, 15, color, true);
        button.setGravity(Gravity.CENTER);
        button.setMinHeight(dp(context, 48));
        button.setBackground(new InsetDrawable(pressable(context, 0, 20), 0, dp(context, 4), 0, dp(context, 4)));
        button.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        return button;
    }

    private static void applyModalWidth(Dialog dialog, Context context) {
        Window window = dialog.getWindow();
        if (window == null) return;
        int width = Math.min(context.getResources().getDisplayMetrics().widthPixels
                - dp(context, 32), dp(context, 480));
        window.setLayout(width, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    /** Single-choice list; the current choice is marked, and TalkBack hears each row as a radio button. */
    public void choose(Context context, String title, String[] labels, int selected, IntConsumer pick) {
        LinearLayout list = new LinearLayout(context);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setCollectionInfo(AccessibilityNodeInfo.CollectionInfo.obtain(labels.length, 1, false,
                        AccessibilityNodeInfo.CollectionInfo.SELECTION_MODE_SINGLE));
            }
        });
        Dialog[] holder = new Dialog[1];
        for (int i = 0; i < labels.length; i++) {
            final int index = i;
            final boolean chosen = i == selected;
            LinearLayout row = rowBase(context);
            row.setMinimumHeight(dp(context, 48));
            row.setPadding(dp(context, 4), 0, dp(context, 4), 0);
            row.setBackground(pressable(context, 0, 12));
            ImageView mark = iconView(context, chosen ? Icons.Kind.RADIO_ON : Icons.Kind.RADIO_OFF,
                    chosen ? accent : secondary, 20);
            mark.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(dp(context, 20), dp(context, 20));
            iconLp.rightMargin = dp(context, 14);
            row.addView(mark, iconLp);
            row.addView(text(context, labels[i], 16, text, chosen));
            row.setAccessibilityDelegate(new View.AccessibilityDelegate() {
                @Override
                public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                    super.onInitializeAccessibilityNodeInfo(host, info);
                    info.setClassName("android.widget.RadioButton");
                    info.setCheckable(true);
                    info.setChecked(chosen);
                    info.setCollectionItemInfo(AccessibilityNodeInfo.CollectionItemInfo.obtain(index, 1, 0, 1, false, chosen));
                }
            });
            // A keyboard or D-pad starts on the current choice.
            row.setFocusedByDefault(chosen);
            row.setOnClickListener(v -> {
                pick.accept(index);
                if (holder[0] != null) holder[0].dismiss();
            });
            list.addView(row, matchWidth());
        }
        holder[0] = modal(context, title, null, list, null, (Runnable) null,
                Text.label("キャンセル", "Cancel"));
        show(holder[0], context);
    }

    /** Multi-line editor for word and user lists. */
    public void editLines(Context context, String title, String help, String value, Consumer<String> save) {
        EditText input = new EditText(context);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        input.setFilters(new InputFilter[]{new InputFilter.LengthFilter(8000)});
        input.setMinLines(5);
        input.setMaxLines(12);
        input.setGravity(Gravity.TOP | Gravity.START);
        input.setTextColor(text);
        input.setHintTextColor(secondary);
        input.setText(value);
        input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        input.setPadding(dp(context, 14), dp(context, 12), dp(context, 14), dp(context, 12));
        input.setBackground(field(context));
        Dialog dialog = modal(context, title, help, input, Text.label("保存", "Save"),
                () -> save.accept(input.getText().toString()), Text.label("キャンセル", "Cancel"));
        show(dialog, context);
    }

    // ---- speech ----

    /**
     * What a control now holds, unit included, as TalkBack should say it. Android 11+ keeps it as the
     * control's state and reads each change to the focused control; before that, {@code announce} says it.
     */
    static void setSpokenState(View view, CharSequence state, boolean announce) {
        if (Build.VERSION.SDK_INT >= 30) view.setStateDescription(state);
        else if (announce) view.announceForAccessibility(state);
    }

    static void setSpokenState(View view, CharSequence state) {
        setSpokenState(view, state, false);
    }

    /** A stock SeekBar's node: its range, the standard actions that move it, and its value with the unit. */
    static void describeSlider(View view, AccessibilityNodeInfo info, int rangeType, float min, float max,
                               float value, CharSequence spoken) {
        info.setRangeInfo(AccessibilityNodeInfo.RangeInfo.obtain(rangeType, min, max, value));
        if (view.isEnabled()) {
            if (value > min) info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_BACKWARD);
            if (value < max) info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_FORWARD);
            info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SET_PROGRESS);
        }
        // Before Android 11 there is no state line, so the value joins the name.
        if (Build.VERSION.SDK_INT < 30) {
            CharSequence name = view.getContentDescription();
            info.setContentDescription(TextUtils.isEmpty(name) ? spoken : name + ", " + spoken);
        }
    }

    /** The value TalkBack's "set progress" asks for, or NaN when the action is another one. */
    static float progressArgument(int action, android.os.Bundle arguments) {
        if (action != android.R.id.accessibilityActionSetProgress || arguments == null
                || !arguments.containsKey(AccessibilityNodeInfo.ACTION_ARGUMENT_PROGRESS_VALUE)) return Float.NaN;
        return arguments.getFloat(AccessibilityNodeInfo.ACTION_ARGUMENT_PROGRESS_VALUE);
    }

    // ---- windows ----

    /**
     * Shows a dialog without bringing back system bars that the fullscreen player hid, and
     * without stealing focus during the show transition.
     */
    public static void show(Dialog dialog, Context context) {
        Window window = dialog.getWindow();
        Activity activity = activity(context);
        boolean immersive = activity != null && barsHidden(activity);
        if (window != null && immersive) {
            window.addFlags(WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE);
        }
        dialog.show();
        if (window != null && immersive) {
            hideBars(window);
            window.clearFlags(WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE);
        }
    }

    /** Closes a dialog left over a window that went away or shrank to picture-in-picture. */
    static boolean closeIfGone(Dialog dialog, Context context) {
        Activity activity = activity(context);
        if (activity == null) return false;
        if (!activity.isDestroyed() && !activity.isFinishing() && !activity.isInPictureInPictureMode()) return false;
        if (dialog.isShowing()) dialog.dismiss();
        return true;
    }

    @SuppressWarnings("deprecation")
    private static boolean barsHidden(Activity activity) {
        View decor = activity.getWindow().getDecorView();
        if (Build.VERSION.SDK_INT >= 30) {
            WindowInsets insets = decor.getRootWindowInsets();
            return insets != null && !insets.isVisible(WindowInsets.Type.statusBars());
        }
        return (decor.getSystemUiVisibility() & View.SYSTEM_UI_FLAG_FULLSCREEN) != 0;
    }

    @SuppressWarnings("deprecation")
    private static void hideBars(Window window) {
        if (Build.VERSION.SDK_INT >= 30) {
            WindowInsetsController controller = window.getInsetsController();
            if (controller != null) {
                controller.setSystemBarsBehavior(
                        WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
                controller.hide(WindowInsets.Type.systemBars());
            }
        } else {
            window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_FULLSCREEN
                    | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
                    | View.SYSTEM_UI_FLAG_LAYOUT_STABLE);
        }
    }

    /** Dark icons on a light screen, light icons on a dark one. */
    @SuppressWarnings("deprecation")
    public static void systemBarIcons(Window window, boolean darkBackground) {
        if (Build.VERSION.SDK_INT >= 30) {
            WindowInsetsController controller = window.getInsetsController();
            if (controller == null) return;
            int light = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                    | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
            controller.setSystemBarsAppearance(darkBackground ? 0 : light, light);
        } else {
            View decor = window.getDecorView();
            int flags = View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
            int current = decor.getSystemUiVisibility();
            decor.setSystemUiVisibility(darkBackground ? current & ~flags : current | flags);
        }
    }

    /** Pads a full-window root by the system bar and cutout insets. */
    public static void padForInsets(View root) {
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            int l, t, r, b;
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets i = insets.getInsets(WindowInsets.Type.systemBars()
                        | WindowInsets.Type.displayCutout() | WindowInsets.Type.ime());
                l = i.left;
                t = i.top;
                r = i.right;
                b = i.bottom;
            } else {
                l = insets.getSystemWindowInsetLeft();
                t = insets.getSystemWindowInsetTop();
                r = insets.getSystemWindowInsetRight();
                b = insets.getSystemWindowInsetBottom();
            }
            v.setPadding(l, t, r, b);
            return insets;
        });
    }

    public static FrameLayout.LayoutParams frame(int width, int height, int gravity) {
        return new FrameLayout.LayoutParams(width, height, gravity);
    }
}
