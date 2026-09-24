package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.util.AttributeSet;

/** Opt-in source/canonical text fields for display-selection diagnostics. */
@SuppressWarnings("deprecation")
public final class DeepSeekDisplayTextDebugPreference extends AddonSwitchPreference {
    public DeepSeekDisplayTextDebugPreference(Context context) {
        super(context);
        initialize();
    }

    public DeepSeekDisplayTextDebugPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        initialize();
    }

    public DeepSeekDisplayTextDebugPreference(
            Context context,
            AttributeSet attrs,
            int defStyleAttr
    ) {
        super(context, attrs, defStyleAttr);
        initialize();
    }

    public DeepSeekDisplayTextDebugPreference(
            Context context,
            AttributeSet attrs,
            int defStyleAttr,
            int defStyleRes
    ) {
        super(context, attrs, defStyleAttr, defStyleRes);
        initialize();
    }

    private void initialize() {
        setPersistent(false);
        boolean enabled = DeepSeekConfig.displayTextDebugEnabled(getContext());
        setChecked(enabled);
        updateSummary(enabled);
        setOnPreferenceChangeListener((preference, newValue) -> {
            boolean next = Boolean.TRUE.equals(newValue);
            DeepSeekConfig.saveDisplayTextDebugEnabled(getContext(), next);
            setChecked(next);
            updateSummary(next);
            return false;
        });
    }

    private void updateSummary(boolean enabled) {
        setSummary(CaptionStrings.localize(getContext(), enabled
                ? "诊断中记录字幕原文与译文，仅建议排查时开启"
                : "关闭时不记录字幕原文与译文"));
    }
}