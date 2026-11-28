package app.yydarlinker.aicaptions.settings;

import app.yydarlinker.aicaptions.diagnostics.CaptionDiagnosticsDialogs;
import app.yydarlinker.aicaptions.host.CaptionActions;
import app.yydarlinker.aicaptions.overlay.CaptionOverlay;

import static app.yydarlinker.aicaptions.settings.CaptionSettingsDialogs.*;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

/** Standard preference rows backed by the add-on's existing configuration stores. */
@SuppressWarnings("deprecation")
public final class CaptionSettingsPreference extends Preference {
    private final String titleKey;
    private final String summaryKey;
    private final CaptionProviderDialogs provider;
    private final CaptionProfileDialogs profiles;
    private final CaptionDiagnosticsDialogs diagnostics = new CaptionDiagnosticsDialogs();

    public CaptionSettingsPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        setPersistent(false);
        titleKey = slot(context, attrs, "title");
        summaryKey = slot(context, attrs, "summary");
        provider = new CaptionProviderDialogs(context, this::refreshPage);
        profiles = new CaptionProfileDialogs(context, this::refreshPage);
    }

    @Override
    protected void onClick() {
        if (hasWindow(getContext())) run(getContext(), this::open);
    }

    private void open() {
        Context context = getContext();
        String key = getKey();
        if (key == null) return;
        switch (key) {
            case "ai_caption_profiles":
                profiles.showProfiles();
                break;
            case "ai_caption_base_url":
                provider.endpoint(getTitle());
                break;
            case "ai_caption_api_key":
                provider.key(getTitle());
                break;
            case "ai_caption_model":
                provider.model(getTitle());
                break;
            case "ai_caption_test_api":
                provider.testApi(getTitle());
                break;
            case "ai_caption_delete_key":
                profiles.clearKey();
                break;
            case "ai_caption_text_size":
                CaptionAppearanceDialogs.size(context, getTitle(), this::refreshPage);
                break;
            case "ai_caption_background_opacity":
                CaptionAppearanceDialogs.opacity(context, getTitle(), this::refreshPage);
                break;
            case "ai_caption_reset_position":
                CaptionAppearanceDialogs.resetPosition(context, getTitle(), this::refreshPage);
                break;
            case "ai_caption_clear_cache":
                confirm(context, getTitle(), "clear_cache", "delete", () -> CaptionActions.clearCache(context));
                break;
            case "ai_caption_diagnostics":
                diagnostics.open(context);
                break;
            default:
                break;
        }
    }

    @Override
    protected void onBindView(View view) {
        refresh();
        super.onBindView(view);
        styleRow(view);
    }

    void refresh() {
        localizeTitle(this, titleKey);
        String summary;
        try {
            summary = summary();
        } catch (ConfigRead.Failure | ClassCastException unreadable) {
            summary = text(getContext(), "config_unreadable");
        }
        if (summary != null && !summary.contentEquals(getSummary() == null ? "" : getSummary()))
            setSummary(summary);
    }

    private String summary() {
        Context context = getContext();
        String key = getKey();
        if (key == null) return null;
        switch (key) {
            case "ai_caption_profiles":
                return ApiProfiles.list(context).get(ApiProfiles.active(context));
            case "ai_caption_base_url":
                return AiCaptionConfig.baseUrl(context);
            case "ai_caption_model":
                String model = AiCaptionConfig.model(context);
                return model.isEmpty() ? text(context, "model_hint") : model;
            case "ai_caption_api_key":
                return text(context, SecureApiKey.hasSavedValue(context) ? "key_saved" : "enter_key");
            case "ai_caption_text_size":
                return CaptionAppearanceDialogs.sizeLabel(context);
            case "ai_caption_background_opacity":
                return AiCaptionConfig.displayStyle(context).backgroundOpacity + "%";
            default:
                return summaryKey == null ? null : text(context, summaryKey);
        }
    }

    private void refreshPage() {
        PreferenceGroup group = getParent();
        if (group == null) return;
        while (group.getParent() != null && !"morphe_vot_screen__ai_captions".equals(group.getKey()))
            group = group.getParent();
        CaptionTextResolver.Subscription.refreshChildren(group);
    }

    public static boolean hasWindow(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) {
                Activity activity = (Activity) context;
                return !activity.isFinishing() && !activity.isDestroyed();
            }
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) break;
            context = base;
        }
        return true;
    }

    static String slot(Context context, AttributeSet attrs, String attribute) {
        if (attrs == null) return null;
        int id = attrs.getAttributeResourceValue("http://schemas.android.com/apk/res/android", attribute, 0);
        if (id == 0) return null;
        try {
            String name = context.getResources().getResourceEntryName(id);
            return name.startsWith("cap_") ? name.substring(4) : null;
        } catch (android.content.res.Resources.NotFoundException unavailable) {
            return null;
        }
    }

    static void localizeTitle(Preference row, String key) {
        if (key == null) return;
        String title = text(row.getContext(), key);
        if (!title.contentEquals(row.getTitle() == null ? "" : row.getTitle())) row.setTitle(title);
    }

    static void styleRow(View view) {
        CaptionTextResolver.direction(view, false);
        TextView title = view.findViewById(android.R.id.title);
        if (title != null) {
            title.setSingleLine(false);
            title.setEllipsize(null);
        }
    }
}

