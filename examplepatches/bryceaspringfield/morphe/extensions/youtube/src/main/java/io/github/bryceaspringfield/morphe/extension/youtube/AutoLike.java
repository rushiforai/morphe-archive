package io.github.bryceaspringfield.morphe.extension.youtube;

import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Likes each video the user opens, once, when the video's like status is INDIFFERENT (neither liked nor disliked),
 * so an existing like or dislike stays. The status comes from the next endpoint the watch page reads.
 */
@SuppressWarnings("unused")
public final class AutoLike {

    private static final Pattern LIKE_STATUS = Pattern.compile("\"likeStatus\"\\s*:\\s*\"(\\w+)\"");
    private static volatile String lastVideo = "";

    private AutoLike() {
    }

    /** Called by the patch when Morphe's VideoInformation loads a new video ID. */
    public static void onVideo(String videoId) {
        try {
            if (videoId == null || videoId.isEmpty() || videoId.equals(lastVideo)) return;
            lastVideo = videoId;
            WatchHistory.onVideo(videoId);
            Resuggested.opened(videoId);
            LiveCatchUp.onVideo(videoId);
            CommentTitle.onVideo(videoId);
            if (XSettings.AUDIO_ONLY.get()) AudioOnly.set(true, "video " + videoId);
            AccountHistory.soon();
            if (!XSettings.AUTO_LIKE.get() && !XSettings.DEBUG.get()) return;
            // After 3 s, and only for the watch player: an inline preview in a feed or search loads videos too.
            Utils.runOnMainThreadDelayed(() -> {
                if (!videoId.equals(app.morphe.extension.youtube.patches.VideoInformation.getVideoId())) return;
                if (!app.morphe.extension.youtube.shared.PlayerType.getCurrent().isMaximizedOrFullscreen()) return;
                Utils.runOnBackgroundThread(() -> likeIfIndifferent(videoId));
            }, 3000);
        } catch (Exception e) {
            Logger.printException(() -> "YouTube Extras: auto like failed", e);
        }
    }

    private static void likeIfIndifferent(String videoId) {
        try {
            if (!Account.signedIn()) return;
            JSONObject next = Account.post("next", new JSONObject().put("videoId", videoId));
            if (next == null) return;
            String text = next.toString();
            if (XSettings.DEBUG.get()) dump("yx_next.json", text);
            Matcher m = LIKE_STATUS.matcher(text);
            String status = m.find() ? m.group(1) : "UNKNOWN";
            Logger.printDebug(() -> "YouTube Extras: " + videoId + " like status " + status);
            if (!XSettings.AUTO_LIKE.get() || !"INDIFFERENT".equals(status)) return;
            JSONObject r = Account.post("like/like", new JSONObject().put("target", new JSONObject().put("videoId", videoId)));
            Logger.printDebug(() -> "YouTube Extras: liked " + videoId + ": " + (r != null));
        } catch (Exception e) {
            Logger.printException(() -> "YouTube Extras: like request failed", e);
        }
    }

    /** Saves a response in the app's cache folder, for reading with adb when Log feed items is on. */
    static void dump(String name, String text) {
        try (FileOutputStream o = new FileOutputStream(new File(Utils.getContext().getCacheDir(), name))) {
            o.write(text.getBytes(StandardCharsets.UTF_8));
        } catch (Exception ignored) {
        }
    }
}
