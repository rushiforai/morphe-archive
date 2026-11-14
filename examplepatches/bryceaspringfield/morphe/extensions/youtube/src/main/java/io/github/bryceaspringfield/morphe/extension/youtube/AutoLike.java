package io.github.bryceaspringfield.morphe.extension.youtube;

import org.json.JSONObject;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Likes each video the user opens, once, when the video's like status is INDIFFERENT (neither liked nor disliked),
 * so an existing like or dislike stays. The status comes from the next endpoint the watch page reads. The like is a tap
 * on the watch page's own like button, so its icon fills and the app sends its own request; the button is found by
 * the like count its description states in any language ("like this video along with 110,399 other people", "poner Me
 * gusta en este video, al igual que 110,400 personas más"). Where the button is off screen, the like is sent directly
 * (the icon then fills only when the video is opened again).
 */
@SuppressWarnings("unused")
public final class AutoLike {

    private static final Pattern LIKE_STATUS = Pattern.compile("\"likeStatus\"\\s*:\\s*\"(\\w+)\"");
    private static final Pattern LIKE_COUNT = Pattern.compile("\"likeCountIf(?:Indifferent|Liked)Number\"\\s*:\\s*\"(\\d+)\"");
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
            // The button's description states the count with the like (Big Buck Bunny's, unliked, "along with
            // 110,399 other people"; another's 959 where likeCountIfIndifferentNumber was 958), so both counts match.
            java.util.Set<String> counts = new java.util.HashSet<>();
            for (Matcher c = LIKE_COUNT.matcher(text); c.find(); ) counts.add(c.group(1));
            Utils.runOnMainThreadDelayed(() -> tapOrSend(videoId, counts, 0), 0);
        } catch (Exception e) {
            Logger.printException(() -> "YouTube Extras: like request failed", e);
        }
    }

    /** The watch page may still be laying out its buttons: looks again every 500 ms for 6 s, then sends the like. */
    private static void tapOrSend(String videoId, java.util.Set<String> counts, int tries) {
        if (!videoId.equals(app.morphe.extension.youtube.patches.VideoInformation.getVideoId())) return;
        View button = counts.isEmpty() ? null : likeButton(videoId, counts);
        if (button != null) {
            button.performClick();
            Logger.printDebug(() -> "YouTube Extras: liked " + videoId + " with the like button");
            return;
        }
        if (tries < 12) {
            Utils.runOnMainThreadDelayed(() -> tapOrSend(videoId, counts, tries + 1), 500);
            return;
        }
        if (XSettings.DEBUG.get()) {
            Activity a = HomeMore.resumedMain();
            StringBuilder seen = new StringBuilder();
            if (a != null) numbered(a.getWindow().getDecorView(), seen);
            Logger.printDebug(() -> "YouTube Extras: no like button stating " + counts + "; numbered buttons: " + seen);
        }
        Utils.runOnBackgroundThread(() -> {
            try {
                JSONObject r = Account.post("like/like", new JSONObject().put("target", new JSONObject().put("videoId", videoId)));
                Logger.printDebug(() -> "YouTube Extras: liked " + videoId + " by request: " + (r != null));
            } catch (Exception e) {
                Logger.printException(() -> "YouTube Extras: like request failed", e);
            }
        });
    }

    /** The descriptions of the shown, clickable views stating a number, for the debug log. */
    private static void numbered(View v, StringBuilder out) {
        if (!v.isShown() || out.length() > 1500) return;
        CharSequence d = v.getContentDescription();
        if (d != null && v.isClickable() && d.toString().matches("(?s).*\\d.*")) out.append(d).append(" | ");
        if (v instanceof ViewGroup g) {
            for (int i = 0; i < g.getChildCount(); i++) numbered(g.getChildAt(i), out);
        }
    }

    /**
     * The shown, clickable view whose description states the video's like count (its digits alone), on the watch page
     * of the video still open; the leftmost where two match (the dislike button states the dislike count).
     */
    private static View likeButton(String videoId, java.util.Set<String> counts) {
        Activity a = HomeMore.resumedMain();
        if (a == null || !videoId.equals(app.morphe.extension.youtube.patches.VideoInformation.getVideoId())) return null;
        View[] best = {null};
        find(a.getWindow().getDecorView(), counts, best);
        return best[0];
    }

    private static void find(View v, java.util.Set<String> counts, View[] best) {
        if (!v.isShown()) return;
        CharSequence d = v.getContentDescription();
        if (d != null && v.isClickable() && counts.contains(d.toString().replaceAll("\\D", ""))) {
            int[] xy = new int[2], bxy = new int[2];
            v.getLocationOnScreen(xy);
            if (best[0] != null) best[0].getLocationOnScreen(bxy);
            if (best[0] == null || xy[0] < bxy[0]) best[0] = v;
        }
        if (v instanceof ViewGroup g) {
            for (int i = 0; i < g.getChildCount(); i++) find(g.getChildAt(i), counts, best);
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
