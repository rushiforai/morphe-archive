package io.github.bryceaspringfield.morphe.extension.youtube;

import android.view.View;
import android.view.ViewGroup;
import android.widget.Spinner;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.youtube.patches.VideoInformation;

/**
 * Switches live chat from Top chat to Live chat (all messages) once a video, when the chat's sort menu binds with its
 * first option selected. The menu is the only two-option sort filter Spinner of a live stream or chat replay; the
 * switch goes through the Spinner's own listener, as a user's choice does, and a later choice of the user stays.
 */
@SuppressWarnings("unused")
public final class LiveChat {

    private static volatile String switchedVideo = "";

    private static volatile String rewrittenVideo = "";

    /**
     * The continuation's field 16 (tag 0x82 0x01, then its length) starts with field 1, the chat type: 4 for top
     * messages, 1 for all messages (seen in YouTube 21.44's first live chat request: 16 = {1: 4, 3: 2, ...}).
     */
    private static int topChatFlag(byte[] b) {
        for (int i = 0; i + 4 < b.length; i++) {
            if (b[i] == (byte) 0x82 && b[i + 1] == 0x01 && b[i + 2] > 0 && b[i + 3] == 0x08 && b[i + 4] == 0x04) return i + 4;
        }
        return -1;
    }

    private LiveChat() {
    }

    /**
     * Rewrites the chat type of a live chat request's continuation from top messages to all messages, for the first
     * request of each video; later requests follow the server's answer, so a later choice of the user stays.
     */
    public static byte[] rewriteBytes(byte[] continuation) {
        try {
            if (continuation == null || continuation.length == 0 || !XSettings.LIVE_CHAT_ALL_MESSAGES.get()) return continuation;
            String video = VideoInformation.getVideoId();
            int at = topChatFlag(continuation);
            Logger.printDebug(() -> "YouTube Extras: live chat request bytes " + continuation.length + ", top-chat flag at " + at
                    + (XSettings.DEBUG.get() ? " " + android.util.Base64.encodeToString(continuation, android.util.Base64.NO_WRAP) : ""));
            if (at < 0 || video.equals(rewrittenVideo)) return continuation;
            rewrittenVideo = video;
            byte[] out = continuation.clone();
            out[at] = 0x01;
            return out;
        } catch (Exception e) {
            Logger.printException(() -> "YouTube Extras: live chat rewrite failed", e);
            return continuation;
        }
    }

    public static String rewriteToken(String token) {
        try {
            if (token == null || token.isEmpty() || !XSettings.LIVE_CHAT_ALL_MESSAGES.get()) return token;
            String decoded = java.net.URLDecoder.decode(token, "UTF-8");
            byte[] raw = android.util.Base64.decode(decoded, android.util.Base64.URL_SAFE);
            byte[] out = rewriteBytes(raw);
            if (out == raw) return token;
            String encoded = android.util.Base64.encodeToString(out, android.util.Base64.URL_SAFE | android.util.Base64.NO_WRAP);
            Logger.printDebug(() -> "YouTube Extras: live chat token rewritten to all messages");
            return decoded.equals(token) ? encoded : java.net.URLEncoder.encode(encoded, "UTF-8");
        } catch (Exception e) {
            Logger.printDebug(() -> "YouTube Extras: live chat token not rewritten: " + e);
            return token;
        }
    }

    private static int indexOf(byte[] data, byte[] pattern) {
        outer:
        for (int i = 0; i + pattern.length <= data.length; i++) {
            for (int j = 0; j < pattern.length; j++) if (data[i + j] != pattern[j]) continue outer;
            return i;
        }
        return -1;
    }

    public static void onSortMenu(Spinner spinner) {
        try {
            if (!XSettings.LIVE_CHAT_ALL_MESSAGES.get()) return;
            if (spinner.getAdapter() == null || spinner.getAdapter().getCount() != 2) return;
            if (spinner.getSelectedItemPosition() != 0) return;
            String video = VideoInformation.getVideoId();
            if (video.equals(switchedVideo) || !inLiveChat(spinner)) return;
            switchedVideo = video;
            Utils.runOnMainThreadDelayed(() -> {
                if (spinner.getSelectedItemPosition() == 0) {
                    Logger.printDebug(() -> "YouTube Extras: live chat switched to all messages for " + video);
                    spinner.setSelection(1);
                }
            }, 300);
        } catch (Exception e) {
            Logger.printException(() -> "YouTube Extras: live chat switch failed", e);
        }
    }

    /** Whether the menu sits in a live chat panel: the video is live, or a parent holds a live chat view. */
    private static boolean inLiveChat(View v) {
        if (VideoInformation.isLiveStream()) return true;
        View root = v.getRootView();
        int id = root.getResources().getIdentifier("live_chat_fragment_container", "id", root.getContext().getPackageName());
        return id != 0 && root.findViewById(id) != null;
    }
}
