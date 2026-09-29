package io.github.bakwudo.uyu.extension.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.preference.Preference;
import android.text.InputFilter;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.GridLayout;
import android.widget.LinearLayout;
import android.widget.Toast;

import java.util.Locale;

/**
 * An ARGB color setting. The row shows a swatch of the color. The dialog offers preset colors
 * and a hex field.
 */
@SuppressWarnings("deprecation")
public final class ColorPreference extends Preference {
    /** Niconico's comment colors. Picking one keeps the alpha of the current value. */
    private static final int[] PRESETS = {
            0xFFFFFF, // white
            0xFF0000, // red
            0xFF8080, // pink
            0xFFC000, // orange
            0xFFFF00, // yellow
            0x00FF00, // green
            0x00FFFF, // cyan
            0x0000FF, // blue
            0xC000FF, // purple
            0x000000, // black
    };

    private static final Object SWATCH_TAG = new Object();

    private final IntSetting setting;
    private int value;

    public ColorPreference(Context context, IntSetting setting) {
        super(context);
        this.setting = setting;
        setKey(setting.key);
        setPersistent(true);
        setDefaultValue(setting.defaultValue);
    }

    @Override
    protected void onSetInitialValue(boolean restorePersistedValue, Object defaultValue) {
        value = setting.get();
        setSummary(format(value));
    }

    @Override
    protected View onCreateView(ViewGroup parent) {
        View row = super.onCreateView(parent);
        ViewGroup widgetFrame = row.findViewById(android.R.id.widget_frame);
        if (widgetFrame != null) {
            View swatch = new View(getContext());
            swatch.setTag(SWATCH_TAG);
            int size = SettingsUi.dp(getContext(), 32);
            widgetFrame.addView(swatch, new ViewGroup.LayoutParams(size, size));
            widgetFrame.setVisibility(View.VISIBLE);
        }
        return row;
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        View swatch = view.findViewWithTag(SWATCH_TAG);
        if (swatch != null) swatch.setBackground(swatchDrawable(getContext(), value));
    }

    @Override
    protected void onClick() {
        Context context = getContext();
        int padding = SettingsUi.dp(context, 20);

        LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setPadding(padding, padding, padding, 0);

        EditText hex = new EditText(context);
        hex.setSingleLine(true);
        hex.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS
                | InputType.TYPE_TEXT_FLAG_CAP_CHARACTERS);
        hex.setFilters(new InputFilter[]{new InputFilter.LengthFilter(9)});
        hex.setHint("#AARRGGBB");
        hex.setText(format(value));

        GridLayout presets = new GridLayout(context);
        presets.setColumnCount(5);
        int size = SettingsUi.dp(context, 40);
        int margin = SettingsUi.dp(context, 6);
        for (int rgb : PRESETS) {
            View swatch = new View(context);
            swatch.setBackground(swatchDrawable(context, 0xFF000000 | rgb));
            swatch.setOnClickListener(v -> {
                Integer current = parse(hex.getText().toString());
                int alpha = (current == null ? value : current) & 0xFF000000;
                hex.setText(format(alpha | rgb));
                hex.setSelection(hex.length());
            });
            GridLayout.LayoutParams params = new GridLayout.LayoutParams();
            params.width = size;
            params.height = size;
            params.setMargins(margin, margin, margin, margin);
            presets.addView(swatch, params);
        }

        LinearLayout.LayoutParams presetsParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        presetsParams.gravity = Gravity.CENTER_HORIZONTAL;
        layout.addView(presets, presetsParams);
        layout.addView(hex, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        AlertDialog dialog = SettingsUi.dialog(context)
                .setTitle(getTitle())
                .setView(layout)
                .setPositiveButton(android.R.string.ok, null)
                .setNegativeButton(android.R.string.cancel, null)
                .setNeutralButton("Default", (d, which) -> setValue(setting.defaultValue))
                .create();
        dialog.setOnShowListener(d -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            Integer color = parse(hex.getText().toString());
            if (color == null) {
                Toast.makeText(context, "Enter a color as #AARRGGBB", Toast.LENGTH_SHORT).show();
                return;
            }
            setValue(color);
            dialog.dismiss();
        }));
        dialog.show();
    }

    private void setValue(int color) {
        if (!callChangeListener(color)) return;
        value = color;
        persistInt(color);
        setSummary(format(color));
        notifyChanged();
    }

    /**
     * @return The color for "#AARRGGBB" or "#RRGGBB" (opaque), with or without the #.
     */
    private static Integer parse(String text) {
        String hex = text.trim();
        if (hex.startsWith("#")) hex = hex.substring(1);
        if (hex.length() != 6 && hex.length() != 8) return null;
        try {
            long color = Long.parseLong(hex, 16);
            return hex.length() == 6 ? (int) (0xFF000000L | color) : (int) color;
        } catch (NumberFormatException ex) {
            return null;
        }
    }

    private static String format(int color) {
        return String.format(Locale.ROOT, "#%08X", color);
    }

    private static GradientDrawable swatchDrawable(Context context, int color) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setShape(GradientDrawable.OVAL);
        drawable.setColor(color);
        drawable.setStroke(SettingsUi.dp(context, 1), SettingsUi.isDark(context) ? 0xFF808080 : 0xFF606060);
        return drawable;
    }
}
