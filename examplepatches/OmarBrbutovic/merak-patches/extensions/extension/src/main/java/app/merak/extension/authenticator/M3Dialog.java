package app.merak.extension.authenticator;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.text.InputType;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * Dialogs and bottom sheets in the style of the app's own Material 3 dialogs:
 * rounded 28dp surface container, optional centered icon, Product Sans title,
 * secondary color body text and primary color text buttons aligned to the end.
 */
final class M3Dialog {

    private final Activity activity;
    private final boolean sheet;
    private Drawable icon;
    private CharSequence title;
    private CharSequence message;
    private View content;
    private boolean contentPadded = true;
    private final List<TextView> buttons = new ArrayList<>();
    private Runnable onDismiss;
    private Dialog dialog;

    private M3Dialog(Activity activity, boolean sheet) {
        this.activity = activity;
        this.sheet = sheet;
    }

    /** A centered dialog. */
    static M3Dialog dialog(Activity activity) {
        return new M3Dialog(activity, false);
    }

    /** A modal bottom sheet. */
    static M3Dialog sheet(Activity activity) {
        return new M3Dialog(activity, true);
    }

    M3Dialog icon(Drawable icon) {
        this.icon = icon;
        return this;
    }

    M3Dialog title(CharSequence title) {
        this.title = title;
        return this;
    }

    M3Dialog message(CharSequence message) {
        this.message = message;
        return this;
    }

    /** Scrollable content below the title. {@code padded} adds the horizontal dialog padding. */
    M3Dialog content(View content, boolean padded) {
        this.content = content;
        this.contentPadded = padded;
        return this;
    }

    /**
     * Adds a text button. Buttons are laid out at the end in the order they are added,
     * so add the dismissive action first and the confirming action last.
     *
     * @param action Run on click. Return false to keep the dialog open (for example on invalid input).
     */
    M3Dialog button(String label, ButtonAction action) {
        TextView button = new TextView(activity);
        button.setText(label);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        button.setTypeface(Ui.medium());
        button.setTextColor(Ui.primary(activity));
        button.setGravity(Gravity.CENTER);
        button.setMinHeight(Ui.dp(activity, 40));
        button.setMinWidth(Ui.dp(activity, 48));
        int pad = Ui.dp(activity, 12);
        button.setPadding(pad, 0, pad, 0);
        button.setBackground(Ui.ripple(activity, null, Ui.dp(activity, 20)));
        button.setOnClickListener(v -> {
            if (action == null || action.run()) dismiss();
        });
        buttons.add(button);
        return this;
    }

    interface ButtonAction {
        boolean run();
    }

    /** Button that runs the action and always closes the dialog. */
    static ButtonAction closing(Runnable runnable) {
        return () -> {
            if (runnable != null) runnable.run();
            return true;
        };
    }

    M3Dialog onDismiss(Runnable onDismiss) {
        this.onDismiss = onDismiss;
        return this;
    }

    void dismiss() {
        if (dialog != null && dialog.isShowing()) dialog.dismiss();
    }

