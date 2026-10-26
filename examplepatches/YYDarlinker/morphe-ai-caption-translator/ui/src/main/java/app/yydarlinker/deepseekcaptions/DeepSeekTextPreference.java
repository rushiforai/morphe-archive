package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.text.InputType;
import android.util.AttributeSet;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

/** The base URL and the API key of the active profile. */
@SuppressWarnings("deprecation")
public class DeepSeekTextPreference extends ProfileEditorPreference {
    static final String KEY_BASE_URL = "deepseek_caption_base_url";
    static final String KEY_API_KEY = "deepseek_caption_api_key";

    public DeepSeekTextPreference(Context context) {
        this(context, null);
    }

    public DeepSeekTextPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    private boolean isKey() {
        return KEY_API_KEY.equals(getKey());
    }

    @Override
    void configureEditor(EditText value) {
        value.setSingleLine(true);
        value.setImeOptions(EditorInfo.IME_ACTION_DONE);
        if (isKey()) {
            value.setInputType(CaptionInputPolicy.keyInputType());
            ((InlineCaptionEditor) value).sensitive(true);
            value.setImeOptions(
                    EditorInfo.IME_ACTION_DONE | EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
            uiHint(value, SecureApiKey.hasSavedValue(getContext()) ? "key_saved" : "enter_key");
        } else if (KEY_BASE_URL.equals(getKey())) {
            value.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        } else {
            value.setInputType(InputType.TYPE_CLASS_TEXT);
        }
    }

    /** A saved key is never shown again, so its field always starts empty. */
    @Override
    String initialValue() {
        return KEY_BASE_URL.equals(getKey()) ? DeepSeekConfig.baseUrl(getContext()) : "";
    }

    @Override
    void addDetails(Context context, LinearLayout root) {
        state = new TextView(context);
        CaptionSettingsStyle.caption(state);
        state.setPadding(0, CaptionSettingsStyle.dp(context, 6), 0, 0);
        showState(false);
        root.addView(state, wide());
    }

    @Override
    boolean accepts(String value) {
        if (!isKey()) return true;
        if (value.isEmpty()) return false;
        if (value.contains("\n") || value.contains("\r")) {
            if (editor != null)
                editor.setError(CaptionStrings.localize(getContext(), "API Key 应为单行"));
            return false;
        }
        return true;
    }

    @Override
    void save(String value) throws Exception {
        if (KEY_BASE_URL.equals(getKey())) DeepSeekConfig.saveBaseUrl(getContext(), value);
        else if (isKey()) SecureApiKey.save(getContext(), value);
        else throw new IllegalArgumentException("未知设置项");
    }

    @Override
    Object storedValue() {
        return isKey() ? SecureApiKey.captureCredential(getContext()).identity()
                : ApiProfiles.values(getContext()).getAll().get("base_url");
    }

    @Override
    void saved() {
        showState(true);
        DeepSeekModelPreference.onCredentialsChanged(getContext());
    }

    @Override
    String defaultFailure() {
        return "自动保存失败";
    }

    @Override
    void detached() {
        super.detached();
        if (isKey() && flushed(editor.getText().toString().trim())) {
            // A key never stays in a field that is not on screen.
            cancelPendingSave();
            editor.setText("");
            cancelPendingSave();
        }
    }

    @Override
    boolean flushed(String value) {
        return super.flushed(value) || (isKey() && value.isEmpty());
    }

    private void showState(boolean justSaved) {
        if (isKey()) {
            boolean hasKey = SecureApiKey.hasSavedValue(getContext());
            uiText(state, !hasKey ? "message_10d1b374429d" : justSaved ? "saved" : "key_saved");
            if (editor != null) uiHint(editor, hasKey ? "key_saved" : "enter_key");
        } else if (justSaved) {
            uiText(state, "saved");
        } else {
            // XML summaries are already localized: translating their prefixes would duplicate text.
            uiText(
                    state,
                    () ->
                            getSummary() == null || getSummary().length() == 0
                                    ? CaptionStrings.get(getContext(), "autosave")
                                    : getSummary().toString());
        }
        state.setAlpha(1f);
    }
}
