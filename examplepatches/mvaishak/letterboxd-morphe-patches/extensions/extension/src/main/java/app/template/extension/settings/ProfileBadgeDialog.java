package app.template.extension.settings;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.content.res.ColorStateList;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.CheckedTextView;
import android.widget.ListPopupWindow;
import android.widget.ListView;
import android.graphics.drawable.GradientDrawable;
import android.text.InputFilter;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

final class ProfileBadgeDialog extends Dialog {
    private static final String[] MODES = {"original", "pro", "patron", "custom"};
    private static final String[] MODE_LABELS = {"Original", "Pro", "Patron", "Custom"};
    private static final String[] STYLES = {"letterboxd", "local"};
    private static final String[] STYLE_LABELS = {"Letterboxd", "Local outline"};

    private String mode = Prefs.getString(Prefs.KEY_PROFILE_BADGE_MODE, "original");
    private String style = Prefs.getString(Prefs.KEY_PROFILE_BADGE_STYLE, "letterboxd");
    private String hex = Prefs.getString(Prefs.KEY_PROFILE_BADGE_COLOR, "");
    private final int accent;
    private final int surface;
    private final int fieldSurface;
    private final int foreground;
    private final int secondary;
    private EditText label;
    private LinearLayout custom;
    private TextView preview;
    private Button modeButton;
    private Button styleButton;
    private Button colorButton;
    private Button save;

