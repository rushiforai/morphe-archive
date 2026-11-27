package app.xposed.extension;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.EditorInfo;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

/**
 * One full-screen page in the style of X's settings: a back arrow, a bold title and rows.
 * Our screens run inside X's activity without resources of their own, so they are built in
 * code; every row is at least 48dp tall and labels its controls for TalkBack.
 */
final class Page {
    static final int DESTRUCTIVE = 0xFFF4212E;
    private static final Glyphs.Glyph BACK = new Glyphs.Glyph(new Glyphs.Layer(
            Glyphs.svg("M7.414 13l5.043 5.04-1.414 1.42L3.586 12l7.457-7.46 1.414 1.42L7.414 11H21v2H7.414z"), false, 0));

    interface Picked {
        void on(String value);
    }

    interface Switched {
        void on(boolean checked);
    }

    interface Checked {
        boolean get();
    }

    interface Typed {
        void on(String text);
    }

    final Context context;
    final Ui ui;
    final Dialog dialog;
    /** The page's rows; inside a ScrollView unless the page was made with its own content. */
    final LinearLayout list;
    private final LinearLayout root;
    /** Where the row builders add: the list, or a group being rebuilt. */
    private LinearLayout target;

    /** A page whose rows scroll. */
    Page(Context context, String title) {
        this(context, title, null);
    }

    /** A page with fixed content instead of a scrolling list, such as a ListView. */
    Page(Context context, String title, View content) {
        this.context = context;
        this.ui = new Ui(context);
        this.dialog = fullScreen(context, ui);
        root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setFitsSystemWindows(true);
        root.addView(bar(title), new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ui.dp(53)));
        list = new LinearLayout(context);
        list.setOrientation(LinearLayout.VERTICAL);
        if (content == null) {
            list.setPadding(0, 0, 0, ui.dp(24));
            ScrollView scroll = new ScrollView(context);
            scroll.addView(list);
            content = scroll;
        }
        target = list;
        root.addView(content, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        dialog.setContentView(root);
    }

    void show() {
        dialog.show();
    }

    void onClose(Runnable r) {
        dialog.setOnDismissListener(d -> r.run());
    }

    /** Puts a view between the title bar and the content, such as a search field. */
    void header(View view) {
        root.addView(view, 1, Ui.matchWidth());
    }

    /** Puts a view below the content, such as an undo bar. */
    void footer(View view) {
        root.addView(view, Ui.matchWidth());
    }

    void clear() {
        list.removeAllViews();
    }

    /** An empty block in the list that can be rebuilt on its own with {@link #into}. */
    LinearLayout group() {
        LinearLayout group = new LinearLayout(context);
        group.setOrientation(LinearLayout.VERTICAL);
        target.addView(group, Ui.matchWidth());
        return group;
    }

    /** Rebuilds a group: clears it and runs the row builders into it. */
    void into(LinearLayout group, Runnable build) {
        LinearLayout previous = target;
        group.removeAllViews();
        target = group;
        try {
            build.run();
        } finally {
            target = previous;
        }
    }

    void add(View view) {
        target.addView(view, Ui.matchWidth());
    }

    TextView section(String title) {
        if (target != list || list.getChildCount() > 0) {
            View gap = ui.divider();
            ((LinearLayout.LayoutParams) gap.getLayoutParams()).topMargin = ui.dp(12);
            target.addView(gap);
        }
        TextView t = ui.text(title, 20, true, ui.text);
        t.setPadding(ui.dp(16), ui.dp(16), ui.dp(16), ui.dp(8));
        t.setAccessibilityHeading(true);
        target.addView(t);
        return t;
    }

    /** Secondary explanatory text. */
    TextView note(CharSequence text) {
        TextView t = ui.text(text, 13, false, ui.secondary);
        t.setPadding(ui.dp(16), ui.dp(4), ui.dp(16), ui.dp(8));
        target.addView(t, Ui.matchWidth());
        return t;
    }

