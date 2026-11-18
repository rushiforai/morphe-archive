package io.github.sabopura.morphe.extension.twitch.original;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.danmaku.DanmakuSettings;
import io.github.sabopura.morphe.extension.twitch.danmaku.TwitchDanmaku;
import io.github.sabopura.morphe.extension.twitch.player.PlayerTools;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

/**
 * Remembers settings per channel login and restores them when that channel opens. Nothing is remembered
 * until the user asks. While a remembered channel is open the normal values are kept aside, also on disk, so
 * leaving the channel or the app being killed cannot leave one channel's values in place.
 */
public final class ChannelProfiles {
    public static final String KEY_APPLY = "channel_profiles_apply", KEY_PROFILES = "channel_profiles";
    private static final String KEY_ASIDE_DANMAKU = "channel_profiles_aside_danmaku",
            KEY_ASIDE_FONT = "channel_profiles_aside_font";
    private static final String KEY_FONT = "font_percent";

    private static String login = "";
    /** {@link PlayerTools#playing()} when the profile last reached the player. */
    private static String appliedTo = "";
    private static boolean applied, volumeTouched;

    private ChannelProfiles() {
    }

    /** Twitch joined a channel's chat (from {@link Original#onChannelJoin}). Not necessarily the main thread. */
    public static void onChannel(String channelId, String channelName) {
        if (channelName == null) return;
        // Off the main thread this runs later, after the caller's own guard has returned.
        Original.onMain(() -> {
            try {
                channelOpened(channelName.toLowerCase(Locale.ROOT));
            } catch (RuntimeException | LinkageError e) {
                Diagnostics.note("original.profile-channel", e);
            }
        });
    }

    static boolean active() {
        SharedPreferences prefs = Original.prefs();
        return Features.has(Feature.CHANNEL_PROFILES) && prefs != null && prefs.getBoolean(KEY_APPLY, true);
    }

    private static void channelOpened(String name) {
        if (name.equals(login)) return;
        restoreAside();
        if (volumeTouched && PlayerTools.hasPlayer()) PlayerTools.volume(1f);
        volumeTouched = false;
        login = name;
        applied = false;
        appliedTo = "";
        if (!active()) return;
        ProfileStore.Profile profile = profiles().get(name);
        if (profile == null) return;
        applied = true;
        SharedPreferences prefs = Original.prefs();
        prefs.edit()
                .putBoolean(KEY_ASIDE_DANMAKU, danmakuEnabled())
                .putInt(KEY_ASIDE_FONT, prefs.getInt(KEY_FONT, 100))
                .apply();
        applySaved(profile);
        applyToPlayer(profile, PlayerTools.playing());
    }

    private static boolean danmakuEnabled() {
        Context context = Original.app();
        return context != null && DanmakuSettings.preferences(context).getBoolean(DanmakuSettings.KEY_ENABLED, true);
    }

    private static void applySaved(ProfileStore.Profile profile) {
        Context context = Original.app();
        if (context == null) return;
        setDanmaku(context, profile.danmaku);
        setChatPercent(context, profile.chatPercent);
    }

    /**
     * Volume and speed live on the player, so they are set when a player starts other content. A
     * player resuming the same content keeps what the viewer chose since.
     */
    static void playerStarted() {
        if (!applied || !active()) return;
        String playing = PlayerTools.playing();
        if (playing.equals(appliedTo)) return;
        ProfileStore.Profile profile = profiles().get(login);
        if (profile != null) applyToPlayer(profile, playing);
    }

    private static void applyToPlayer(ProfileStore.Profile profile, String playing) {
        if (playing.isEmpty()) return;
        appliedTo = playing;
        PlayerTools.volume(profile.volume);
        volumeTouched = profile.volume != 1f;
        if (profile.vodSpeed > 0f && !PlayerTools.vodId().isEmpty()) {
            try {
                PlayerTools.speed(profile.vodSpeed);
            } catch (Exception e) {
                Diagnostics.note("original.profile-vod-speed", e);
            }
        }
    }

