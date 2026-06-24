package app.ytmusicproxy.extension.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.text.InputType;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.EditText;

import androidx.preference.Preference;

import app.ytmusicproxy.extension.ProxyConfig;
import app.ytmusicproxy.extension.ProxySettingsStore;

@SuppressWarnings("unused")
public final class ProxyTextPreference extends Preference {
    private static final String ANDROID_NS = "http://schemas.android.com/apk/res/android";
    private final String dialogTitle;
    private final int inputType;
    private final boolean singleLine;

    public ProxyTextPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.dialogTitle = stringAttribute(attrs, "dialogTitle", null);
        this.inputType = attrs == null
                ? InputType.TYPE_CLASS_TEXT
                : attrs.getAttributeIntValue(ANDROID_NS, "inputType", InputType.TYPE_CLASS_TEXT);
        this.singleLine = attrs == null || attrs.getAttributeBooleanValue(ANDROID_NS, "singleLine", true);
        updateSummary();
    }

    @Override
    public void B() {
        super.B();
        updateSummary();
    }

    @Override
    protected void c() {
        final Context context = j;
        final String key = t;
        if (TextUtils.isEmpty(key)) {
            return;
        }

        final EditText editText = new EditText(context);
        editText.setSingleLine(singleLine);
        editText.setInputType(inputType);

        String currentValue = preferences().getString(key, defaultValue(key));
        editText.setText(currentValue);
        editText.setSelection(editText.getText().length());

        new AlertDialog.Builder(context)
                .setTitle(!TextUtils.isEmpty(dialogTitle) ? dialogTitle : q)
                .setView(editText)
                .setPositiveButton(android.R.string.ok, (dialog, which) -> {
                    String newValue = editText.getText().toString();
                    if (T(newValue)) {
                        preferences().edit().putString(key, newValue).apply();
                        updateSummary();
                    }
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void updateSummary() {
        String key = t;
        if (TextUtils.isEmpty(key)) {
            return;
        }

        String value = preferences().getString(key, defaultValue(key));
        if (ProxySettingsStore.KEY_PASSWORD.equals(key)) {
            n(TextUtils.isEmpty(value) ? "Not set" : "Set");
            return;
        }
        n(TextUtils.isEmpty(value) ? "Not set" : value);
    }

    private SharedPreferences preferences() {
        return ProxySettingsStore.preferences(j);
    }

    private static String defaultValue(String key) {
        if (ProxySettingsStore.KEY_HOST.equals(key)) {
            return ProxyConfig.DEFAULT_HOST;
        }
        if (ProxySettingsStore.KEY_PORT.equals(key)) {
            return ProxyConfig.DEFAULT_PORT;
        }
        if (ProxySettingsStore.KEY_USERNAME.equals(key)) {
            return ProxyConfig.DEFAULT_USERNAME;
        }
        if (ProxySettingsStore.KEY_PASSWORD.equals(key)) {
            return ProxyConfig.DEFAULT_PASSWORD;
        }
        return "";
    }

    private static String stringAttribute(AttributeSet attrs, String name, String fallback) {
        if (attrs == null) {
            return fallback;
        }

        String value = attrs.getAttributeValue(ANDROID_NS, name);
        return value == null ? fallback : value;
    }
}