final class CaptionAppearanceDialogs {
    private static final String[] SIZE_KEYS = {
        "size_tier_xs", "size_tier_s", "size_tier_standard", "size_tier_l", "size_tier_xl"
    };

    private CaptionAppearanceDialogs() {}

    static void size(Context context, CharSequence title, Runnable refresh) {
        String[] tiers = new String[SIZE_KEYS.length];
        for (int i = 0; i < tiers.length; i++) tiers[i] = text(context, SIZE_KEYS[i]);
        builder(context, title)
                .setSingleChoiceItems(tiers, AiCaptionConfig.displayStyle(context).captionSizeTier,
                        (dialog, which) -> {
                            run(context, () -> {
                                AiCaptionConfig.saveCaptionSizeTier(context, which);
                                update(context, refresh);
                            });
                        })
                .setNegativeButton(text(context, "cancel"), null).show();
    }

    static String sizeLabel(Context context) {
        return text(context, SIZE_KEYS[AiCaptionConfig.displayStyle(context).captionSizeTier]);
    }

    static void opacity(Context context, CharSequence title, Runnable refresh) {
        SeekBar slider = new SeekBar(context);
        slider.setMax(100);
        slider.setProgress(AiCaptionConfig.displayStyle(context).backgroundOpacity);
        slider.setContentDescription(title);
        TextView percentage = new TextView(context);
        percentage.setTextSize(16);
        percentage.setGravity(android.view.Gravity.CENTER);
        MorpheDialog.styleSlider(slider, percentage);
        java.text.NumberFormat format = java.text.NumberFormat.getPercentInstance(CaptionTextResolver.locale(context));
        percentage.setText(format.format(slider.getProgress() / 100.0));
        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                percentage.setText(format.format(progress / 100.0));
            }

            @Override
            public void onStartTrackingTouch(SeekBar bar) {}

            @Override
            public void onStopTrackingTouch(SeekBar bar) {}
        });
        LinearLayout body = new LinearLayout(context);
        body.setOrientation(LinearLayout.VERTICAL);
        int gap = Math.round(8 * context.getResources().getDisplayMetrics().density);
        LinearLayout.LayoutParams valueParams = new LinearLayout.LayoutParams(-1, -2);
        valueParams.setMargins(0, gap, 0, gap);
        body.addView(percentage, valueParams);
        LinearLayout range = new LinearLayout(context);
        range.setGravity(android.view.Gravity.CENTER_VERTICAL);
        TextView minimum = new TextView(context), maximum = new TextView(context);
        minimum.setTextSize(14);
        maximum.setTextSize(14);
        minimum.setText(format.format(0));
        maximum.setText(format.format(1));
        range.addView(minimum);
        LinearLayout.LayoutParams sliderParams = new LinearLayout.LayoutParams(0, -2, 1);
        sliderParams.setMargins(gap, 0, gap, 0);
        range.addView(slider, sliderParams);
        range.addView(maximum);
        body.addView(range);

        builder(context, title)
                .setView(body)
                .setNeutralButton(text(context, "reset"), (dialog, which) ->
                        slider.setProgress(AiCaptionConfig.DEFAULT_BACKGROUND_OPACITY), false)
                .setPositiveButton(text(context, "profile_save"),
                        (dialog, which) -> run(context, () -> {
                            AiCaptionConfig.saveBackgroundOpacity(context, slider.getProgress());
                            update(context, refresh);
                        }))
                .setNegativeButton(text(context, "cancel"), null).show();
    }

    static void resetPosition(Context context, CharSequence title, Runnable refresh) {
        confirm(context, title, "message_fd1ada5395a0", "reset_position_action", () -> {
            AiCaptionConfig.resetCaptionPositions(context);
            update(context, refresh);
        });
    }

    private static void update(Context context, Runnable refresh) {
        CaptionOverlay.refreshStyle(context);
        refresh.run();
    }
}
