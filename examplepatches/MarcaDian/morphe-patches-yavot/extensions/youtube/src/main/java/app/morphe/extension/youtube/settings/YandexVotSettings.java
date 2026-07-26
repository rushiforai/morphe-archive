package app.morphe.extension.youtube.settings;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;
import static app.morphe.extension.shared.settings.Setting.parent;

import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.shared.settings.preference.SeekBarPreference;
import app.morphe.extension.shared.settings.preference.SeekBarPreference.SeekBarConfig;

public final class YandexVotSettings {
    public static final BooleanSetting YANDEX_VOT_ENABLED =
            new BooleanSetting("morphe_yandex_vot_enabled", FALSE);
    public static final StringSetting YANDEX_VOT_SOURCE_LANGUAGE =
            new StringSetting("morphe_yandex_vot_source_language", "auto", false, parent(YANDEX_VOT_ENABLED));
    public static final StringSetting YANDEX_VOT_TARGET_LANGUAGE =
            new StringSetting("morphe_yandex_vot_target_language", "ru", false, parent(YANDEX_VOT_ENABLED));
    public static final IntegerSetting YANDEX_VOT_TRANSLATION_VOLUME =
            new IntegerSetting("morphe_yandex_vot_translation_volume", 100, false, parent(YANDEX_VOT_ENABLED));
    public static final IntegerSetting YANDEX_VOT_ORIGINAL_AUDIO_VOLUME =
            new IntegerSetting("morphe_yandex_vot_original_audio_volume", 30, false, parent(YANDEX_VOT_ENABLED));
    public static final BooleanSetting YANDEX_VOT_AUDIO_PROXY_ENABLED =
            new BooleanSetting("morphe_yandex_vot_audio_proxy_enabled", TRUE, false, parent(YANDEX_VOT_ENABLED));
    public static final StringSetting YANDEX_VOT_PROXY_URL =
            new StringSetting("morphe_yandex_vot_proxy_url", "vot-worker.eu.cc", false, parent(YANDEX_VOT_ENABLED));
    public static final BooleanSetting YANDEX_VOT_USE_LIVE_VOICES =
            new BooleanSetting("morphe_yandex_vot_use_live_voices", TRUE, false, parent(YANDEX_VOT_ENABLED));
    public static final StringSetting YANDEX_VOT_OAUTH_TOKEN =
            new StringSetting("morphe_yandex_vot_oauth_token", "", false, parent(YANDEX_VOT_ENABLED));

    static {
        SeekBarPreference.register(new SeekBarConfig(YANDEX_VOT_TRANSLATION_VOLUME, 0, 100, 5, "%"));
        SeekBarPreference.register(new SeekBarConfig(YANDEX_VOT_ORIGINAL_AUDIO_VOLUME, 0, 100, 5, "%"));
    }

    private YandexVotSettings() { }
}
