package app.yydarlinker.aicaptions.settings;

import static app.yydarlinker.aicaptions.settings.CaptionSettingsDialogs.*;

import android.content.Context;
import android.preference.SwitchPreference;
import android.util.AttributeSet;
import android.view.View;

/** The engine and both menu placements use the same standard switch widget. */
@SuppressWarnings("deprecation")
public final class CaptionSettingsSwitch extends SwitchPreference {
    public static final String ENGINE = "ai_caption_enabled";
    static final String VIDEO_MENU = "ai_caption_flyout_menu";
    static final String SHORTS_MENU = "ai_caption_shorts_flyout_menu";

    private final String titleKey;
    private final String summaryKey;
    private CaptionTextResolver.Subscription locale;

    public CaptionSettingsSwitch(Context context, AttributeSet attrs) {
        super(context, attrs);
        setPersistent(false);
        titleKey = CaptionSettingsPreference.slot(context, attrs, "title");
        summaryKey = CaptionSettingsPreference.slot(context, attrs, "summary");
        setOnPreferenceChangeListener((preference, value) -> {
            run(context, () -> {
                boolean checked = Boolean.TRUE.equals(value);
                if (ENGINE.equals(getKey())) CaptionQuickToggle.setEngine(context, checked);
                else if (SHORTS_MENU.equals(getKey())) AiCaptionConfig.saveShortsFlyoutMenuEnabled(context, checked);
                else if (VIDEO_MENU.equals(getKey())) AiCaptionConfig.saveFlyoutMenuEnabled(context, checked);
                refresh();
            });
            return false;
        });
    }

    static boolean menuVisible(Context context, boolean shorts) {
        return shorts ? AiCaptionConfig.shortsFlyoutMenuEnabled(context)
                : AiCaptionConfig.flyoutMenuEnabled(context);
    }

    @Override
    protected void onAttachedToActivity() {
        super.onAttachedToActivity();
        attachLocale();
    }

    @Override
    protected void onBindView(View view) {
        attachLocale();
        refresh();
        super.onBindView(view);
        CaptionSettingsPreference.styleRow(view);
    }

    private void attachLocale() {
        if (locale == null && ENGINE.equals(getKey())) locale = CaptionTextResolver.Subscription.attach(this);
    }

    @Override
    protected void onPrepareForRemoval() {
        if (locale != null) locale.close();
        locale = null;
        super.onPrepareForRemoval();
    }

    void refresh() {
        Context context = getContext();
        CaptionSettingsPreference.localizeTitle(this, titleKey);
        String summary = summaryKey;
        if (ENGINE.equals(getKey())) {
            boolean enabled = AiCaptionConfig.enabled(context);
            setChecked(enabled);
            if (enabled) {
                AiCaptionConfig.ProviderSettings config = AiCaptionConfig.load(context);
                summary = !config.readable ? "config_unreadable"
                        : config.hasCredential ? "message_2c107e436145" : "message_1cc3c4b0aab0";
            } else {
                summary = "message_7b7480271fa5";
            }
        } else {
            setChecked(menuVisible(context, SHORTS_MENU.equals(getKey())));
        }
        if (summary != null) {
            String next = text(context, summary);
            if (!next.contentEquals(getSummary() == null ? "" : getSummary())) setSummary(next);
        }
    }
}
