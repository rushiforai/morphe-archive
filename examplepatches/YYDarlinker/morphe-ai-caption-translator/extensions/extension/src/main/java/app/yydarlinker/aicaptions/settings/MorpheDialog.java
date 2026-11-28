package app.yydarlinker.aicaptions.settings;

import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Path;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.PathShape;
import android.os.Build;
import android.os.Bundle;
import android.text.Layout;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckedTextView;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;

import static android.view.ViewGroup.LayoutParams.MATCH_PARENT;
import static android.view.ViewGroup.LayoutParams.WRAP_CONTENT;

/** Rounded settings card built with framework views and the active host theme. */
public final class MorpheDialog extends Dialog {
    private final Context host;
    private final Palette palette;
    private final CharSequence title;
    private CharSequence message;
    private View content;
    private CharSequence[] items;
    private int selected = ListView.INVALID_POSITION;
    private RowAction rename, delete;
    private OnClickListener choose;
    private Action negative, neutral, positive, export;
    private boolean diagnostic, secure, fixedPair;

    record RowAction(CharSequence label, OnClickListener click) {}

    private record Action(int id, CharSequence label, OnClickListener click, boolean enabled, boolean dismiss) {}

    public MorpheDialog(Context context, CharSequence title) {
        super(context);
        host = context;
        palette = new Palette(context);
        this.title = title;
    }

    public MorpheDialog setMessage(CharSequence value) {
        message = value;
        return this;
    }

    MorpheDialog setView(View value) {
        content = value;
        return this;
    }

    MorpheDialog setSingleChoiceItems(CharSequence[] values, int checked, OnClickListener listener) {
        items = values;
        selected = checked;
        choose = listener;
        return this;
    }

    MorpheDialog manageChoices(RowAction rename, RowAction delete) {
        this.rename = rename;
        this.delete = delete;
        fixedPair = true;
        return this;
    }

    public MorpheDialog setPositiveButton(CharSequence label, OnClickListener click) {
        positive = new Action(android.R.id.button1, label, click, true, true);
        return this;
    }

    MorpheDialog setNegativeButton(CharSequence label, OnClickListener click) {
        negative = new Action(android.R.id.button2, label, click, true, true);
        return this;
    }

    MorpheDialog setNeutralButton(CharSequence label, OnClickListener click) {
        return setNeutralButton(label, click, true);
    }

    MorpheDialog setNeutralButton(CharSequence label, OnClickListener click, boolean dismiss) {
        neutral = new Action(android.R.id.button3, label, click, true, dismiss);
        return this;
    }

    public MorpheDialog diagnostics(CharSequence log, CharSequence copy, Runnable copyLog,
            CharSequence save, Runnable saveLog, CharSequence clear, Runnable clearLog, CharSequence close) {
        diagnostic = true;
        message = log;
        export = new Action(View.NO_ID, save, keepOpen(saveLog), saveLog != null, false);
        positive = new Action(android.R.id.button1, copy, keepOpen(copyLog), copyLog != null, false);
        return setNeutralButton(clear, keepOpen(clearLog)).setNegativeButton(close, null);
    }

    private static OnClickListener keepOpen(Runnable action) {
        return action == null ? null : (dialog, which) -> action.run();
    }

    void protectContent() {
        secure = true;
    }

    Button button(int id) {
        return findViewById(id);
    }

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        Window window = getWindow();
        window.requestFeature(Window.FEATURE_NO_TITLE);
        window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        if (secure) window.addFlags(WindowManager.LayoutParams.FLAG_SECURE);
        window.setDimAmount(.48f);
        window.setGravity(Gravity.CENTER);
        window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                | WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
        setCanceledOnTouchOutside(true);

        LinearLayout card = column();
        card.setBackground(shape(palette.card, dp(28)));
        card.setPadding(dp(24), dp(16), dp(24), dp(24));
        card.setFocusableInTouchMode(true);
        CaptionTextResolver.direction(card, false);