    private static void setDanmaku(Context context, boolean enabled) {
        if (!Features.has(Feature.DANMAKU)) return;
        DanmakuSettings.setEnabled(context, enabled);
        TwitchDanmaku.settingsChanged();
    }

    private static void setChatPercent(Context context, int percent) {
        if (!Features.has(Feature.CHAT_APPEARANCE)) return;
        ChatSettings.preferences(context).edit().putInt(KEY_FONT, percent).apply();
        ChatSettings.reload(context);
    }

    /** Puts back the values kept aside, if any. Safe to call when there are none. */
    private static void restoreAside() {
        SharedPreferences prefs = Original.prefs();
        if (prefs == null || !prefs.contains(KEY_ASIDE_FONT)) return;
        Context context = Original.app();
        if (context != null) {
            setDanmaku(context, prefs.getBoolean(KEY_ASIDE_DANMAKU, true));
            setChatPercent(context, prefs.getInt(KEY_ASIDE_FONT, 100));
        }
        prefs.edit().remove(KEY_ASIDE_DANMAKU).remove(KEY_ASIDE_FONT).apply();
    }

    /** At app start: the process may have ended with a channel's values still in place. */
    static void restoreAfterRestart() {
        if (Features.has(Feature.CHANNEL_PROFILES)) restoreAside();
    }

    // ---- player menu and settings ----

    public static String currentLogin() {
        return login;
    }

    public static boolean remembered() {
        return profiles().containsKey(login);
    }

    public static int volumePercent() {
        ProfileStore.Profile profile = profiles().get(login);
        return Math.round((profile == null ? 1f : profile.volume) * 100);
    }

    /**
     * Remembers the current values for the open channel, or forgets them. Values kept aside stay until the
     * channel is left, so a choice made here never touches the settings the user just set.
     */
    public static void setRemembered(Context context, boolean remember) {
        Map<String, ProfileStore.Profile> profiles = profiles();
        if (remember && !login.isEmpty()) {
            float rate = PlayerTools.playbackRate();
            boolean vod = !PlayerTools.vodId().isEmpty();
            profiles.put(login, new ProfileStore.Profile(1f, danmakuEnabled(),
                    vod && !Float.isNaN(rate) ? rate : 0f, ChatSettings.preferences(context).getInt(KEY_FONT, 100)));
            applied = true;
            appliedTo = PlayerTools.playing();
        } else {
            profiles.remove(login);
            applied = false;
        }
        save(profiles);
    }

    public static void setVolumePercent(int percent) {
        Map<String, ProfileStore.Profile> profiles = profiles();
        ProfileStore.Profile old = profiles.get(login);
        float volume = Math.max(0, Math.min(100, percent)) / 100f;
        if (PlayerTools.hasPlayer()) PlayerTools.volume(volume);
        volumeTouched = volume != 1f;
        if (old == null) return;
        profiles.put(login, new ProfileStore.Profile(volume, old.danmaku, old.vodSpeed, old.chatPercent));
        save(profiles);
    }

    public static List<String> names() {
        return new ArrayList<>(profiles().keySet());
    }

    public static void forget(String name) {
        Map<String, ProfileStore.Profile> profiles = profiles();
        profiles.remove(name);
        save(profiles);
        if (name.equals(login)) applied = false;
    }

    private static Map<String, ProfileStore.Profile> profiles() {
        SharedPreferences prefs = Original.prefs();
        return ProfileStore.parse(prefs == null ? null : prefs.getString(KEY_PROFILES, null));
    }

    private static void save(Map<String, ProfileStore.Profile> profiles) {
        SharedPreferences prefs = Original.prefs();
        if (prefs != null) prefs.edit().putString(KEY_PROFILES, ProfileStore.serialize(profiles)).apply();
    }
}
