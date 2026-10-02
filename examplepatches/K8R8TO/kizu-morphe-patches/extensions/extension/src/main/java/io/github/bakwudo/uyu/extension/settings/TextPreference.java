package io.github.bakwudo.uyu.extension.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.preference.Preference;
import android.text.InputType;
import android.widget.EditText;
import android.widget.FrameLayout;

/**
 * A single line text setting, edited in a dialog. The row shows the value, or a placeholder
 * text when it is empty.
 */
@SuppressWarnings("deprecation")
public final class TextPreference extends Preference {
    private final StringSetting setting;
    private final String hint;
    private final CharSequence emptySummary;

    /**
     * @param hint         Shown in the empty text field.
     * @param emptySummary Shown in the row when the value is empty.
     */
    public TextPreference(Context context, StringSetting setting, String hint, CharSequence emptySummary) {
        super(context);
        this.setting = setting;
        this.hint = hint;
        this.emptySummary = emptySummary;
        setKey(setting.key);
        setPersistent(true);
        setDefaultValue(setting.defaultValue);
    }

    @Override
    protected void onSetInitialValue(boolean restorePersistedValue, Object defaultValue) {
        updateSummary(setting.get());
    }

    @Override
    protected void onClick() {
        Context context = getContext();
        int padding = SettingsUi.dp(context, 20);

        EditText text = new EditText(context);
        text.setSingleLine(true);
        text.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        text.setHint(hint);
        text.setText(setting.get());
        text.setSelection(text.length());

        FrameLayout layout = new FrameLayout(context);
        layout.setPadding(padding, padding / 2, padding, 0);
        layout.addView(text);

        AlertDialog dialog = SettingsUi.dialog(context)
                .setTitle(getTitle())
                .setView(layout)
                .setPositiveButton(android.R.string.ok, (d, which) -> setValue(text.getText().toString().trim()))
                .setNegativeButton(android.R.string.cancel, null)
                .setNeutralButton("Clear", (d, which) -> setValue(""))
                .create();
        dialog.show();
    }

    private void setValue(String value) {
        if (!callChangeListener(value)) return;
        persistString(value);
        updateSummary(value);
        notifyChanged();
    }

    private void updateSummary(String value) {
        setSummary(value.isEmpty() ? emptySummary : value);
    }
}
