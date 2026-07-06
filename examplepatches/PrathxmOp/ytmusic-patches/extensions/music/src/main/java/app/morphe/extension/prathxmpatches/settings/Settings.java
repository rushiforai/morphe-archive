package app.morphe.extension.prathxmpatches.settings;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;
import static app.morphe.extension.shared.settings.Setting.parent;

import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.SharedYouTubeSettings;
import app.morphe.extension.shared.settings.preference.SeekBarPreference;
import app.morphe.extension.shared.settings.preference.SeekBarPreference.SeekBarConfig;

@SuppressWarnings({"deprecation", "RedundantSuppression"})
public class Settings {

    private static boolean mainPatchApplied = false;

    static {
        try {
            Class.forName("app.morphe.extension.music.settings.Settings");
            mainPatchApplied = true;
        } catch (ClassNotFoundException ignored) {
        }
    }

    private static BooleanSetting getBoolean(String key, Boolean defaultValue, boolean visible) {
        Setting<?> existing = Setting.getSettingFromPath(key);
        if (existing instanceof BooleanSetting) {
            return (BooleanSetting) existing;
        }
        return new BooleanSetting(key, defaultValue, visible);
    }

    private static BooleanSetting getBoolean(String key, Boolean defaultValue, boolean visible, Setting.Availability parentRelation) {
        Setting<?> existing = Setting.getSettingFromPath(key);
        if (existing instanceof BooleanSetting) {
            return (BooleanSetting) existing;
        }
        return new BooleanSetting(key, defaultValue, visible, parentRelation);
    }

    private static StringSetting getString(String key, String defaultValue) {
        Setting<?> existing = Setting.getSettingFromPath(key);
        if (existing instanceof StringSetting) {
            return (StringSetting) existing;
        }
        return new StringSetting(key, defaultValue);
    }

    private static StringSetting getString(String key, String defaultValue, boolean visible) {
        Setting<?> existing = Setting.getSettingFromPath(key);
        if (existing instanceof StringSetting) {
            return (StringSetting) existing;
        }
        return new StringSetting(key, defaultValue, visible);
    }

    private static StringSetting getString(String key, String defaultValue, boolean visible, Setting.Availability parentRelation) {
        Setting<?> existing = Setting.getSettingFromPath(key);
        if (existing instanceof StringSetting) {
            return (StringSetting) existing;
        }
        return new StringSetting(key, defaultValue, visible, parentRelation);
    }

    private static IntegerSetting getInteger(String key, Integer defaultValue, boolean visible) {
        Setting<?> existing = Setting.getSettingFromPath(key);
        if (existing instanceof IntegerSetting) {
            return (IntegerSetting) existing;
        }
        return new IntegerSetting(key, defaultValue, visible);
    }

    // Discord RPC
    public static final BooleanSetting DISCORD_RPC_ENABLED = getBoolean("morphe_music_discord_rpc_enabled", FALSE, true);
    public static final BooleanSetting DISCORD_RPC_ADVANCED = getBoolean("morphe_music_discord_rpc_advanced", FALSE, true);
    public static final StringSetting DISCORD_RPC_STATE_TEMPLATE = getString("morphe_music_discord_rpc_state_template", "{artist.name}");
    public static final StringSetting DISCORD_RPC_DETAILS_TEMPLATE = getString("morphe_music_discord_rpc_details_template", "{song.name}");
    public static final BooleanSetting DISCORD_RPC_BUTTON1_ENABLED = getBoolean("morphe_music_discord_rpc_button1_enabled", TRUE, true);
    public static final StringSetting DISCORD_RPC_BUTTON1_LABEL = getString("morphe_music_discord_rpc_button1_label", "Listen on YouTube Music");
    public static final StringSetting DISCORD_RPC_BUTTON1_URL = getString("morphe_music_discord_rpc_button1_url", "https://music.youtube.com/watch?v={song.id}");
    public static final BooleanSetting DISCORD_RPC_BUTTON2_ENABLED = getBoolean("morphe_music_discord_rpc_button2_enabled", TRUE, true);
    public static final StringSetting DISCORD_RPC_BUTTON2_LABEL = getString("morphe_music_discord_rpc_button2_label", "Visit Morphe");
    public static final StringSetting DISCORD_RPC_BUTTON2_URL = getString("morphe_music_discord_rpc_button2_url", "https://github.com/MorpheApp/Morphe");

