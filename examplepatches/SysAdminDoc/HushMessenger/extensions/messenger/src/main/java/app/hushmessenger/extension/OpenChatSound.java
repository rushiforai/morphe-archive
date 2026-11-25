package app.hushmessenger.extension;

/**
 * A sound for a message that comes into the chat you have open (#224). Messenger plays one there for likes and stickers
 * only. For any other message it asks whether in-app sounds would play right now (the ringer, its own In-app sounds
 * setting, the app in front) and drops the answer. The patch hands that answer here, and a yes sends the message on to
 * the sound Messenger plays for a message from another chat while the app is open.
 *
 * Off, Pause, safe mode and every failure keep Messenger quiet, as it was. A no from Messenger stays a no, so a silent
 * phone or In-app sounds turned off still mean no sound, and it isn't counted as a use. Public, since the call comes from
 * Messenger's own sound code.
 */
public final class OpenChatSound {
    static final String KEY = "open_chat_sound";

    private OpenChatSound() { }

    /** Whether the message in the open chat gets Messenger's in-app message sound. */
    public static boolean play(boolean inAppSoundsOn) {
        try {
            return inAppSoundsOn && Settings.enabled(KEY);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't play the open chat sound", error);
            return false;
        }
    }
}
