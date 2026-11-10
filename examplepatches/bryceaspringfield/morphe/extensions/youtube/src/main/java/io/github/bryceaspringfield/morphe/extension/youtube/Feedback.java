package io.github.bryceaspringfield.morphe.extension.youtube;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Automatic "Not interested" feedback with a reason, as the menu sends it: the item's Not interested token (the
 * first feedback token of its buffer, since Not interested is the menu's first item holding one), then the reason
 * token the answer's "Tell us why" dialog states (dismissalFollowUpRenderer.reasons: I've already watched the
 * video, I don't like the video). Each video is reported once a session, as the signed-in user.
 */
final class Feedback {

    enum Reason {WATCHED, DONT_LIKE}

    private static final Set<String> SENT = ConcurrentHashMap.newKeySet();

    /** Videos whose red progress bar was seen on Home or under the player; the filter hides them when laid out again. */
    private static final Set<String> WATCHED = ConcurrentHashMap.newKeySet();

    private Feedback() {
    }

    static boolean isWatched(String videoId) {
        return videoId != null && WATCHED.contains(videoId);
    }

    static void onHidden(VideoItem item, String why) {
        if (XSettings.AUTO_DISLIKE_FILTERED.get()) send(item, Reason.DONT_LIKE, why);
    }

    static void onWatched(VideoItem item) {
        String mode = XSettings.AUTO_WATCHED.get();
        if ("off".equals(mode) || item == null || item.videoId == null) return;
        if ("fully".equals(mode) && WatchHistory.fraction(item.videoId) < 0.9f) return;
        WATCHED.add(item.videoId);
        send(item, Reason.WATCHED, "watched (" + mode + ")");
    }

    /** A feed item whose video this app has played: partly at any part played (2% or more), fully at 90%. */
    static void onFeedItem(VideoItem item) {
        String mode = XSettings.AUTO_WATCHED.get();
        if ("off".equals(mode) || item == null || item.videoId == null) return;
        if (item.videoId.equals(app.morphe.extension.youtube.patches.VideoInformation.getStartingOrPlayingVideoId())) return;
        float played = WatchHistory.fraction(item.videoId);
        if (played >= ("fully".equals(mode) ? 0.9f : 0.02f)) WATCHED.add(item.videoId);
        if (played >= ("fully".equals(mode) ? 0.9f : 0.02f)) send(item, Reason.WATCHED, "played " + Math.round(played * 100) + "% here (" + mode + ")");
    }

    private static void send(VideoItem item, Reason reason, String why) {
        if (item.videoId == null || item.feedbackToken == null || !SENT.add(item.videoId)) return;
        Utils.runOnBackgroundThread(() -> {
            try {
                if (!Account.signedIn()) return;
                JSONObject r = Account.post("feedback", new JSONObject()
                        .put("feedbackTokens", new JSONArray().put(item.feedbackToken)));
                String reasonToken = reasonToken(r, reason);
                if (reasonToken != null) {
                    Account.post("feedback", new JSONObject().put("feedbackTokens", new JSONArray().put(reasonToken)));
                }
                Logger.printDebug(() -> "YouTube Extras: Not interested sent for " + item.videoId + " (" + why
                        + "), reason " + reason + (reasonToken == null ? " not offered" : " sent"));
            } catch (Exception e) {
                Logger.printException(() -> "YouTube Extras: feedback failed", e);
            }
        });
    }

    /** The reason's token from the Not interested answer: by its text in English or Spanish, else by its position. */
    static String reasonToken(JSONObject answer, Reason reason) {
        if (answer == null) return null;
        JSONArray responses = answer.optJSONArray("feedbackResponses");
        if (responses == null) return null;
        for (int i = 0; i < responses.length(); i++) {
            JSONObject resp = responses.optJSONObject(i);
            JSONObject dialog = resp == null ? null : resp.optJSONObject("followUpDialog");
            JSONObject follow = dialog == null ? null : dialog.optJSONObject("dismissalFollowUpRenderer");
            JSONArray reasons = follow == null ? null : follow.optJSONArray("reasons");
            if (reasons == null) continue;
            String byPosition = null;
            for (int j = 0; j < reasons.length(); j++) {
                JSONObject r = reasons.optJSONObject(j);
                JSONObject t = r == null ? null : r.optJSONObject("dismissalReasonTextRenderer");
                if (t == null) continue;
                String text = runs(t.optJSONObject("text")).toLowerCase(Locale.ROOT);
                JSONObject fb = t.optJSONObject("feedback");
                JSONObject ep = fb == null ? null : fb.optJSONObject("feedbackEndpoint");
                String token = ep == null ? null : ep.optString("feedbackToken", null);
                boolean watched = text.contains("watched") || text.contains("miré") || text.contains("vi el") || text.contains("visto");
                boolean dontLike = text.contains("like") || text.contains("gusta");
                if (reason == Reason.WATCHED && watched) return token;
                if (reason == Reason.DONT_LIKE && dontLike && !watched) return token;
                if (j == (reason == Reason.WATCHED ? 0 : 1)) byPosition = token;
            }
            return byPosition;
        }
        return null;
    }

    private static String runs(JSONObject text) {
        if (text == null) return "";
        if (text.has("simpleText")) return text.optString("simpleText");
        StringBuilder out = new StringBuilder();
        JSONArray runs = text.optJSONArray("runs");
        for (int i = 0; runs != null && i < runs.length(); i++) out.append(runs.optJSONObject(i).optString("text"));
        return out.toString();
    }
}