    // ListenBrainz
    public static final StringSetting LISTENBRAINZ_USER_TOKEN = getString("morphe_music_listenbrainz_token", "", false);
    public static final BooleanSetting LISTENBRAINZ_SCROBBLING = getBoolean("morphe_music_listenbrainz_enabled", FALSE, true);
    public static final BooleanSetting LISTENBRAINZ_NOW_PLAYING = getBoolean("morphe_music_listenbrainz_now_playing", FALSE, true, parent(LISTENBRAINZ_SCROBBLING));
    public static final IntegerSetting LISTENBRAINZ_MIN_SONG_DURATION = getInteger("morphe_music_listenbrainz_min_song_duration", 30, true);
    public static final IntegerSetting LISTENBRAINZ_DELAY_PERCENT = getInteger("morphe_music_listenbrainz_delay_percent", 50, true);
    public static final IntegerSetting LISTENBRAINZ_DELAY_SECONDS = getInteger("morphe_music_listenbrainz_delay_seconds", 180, true);

    // Last.fm
    public static final StringSetting LASTFM_SESSION_KEY = getString("morphe_music_lastfm_session_key", "", false);
    public static final StringSetting LASTFM_USERNAME = getString("morphe_music_lastfm_username", "", false);
    public static final BooleanSetting LASTFM_SCROBBLING = getBoolean("morphe_music_lastfm_enabled", FALSE, true);
    public static final BooleanSetting LASTFM_NOW_PLAYING = getBoolean("morphe_music_lastfm_now_playing", FALSE, true, parent(LASTFM_SCROBBLING));
    public static final BooleanSetting LASTFM_LOVE_ON_LIKE = getBoolean("morphe_music_lastfm_love_on_like", FALSE, true, parent(LASTFM_SCROBBLING));
    public static final IntegerSetting LASTFM_MIN_SONG_DURATION = getInteger("morphe_music_lastfm_min_song_duration", 30, true);
    public static final IntegerSetting LASTFM_DELAY_PERCENT = getInteger("morphe_music_lastfm_delay_percent", 50, true);
    public static final IntegerSetting LASTFM_DELAY_SECONDS = getInteger("morphe_music_lastfm_delay_seconds", 180, true);

    // Metadata Cleanup
    public static final BooleanSetting SCROBBLING_METADATA_CLEANUP = getBoolean("morphe_music_scrobbling_metadata_cleanup", TRUE, true);
    public static final StringSetting SCROBBLING_CUSTOM_REGEX = getString("morphe_music_scrobbling_custom_regex", "", true, parent(SCROBBLING_METADATA_CLEANUP));

    static {
        if (!mainPatchApplied) {
            SeekBarPreference.register(new SeekBarConfig(LISTENBRAINZ_MIN_SONG_DURATION,
                    10, 60, 5, "s"));
            SeekBarPreference.register(new SeekBarConfig(LISTENBRAINZ_DELAY_PERCENT,
                    30, 95, 5, "%"));
            SeekBarPreference.register(new SeekBarConfig(LISTENBRAINZ_DELAY_SECONDS,
                    30, 360, 10, "s"));
            SeekBarPreference.register(new SeekBarConfig(LASTFM_MIN_SONG_DURATION,
                    10, 60, 5, "s"));
            SeekBarPreference.register(new SeekBarConfig(LASTFM_DELAY_PERCENT,
                    30, 95, 5, "%"));
            SeekBarPreference.register(new SeekBarConfig(LASTFM_DELAY_SECONDS,
                    30, 360, 10, "s"));
        }
    }
}