    M3Dialog show() {
        Context c = activity;
        int side = Ui.dp(c, 24);
        float radius = Ui.dp(c, 28);

        LinearLayout root = new LinearLayout(c);
        root.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable background = new GradientDrawable();
        background.setColor(sheet ? Ui.surfaceContainerLow(c) : Ui.surfaceContainerHigh(c));
        background.setCornerRadii(sheet ? Ui.radii(radius, 0) : Ui.radii(radius, radius));
        root.setBackground(background);
        root.setClipToOutline(true);
        root.setPadding(0, sheet ? 0 : side, 0, sheet ? Ui.dp(c, 16) : Ui.dp(c, 16));

        if (sheet) {
            View handle = new View(c);
            handle.setBackground(Ui.rounded((Ui.onSurfaceVariant(c) & 0x00FFFFFF) | 0x66000000, Ui.dp(c, 2)));
            LinearLayout.LayoutParams handleParams = new LinearLayout.LayoutParams(Ui.dp(c, 32), Ui.dp(c, 4));
            handleParams.gravity = Gravity.CENTER_HORIZONTAL;
            handleParams.setMargins(0, Ui.dp(c, 16), 0, Ui.dp(c, 16));
            root.addView(handle, handleParams);
        }

        if (icon != null) {
            ImageView iconView = new ImageView(c);
            iconView.setImageDrawable(icon);
            int size = Ui.dp(c, 24);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(size, size);
            params.gravity = Gravity.CENTER_HORIZONTAL;
            params.bottomMargin = Ui.dp(c, 16);
            root.addView(iconView, params);
        }

        if (title != null) {
            TextView titleView = new TextView(c);
            titleView.setText(title);
            titleView.setTypeface(Ui.headline(c));
            titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, sheet ? 22 : 24);
            titleView.setTextColor(Ui.onSurface(c));
            titleView.setGravity(icon != null ? Gravity.CENTER_HORIZONTAL : Gravity.START);
            titleView.setPadding(side, 0, side, Ui.dp(c, 16));
            root.addView(titleView, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        if (message != null) {
            TextView messageView = new TextView(c);
            messageView.setText(message);
            messageView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            messageView.setLineSpacing(Ui.dp(c, 4), 1f);
            messageView.setTextColor(Ui.onSurfaceVariant(c));
            messageView.setPadding(side, 0, side, Ui.dp(c, 8));
            root.addView(messageView);
        }

        if (content != null) {
            DisplayMetrics metrics = c.getResources().getDisplayMetrics();
            final int maxHeight = (int) (metrics.heightPixels * (sheet ? 0.72f : 0.55f));
            ScrollView scroll = new ScrollView(c) {
                @Override
                protected void onMeasure(int widthSpec, int heightSpec) {
                    super.onMeasure(widthSpec, MeasureSpec.makeMeasureSpec(maxHeight, MeasureSpec.AT_MOST));
                }
            };
            scroll.setClipToPadding(false);
            scroll.setOverScrollMode(View.OVER_SCROLL_IF_CONTENT_SCROLLS);
            if (contentPadded) scroll.setPadding(side, 0, side, 0);
            scroll.addView(content, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            root.addView(scroll, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        if (!buttons.isEmpty()) {
            LinearLayout row = new LinearLayout(c);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
            row.setPadding(side - Ui.dp(c, 12), Ui.dp(c, 16), side - Ui.dp(c, 12), Ui.dp(c, 8));
            for (TextView button : buttons) {
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                params.setMarginStart(Ui.dp(c, 8));
                row.addView(button, params);
            }
            root.addView(row, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        dialog = new Dialog(c);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(root);
        dialog.setCanceledOnTouchOutside(true);
        if (onDismiss != null) dialog.setOnDismissListener(d -> onDismiss.run());

        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            DisplayMetrics metrics = c.getResources().getDisplayMetrics();
            if (sheet) {
                window.setGravity(Gravity.BOTTOM);
                int width = Math.min(metrics.widthPixels, Ui.dp(c, 640));
                window.setLayout(width, ViewGroup.LayoutParams.WRAP_CONTENT);
                window.setWindowAnimations(android.R.style.Animation_InputMethod);
                if (Build.VERSION.SDK_INT >= 30) {
                    // Draw behind the navigation bar so the sheet reaches the bottom edge,
                    // and keep the content above it.
                    window.setDecorFitsSystemWindows(false);
                    WindowManager.LayoutParams attributes = window.getAttributes();
                    attributes.setFitInsetsTypes(0);
                    window.setAttributes(attributes);
                    window.setNavigationBarContrastEnforced(false);
                    final int basePadding = root.getPaddingBottom();
                    root.setOnApplyWindowInsetsListener((v, insets) -> {
                        int navigation = insets.getInsets(android.view.WindowInsets.Type.navigationBars()).bottom;
                        v.setPadding(v.getPaddingLeft(), v.getPaddingTop(), v.getPaddingRight(), basePadding + navigation);
                        return insets;
                    });
                }
            } else {
                int width = Math.min(Ui.dp(c, 560), metrics.widthPixels - 2 * Ui.dp(c, 32));
                window.setLayout(width, ViewGroup.LayoutParams.WRAP_CONTENT);
            }
            window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        }
        dialog.show();
        return this;
    }

    // region Content building blocks

    /** Vertical container for dialog content. */
    static LinearLayout column(Context c) {
        LinearLayout column = new LinearLayout(c);
        column.setOrientation(LinearLayout.VERTICAL);
        return column;
    }

    /** Section label in primary color, like settings group headers. */
    static TextView sectionLabel(Context c, String text) {
        TextView view = new TextView(c);
        view.setText(text);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        view.setTypeface(Ui.medium());
        view.setTextColor(Ui.primary(c));
        view.setPadding(Ui.dp(c, 4), Ui.dp(c, 20), Ui.dp(c, 4), Ui.dp(c, 8));
        return view;
    }

    /**
     * Wraps rows in a grouped list: each row is a rounded segment and the group has large
     * outer corners, matching the cards of the account list.
     */
    static LinearLayout groupedList(Context c, List<View> rows, int fillColor) {
        LinearLayout group = column(c);
        float large = Ui.dp(c, 20);
        float small = Ui.dp(c, 4);
        for (int i = 0; i < rows.size(); i++) {
            View row = rows.get(i);
            float top = i == 0 ? large : small;
            float bottom = i == rows.size() - 1 ? large : small;
            row.setBackground(Ui.ripple(c, fillColor, new float[]{
                    top, top, top, top, bottom, bottom, bottom, bottom}));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            if (i > 0) params.topMargin = Ui.dp(c, 2);
            group.addView(row, params);
        }
        return group;
    }

    /** A list row: optional leading view, title, optional subtitle and optional trailing view. */
    static LinearLayout listRow(Context c, View leading, CharSequence title, CharSequence subtitle, View trailing) {
        LinearLayout row = new LinearLayout(c);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(Ui.dp(c, subtitle != null ? 64 : 56));
        row.setPadding(Ui.dp(c, 16), Ui.dp(c, 8), Ui.dp(c, trailing != null ? 8 : 16), Ui.dp(c, 8));
        row.setClickable(true);
        row.setFocusable(true);

        if (leading != null) {
            LinearLayout.LayoutParams params = keepSize(leading);
            params.setMarginEnd(Ui.dp(c, 16));
            row.addView(leading, params);
        }

        LinearLayout texts = column(c);
        TextView titleView = new TextView(c);
        titleView.setText(title);
        titleView.setSingleLine(true);
        titleView.setEllipsize(TextUtils.TruncateAt.END);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        titleView.setTextColor(Ui.onSurface(c));
        texts.addView(titleView);
        if (subtitle != null) {
            TextView subtitleView = new TextView(c);
            subtitleView.setText(subtitle);
            subtitleView.setSingleLine(true);
            subtitleView.setEllipsize(TextUtils.TruncateAt.END);
            subtitleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            subtitleView.setTextColor(Ui.onSurfaceVariant(c));
            texts.addView(subtitleView);
        }
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        if (trailing != null) {
            LinearLayout.LayoutParams params = keepSize(trailing);
            params.setMarginStart(Ui.dp(c, 8));
            row.addView(trailing, params);
        }
        row.setContentDescription(subtitle == null ? title : title + ", " + subtitle);
        return row;
    }

    /**
     * Layout params that keep a view's own fixed size. A plain View with wrap content
     * would otherwise take all the space it is offered.
     */
    private static LinearLayout.LayoutParams keepSize(View view) {
        ViewGroup.LayoutParams existing = view.getLayoutParams();
        return existing != null
                ? new LinearLayout.LayoutParams(existing.width, existing.height)
                : new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    /** Full width action row of a bottom sheet: icon and label. */
    static View sheetAction(Context c, Drawable icon, String label, int color, Runnable onClick) {
        LinearLayout row = new LinearLayout(c);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(Ui.dp(c, 56));
        row.setPadding(Ui.dp(c, 24), 0, Ui.dp(c, 24), 0);
        row.setBackground(Ui.selectableBackground(c, false));
        row.setClickable(true);
        row.setFocusable(true);

        ImageView iconView = new ImageView(c);
        iconView.setImageDrawable(icon);
        int size = Ui.dp(c, 24);
        LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(size, size);
        iconParams.setMarginEnd(Ui.dp(c, 16));
        row.addView(iconView, iconParams);

        TextView text = new TextView(c);
        text.setText(label);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        text.setTextColor(color);
        row.addView(text);

        row.setContentDescription(label);
        row.setOnClickListener(v -> onClick.run());
        return row;
    }

    /** Small colored circle, used to show a category color. */
    static View colorDot(Context c, int color, int sizeDp) {
        View dot = new View(c);
        dot.setBackground(Ui.dot(color));
        int size = Ui.dp(c, sizeDp);
        dot.setLayoutParams(new LinearLayout.LayoutParams(size, size));
        return dot;
    }

    static RadioButton radio(Context c, boolean checked) {
        RadioButton radio = new RadioButton(c);
        styleCompound(c, radio, checked);
        return radio;
    }

    static CheckBox checkbox(Context c, boolean checked) {
        CheckBox box = new CheckBox(c);
        styleCompound(c, box, checked);
        return box;
    }

    private static void styleCompound(Context c, CompoundButton button, boolean checked) {
        button.setChecked(checked);
        button.setClickable(false);
        button.setFocusable(false);
        button.setButtonTintList(new ColorStateList(
                new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}},
                new int[]{Ui.primary(c), Ui.onSurfaceVariant(c)}));
        button.setPadding(0, 0, 0, 0);
    }

    /** Outlined text field: input plus supporting text for errors. */
    static final class TextField {
        final LinearLayout view;
        final EditText input;
        final TextView supporting;

        TextField(Context c, String label, String initial) {
            view = column(c);

            input = new EditText(c);
            input.setSingleLine(true);
            input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_WORDS);
            input.setImeOptions(EditorInfo.IME_ACTION_DONE);
            input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            input.setTextColor(Ui.onSurface(c));
            input.setHint(label);
            input.setHintTextColor(Ui.onSurfaceVariant(c));
            input.setText(initial);
            input.setSelection(input.getText().length());
            input.setMinHeight(Ui.dp(c, 56));
            input.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), 0);
            input.setHighlightColor((Ui.primary(c) & 0x00FFFFFF) | 0x55000000);
            setOutline(c, false);
            if (Build.VERSION.SDK_INT >= 29) {
                GradientDrawable cursor = new GradientDrawable();
                cursor.setColor(Ui.primary(c));
                cursor.setSize(Ui.dp(c, 2), Ui.dp(c, 20));
                input.setTextCursorDrawable(cursor);
            }
            view.addView(input, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            supporting = new TextView(c);
            supporting.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            supporting.setTextColor(Ui.error(c));
            supporting.setPadding(Ui.dp(c, 16), Ui.dp(c, 4), Ui.dp(c, 16), 0);
            supporting.setVisibility(View.GONE);
            view.addView(supporting);

            input.setOnFocusChangeListener((v, focused) -> {
                if (supporting.getVisibility() != View.VISIBLE) setOutline(c, false);
            });
        }

        void setError(Context c, String error) {
            supporting.setText(error);
            supporting.setVisibility(error == null ? View.GONE : View.VISIBLE);
            setOutline(c, error != null);
        }

        private void setOutline(Context c, boolean error) {
            float radius = Ui.dp(c, 4);
            GradientDrawable focused = new GradientDrawable();
            focused.setCornerRadius(radius);
            focused.setStroke(Ui.dp(c, 2), error ? Ui.error(c) : Ui.primary(c));
            GradientDrawable normal = new GradientDrawable();
            normal.setCornerRadius(radius);
            normal.setStroke(Ui.dp(c, 1), error ? Ui.error(c) : Ui.themeColor(c, "colorOutline",
                    Ui.isDark(c) ? 0xFF8E918F : 0xFF747775));
            StateListDrawable states = new StateListDrawable();
            states.addState(new int[]{android.R.attr.state_focused}, focused);
            states.addState(new int[]{}, normal);
            input.setBackground(states);
        }

        String text() {
            return input.getText().toString().trim();
        }
    }

    // endregion
}
