/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Tapping the bar above a chat while music plays opens Telegram's full player, with its seek bar,
 * speed and timeline. For a voice message the same tap only scrolls to the message. With the
 * switch on, voice messages open the full player too, and the player stays open for them. Only
 * the player asks, so bubbles, transcription and the playback queue keep treating voice as voice.
 * A view-once voice message never opens it.
 */
public final class VoicePlayer {
    private VoicePlayer() {}

    /**
     * Asked by the player and the bar wherever Telegram checks whether a message is music.
     *
     * @param message Telegram's message, never null at these sites
     * @return whether the full player handles it
     */
    public static boolean music(Object message) {
        if (message == null) return false;
        boolean music = isMusic(message);
        if (music) return true;
        try {
            if (!plays(false, isVoice(message), once(message))) return false;
            HookStatus.counted(FamilyNames.VOICE_MUSIC_PLAYER, "voice in the player");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VOICE_MUSIC_PLAYER, "voice", failure);
            return false;
        }
    }

    /**
     * Asked where the full player shows Add to Profile, right after it reads whether it shows your
     * own profile list, which hides that button and Remove from Profile. A voice message the switch
     * put in the player can't go on a profile, so the player hides them for it too.
     *
     * @param mine non-zero when the player shows your own profile list
     * @return whether the player hides both profile buttons
     */
    public static boolean keepsProfileOut(int mine) {
        if (mine != 0) return true;
        try {
            Object playing = playing();
            if (playing == null) return false;
            if (!hidesProfile(false, isMusic(playing), isVoice(playing), once(playing))) return false;
            HookStatus.counted(FamilyNames.VOICE_MUSIC_PLAYER, "no Add to Profile for voice");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VOICE_MUSIC_PLAYER, "profile buttons", failure);
            return false;
        }
    }

    /** Your own list hides the profile buttons; so does a voice message, wherever the player shows one. */
    static boolean hidesProfile(boolean mine, boolean music, boolean voice, boolean once) {
        if (mine) return true;
        return !music && plays(false, voice, once);
    }

    /** Music always plays in the player; a voice message only with the switch on, and never a view-once one. */
    static boolean plays(boolean music, boolean voice, boolean once) {
        if (music) return true;
        return voice && !once && on();
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.VOICE_MUSIC_PLAYER);
        try {
            return Utils.settingsReady() && Settings.VOICE_MUSIC_PLAYER.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VOICE_MUSIC_PLAYER, "switch", failure);
            return false;
        }
    }

    /** Telegram's own music check. Replaced when patching. */
    public static boolean isMusic(Object message) { return false; }

    /** Whether the message is a voice message. Replaced when patching. */
    public static boolean isVoice(Object message) { return false; }

    /** Whether the voice message plays once and disappears. Replaced when patching. */
    public static boolean once(Object message) { return true; }

    /** The message playing now, or null. Replaced when patching. */
    public static Object playing() { return null; }
}
