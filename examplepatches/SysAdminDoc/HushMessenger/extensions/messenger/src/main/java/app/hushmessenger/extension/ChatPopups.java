package app.hushmessenger.extension;

import android.app.NotificationChannel;
import android.os.Build;

/**
 * Messenger recreates its Chats channel one step below high when it expects a chat head to cover the message, and only
 * its server flags ever raise it again. A phone it did that on gets no pop-ups for chats from then on, chat head or not
 * (#126). Someone who picked Chat heads under Allow chat bubbles keeps Messenger's behavior, so they don't get both.
 */
public final class ChatPopups {
    private static final String KEY = "chat_popups";
    private static final String CHATS_CHANNEL = "messenger_orca_050_messaging";

    private ChatPopups() {}

    /** Messenger is about to recreate [channel] at [wanted]. True leaves it where it is. */
    public static boolean keepChannel(NotificationChannel channel, int wanted) {
        try {
            return channel != null && wanted < channel.getImportance() && isChats(channel) && inEffect();
        } catch (RuntimeException error) {
            Settings.hookFailed(KEY, "Couldn't check the Chats channel", error);
            return false;
        }
    }

    /** True sends Messenger straight to its own raise of [channel], which it only reaches below high. */
    public static boolean raiseChannel(NotificationChannel channel) {
        try {
            // The user's own choice is only readable from Android 10 on, so Android 9 stays with Messenger's checks.
            return channel != null && Build.VERSION.SDK_INT >= 29 && isChats(channel)
                && !channel.hasUserSetImportance() && inEffect();
        } catch (RuntimeException error) {
            Settings.hookFailed(KEY, "Couldn't check the Chats channel", error);
            return false;
        }
    }

    private static boolean isChats(NotificationChannel channel) {
        String id = channel.getId();
        return id != null && id.startsWith(CHATS_CHANNEL);
    }

    private static boolean inEffect() {
        return Settings.running() && !Settings.forceChatHeads();
    }
}
