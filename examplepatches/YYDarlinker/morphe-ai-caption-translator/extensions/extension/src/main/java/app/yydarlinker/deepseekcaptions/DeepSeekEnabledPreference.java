package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.util.AttributeSet;

/** Native Morphe switch that persists immediately. */
@SuppressWarnings("deprecation")
public final class DeepSeekEnabledPreference extends AddonSwitchPreference {
    private CaptionLocaleSubscription localeSubscription;
    public DeepSeekEnabledPreference(Context context) {
        super(context);
        initialize();
    }

    public DeepSeekEnabledPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        initialize();
    }

    public DeepSeekEnabledPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initialize();
    }

    public DeepSeekEnabledPreference(
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
        setChecked(DeepSeekConfig.load(getContext()).enabled);
        updateSummary();
        setOnPreferenceChangeListener((preference, newValue) -> {
            boolean enabled = Boolean.TRUE.equals(newValue);
            if(!CaptionQuickToggle.setEngine(getContext(),enabled))return false;
            setChecked(enabled);
            updateSummary();
            return false;
        });
    }

    @Override protected void onBindView(android.view.View view) {
        attachLanguage();
        boolean saved=DeepSeekConfig.enabled(getContext());
        if(isChecked()!=saved){setChecked(saved);updateSummary();}
        super.onBindView(view);
    }
    @Override protected void onAttachedToActivity(){super.onAttachedToActivity();attachLanguage();}
    private void attachLanguage(){CaptionLocaleSubscription next=CaptionLocaleSubscription.attach(this);if(localeSubscription!=null&&localeSubscription!=next)localeSubscription.close();localeSubscription=next;}
    @Override protected void onPrepareForRemoval(){if(localeSubscription!=null){localeSubscription.close();localeSubscription=null;}super.onPrepareForRemoval();}
    @Override protected void refreshDynamicText(){setTitle(CaptionStrings.settings(getContext(),"enable_ai"));updateSummary();}

    private void updateSummary() {
        DeepSeekConfig.Snapshot current = DeepSeekConfig.load(getContext());
        if (!current.enabled) setSummary(CaptionStrings.settings(getContext(), "message_7b7480271fa5"));
        else if (current.apiKey.isEmpty()) setSummary(CaptionStrings.settings(getContext(), "message_1cc3c4b0aab0"));
        else setSummary(CaptionStrings.settings(getContext(), "message_2c107e436145"));
    }
}