    /** A row: optional icon, title, optional summary, optional widget on the right. */
    LinearLayout row(View icon, CharSequence title, CharSequence summary, View widget, View.OnClickListener onClick) {
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(ui.dp(48));
        row.setPadding(ui.dp(16), ui.dp(12), ui.dp(16), ui.dp(12));
        if (onClick != null) {
            row.setBackground(ui.rowBackground());
            row.setOnClickListener(onClick);
        }
        if (icon != null) {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ui.dp(24),
                    icon instanceof TextView ? ViewGroup.LayoutParams.WRAP_CONTENT : ui.dp(24));
            lp.setMarginEnd(ui.dp(16));
            row.addView(icon, lp);
        }
        LinearLayout texts = new LinearLayout(context);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.addView(ui.text(startAligned(title), 15, false, ui.text));
        if (summary != null) {
            TextView s = ui.text(startAligned(summary), 13, false, ui.secondary);
            s.setPadding(0, ui.dp(2), 0, 0);
            texts.addView(s);
        }
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        if (widget != null) {
            LinearLayout.LayoutParams lp = widget.getLayoutParams() instanceof LinearLayout.LayoutParams
                    ? (LinearLayout.LayoutParams) widget.getLayoutParams()
                    : new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.setMarginStart(ui.dp(16));
            row.addView(widget, lp);
        }
        target.addView(row, Ui.matchWidth());
        return row;
    }

    /**
     * Wraps text that contains right-to-left letters, such as an Arabic language name or a
     * filter term, in a first-strong isolate. The paragraph then takes the default direction,
     * so the line stays at the same edge as its neighbours while the text inside still reads
     * right to left.
     */
    static CharSequence startAligned(CharSequence text) {
        if (!(text instanceof String)) return text;
        for (int i = 0; i < text.length(); i++) {
            byte d = Character.getDirectionality(text.charAt(i));
            if (d == Character.DIRECTIONALITY_RIGHT_TO_LEFT || d == Character.DIRECTIONALITY_RIGHT_TO_LEFT_ARABIC) {
                return "\u2068" + text + "\u2069";
            }
        }
        return text;
    }

    LinearLayout row(CharSequence title, CharSequence summary, View widget, View.OnClickListener onClick) {
        return row(null, title, summary, widget, onClick);
    }

    /** A row that opens another page, with a chevron. */
    LinearLayout link(Glyphs.Glyph icon, CharSequence title, CharSequence summary, View.OnClickListener onClick) {
        return row(icon != null ? icon(icon, ui.text) : null, title, summary, icon(Icons.NEXT, ui.secondary), onClick);
    }

    Toggle toggle(CharSequence title, CharSequence summary, boolean checked, Switched switched) {
        Toggle sw = new Toggle(context, ui, checked);
        sw.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout row = row(title, summary, sw, v -> {
            sw.toggle();
            switched.on(sw.isChecked());
        });
        checkable(row, Switch.class, sw::isChecked);
        return sw;
    }

    /** Lets TalkBack read a row as a switch or checkbox with its state; stateDescription needs API 30. */
    static void checkable(View row, Class<?> role, Checked checked) {
        row.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName(role.getName());
                info.setCheckable(true);
                info.setChecked(checked.get());
            }
        });
    }

    static void checkbox(View row, Checked checked) {
        checkable(row, CheckBox.class, checked);
    }

    /** A row showing the current choice; tapping it offers the others. */
    TextView choice(CharSequence title, CharSequence summary, String[] labels, String[] values, String current, Picked picked) {
        TextView value = ui.text(labelFor(labels, values, current), 15, false, Ui.ACCENT);
        String[] selected = {current};
        row(title, summary, value, v -> pick(title, labels, values, selected[0], p -> {
            selected[0] = p;
            value.setText(labelFor(labels, values, p));
            picked.on(p);
        }));
        return value;
    }

    private static String labelFor(String[] labels, String[] values, String value) {
        for (int i = 0; i < values.length; i++) if (values[i].equals(value)) return labels[i];
        return labels[0];
    }

    /** A small card with one row per option, the current one checked. */
    void pick(CharSequence title, String[] labels, String[] values, String current, Picked picked) {
        Dialog d = new Dialog(context);
        LinearLayout card = card(d, title);
        for (int i = 0; i < labels.length; i++) {
            String value = values[i];
            LinearLayout option = new LinearLayout(context);
            option.setGravity(Gravity.CENTER_VERTICAL);
            option.setMinimumHeight(ui.dp(48));
            option.setPadding(ui.dp(24), ui.dp(14), ui.dp(24), ui.dp(14));
            option.setBackground(ui.rowBackground());
            option.addView(ui.text(labels[i], 15, false, ui.text), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            ImageView check = icon(Icons.CHECK, Ui.ACCENT);
            check.setVisibility(value.equals(current) ? View.VISIBLE : View.INVISIBLE);
            option.addView(check, new LinearLayout.LayoutParams(ui.dp(20), ui.dp(20)));
            option.setSelected(value.equals(current));
            option.setOnClickListener(v -> {
                picked.on(value);
                d.dismiss();
            });
            card.addView(option, Ui.matchWidth());
        }
        d.show();
    }

    /** A small card asking for one number or line of text. */
    void ask(CharSequence title, CharSequence help, String initial, int inputType, Typed typed) {
        Dialog d = new Dialog(context);
        LinearLayout card = card(d, title);
        if (help != null) {
            TextView h = ui.text(help, 13, false, ui.secondary);
            h.setPadding(ui.dp(24), 0, ui.dp(24), ui.dp(8));
            card.addView(h);
        }
        EditText field = field(String.valueOf(title), inputType, null);
        field.setText(initial);
        field.setSelection(field.getText().length());
        LinearLayout.LayoutParams lp = Ui.matchWidth();
        lp.setMargins(ui.dp(24), 0, ui.dp(24), ui.dp(12));
        card.addView(field, lp);
        Runnable done = () -> {
            typed.on(field.getText().toString());
            d.dismiss();
        };
        field.setOnEditorActionListener((v, actionId, event) -> {
            done.run();
            return true;
        });
        LinearLayout buttons = new LinearLayout(context);
        buttons.setGravity(Gravity.END);
        buttons.setPadding(ui.dp(24), 0, ui.dp(24), ui.dp(8));
        buttons.addView(ui.pill("Cancel", false, v -> d.dismiss()));
        TextView save = ui.pill("Save", true, v -> done.run());
        LinearLayout.LayoutParams saveLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        saveLp.setMarginStart(ui.dp(12));
        buttons.addView(save, saveLp);
        card.addView(buttons, Ui.matchWidth());
        d.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_VISIBLE);
        d.show();
        field.requestFocus();
    }

    /** A small card confirming an action that can't be undone; [action] runs only on the red button. */
    void confirm(CharSequence title, CharSequence message, String actionLabel, Runnable action) {
        Dialog d = new Dialog(context);
        LinearLayout card = card(d, title);
        TextView m = ui.text(message, 15, false, ui.secondary);
        m.setPadding(ui.dp(24), 0, ui.dp(24), ui.dp(16));
        card.addView(m);
        LinearLayout buttons = new LinearLayout(context);
        buttons.setGravity(Gravity.END);
        buttons.setPadding(ui.dp(24), 0, ui.dp(24), ui.dp(8));
        buttons.addView(ui.pill("Cancel", false, v -> d.dismiss()));
        TextView go = ui.destructivePill(actionLabel, v -> {
            d.dismiss();
            action.run();
        });
        LinearLayout.LayoutParams goLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        goLp.setMarginStart(ui.dp(12));
        buttons.addView(go, goLp);
        card.addView(buttons, Ui.matchWidth());
        d.show();
    }

    private LinearLayout card(Dialog d, CharSequence title) {
        d.requestWindowFeature(Window.FEATURE_NO_TITLE);
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(0, ui.dp(8), 0, ui.dp(8));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(ui.background);
        bg.setCornerRadius(ui.dp(16));
        card.setBackground(bg);
        TextView t = ui.text(title, 20, true, ui.text);
        t.setPadding(ui.dp(24), ui.dp(16), ui.dp(24), ui.dp(8));
        t.setAccessibilityHeading(true);
        card.addView(t);
        ScrollView scroll = new ScrollView(context);
        scroll.addView(card);
        d.setContentView(scroll);
        Window w = d.getWindow();
        w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        w.setLayout(Math.min(context.getResources().getDisplayMetrics().widthPixels - ui.dp(48), ui.dp(480)),
                ViewGroup.LayoutParams.WRAP_CONTENT);
        return card;
    }

    /** A rounded single-line field in X's style. onDone runs for the keyboard's action key. */
    EditText field(String hint, int inputType, Typed onDone) {
        EditText field = new EditText(context);
        field.setHint(hint);
        field.setHintTextColor(ui.secondary);
        field.setTextColor(ui.text);
        field.setTypeface(ui.regular);
        field.setTextSize(15);
        field.setSingleLine(true);
        field.setInputType(inputType);
        field.setImeOptions(EditorInfo.IME_ACTION_DONE);
        field.setMinHeight(ui.dp(48));
        field.setPadding(ui.dp(16), ui.dp(10), ui.dp(16), ui.dp(10));
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(ui.divider);
        pill.setCornerRadius(ui.dp(24));
        field.setBackground(pill);
        if (onDone != null) {
            field.setOnEditorActionListener((v, actionId, event) -> {
                onDone.on(field.getText().toString());
                return true;
            });
        }
        return field;
    }

    /** A search field above the content; onChange gets the trimmed query. */
    EditText search(String hint, Typed onChange) {
        EditText search = field(hint, InputType.TYPE_CLASS_TEXT, null);
        search.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        search.setOnEditorActionListener((v, actionId, event) -> {
            v.clearFocus();
            return false;
        });
        search.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                onChange.on(s.toString().trim());
            }

            @Override
            public void afterTextChanged(Editable s) {
            }
        });
        LinearLayout box = new LinearLayout(context);
        box.setPadding(ui.dp(16), ui.dp(4), ui.dp(16), ui.dp(8));
        box.addView(search, Ui.matchWidth());
        header(box);
        return search;
    }

    /** A full-width text action, such as "Clear cached accounts" in red. */
    TextView action(CharSequence label, int color, View.OnClickListener onClick) {
        TextView t = ui.text(label, 15, false, color);
        t.setMinHeight(ui.dp(48));
        t.setGravity(Gravity.CENTER_VERTICAL);
        t.setPadding(ui.dp(16), ui.dp(12), ui.dp(16), ui.dp(12));
        t.setBackground(ui.rowBackground());
        t.setOnClickListener(onClick);
        target.addView(t, Ui.matchWidth());
        return t;
    }

    /** A 20dp icon; the drawable has no size of its own. */
    ImageView icon(Glyphs.Glyph glyph, int color) {
        ImageView v = new ImageView(context);
        v.setImageDrawable(glyph.asDrawable(color));
        v.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        v.setLayoutParams(new LinearLayout.LayoutParams(ui.dp(20), ui.dp(20)));
        return v;
    }

    /** A multi-select mark: an outlined box, or a filled box with a check, 24dp like Material's. */
    ImageView checkMark(boolean checked) {
        ImageView v = new ImageView(context);
        v.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        v.setLayoutParams(new LinearLayout.LayoutParams(ui.dp(24), ui.dp(24)));
        setChecked(v, checked);
        return v;
    }

    void setChecked(ImageView mark, boolean checked) {
        GradientDrawable box = new GradientDrawable();
        box.setCornerRadius(ui.dp(3));
        if (checked) {
            box.setColor(Ui.ACCENT);
            LayerDrawable layers = new LayerDrawable(new Drawable[]{box, Icons.CHECK.asDrawable(Color.WHITE)});
            layers.setLayerInset(1, ui.dp(2), ui.dp(2), ui.dp(2), ui.dp(2));
            mark.setImageDrawable(new InsetDrawable(layers, ui.dp(3)));
        } else {
            box.setStroke(ui.dp(2), ui.secondary);
            mark.setImageDrawable(new InsetDrawable(box, ui.dp(3)));
        }
    }

    /** A 48dp icon button, labelled for TalkBack. */
    FrameLayout iconButton(Glyphs.Glyph glyph, int color, String description, View.OnClickListener onClick) {
        FrameLayout button = new FrameLayout(context);
        button.setBackground(ui.rowBackground());
        button.setContentDescription(description);
        button.setOnClickListener(onClick);
        button.addView(icon(glyph, color), new FrameLayout.LayoutParams(ui.dp(20), ui.dp(20), Gravity.CENTER));
        button.setLayoutParams(new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        return button;
    }

    /** An emoji, such as a flag, sized like an icon. */
    TextView emoji(String emoji) {
        TextView t = ui.text(emoji, 18, false, ui.text);
        // An icon: sized in dp like the line icons, so large text doesn't clip it.
        t.setTextSize(TypedValue.COMPLEX_UNIT_DIP, 19);
        t.setGravity(Gravity.CENTER);
        t.setIncludeFontPadding(false);
        t.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return t;
    }

    /** A full-screen dialog painted in X's background, with system bars to match. */
    private static Dialog fullScreen(Context context, Ui ui) {
        Dialog d = new Dialog(context, android.R.style.Theme_DeviceDefault_NoActionBar);
        Window w = d.getWindow();
        w.setBackgroundDrawable(new ColorDrawable(ui.background));
        w.setStatusBarColor(ui.background);
        w.setNavigationBarColor(ui.background);
        // Keep fields and buttons above the keyboard.
        w.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        if (android.os.Build.VERSION.SDK_INT >= 30) {
            int light = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
            w.getDecorView().post(() -> {
                WindowInsetsController c = w.getInsetsController();
                if (c != null) c.setSystemBarsAppearance(ui.dark ? 0 : light, light);
            });
        }
        return d;
    }

    /** X's page chrome: back arrow and a bold title. */
    private View bar(String title) {
        LinearLayout bar = new LinearLayout(context);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPaddingRelative(ui.dp(4), 0, ui.dp(16), 0);
        FrameLayout back = iconButton(BACK, ui.text, "Back", v -> dialog.dismiss());
        bar.addView(back);
        TextView t = ui.text(title, 20, true, ui.text);
        t.setPaddingRelative(ui.dp(20), 0, 0, 0);
        t.setSingleLine(true);
        t.setEllipsize(TextUtils.TruncateAt.END);
        t.setAccessibilityHeading(true);
        bar.addView(t, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        return bar;
    }
}
