package app.morphe.extension.tiktok.settings;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.StringSetting;

/** BlueIT Service advanced feed rules that do not require app restart. */
public final class AdvancedFeedSettings extends BaseSettings {
    public static final StringSetting BLOCKED_KEYWORDS =
            new StringSetting("blueit_feed_blocked_keywords", "");
    public static final StringSetting BLOCKED_CREATORS =
            new StringSetting("blueit_feed_blocked_creators", "");
    public static final StringSetting BLOCKED_SOUNDS =
            new StringSetting("blueit_feed_blocked_sounds", "");
    public static final StringSetting DURATION_SECONDS =
            new StringSetting("blueit_feed_duration_seconds", "0-2147483647");

    private AdvancedFeedSettings() {
    }
}
