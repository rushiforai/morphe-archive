package app.hushmessenger.extension;

import android.content.Context;
import android.os.Build;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/**
 * Videos in chat heads (#104). Messenger's video player either draws a video on a SurfaceView, a layer of its own
 * that the system places under the window, or into a TextureView like any other view. 587 takes the SurfaceView on
 * Android 10 and newer unless the screen asks for a TextureView. A chat head is a window over other apps, and on some
 * phones that separate layer shows black there and stays on screen after the chat head closes. Messenger hands its
 * choice and the player's context to textureView() before it builds the player, and a player in a chat head gets the
 * TextureView. Public, since the call comes from Messenger's own package.
 */
public final class ChatHeadVideo {
    static final String KEY = "chat_head_video";

    /**
     * Phone makers whose window compositor leaves the video layer behind. A box stayed on screen where a video had
     * been, both in a chat head and on the way back out of a chat, so the chat head alone wasn't the whole of it
     * (#104, a Huawei Mate XT on Android 12). Nothing in Android reports the fault and the leftover costs more than
     * the layer saves, so every video on these phones draws into a TextureView.
     */
    static final Set<String> LAYER_LEAVES_A_BOX =
        Collections.unmodifiableSet(new HashSet<>(Arrays.asList("huawei", "honor")));

    private ChatHeadVideo() {}

    /**
     * True when the player should draw into a TextureView: Messenger asked for one, the video is in a chat head, or
     * this phone's compositor leaves the separate layer behind.
     */
    public static boolean textureView(Context context, boolean messengerAsked) {
        if (messengerAsked) return true;
        try {
            return context != null && Settings.running() && (layerLeavesABox() || inChatHead(context));
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Couldn't tell where a video plays", error);
            return false;
        }
    }

    /** Whether this phone is one of [LAYER_LEAVES_A_BOX]. */
    static boolean layerLeavesABox() {
        String maker = Build.MANUFACTURER;
        return maker != null && LAYER_LEAVES_A_BOX.contains(maker.trim().toLowerCase(Locale.US));
    }

    /**
     * Chat heads draw from Messenger's chat head service, so their context leads to no activity. A chat Android opens as
     * a bubble is an activity of its own and keeps Messenger's choice: its video layer draws fine there, and a forced
     * TextureView left a black box on a link's preview and blanked the bubble when the gallery opened (#221).
     */
    static boolean inChatHead(Context context) {
        return ChatJump.activity(context) == null;
    }
}
