package app.jimaku.extension.ui;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.GradientDrawable;
import android.text.Editable;
import android.text.InputType;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.style.LocaleSpan;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.Locale;
import java.util.function.Consumer;

import app.jimaku.extension.Guard;

/**
 * The rows of Jimaku's sheets, in the measures of YouTube's player sheets: 48 dp high, a 24 dp
 * icon 16 dp in, the label 52 dp in at 16 sp, a value in the secondary colour at the row's end.
 */
public final class Rows {
    private static final Typeface MEDIUM = Typeface.create("sans-serif-medium", Typeface.NORMAL);
    private static final Typeface REGULAR = Typeface.create("sans-serif", Typeface.NORMAL);

    private Rows() {
    }

    /**
     * A language as the extension's menu has it: the check-mark column, its name in its own language,
     * at the end what a press costs or its step while it is made, and the sparkle after that for a
     * Premium version.
     */
    public static View language(Context context, Theme theme, String name, String lang, String value, boolean checked,
                                boolean premium, String premiumName, Runnable press) {
        LinearLayout row = row(context, theme, press);
        row.addView(new IconView(context, theme, checked ? Icons.CHECK : null, theme.text, 24), iconParams(theme));
        TextView label = label(context, theme, name);
        label.setTextLocale(Locale.forLanguageTag(lang));
        row.addView(label, labelParams());
        if (!value.isEmpty()) {
            TextView shown = secondary(context, theme, value);
            shown.setFontFeatureSettings("tnum");
            shown.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.setMarginStart(theme.dp(16));
            row.addView(shown, params);
        }
        if (premium) {
            IconView spark = new IconView(context, theme, Icons.SPARKLE, theme.secondary, 14);
            spark.setContentDescription(premiumName);
            spark.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(theme.dp(14), theme.dp(14));
            params.setMarginStart(theme.dp(value.isEmpty() ? 8 : 5));
            row.addView(spark, params);
        }
        StringBuilder described = new StringBuilder(name);
        if (!value.isEmpty()) described.append(", ").append(value);
        if (premium) described.append(", ").append(premiumName);
        row.setContentDescription(inLanguage(described.toString(), name.length(), lang));
        row.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName("android.widget.RadioButton");
                info.setCheckable(true);
                info.setChecked(checked);
            }
        });
        return row;
    }

    /**
     * A language's row asking its question in place: the question where its value was, then ✕ and ✓
     * as round 40 dp buttons in the style of Settings' − and +, ✓ filled as YouTube fills the button
     * that goes ahead. TalkBack reads the question as "German: Generate?". With {@code announce} the
     * question is announced once it shows, and TalkBack's focus moves to ✕, named Cancel; ✓ is named
     * by what it does.
     */
    public static View question(Context context, Theme theme, String name, String lang, String question, String described,
                                String cancel, String yes, boolean announce, Runnable onCancel, Runnable onYes) {
        LinearLayout row = row(context, theme, null);
        row.setPaddingRelative(theme.dp(16), 0, theme.dp(12), 0);
        row.setBackgroundColor(theme.asking);
        row.addView(new IconView(context, theme, null, theme.text, 24), iconParams(theme));
        TextView label = label(context, theme, name);
        label.setTextLocale(Locale.forLanguageTag(lang));
        row.addView(label, labelParams());
        TextView asked = secondary(context, theme, announce ? "" : question);
        asked.setTextColor(theme.text);
        asked.setContentDescription(inLanguage(described, name.length(), lang));
        LinearLayout.LayoutParams askedParams = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        askedParams.setMarginStart(theme.dp(16));
        row.addView(asked, askedParams);
        RoundButton no = new RoundButton(context, theme, RoundButton.CROSS, false, true, cancel, onCancel);
        no.setTag(ASK_CANCEL);
        LinearLayout.LayoutParams noParams = roundParams(theme);
        noParams.setMarginStart(theme.dp(12));
        row.addView(no, noParams);
        LinearLayout.LayoutParams yesParams = roundParams(theme);
        yesParams.setMarginStart(theme.dp(8));
        row.addView(new RoundButton(context, theme, RoundButton.CHECK, true, true, yes, onYes), yesParams);
        if (announce) {
            // Set once the row is on screen, so the question's own live region announces it.
            asked.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
            row.post(() -> Guard.run("question shown", () -> {
                asked.setText(question);
                if (no.isShown()) no.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null);
            }));
        }
        return row;
    }

    /** Moves TalkBack's focus to {@code view} once it is on screen, as ✕ hands it back to the row that asked. */
    public static void focusWhenShown(View view) {
        view.post(() -> Guard.run("row focus", () -> {
            if (view.isShown()) view.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null);
        }));
    }

    /** The one line in place of the languages where there is nothing to list or make, wrapping within the sheet. */
    public static View note(Context context, Theme theme, String text) {
        TextView note = new TextView(context);
        note.setText(text);
        note.setTextColor(theme.text);
        note.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        note.setTypeface(REGULAR);
        note.setPaddingRelative(theme.dp(16), theme.dp(14), theme.dp(16), theme.dp(14));
        note.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return note;
    }

    /** The tag of a question's ✕, by which the menu finds it again. */
    public static final String ASK_CANCEL = "ask:no";

    /**
     * Other languages' line above its list, in the secondary colour where the labels start: the mode
     * and what a language costs, or that no language matches the search.
     */
    public static View listCaption(Context context, Theme theme, String text) {
        TextView caption = secondary(context, theme, text);
        caption.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        caption.setSingleLine(false);
        caption.setMinHeight(theme.dp(36));
        caption.setPaddingRelative(theme.dp(52), theme.dp(8), theme.dp(16), theme.dp(4));
        caption.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return caption;
    }

    /**
     * A search field in the style of YouTube's own: a 40 dp pill in the round buttons' grey, its
     * magnifier in the secondary colour, the words in the text colour. It takes the keyboard only
     * when tapped; {@code typed} hears each change.
     */
    public static EditText search(Context context, Theme theme, String hint, Consumer<String> typed) {
        EditText field = new EditText(context);
        field.setHint(hint);
        field.setHintTextColor(theme.secondary);
        field.setTextColor(theme.text);
        field.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        field.setTypeface(REGULAR);
        field.setSingleLine(true);
        field.setImeOptions(EditorInfo.IME_ACTION_SEARCH | EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(theme.roundButton);
        pill.setCornerRadius(theme.dp(20));
        field.setBackground(pill);
        field.setPaddingRelative(theme.dp(44), 0, theme.dp(16), 0);
        field.setGravity(Gravity.CENTER_VERTICAL);
        field.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence text, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence text, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable text) {
                Guard.run("search", () -> typed.accept(text.toString()));
            }
        });
        return field;
    }

    /** The search field in its row, 16 dp in from the sheet's sides, its magnifier over the pill's start. */
    public static View searchRow(Context context, Theme theme, EditText field) {
        FrameLayout row = new FrameLayout(context);
        row.setPaddingRelative(theme.dp(16), theme.dp(4), theme.dp(16), theme.dp(4));
        row.addView(field, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, theme.dp(40)));
        IconView glass = new IconView(context, theme, Icons.SEARCH, theme.secondary, 20);
        FrameLayout.LayoutParams glassParams = new FrameLayout.LayoutParams(theme.dp(20), theme.dp(20), Gravity.CENTER_VERTICAL | Gravity.START);
        glassParams.setMarginStart(theme.dp(14));
        row.addView(glass, glassParams);
        row.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return row;
    }

    /** {@code text} with its first {@code length} characters marked as {@code lang}, so TalkBack reads a language's name in its own language. */
    private static CharSequence inLanguage(String text, int length, String lang) {
        SpannableString marked = new SpannableString(text);
        marked.setSpan(new LocaleSpan(Locale.forLanguageTag(lang)), 0, Math.min(length, text.length()), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return marked;
    }

    /** A row with an icon, a label and YouTube's switch at its end. */
    public static View toggle(Context context, Theme theme, Icons.Icon icon, String label, boolean on, boolean enabled,
                              Runnable press) {
        LinearLayout row = row(context, theme, press);
        row.addView(new IconView(context, theme, icon, theme.text, 24), iconParams(theme));
        row.addView(label(context, theme, label), labelParams());
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(theme.dp(40), theme.dp(24));
        params.setMarginStart(theme.dp(16));
        row.addView(new SwitchView(context, theme, on && enabled), params);
        if (!enabled) row.setAlpha(theme.disabledAlpha / 255f);
        row.setContentDescription(label);
        row.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName("android.widget.Switch");
                info.setCheckable(true);
                info.setChecked(on && enabled);
                info.setEnabled(enabled);
            }
        });
        return row;
    }

    /**
     * The menu's top row signed in, as the extension's: the sparkle, Premium, the minutes left or
     * "Standard, free" beside YouTube's switch, which the whole row flips.
     */
    public static View premium(Context context, Theme theme, String label, String value, boolean on, Runnable press) {
        LinearLayout row = row(context, theme, press);
        row.addView(new IconView(context, theme, Icons.SPARKLE, theme.text, 20), iconParams(theme));
        row.addView(label(context, theme, label), labelParams());
        if (!value.isEmpty()) row.addView(value(context, theme, value), valueParams(theme));
        row.addView(new SwitchView(context, theme, on), switchParams(theme));
        row.setContentDescription(value.isEmpty() ? label : label + ", " + value);
        row.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName("android.widget.Switch");
                info.setCheckable(true);
                info.setChecked(on);
            }
        });
        return row;
    }

    /**
     * The top row signed out, as the extension's: Premium, a Sign in pill and the switch greyed out,
     * which TalkBack names {@code switchName} and reads as off and unavailable.
     */
    public static View signedOut(Context context, Theme theme, String label, String pill, String switchName, Runnable signIn) {
        LinearLayout row = row(context, theme, null);
        row.addView(new IconView(context, theme, Icons.SPARKLE, theme.text, 20), iconParams(theme));
        TextView name = label(context, theme, label);
        name.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
        row.addView(name, labelParams());
        TextView button = new TextView(context);
        button.setText(pill);
        button.setTextColor(theme.text);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        button.setTypeface(MEDIUM);
        button.setGravity(Gravity.CENTER);
        button.setPadding(theme.dp(14), 0, theme.dp(14), 0);
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(theme.roundButton);
        shape.setCornerRadius(theme.dp(16));
        button.setBackground(new RippleDrawable(ColorStateList.valueOf(theme.pressed), shape, null));
        button.setOnClickListener(v -> Guard.run("menu press", signIn));
        readAsButton(button);
        LinearLayout.LayoutParams pillParams = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, theme.dp(32));
        pillParams.setMarginStart(theme.dp(16));
        row.addView(button, pillParams);
        SwitchView off = new SwitchView(context, theme, false);
        off.setAlpha(theme.disabledAlpha / 255f);
        off.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
        off.setFocusable(true);
        off.setContentDescription(switchName);
        off.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName("android.widget.Switch");
                info.setCheckable(true);
                info.setChecked(false);
                info.setEnabled(false);
            }
        });
        row.addView(off, switchParams(theme));
        return row;
    }

    /** A row that reads a label and a value, as Account's minutes. */
    public static View labelled(Context context, Theme theme, String label, String value) {
        LinearLayout row = row(context, theme, null);
        row.addView(label(context, theme, label), labelParams());
        row.addView(value(context, theme, value), valueParams(theme));
        row.setFocusable(true);
        row.setContentDescription(label + ", " + value);
        return row;
    }

    /** A row that does one thing when pressed, as Account's amounts and Sign out; greyed out while it can't. */
    public static View action(Context context, Theme theme, String label, boolean enabled, Runnable press) {
        LinearLayout row = row(context, theme, enabled ? press : null);
        row.addView(label(context, theme, label), labelParams());
        if (!enabled) row.setAlpha(theme.disabledAlpha / 255f);
        row.setContentDescription(label);
        row.setEnabled(enabled);
        readAsButton(row);
        return row;
    }

    /** Words under a group of rows in the secondary colour, wrapping, as Account's rate. */
    public static View footnote(Context context, Theme theme, String text) {
        TextView note = secondary(context, theme, text);
        note.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        note.setSingleLine(false);
        note.setPaddingRelative(theme.dp(16), theme.dp(4), theme.dp(16), theme.dp(12));
        note.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return note;
    }

    private static TextView value(Context context, Theme theme, String text) {
        TextView shown = secondary(context, theme, text);
        shown.setFontFeatureSettings("tnum");
        shown.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return shown;
    }

    private static LinearLayout.LayoutParams valueParams(Theme theme) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.setMarginStart(theme.dp(16));
        return params;
    }

    private static LinearLayout.LayoutParams switchParams(Theme theme) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(theme.dp(40), theme.dp(24));
        params.setMarginStart(theme.dp(16));
        return params;
    }

    /**
     * A row that opens a second sheet: an icon, a label and YouTube's chevron, 24 dp as on its More
     * row, which has no value before it.
     */
    public static View submenu(Context context, Theme theme, Icons.Icon icon, String label, Runnable press) {
        LinearLayout row = row(context, theme, press);
        row.addView(new IconView(context, theme, icon, theme.text, 24), iconParams(theme));
        row.addView(label(context, theme, label), labelParams());
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(theme.dp(24), theme.dp(24));
        params.setMarginStart(theme.dp(16));
        row.addView(new IconView(context, theme, Icons.NEXT, theme.text, 24), params);
        row.setContentDescription(label);
        readAsButton(row);
        return row;
    }

    /** A setting stepped with YouTube's round − and +, its value between them in a fixed width. */
    public static View stepper(Context context, Theme theme, String label, String value, String decrease,
                               String increase, boolean canDecrease, boolean canIncrease,
                               Runnable down, Runnable up) {
        LinearLayout row = row(context, theme, null);
        row.setPaddingRelative(theme.dp(16), 0, theme.dp(12), 0);
        row.addView(label(context, theme, label), labelParams());
        row.addView(new RoundButton(context, theme, RoundButton.MINUS, false, canDecrease, decrease, down), roundParams(theme));
        TextView shown = new TextView(context);
        shown.setText(value);
        shown.setTextColor(theme.text);
        shown.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        shown.setTypeface(REGULAR);
        shown.setGravity(Gravity.CENTER);
        shown.setFontFeatureSettings("tnum");
        row.addView(shown, new LinearLayout.LayoutParams(theme.dp(72), ViewGroup.LayoutParams.MATCH_PARENT));
        row.addView(new RoundButton(context, theme, RoundButton.PLUS, false, canIncrease, increase, up), roundParams(theme));
        return row;
    }

    /** A setting that reads a state and carries one text button, as Position with Reset. */
    public static View withAction(Context context, Theme theme, String label, String value, String action,
                                  boolean actionEnabled, Runnable press) {
        LinearLayout row = row(context, theme, null);
        row.setPaddingRelative(theme.dp(16), 0, theme.dp(8), 0);
        row.addView(label(context, theme, label), labelParams());
        TextView shown = secondary(context, theme, value);
        row.addView(shown, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.MATCH_PARENT));
        row.addView(textButton(context, theme, action, actionEnabled, press),
                new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.MATCH_PARENT));
        return row;
    }

    /** A second sheet's title row, as YouTube's Captions sheet has it, with an optional text button at its end. */
    public static View title(Context context, Theme theme, String title, String action, boolean actionEnabled,
                             Runnable press) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(theme.dp(48));
        row.setPaddingRelative(theme.dp(16), 0, theme.dp(8), 0);
        TextView text = new TextView(context);
        text.setText(title);
        text.setTextColor(theme.text);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        text.setTypeface(REGULAR);
        text.setAccessibilityHeading(true);
        row.addView(text, labelParams());
        if (action != null) {
            row.addView(textButton(context, theme, action, actionEnabled, press),
                    new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, theme.dp(48)));
        }
        return row;
    }

    /** YouTube's 1 dp divider across the sheet. */
    public static View divider(Context context, Theme theme) {
        View line = new View(context);
        line.setBackgroundColor(theme.divider);
        line.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, theme.dp(1))));
        line.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return line;
    }

    /** A group's caption above its rows, in the secondary colour, as the extension's Settings has "Size". */
    public static View caption(Context context, Theme theme, String text) {
        TextView caption = secondary(context, theme, text);
        caption.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        caption.setMinHeight(theme.dp(36));
        caption.setPaddingRelative(theme.dp(16), theme.dp(8), theme.dp(16), 0);
        caption.setAccessibilityHeading(true);
        caption.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return caption;
    }

    /** Empty space between groups of rows. */
    public static View space(Context context, Theme theme, float dp) {
        View space = new View(context);
        space.setLayoutParams(new LinearLayout.LayoutParams(1, theme.dp(dp)));
        space.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return space;
    }

    private static LinearLayout row(Context context, Theme theme, Runnable press) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(theme.dp(48));
        row.setPaddingRelative(theme.dp(16), 0, theme.dp(16), 0);
        row.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        if (press != null) {
            row.setBackground(ripple(theme, new ColorDrawable(Color.WHITE)));
            row.setOnClickListener(v -> Guard.run("menu press", press));
        }
        return row;
    }

    private static Drawable ripple(Theme theme, Drawable mask) {
        return new RippleDrawable(ColorStateList.valueOf(theme.pressed), null, mask);
    }

    private static TextView label(Context context, Theme theme, String text) {
        TextView label = new TextView(context);
        label.setText(text);
        label.setTextColor(theme.text);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        label.setTypeface(MEDIUM);
        label.setSingleLine(true);
        label.setEllipsize(TextUtils.TruncateAt.END);
        label.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return label;
    }

    private static TextView secondary(Context context, Theme theme, String text) {
        TextView value = new TextView(context);
        value.setText(text);
        value.setTextColor(theme.secondary);
        value.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        value.setTypeface(REGULAR);
        value.setGravity(Gravity.CENTER_VERTICAL);
        value.setSingleLine(true);
        return value;
    }

    private static TextView textButton(Context context, Theme theme, String text, boolean enabled, Runnable press) {
        TextView button = new TextView(context);
        button.setText(text);
        button.setTextColor(theme.link);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        button.setTypeface(MEDIUM);
        button.setGravity(Gravity.CENTER);
        button.setPadding(theme.dp(12), 0, theme.dp(12), 0);
        button.setEnabled(enabled);
        button.setAlpha(enabled ? 1f : theme.disabledAlpha / 255f);
        if (enabled && press != null) {
            button.setBackground(ripple(theme, new ColorDrawable(Color.WHITE)));
            button.setOnClickListener(v -> Guard.run("menu press", press));
        }
        readAsButton(button);
        return button;
    }

    /** TalkBack reads {@code view} as a button, as it reads the rows and buttons of YouTube's sheets. */
    private static void readAsButton(View view) {
        view.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName("android.widget.Button");
            }
        });
    }

    private static LinearLayout.LayoutParams iconParams(Theme theme) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(theme.dp(24), theme.dp(24));
        params.setMarginEnd(theme.dp(12));
        return params;
    }

    private static LinearLayout.LayoutParams labelParams() {
        return new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
    }

    private static LinearLayout.LayoutParams roundParams(Theme theme) {
        return new LinearLayout.LayoutParams(theme.dp(40), theme.dp(40));
    }

    /** One icon in a square, in one colour. */
    static final class IconView extends View {
        private final Icons.Icon icon;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float sizeDp;
        private final Theme theme;

        IconView(Context context, Theme theme, Icons.Icon icon, int color, float sizeDp) {
            super(context);
            this.icon = icon;
            this.theme = theme;
            this.sizeDp = sizeDp;
            paint.setColor(color);
            setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            if (icon == null) return;
            float size = theme.dp(sizeDp);
            Icons.draw(canvas, icon, (getWidth() - size) / 2f, (getHeight() - size) / 2f, size, paint);
        }
    }

    /** YouTube's switch: a 40 × 24 dp track with its knob at the start when off and at the end when on. */
    static final class SwitchView extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Theme theme;
        private final boolean on;
        private final RectF track = new RectF();

        SwitchView(Context context, Theme theme, boolean on) {
            super(context);
            this.theme = theme;
            this.on = on;
            setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float h = getHeight();
            track.set(0, 0, getWidth(), h);
            paint.setColor(on ? theme.switchOnTrack : theme.switchOffTrack);
            canvas.drawRoundRect(track, h / 2, h / 2, paint);
            float inset = theme.dp(2);
            float radius = h / 2 - inset;
            float cx = on ? getWidth() - inset - radius : inset + radius;
            paint.setColor(theme.switchKnob);
            canvas.drawCircle(cx, h / 2, radius, paint);
        }
    }

    /**
     * One of YouTube's round − and + buttons, or a question's ✕ and ✓: a 40 dp circle, greyed out where
     * it can't step further. {@code filled} draws it in the text colour with its glyph in the sheet's.
     */
    static final class RoundButton extends View {
        static final int MINUS = 0, PLUS = 1, CROSS = 2, CHECK = 3;

        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Theme theme;
        private final int glyph;
        private final boolean filled;

        RoundButton(Context context, Theme theme, int glyph, boolean filled, boolean enabled, String name, Runnable press) {
            super(context);
            this.theme = theme;
            this.glyph = glyph;
            this.filled = filled;
            setEnabled(enabled);
            setContentDescription(name);
            readAsButton(this);
            if (enabled) {
                setOnClickListener(v -> Guard.run("menu press", press));
                setBackground(new RippleDrawable(ColorStateList.valueOf(filled ? theme.pressedOnText : theme.pressed), null, null));
            } else {
                setAlpha(theme.disabledAlpha / 255f);
            }
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float cx = getWidth() / 2f, cy = getHeight() / 2f;
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(filled ? theme.text : theme.roundButton);
            canvas.drawCircle(cx, cy, Math.min(cx, cy), paint);
            int ink = filled ? theme.sheet : theme.text;
            if (glyph == CHECK) {
                paint.setColor(ink);
                float size = theme.dp(24);
                Icons.draw(canvas, Icons.CHECK, cx - size / 2, cy - size / 2, size, paint);
                return;
            }
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(theme.dp(2));
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setColor(ink);
            if (glyph == CROSS) {
                float half = theme.dp(5);
                canvas.drawLine(cx - half, cy - half, cx + half, cy + half, paint);
                canvas.drawLine(cx + half, cy - half, cx - half, cy + half, paint);
                return;
            }
            float half = theme.dp(7);
            canvas.drawLine(cx - half, cy, cx + half, cy, paint);
            if (glyph == PLUS) canvas.drawLine(cx, cy - half, cx, cy + half, paint);
        }
    }
}
