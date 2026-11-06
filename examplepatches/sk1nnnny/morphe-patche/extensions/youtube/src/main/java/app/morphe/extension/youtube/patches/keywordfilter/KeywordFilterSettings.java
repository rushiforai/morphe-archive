package app.morphe.extension.youtube.patches.keywordfilter;

import static app.morphe.extension.shared.settings.Setting.parent;

import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.LongSetting;
import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.youtube.settings.Settings;

/**
 * Settings for the enhanced Keyword Content Filter add-on.
 * Reuses the base Morphe Settings for built-in keys and declares the extended toggles.
 */
public final class KeywordFilterSettings {

    public static final BooleanSetting HIDE_KEYWORD_CONTENT_HOME = Settings.HIDE_KEYWORD_CONTENT_HOME;
    public static final BooleanSetting HIDE_KEYWORD_CONTENT_SUBSCRIPTIONS = Settings.HIDE_KEYWORD_CONTENT_SUBSCRIPTIONS;
    public static final BooleanSetting HIDE_KEYWORD_CONTENT_SEARCH = Settings.HIDE_KEYWORD_CONTENT_SEARCH;
    public static final BooleanSetting HIDE_KEYWORD_CONTENT_COMMENTS = Settings.HIDE_KEYWORD_CONTENT_COMMENTS;
    public static final StringSetting HIDE_KEYWORD_CONTENT_PHRASES = Settings.HIDE_KEYWORD_CONTENT_PHRASES;

    public static final BooleanSetting HIDE_KEYWORD_CONTENT_CHANNEL = new BooleanSetting(
            "morphe_hide_keyword_content_channel", true);
    public static final BooleanSetting HIDE_KEYWORD_CONTENT_CHECK_SUBTITLES = new BooleanSetting(
            "morphe_hide_keyword_content_check_subtitles", true);
    public static final BooleanSetting HIDE_KEYWORD_CONTENT_USE_AND_OPERATOR = new BooleanSetting(
            "morphe_hide_keyword_content_use_and_operator", true);
    public static final BooleanSetting HIDE_KEYWORD_CONTENT_USE_REGEX = new BooleanSetting(
            "morphe_hide_keyword_content_use_regex", true);
    public static final BooleanSetting HIDE_KEYWORD_CONTENT_CASE_SENSITIVE = new BooleanSetting(
            "morphe_hide_keyword_content_case_sensitive", false);
    public static final BooleanSetting HIDE_KEYWORD_CONTENT_DEBUG = new BooleanSetting(
            "morphe_hide_keyword_content_debug", false);

    public static final LongSetting KEYWORD_HIDE_COUNT_HOME = Settings.KEYWORD_HIDE_COUNT_HOME;
    public static final LongSetting KEYWORD_HIDE_COUNT_SUBSCRIPTIONS = Settings.KEYWORD_HIDE_COUNT_SUBSCRIPTIONS;
    public static final LongSetting KEYWORD_HIDE_COUNT_SEARCH = Settings.KEYWORD_HIDE_COUNT_SEARCH;
    public static final LongSetting KEYWORD_HIDE_COUNT_COMMENTS = Settings.KEYWORD_HIDE_COUNT_COMMENTS;
    public static final StringSetting KEYWORD_HIDES_24H = Settings.KEYWORD_HIDES_24H;

    public static void ensureLoaded() {
        HIDE_KEYWORD_CONTENT_CHANNEL.get();
        HIDE_KEYWORD_CONTENT_CHECK_SUBTITLES.get();
        HIDE_KEYWORD_CONTENT_USE_AND_OPERATOR.get();
        HIDE_KEYWORD_CONTENT_USE_REGEX.get();
        HIDE_KEYWORD_CONTENT_CASE_SENSITIVE.get();
        HIDE_KEYWORD_CONTENT_DEBUG.get();
    }

    private KeywordFilterSettings() {
    }
}
