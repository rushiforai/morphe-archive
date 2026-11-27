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

@SuppressWarnings("unused")
public final class AutoLike {

    private static final Pattern LIKE_STATUS = Pattern.compile("\"likeStatus\"\\s*:\\s*\"(\\w+)\"");
    private static final Pattern LIKE_COUNT = Pattern.compile("\"likeCountIf(?:Indifferent|Liked)Number\"\\s*:\\s*\"(\\d+)\"");
    private static volatile String lastVideo = "";

    private AutoLike() {
    }

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
            if (!XSettings.DISLIKE_CHANNELS.get().trim().isEmpty()) dislikeSoon(videoId, 0);
            if (!XSettings.AUTO_LIKE.get() && !XSettings.DEBUG.get()) return;
            Utils.runOnMainThreadDelayed(() -> {
                if (!videoId.equals(app.morphe.extension.youtube.patches.VideoInformation.getVideoId())) return;
                if (!app.morphe.extension.youtube.shared.PlayerType.getCurrent().isMaximizedOrFullscreen()) return;
                Utils.runOnBackgroundThread(() -> likeIfIndifferent(videoId));
            }, 3000);
        } catch (Exception e) {
            Logger.printException(() -> "YouTube Extras: auto like failed", e);
        }
    }

    private static final java.util.Set<String> DISLIKE_DONE = java.util.concurrent.ConcurrentHashMap.newKeySet();

    private static void dislikeSoon(String videoId, int tries) {
        Utils.runOnMainThreadDelayed(() -> {
            try {
                if (!videoId.equals(app.morphe.extension.youtube.patches.VideoInformation.getVideoId())) return;
                if (!app.morphe.extension.youtube.shared.PlayerType.getCurrent().isMaximizedOrFullscreen()) {
                    if (tries < 20) dislikeSoon(videoId, tries + 1);
                    return;
                }
                String id = app.morphe.extension.youtube.patches.VideoInformation.getChannelId();
                String name = app.morphe.extension.youtube.patches.VideoInformation.getChannelName();
                if ((id == null || id.isEmpty()) && (name == null || name.isEmpty())) {
                    if (tries < 20) dislikeSoon(videoId, tries + 1);
                    return;
                }
                String list = XSettings.DISLIKE_CHANNELS.get();
                if (!list.contains("@") && !ChannelRules.listed(list, id, name, Channels.handleOf(id))) return;
                if (!DISLIKE_DONE.add(videoId)) return;
                Utils.runOnBackgroundThread(() -> sendDislike(videoId, id, name));
            } catch (Throwable t) {
                Logger.printException(() -> "YouTube Extras: dislike channels failed", t);
            }
        }, tries == 0 ? 2000 : 500);
    }

    private static final Pattern OWNER_HANDLE = Pattern.compile("\"canonicalBaseUrl\"\\s*:\\s*\"/@([^\"]+)\"");

    private static void sendDislike(String videoId, String channelId, String channel) {
        try {
            if (!Account.signedIn()) return;
            JSONObject next = Account.post("next", new JSONObject().put("videoId", videoId));
            String text = next == null ? "" : next.toString();
            Matcher h = OWNER_HANDLE.matcher(text);
            String handle = h.find() ? h.group(1) : null;
            if (!ChannelRules.listed(XSettings.DISLIKE_CHANNELS.get(), channelId, channel, handle)) return;
            Matcher m = LIKE_STATUS.matcher(text);
            String status = m.find() ? m.group(1) : "UNKNOWN";
            if ("DISLIKE".equals(status)) {
                Logger.printDebug(() -> "YouTube Extras: " + videoId + " of " + channel + " is already disliked");
                return;
            }
            JSONObject r = Account.post("like/dislike", new JSONObject().put("target", new JSONObject().put("videoId", videoId)));
            Logger.printDebug(() -> "YouTube Extras: disliked " + videoId + " of " + channel + " (was " + status + "): " + (r != null));
        } catch (Exception e) {
            Logger.printException(() -> "YouTube Extras: dislike request failed", e);
        }
    }

    private static String ownerHandle(String text) {
        Matcher h = OWNER_HANDLE.matcher(text);
        return h.find() ? h.group(1) : null;
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
            if (ChannelRules.listed(XSettings.DISLIKE_CHANNELS.get(),
                    app.morphe.extension.youtube.patches.VideoInformation.getChannelId(),
                    app.morphe.extension.youtube.patches.VideoInformation.getChannelName(), ownerHandle(text))) return;
            java.util.Set<String> counts = new java.util.HashSet<>();
            for (Matcher c = LIKE_COUNT.matcher(text); c.find(); ) counts.add(c.group(1));
            Utils.runOnMainThreadDelayed(() -> tapOrSend(videoId, counts, 0), 0);
        } catch (Exception e) {
            Logger.printException(() -> "YouTube Extras: like request failed", e);
        }
    }

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
            Activity a = ResumedActivity.main();
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

    private static void numbered(View v, StringBuilder out) {
        if (!v.isShown() || out.length() > 1500) return;
        CharSequence d = v.getContentDescription();
        if (d != null && v.isClickable() && d.toString().matches("(?s).*\\d.*")) out.append(d).append(" | ");
        if (v instanceof ViewGroup g) {
            for (int i = 0; i < g.getChildCount(); i++) numbered(g.getChildAt(i), out);
        }
    }

    private static View likeButton(String videoId, java.util.Set<String> counts) {
        Activity a = ResumedActivity.main();
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

    static void dump(String name, String text) {
        try (FileOutputStream o = new FileOutputStream(new File(Utils.getContext().getCacheDir(), name))) {
            o.write(text.getBytes(StandardCharsets.UTF_8));
        } catch (Exception ignored) {
        }
    }
}