        TextView heading = label(title, 18);
        heading.setTypeface(Typeface.DEFAULT_BOLD);
        heading.setGravity(Gravity.CENTER);
        heading.setAccessibilityHeading(true);
        heading.setPadding(0, 0, 0, dp(16));
        card.addView(heading);
        if (items != null || message != null || content != null) {
            card.addView(items == null ? scrollBody() : choices(),
                    new LinearLayout.LayoutParams(MATCH_PARENT, items == null ? WRAP_CONTENT : 0, 1));
        }
        if (diagnostic) {
            addFooter(card, true, 16, export);
            addFooter(card, true, 12, neutral, negative, positive);
        } else {
            addFooter(card, fixedPair, 16, neutral, negative, positive);
        }
        setContentView(card);
        card.requestFocus();
    }

    @Override
    public void show() {
        super.show();
        getWindow().setLayout(cardWidth(), WRAP_CONTENT);
    }

    private int cardWidth() {
        var display = host.getResources().getDisplayMetrics();
        int shortSide = Math.min(display.widthPixels, display.heightPixels);
        if (Build.VERSION.SDK_INT >= 30) {
            var bounds = host.getSystemService(WindowManager.class).getCurrentWindowMetrics().getBounds();
            shortSide = Math.min(bounds.width(), bounds.height());
        }
        return (int) (shortSide * .9f);
    }

    private int viewportHeight() {
        if (Build.VERSION.SDK_INT >= 30) {
            var metrics = host.getSystemService(WindowManager.class).getCurrentWindowMetrics();
            var insets = metrics.getWindowInsets().getInsets(
                    WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
            return metrics.getBounds().height() - insets.top - insets.bottom;
        }
        return host.getResources().getDisplayMetrics().heightPixels;
    }

    private ScrollView scrollBody() {
        ScrollView scroll = new ScrollView(host) {
            @Override
            protected void onMeasure(int width, int height) {
                if (diagnostic) {
                    int cap = Math.max(0, (int) (viewportHeight() * .5f));
                    // The parent also shrinks this weighted child to fit the fixed footer.
                    int available = MeasureSpec.getMode(height) == MeasureSpec.UNSPECIFIED
                            ? cap : Math.min(cap, MeasureSpec.getSize(height));
                    int mode = MeasureSpec.getMode(height) == MeasureSpec.EXACTLY
                            ? MeasureSpec.EXACTLY : MeasureSpec.AT_MOST;
                    height = MeasureSpec.makeMeasureSpec(available, mode);
                }
                super.onMeasure(width, height);
            }
        };
        LinearLayout stack = column();
        if (diagnostic) {
            scroll.setBackground(shape(palette.inset, dp(10)));
            scroll.setClipToOutline(true);
            stack.setPadding(dp(8), dp(4), dp(8), dp(4));
            for (String entry : message.toString().split("\\n")) {
                TextView line = label(entry, 12);
                line.setPadding(dp(4), dp(4), dp(4), dp(4));
                line.setTextIsSelectable(true);
                line.setTextDirection(View.TEXT_DIRECTION_FIRST_STRONG_LTR);
                stack.addView(line);
            }
        } else if (message != null) {
            stack.addView(label(message, 16));
        }
        if (content != null) {
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(MATCH_PARENT, WRAP_CONTENT);
            if (message != null) params.topMargin = dp(12);
            stack.addView(content, params);
        }
        scroll.addView(stack, new ScrollView.LayoutParams(MATCH_PARENT, WRAP_CONTENT));
        return scroll;
    }

    private ListView choices() {
        ListView list = new ListView(host);
        list.setDivider(null);
        list.setSelector(new ColorDrawable(Color.TRANSPARENT));
        list.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
        list.setAdapter(new ArrayAdapter<CharSequence>(host, android.R.layout.simple_list_item_1, items) {
            @Override
            public View getView(int position, View recycled, ViewGroup parent) {
                if (rename != null) return profileRow(position, getItem(position), recycled);
                CheckedTextView row = recycled == null ? choiceLabel() : (CheckedTextView) recycled;
                bindChoice(row, position, getItem(position));
                row.setPaddingRelative(0, dp(12), 0, dp(12));
                return row;
            }
        });
        if (selected >= 0) {
            list.setItemChecked(selected, true);
            list.setSelection(selected);
        }
        list.setOnItemClickListener((parent, row, position, id) -> invoke(choose, position));
        return list;
    }

    private CheckedTextView choiceLabel() {
        CheckedTextView row = new CheckedTextView(host);
        TypedValue appearance = new TypedValue();
        if (host.getTheme().resolveAttribute(android.R.attr.textAppearanceListItem, appearance, true)
                && appearance.resourceId != 0) row.setTextAppearance(appearance.resourceId);
        row.setCompoundDrawablePadding(dp(24));
        row.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
        row.setTextColor(palette.ink);
        row.setBackground(ripple(palette.card, palette.ripple, dp(12)));
        return row;
    }

    private void bindChoice(CheckedTextView label, int position, CharSequence name) {
        boolean checked = position == selected;
        label.setText(name);
        label.setChecked(checked);
        label.setCompoundDrawablesRelative(glyph(contours(CHECK), checked ? palette.ink : Color.TRANSPARENT),
                null, null, null);
    }

    private View profileRow(int position, CharSequence name, View recycled) {
        LinearLayout row;
        if (recycled == null) {
            row = new LinearLayout(host);
            row.setBaselineAligned(false);
            row.setGravity(Gravity.CENTER_VERTICAL);
            CheckedTextView label = choiceLabel();
            label.setPaddingRelative(0, dp(12), dp(8), dp(12));
            row.addView(label, new LinearLayout.LayoutParams(0, WRAP_CONTENT, 1));
            label.setSingleLine(true);
            label.setEllipsize(TextUtils.TruncateAt.END);
            row.addView(icon(rename, renamePath()), new LinearLayout.LayoutParams(dp(40), dp(40)));
            if (delete != null)
                row.addView(icon(delete, deletePath()), new LinearLayout.LayoutParams(dp(40), dp(40)));
        } else row = (LinearLayout) recycled;
        CheckedTextView label = (CheckedTextView) row.getChildAt(0);
        bindChoice(label, position, name);
        label.setOnClickListener(view -> invoke(choose, position));
        row.getChildAt(1).setOnClickListener(view -> invoke(rename.click(), position));
        if (delete != null) row.getChildAt(2).setOnClickListener(view -> invoke(delete.click(), position));
        return row;
    }

    private ImageButton icon(RowAction action, Path path) {
        ImageButton button = new ImageButton(host, null, 0);
        button.setContentDescription(action.label());
        button.setImageDrawable(glyph(path, palette.ink));
        button.setPadding(dp(8), dp(8), dp(8), dp(8));
        button.setScaleType(ImageView.ScaleType.FIT_CENTER);
        button.setBackground(ripple(palette.card, palette.ripple, dp(20)));
        return button;
    }

    private void invoke(OnClickListener listener, int position) {
        dismiss();
        listener.onClick(this, position);
    }

    // Morphe's filled morphe_settings_custom_checkmark, in its original 24-unit viewport.
    private static final float[][] CHECK = {{9.29446f, 19, 3.4f, 12.708f, 4.24339f, 11.8029f,
            9.29446f, 17.1896f, 20.1565f, 5.6f, 21, 6.50026f}};
    // Material Symbols Outlined edit (weight 200), Copyright 2022 Google, Apache-2.0.
    // Adapted from Morphe's morphe_sb_edit.xml by dropping the animation and restoring the 24-unit viewport.
    private static Path renamePath() {
        Path path = new Path();
        path.moveTo(6.25f, 23.75f);
        path.lineTo(7.62109f, 23.75f);
        path.lineTo(20.9961f, 10.3789f);
        path.lineTo(19.6211f, 9.00391f);
        path.lineTo(6.25f, 22.3789f);
        path.close();
        path.moveTo(5, 25);
        path.lineTo(5, 21.8516f);
        path.lineTo(21.4766f, 5.35938f);
        path.cubicTo(21.6055f, 5.24219f, 21.7461f, 5.15625f, 21.8984f, 5.09375f);
        path.cubicTo(22.0547f, 5.03125f, 22.2148f, 5, 22.3828f, 5);
        path.cubicTo(22.5508f, 5, 22.7148f, 5.02734f, 22.8711f, 5.07813f);
        path.cubicTo(23.0313f, 5.13281f, 23.1758f, 5.22656f, 23.3086f, 5.36719f);
        path.lineTo(24.6406f, 6.70703f);
        path.cubicTo(24.7813f, 6.83984f, 24.875f, 6.98438f, 24.9258f, 7.14453f);
        path.cubicTo(24.9766f, 7.30469f, 25, 7.46094f, 25, 7.62109f);
        path.cubicTo(25, 7.78906f, 24.9727f, 7.95313f, 24.9141f, 8.10547f);
        path.cubicTo(24.8555f, 8.26172f, 24.7656f, 8.40234f, 24.6406f, 8.53125f);
        path.lineTo(8.14844f, 25);
        path.close();
        Matrix scale = new Matrix();
        scale.setScale(.8f, .8f);
        path.transform(scale);
        return path;
    }

    // morphe_settings_search_remove.xml, mapped directly from its original vector path.
    private static Path deletePath() {
        Path path = new Path();
        path.moveTo(7.61719f, 20);
        path.cubicTo(7.16797f, 20, 6.78516f, 19.8438f, 6.47266f, 19.5273f);
        path.cubicTo(6.15625f, 19.2148f, 6, 18.832f, 6, 18.3828f);
        path.lineTo(6, 6);
        path.lineTo(5, 6);
        path.lineTo(5, 5);
        path.lineTo(9, 5);
        path.lineTo(9, 4.23047f);
        path.lineTo(15, 4.23047f);
        path.lineTo(15, 5);
        path.lineTo(19, 5);
        path.lineTo(19, 6);
        path.lineTo(18, 6);
        path.lineTo(18, 18.3828f);
        path.cubicTo(18, 18.8438f, 17.8477f, 19.2305f, 17.5391f, 19.5391f);
        path.cubicTo(17.2305f, 19.8477f, 16.8438f, 20, 16.3828f, 20);
        path.close();
        path.moveTo(17, 6);
        path.lineTo(7, 6);
        path.lineTo(7, 18.3828f);
        path.cubicTo(7, 18.5625f, 7.05859f, 18.7109f, 7.17188f, 18.8281f);
        path.cubicTo(7.28906f, 18.9414f, 7.4375f, 19, 7.61719f, 19);
        path.lineTo(16.3828f, 19);
        path.cubicTo(16.5391f, 19, 16.6797f, 18.9375f, 16.8086f, 18.8086f);
        path.cubicTo(16.9375f, 18.6797f, 17, 18.5391f, 17, 18.3828f);
        path.close();
        path.addRect(9.80859f, 8, 10.8086f, 17, Path.Direction.CCW);
        path.addRect(13.1914f, 8, 14.1914f, 17, Path.Direction.CCW);
        return path;
    }

    private static Path contours(float[][] geometry) {
        Path path = new Path();
        path.setFillType(Path.FillType.EVEN_ODD);
        for (float[] contour : geometry) {
            path.moveTo(contour[0], contour[1]);
            for (int i = 2; i < contour.length; i += 2) path.lineTo(contour[i], contour[i + 1]);
            path.close();
        }
        return path;
    }

    private Drawable glyph(Path path, int color) {
        ShapeDrawable mark = new ShapeDrawable(new PathShape(path, 24, 24));
        mark.getPaint().setColor(color);
        mark.setIntrinsicWidth(dp(24));
        mark.setIntrinsicHeight(dp(24));
        mark.setBounds(0, 0, dp(24), dp(24));
        return mark;
    }

    private void addFooter(LinearLayout card, boolean fixed, int top, Action... actions) {
        java.util.ArrayList<Button> buttons = new java.util.ArrayList<>();
        int natural = 0;
        for (Action action : actions) {
            if (action == null) continue;
            Button button = actionButton(action);
            buttons.add(button);
            natural += naturalWidth(button);
        }
        int count = buttons.size();
        if (count == 0) return;
        int gap = dp(8);
        boolean stack = count > 1 && !fixed && natural + gap * (count - 1) > cardWidth() - dp(24) * 2;
        LinearLayout footer = new LinearLayout(host);
        footer.setLayoutDirection(View.LAYOUT_DIRECTION_LTR);
        footer.setBaselineAligned(false);
        footer.setOrientation(stack ? LinearLayout.VERTICAL : LinearLayout.HORIZONTAL);
        for (int i = 0; i < count; i++) {
            Button button = buttons.get(stack ? count - i - 1 : i);
            LinearLayout.LayoutParams buttonParams;
            if (stack || count == 1) {
                if (i > 0) footer.addView(new View(host), new LinearLayout.LayoutParams(MATCH_PARENT, gap));
                buttonParams = new LinearLayout.LayoutParams(MATCH_PARENT, dp(36));
            } else {
                buttonParams = new LinearLayout.LayoutParams(0, dp(36), fixed ? 1 : naturalWidth(button));
                buttonParams.leftMargin = i == 0 ? 0 : gap / 2;
                buttonParams.rightMargin = i == count - 1 ? 0 : gap - gap / 2;
            }
            footer.addView(button, buttonParams);
        }
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(MATCH_PARENT, WRAP_CONTENT);
        params.topMargin = dp(top);
        card.addView(footer, params);
    }

    private int naturalWidth(Button button) {
        return (int) Math.ceil(Layout.getDesiredWidth(button.getText(), button.getPaint()))
                + button.getPaddingLeft() + button.getPaddingRight();
    }

    private Button actionButton(Action action) {
        Button button = new Button(host, null, 0);
        button.setId(action.id());
        button.setAllCaps(false);
        button.setText(action.label());
        button.setTextSize(14);
        button.setSingleLine(true);
        button.setEllipsize(TextUtils.TruncateAt.END);
        button.setGravity(Gravity.CENTER);
        button.setMinHeight(0);
        button.setMinimumHeight(0);
        button.setMinimumWidth(0);
        button.setMinWidth(0);
        button.setStateListAnimator(null);
        button.setBackgroundTintList(null);
        boolean primary = action == positive;
        button.setTextColor(primary ? palette.onPrimary : palette.ink);
        button.setBackground(ripple(primary ? palette.ink : palette.secondary,
                primary ? palette.onPrimary & 0x22ffffff : palette.ripple, dp(20)));
        button.setPadding(dp(8), 0, dp(8), 0);
        button.setEnabled(action.enabled());
        if (!action.enabled()) button.setAlpha(.5f);
        button.setOnClickListener(view -> {
            if (action.dismiss()) dismiss();
            if (action.click() != null) action.click().onClick(this, action.id());
        });
        return button;
    }

    static void styleInput(EditText field) {
        Palette colors = new Palette(field.getContext());
        float density = field.getResources().getDisplayMetrics().density;
        int padding = Math.round(8 * density);
        field.setTextSize(16);
        field.setTextColor(colors.ink);
        field.setHintTextColor(colors.muted);
        field.setHighlightColor(colors.ripple);
        field.setBackgroundTintList(null);
        field.setBackground(shape(colors.inset, Math.round(10 * density)));
        field.setClipToOutline(true);
        field.setPaddingRelative(padding, padding, padding, padding);
        if (Build.VERSION.SDK_INT >= 29) {
            Drawable cursor = field.getTextCursorDrawable();
            if (cursor != null) {
                cursor = cursor.mutate();
                cursor.setTint(colors.ink);
                field.setTextCursorDrawable(cursor);
            }
        }
    }

    static void styleSlider(SeekBar slider, TextView value) {
        Palette colors = new Palette(slider.getContext());
        var accent = new TypedValue();
        var theme = slider.getContext().getTheme();
        int color = colors.ink;
        if (theme.resolveAttribute(android.R.attr.colorAccent, accent, true)) {
            color = accent.resourceId == 0 ? accent.data : slider.getContext().getColor(accent.resourceId);
        }
        value.setTextColor(color);
        slider.setThumbTintList(ColorStateList.valueOf(color));
        slider.setProgressTintList(ColorStateList.valueOf(color));
        slider.setProgressBackgroundTintList(ColorStateList.valueOf(colors.track));
    }

    private LinearLayout column() {
        LinearLayout layout = new LinearLayout(host);
        layout.setOrientation(LinearLayout.VERTICAL);
        return layout;
    }

    private TextView label(CharSequence text, int sp) {
        TextView label = new TextView(host);
        label.setText(text);
        label.setTextSize(sp);
        label.setTextColor(palette.ink);
        return label;
    }

    private int dp(int value) {
        return Math.round(value * host.getResources().getDisplayMetrics().density);
    }

    private static GradientDrawable shape(int color, int radius) {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(color);
        shape.setCornerRadius(radius);
        return shape;
    }

    private static RippleDrawable ripple(int fill, int highlight, int radius) {
        return new RippleDrawable(ColorStateList.valueOf(highlight), shape(fill, radius), null);
    }

    private static final class Palette {
        final int card, ink, onPrimary, secondary, inset, muted, track, ripple;

        Palette(Context host) {
            boolean dark = (host.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;
            var attrs = host.obtainStyledAttributes(new int[] {android.R.attr.colorBackground});
            try {
                int background = attrs.getColor(0, dark ? Color.BLACK : Color.WHITE);
                if (Color.alpha(background) == 255) dark = Color.luminance(background) < .35f;
            } finally {
                attrs.recycle();
            }
            card = dark ? 0xff0f0f0f : Color.WHITE;
            ink = dark ? Color.WHITE : Color.BLACK;
            onPrimary = dark ? Color.BLACK : Color.WHITE;
            secondary = dark ? 0xff252525 : 0xfff2f2f2;
            inset = dark ? 0xff1a1a1a : 0xfff7f7f7;
            muted = dark ? 0xffb8b8b8 : 0xff555555;
            track = dark ? 0xff767676 : 0xff909090;
            ripple = dark ? 0x22ffffff : 0x22000000;
        }
    }
}