    ProfileBadgeDialog(Context context, int accent) {
        super(context);
        this.accent = accent;
        surface = SurfaceColors.elevated(context);
        fieldSurface = SurfaceColors.background(context);
        foreground = AccentPresets.readableText(Color.WHITE, surface);
        secondary = AccentPresets.readableText(0xFF99AABB, surface);
        ScrollView scroll = new ScrollView(context);
        LinearLayout body = new LinearLayout(context);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(dp(20), dp(18), dp(20), dp(12));
        scroll.addView(body);

        TextView title = new TextView(context);
        title.setText("Profile badge");
        applyAppearance(title, "TitleMedium");
        title.setTextColor(foreground);
        title.setTextSize(20);
        body.addView(title);

        preview = new TextView(context);
        android.widget.FrameLayout previewFrame = new android.widget.FrameLayout(context);
        previewFrame.setBackground(roundedSurface(fieldSurface, false));
        previewFrame.setMinimumHeight(dp(64));
        previewFrame.addView(preview, new android.widget.FrameLayout.LayoutParams(
                -2, -2, Gravity.CENTER));
        LinearLayout.LayoutParams previewFrameParams = new LinearLayout.LayoutParams(-1, -2);
        previewFrameParams.topMargin = dp(12);
        body.addView(previewFrame, previewFrameParams);

        modeButton = dropdown(body, "Badge type");
        modeButton.setOnClickListener(v -> showOptions(modeButton, MODE_LABELS, MODES,
                mode, value -> { mode = value; refresh(); }));

        custom = new LinearLayout(context);
        custom.setOrientation(LinearLayout.VERTICAL);
        body.addView(custom);
        label = new EditText(context);
        caption(custom, "Badge text", label);
        applyAppearance(label, "BodyMedium");
        label.setTextColor(AccentPresets.readableText(foreground, fieldSurface));
        label.setPaddingRelative(dp(12), dp(8), dp(12), dp(8));
        label.setBackground(roundedSurface(fieldSurface, true));
        label.setSingleLine(true);
        label.setMinHeight(dp(48));
        label.setFilters(new InputFilter[]{new InputFilter.LengthFilter(Prefs.MAX_PROFILE_BADGE_LABEL)});
        label.setText(Prefs.getString(Prefs.KEY_PROFILE_BADGE_TEXT, ""));
        label.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) { refresh(); }
            @Override public void afterTextChanged(android.text.Editable text) {}
        });
        custom.addView(label);
        styleButton = dropdown(custom, "Badge style");
        styleButton.setOnClickListener(v -> showOptions(styleButton, STYLE_LABELS, STYLES,
                style, value -> { style = value; refresh(); }));
        colorButton = dropdown(custom, "Badge colour");
        colorButton.setOnClickListener(v -> showOptions(colorButton,
                new String[]{"Match app accent", "Custom colour"}, new String[]{"accent", "custom"},
                hex.isEmpty() ? "accent" : "custom", value -> {
                    if ("accent".equals(value)) {
                        hex = "";
                        refresh();
                    } else {
                        int initial = accent;
                        try {
                            if (!hex.isEmpty()) initial = AccentMath.parseHex(hex);
                        } catch (IllegalArgumentException ignored) {
                        }
                        new HexPickerDialog(context, initial, "Badge colour", color -> {
                            hex = String.format(java.util.Locale.ROOT, "#%06X", color & 0xFFFFFF);
                            refresh();
                        }).show();
                    }
                }));

        LinearLayout actions = new LinearLayout(context);
        actions.setGravity(Gravity.END);
        LinearLayout.LayoutParams actionsParams = new LinearLayout.LayoutParams(-1, -2);
        actionsParams.topMargin = dp(12);
        body.addView(actions, actionsParams);
        button(actions, "Cancel", this::dismiss);
        save = button(actions, "Save", () -> {
            Prefs.putString(Prefs.KEY_PROFILE_BADGE_TEXT, label.getText().toString().trim());
            Prefs.putString(Prefs.KEY_PROFILE_BADGE_STYLE, style);
            Prefs.putString(Prefs.KEY_PROFILE_BADGE_COLOR, hex);
            Prefs.putString(Prefs.KEY_PROFILE_BADGE_MODE, mode);
            dismiss();
        });
        save.setBackground(new RippleDrawable(ColorStateList.valueOf(0x22000000),
                roundedSurface(accent, false), null));
        save.setTextColor(AccentPresets.readableText(Color.WHITE, accent));
        body.setFocusableInTouchMode(true);
        body.requestFocus();
        setContentView(scroll);
        Window window = getWindow();
        if (window != null) {
            window.setBackgroundDrawable(roundedSurface(surface, false));
            window.setLayout(Math.min(context.getResources().getDisplayMetrics().widthPixels - dp(40), dp(420)), -2);
            window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN
                    | WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        }
        refresh();
    }

    private void refresh() {
        boolean isCustom = "custom".equals(mode);
        String text = label.getText().toString().trim();
        custom.setVisibility(isCustom ? View.VISIBLE : View.GONE);
        ((View) preview.getParent()).setVisibility("original".equals(mode) ? View.GONE : View.VISIBLE);
        if (isCustom) ProfileBadge.style(preview, text.isEmpty() ? "Badge preview" : text, style, hex);
        else if ("pro".equals(mode)) ProfileBadge.style(preview, "PRO", "letterboxd", "#F07000");
        else if ("patron".equals(mode)) ProfileBadge.style(preview, "PATRON", "letterboxd", "#1F9CE4");
        modeButton.setText("pro".equals(mode) ? "Pro" : "patron".equals(mode)
                ? "Patron" : isCustom ? "Custom" : "Original");
        styleButton.setText("local".equals(style) ? "Local outline" : "Letterboxd");
        colorButton.setText(hex.isEmpty() ? "Match app accent" : hex);
        setArrow(colorButton, false);
        save.setEnabled(!isCustom || !text.isEmpty());
        save.setAlpha(save.isEnabled() ? 1f : 0.45f);
    }

    private Button dropdown(LinearLayout parent, String title) {
        Context ctx = getContext();
        Button field = new Button(ctx, null, android.R.attr.borderlessButtonStyle);
        caption(parent, title, field);
        applyAppearance(field, "BodyMedium");
        field.setAllCaps(false);
        field.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
        field.setPadding(dp(12), dp(8), dp(12), dp(8));
        field.setTextSize(16);
        field.setTextColor(AccentPresets.readableText(foreground, fieldSurface));
        field.setMinHeight(dp(48));
        field.setBackground(new RippleDrawable(ColorStateList.valueOf(0x22FFFFFF),
                roundedSurface(fieldSurface, true), null));
        setArrow(field, false);
        parent.addView(field, new LinearLayout.LayoutParams(-1, -2));
        return field;
    }

    private void setArrow(Button field, boolean expanded) {
        Context ctx = getContext();
        String name = expanded ? "ic_expand_less_22px" : "ic_expand_more_22px";
        int id = ctx.getResources().getIdentifier(name, "drawable", ctx.getPackageName());
        Drawable arrow = id == 0
                ? Glyphs.chevron(0xFF99AABB, ctx.getResources().getDisplayMetrics().density, expanded)
                : ctx.getDrawable(id).mutate();
        arrow.setTint(AccentPresets.readableText(secondary, fieldSurface));
        arrow.setBounds(0, 0, dp(22), dp(22));
        Drawable swatch = null;
        if (field == colorButton) {
            int color = accent;
            try {
                if (!hex.isEmpty()) color = AccentMath.parseHex(hex);
            } catch (IllegalArgumentException ignored) {
            }
            GradientDrawable dot = new GradientDrawable();
            dot.setShape(GradientDrawable.OVAL);
            dot.setColor(0xFF000000 | color);
            dot.setStroke(dp(1), secondary);
            dot.setBounds(0, 0, dp(16), dp(16));
            swatch = dot;
        }
        field.setCompoundDrawablePadding(dp(8));
        field.setCompoundDrawablesRelative(swatch, null, arrow, null);
    }

    private void showOptions(Button field, String[] labels, String[] values, String current,
                             java.util.function.Consumer<String> onSelected) {
        Context ctx = getContext();
        ListPopupWindow menu = new ListPopupWindow(ctx);
        menu.setAnchorView(field);
        menu.setWidth(field.getWidth());
        menu.setModal(true);
        menu.setInputMethodMode(ListPopupWindow.INPUT_METHOD_NOT_NEEDED);
        menu.setBackgroundDrawable(roundedSurface(surface, false));
        menu.setVerticalOffset(dp(4));
        menu.setAdapter(new ArrayAdapter<String>(ctx, android.R.layout.simple_list_item_single_choice, labels) {
            @Override public View getView(int position, View recycled, ViewGroup parent) {
                CheckedTextView row = (CheckedTextView) super.getView(position, recycled, parent);
                applyAppearance(row, "BodyMedium");
                row.setTextColor(foreground);
                row.setMinHeight(dp(48));
                row.setPadding(dp(12), dp(8), dp(12), dp(8));
                row.setCheckMarkTintList(ColorStateList.valueOf(
                        AccentPresets.readableText(accent, surface)));
                return row;
            }
        });
        menu.setOnItemClickListener((parent, row, index, id) -> {
            menu.dismiss();
            onSelected.accept(values[index]);
        });
        menu.setOnDismissListener(() -> setArrow(field, false));
        setArrow(field, true);
        menu.show();
        ListView list = menu.getListView();
        if (list == null) return;
        list.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
        for (int i = 0; i < values.length; i++) {
            if (values[i].equals(current)) {
                list.setItemChecked(i, true);
                break;
            }
        }
    }

    private GradientDrawable roundedSurface(int color, boolean outline) {
        GradientDrawable surface = new GradientDrawable();
        surface.setColor(color);
        surface.setCornerRadius(dp(outline ? 10 : 24));
        if (outline) surface.setStroke(dp(1), (secondary & 0x00FFFFFF) | 0x99000000);
        return surface;
    }

    private Button button(LinearLayout parent, String text, Runnable action) {
        Button button = new Button(getContext(), null, android.R.attr.borderlessButtonStyle);
        button.setAllCaps(false);
        button.setMinHeight(dp(48));
        applyAppearance(button, "LabelMedium");
        button.setTextColor(foreground);
        button.setText(text);
        button.setOnClickListener(v -> action.run());
        parent.addView(button);
        return button;
    }

    private void caption(LinearLayout parent, String title, View field) {
        TextView caption = new TextView(getContext());
        applyAppearance(caption, "LabelMedium");
        caption.setText(title);
        caption.setTextColor(secondary);
        caption.setTextSize(12);
        caption.setPaddingRelative(0, dp(10), 0, dp(4));
        field.setId(View.generateViewId());
        caption.setLabelFor(field.getId());
        parent.addView(caption);
    }

    private void applyAppearance(TextView view, String name) {
        Context context = getContext();
        int id = context.getResources().getIdentifier(
                "TextAppearance.Letterboxd." + name, "style", context.getPackageName());
        if (id != 0) view.setTextAppearance(id);
    }

    private int dp(int value) {
        return Math.round(value * getContext().getResources().getDisplayMetrics().density);
    }
}
