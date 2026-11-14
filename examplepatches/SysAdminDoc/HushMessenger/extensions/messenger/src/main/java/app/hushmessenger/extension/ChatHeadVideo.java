package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Context;
import android.os.Build;

/**
 * Videos in chat heads (#104). Messenger's video player either draws a video on a SurfaceView, a layer of its own
 * that the system places under the window, or into a TextureView like any other view. 587 takes the SurfaceView on
 * Android 10 and newer unless the screen asks for a TextureView. A chat head is a window over other apps, and on some
 * phones (a Huawei Mate XT on Android 12 in #104) that separate layer shows black there and stays on screen after the
 * chat head closes. Messenger hands its choice and the player's context to textureView() before it builds the player,
 * and a player in a chat head gets the TextureView. Public, since the call comes from Messenger's own package.
 */
public final class ChatHeadVideo {
    static final String KEY = "chat_head_video";

    private ChatHeadVideo() {}

    /** True when the player should draw into a TextureView: Messenger asked for one, or the video is in a chat head. */
    public static boolean textureView(Context context, boolean messengerAsked) {
        if (messengerAsked) return true;
        try {
            return context != null && Settings.running() && inChatHead(context);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Couldn't tell where a video plays", error);
            return false;
        }
    }

    /**
     * Chat heads draw from Messenger's chat head service, so their context leads to no activity. On Android 11 and
     * newer they can also be bubbles, where the chat runs in an activity Android launched from the bubble.
     */
    static boolean inChatHead(Context context) {
        Activity activity = ChatJump.activity(context);
        if (activity == null) return true;
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && activity.isLaunchedFromBubble();
    }
}
